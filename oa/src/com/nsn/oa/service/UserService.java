package com.nsn.oa.service;

import com.nsn.oa.dao.IUserDao;

/**
 * 用戶模塊業務邏輯
 * @author Administrator
 *
 */
public class UserService {
	private IUserDao userDao;

	public IUserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	
}
