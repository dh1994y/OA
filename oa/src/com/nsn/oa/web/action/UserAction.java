package com.nsn.oa.web.action;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;

import com.nsn.oa.dao.utils.Conditions;
import com.nsn.oa.dao.utils.Conditions.Operator;
import com.nsn.oa.domain.User;
import com.nsn.oa.service.UserService;
import com.nsn.oa.utils.CommonUtils;
import com.nsn.oa.utils.DataTablesPage;
import com.nsn.oa.utils.JsonUtils;
import com.nsn.oa.utils.Md5Utils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User> {

	private User user = new User();
	private UserService userService;
	private String checkNumber;
	private String isRemember;
	private String sEcho;
	private int iDisplayStart;
	private int iDisplayLength;

	public String home() {
		return "home";
	}

	public String userDetail() {
		User detailUser = userService.findUserById(user.getId());
		// 检索创建人 最后修改人
		if (detailUser.getCreateUser() != null) {
			User createUser = userService.findUserById(detailUser.getCreateUser());
			detailUser.setCreateUserName(createUser.getUsername());
		}
		if (detailUser.getLastModifyUser() != null) {
			User lastModifyUser = userService.findUserById(detailUser.getLastModifyUser());
			detailUser.setLastModifyUserName(lastModifyUser.getUsername());
		}
		// 放入栈顶 方便取值
		ActionContext.getContext().getValueStack().pop();
		ActionContext.getContext().getValueStack().push(detailUser);
		return "detail";
	}

	public String userAdd() {
		return "add";
	}

	public String add() {
		// 添加额外字段
		user.setIsDuty("isDuty_on");
		// 取出当前登录用户
		User currentUser = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		user.setCreateUser(currentUser.getId());
		user.setCreateDate(new Date());
		user.setIsDelete(false);
		// 设置初始密码
		user.setPassword(Md5Utils.md5("000000"));
		userService.addUser(user);
		return "home";
	}

	public String userEdit() {
		User editUser = userService.findUserById(user.getId());

		// 使用值栈存储 存放在栈顶
		ActionContext.getContext().getValueStack().pop();
		ActionContext.getContext().getValueStack().push(editUser);
		return "edit";
	}

	public String update() {
		// 添加修改人 修改时间
		User currentUser = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		user.setLastModifyUser(currentUser.getId());
		user.setLastModifyDate(new Date());
		// 添加缺少信息
		User editUser = userService.findUserById(user.getId());
		user.setPassword(editUser.getPassword());
		user.setCreateDate(editUser.getCreateDate());
		user.setCreateUser(editUser.getCreateUser());
		userService.update(user);
		return "home";
	}

	public String delete() {
		// 逻辑删除 置isDelete 为true
		User delUser = userService.findUserById(user.getId());
		delUser.setIsDelete(true);
		userService.deleteUser(delUser);
		return "home";
	}

	public void checkAccountUnique() {
		String account = user.getAccount();
		if (account != null && account.length() > 0) {
			Conditions conditions = new Conditions();
			conditions.addCondition("account", account, Operator.EQUALS);
			if (user.getId() != null) {
				// 当是修改是 屏蔽自身用户名
				conditions.addCondition("id", user.getId(), Operator.NOT_EQUALS);
			}
			Boolean isUnique = userService.checkAccountUnique(conditions);
			JsonUtils.writeJson(isUnique, ServletActionContext.getResponse());
		}
	}

	public void page() throws IOException {

		DataTablesPage<User> page = new DataTablesPage<User>();

		page.setSEcho(sEcho);
		page.setIDisplayLength(iDisplayLength);
		page.setIDisplayStart(iDisplayStart);

		Conditions conditions = new Conditions();
		conditions.addCondition("username", user.getUsername(), Operator.LIKE);
		conditions.addCondition("isDuty", user.getIsDuty(), Operator.EQUALS);
		conditions.addCondition("gender", user.getGender(), Operator.EQUALS);
		conditions.addCondition("units", user.getUnits(), Operator.EQUALS);
		conditions.addCondition("isDelete", false, Operator.EQUALS);
		
		userService.page(page, conditions);

		// 生成响应数据json格式
		System.out.println(JsonUtils.toJson(page));
		JsonUtils.writeJson(page, ServletActionContext.getResponse());
	}

	public String login() {

		// 合法性校验
		if (CommonUtils.hasEmpty(checkNumber)) {
			addActionError("验证码不能为空");
			return "loginError";
		}
		String ckNum = (String) ServletActionContext.getRequest().getSession().getAttribute("checkNumber");
		if (!ckNum.equals(checkNumber)) {
			addActionError("验证码错误");
			return "loginError";
		}
		if (CommonUtils.hasEmpty(user.getAccount())) {
			addActionError("用户名不能为空");
			return "loginError";
		}
		if (CommonUtils.hasEmpty(user.getPassword())) {
			addActionError("密码不能为空");
			return "loginError";
		}

		// 登录成功标识
		boolean loginSucc = false;
		String account = user.getAccount();
		String password = user.getPassword();
		// 封装查询条件 用户名+密码
		Conditions conditions = new Conditions();
		// 必须是在职员工 未被逻辑删除员工
		conditions.addCondition("isDelete", false, Operator.EQUALS);
		conditions.addCondition("isDuty", "在职", Operator.EQUALS);
		conditions.addCondition("account", account, Operator.EQUALS);
		conditions.addCondition("password", password, Operator.EQUALS);
		// 检索数据库并返回用户信息
		user = userService.login(conditions);
		if (user != null) {
			// 若有cookie回显密码
			loginSucc = true;
		} else {
			// 若无cookie回显密码 即用户输入 md5加密后检索
			conditions.clear();
			conditions.addCondition("isDelete", false, Operator.EQUALS);
			conditions.addCondition("isDuty", "在职", Operator.EQUALS);
			conditions.addCondition("account", account, Operator.EQUALS);
			conditions.addCondition("password", Md5Utils.md5(password), Operator.EQUALS);
			user = userService.login(conditions);
			if (user != null) {
				loginSucc = true;
			}
		}
		// 判断用户是否登录成功 放入session
		if (loginSucc) {
			// 登录成功标识
			ServletActionContext.getRequest().getSession().setAttribute("user", user);
			// 判断是否记住密码
			if ("yes".equals(isRemember)) {
				// 创建cookie
				Cookie accountCookie = new Cookie("accountCookie", account);
				accountCookie.setMaxAge(60 * 60 * 24);
				accountCookie.setPath("/");
				Cookie passwordCookie = new Cookie("passwordCookie", Md5Utils.md5(password));
				passwordCookie.setMaxAge(60 * 60 * 24);
				passwordCookie.setPath("/");
				// 发送到浏览器
				ServletActionContext.getResponse().addCookie(accountCookie);
				ServletActionContext.getResponse().addCookie(passwordCookie);
			}
			return "loginSucc";
		} else {
			// 添加错误信息
			addActionError("用户名或密码错误");
			return "loginError";
		}
	}

	@Override
	public User getModel() {
		return this.user;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setCheckNumber(String checkNumber) {
		this.checkNumber = checkNumber;
	}

	public void setIsRemember(String isRemember) {
		this.isRemember = isRemember;
	}

	public String getSEcho() {
		return sEcho;
	}

	public void setSEcho(String sEcho) {
		this.sEcho = sEcho;
	}

	public int getIDisplayStart() {
		return iDisplayStart;
	}

	public void setIDisplayStart(int iDisplayStart) {
		this.iDisplayStart = iDisplayStart;
	}

	public int getIDisplayLength() {
		return iDisplayLength;
	}

	public void setIDisplayLength(int iDisplayLength) {
		this.iDisplayLength = iDisplayLength;
	}

}
