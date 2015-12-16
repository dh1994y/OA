package com.nsn.oa.web.action;

import com.nsn.oa.domain.User;
import com.nsn.oa.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User>{

	private User user = new User();
	private UserService UserService;
	
	
	@Override
	public User getModel() {
		return this.user;
	}


	public UserService getUserService() {
		return UserService;
	}


	public void setUserService(UserService userService) {
		UserService = userService;
	}
	
}
