package com.nsn.oa.web.action;

import com.nsn.oa.domain.User;
import com.nsn.oa.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class PersonalInfoAction extends ActionSupport implements ModelDriven<User>{
	
	private User user = new User();
	private UserService userService;
	
	public String home(){
		return "home";
	}
	
	public String edit(){
		return "edit";
	}
	
	public String save(){
		return "home";
	}
	
	public String editPwd(){
		return "pwEdit";
	}
	
	public String updatePwd(){
		return "pwEdit";
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
