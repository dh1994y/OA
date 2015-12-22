package com.nsn.oa.service;

import java.util.List;

import com.nsn.oa.dao.IUserDao;
import com.nsn.oa.dao.utils.Conditions;
import com.nsn.oa.domain.User;

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

	public User login(Conditions conditions) {
		List<User> userList = userDao.findByConditions(conditions);
		if(userList!=null&&userList.size()>0){
			return userList.get(0);
		}
		return null;
	}
	
}
