package com.nsn.oa.web.action;

import org.apache.struts2.ServletActionContext;

import com.nsn.oa.domain.User;
import com.nsn.oa.service.UserService;
import com.nsn.oa.utils.Md5Utils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class PersonalInfoAction extends ActionSupport implements ModelDriven<User>{
	
	private User user = new User();
	private UserService userService;
	
	public String home(){
		//获取当前登录用户
		User currentUser = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		//放入值栈栈顶 方便前台取数据
		ActionContext.getContext().getValueStack().pop();
		ActionContext.getContext().getValueStack().push(currentUser);
		return "home";
	}
	
	public String edit(){
		//获取当前登录用户
		User currentUser = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		//放入值栈栈顶 方便前台取数据
		ActionContext.getContext().getValueStack().pop();
		ActionContext.getContext().getValueStack().push(currentUser);
		return "edit";
	}
	
	public String save(){
		//获取当前登录用户
		User currentUser = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		//更新相关值
		currentUser.setMobilePhone(user.getMobilePhone());
		currentUser.setTelephone(user.getTelephone());
		currentUser.setAddress(user.getAddress());
		currentUser.setEmail(user.getEmail());
		userService.update(currentUser);
		return home();
	}
	
	public String editPwd(){
		//获取当前登录用户
		User currentUser = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		//放入值栈栈顶 方便前台取数据
		ActionContext.getContext().getValueStack().pop();
		ActionContext.getContext().getValueStack().push(currentUser);
		return "pwEdit";
	}
	
	public String updatePwd(){
		//获取当前登录用户
		User currentUser = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		//更新相关值  若相等 则没改  不相等则加密存储
		if(!currentUser.getPassword().equals(user.getPassword())){
			currentUser.setPassword(Md5Utils.md5(user.getPassword()));
		}
		userService.update(currentUser);
		return editPwd();
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
}
