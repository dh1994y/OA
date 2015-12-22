package com.nsn.oa.web.action;

import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;

import com.nsn.oa.dao.utils.Conditions;
import com.nsn.oa.dao.utils.Conditions.Operator;
import com.nsn.oa.domain.User;
import com.nsn.oa.service.UserService;
import com.nsn.oa.utils.CommonUtils;
import com.nsn.oa.utils.Md5Utils;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User>{

	private User user = new User();
	private UserService userService;
	private String checkNumber;
	private String isRemember;
	
	public String login(){
		
		//合法性校验
		if(CommonUtils.hasEmpty(checkNumber)){
			addActionError("验证码不能为空");
			return "loginError";
		}
		String ckNum = (String) ServletActionContext.getRequest().getSession().getAttribute("checkNumber");
		if(!ckNum.equals(checkNumber)){
			addActionError("验证码错误");
			return "loginError";
		}
		if(CommonUtils.hasEmpty(user.getAccount())){
			addActionError("用户名不能为空");
			return "loginError";
		}
		if(CommonUtils.hasEmpty(user.getPassword())){
			addActionError("密码不能为空");
			return "loginError";
		}
		
		//登录成功标识
		boolean loginSucc = false;
		String account = user.getAccount();
		String password = user.getPassword();
		//封装查询条件 用户名+密码
		Conditions conditions = new Conditions();
		conditions.addCondition("isDelete", false, Operator.EQUALS);
		conditions.addCondition("account", account, Operator.EQUALS);
		conditions.addCondition("password", password, Operator.EQUALS);
		//检索数据库并返回用户信息
		user = userService.login(conditions);
		if(user!=null){
			//若有cookie回显密码
			loginSucc = true;
		}else{
			//若无cookie回显密码 即用户输入 md5加密后检索
			conditions.clear();
			conditions.addCondition("isDelete", false, Operator.EQUALS);
			conditions.addCondition("account", account, Operator.EQUALS);
			conditions.addCondition("password", Md5Utils.md5(password), Operator.EQUALS);
			user = userService.login(conditions);
			if(user!=null){
				loginSucc = true;
			}
		}
		//判断用户是否登录成功 放入session
		if(loginSucc){
			//登录成功标识
			ServletActionContext.getRequest().getSession().setAttribute("user", user);
			//判断是否记住密码
			if("yes".equals(isRemember)){
				//创建cookie
				Cookie accountCookie = new Cookie("accountCookie", account);
				accountCookie.setMaxAge(60*60*24);
				accountCookie.setPath("/");
				Cookie passwordCookie = new Cookie("passwordCookie",Md5Utils.md5(password));
				passwordCookie.setMaxAge(60*60*24);
				passwordCookie.setPath("/");
				//发送到浏览器
				ServletActionContext.getResponse().addCookie(accountCookie);
				ServletActionContext.getResponse().addCookie(passwordCookie);
			}
			return "loginSucc";
		}else{
			//添加错误信息
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
	
}
