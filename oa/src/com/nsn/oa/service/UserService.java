package com.nsn.oa.service;

import java.util.HashSet;
import java.util.List;

import com.nsn.oa.dao.IUserDao;
import com.nsn.oa.dao.utils.Conditions;
import com.nsn.oa.domain.Role;
import com.nsn.oa.domain.User;
import com.nsn.oa.utils.DataTablesPage;
import com.nsn.oa.utils.Dictionary;


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

	public void addUser(User user) {
		
		userDao.addOrUpdate(user);
	}

	public boolean checkAccountUnique(Conditions conditions) {
		return userDao.checkUnique(conditions);
	}

	public void page(DataTablesPage<User> page, Conditions conditions) {
		userDao.page(page, conditions);
	}

	public void update(User user) {
		userDao.addOrUpdate(user);
	}

	public User findUserById(String id) {
		return userDao.findById(id);
	}

	public void deleteUser(User delUser) {
		userDao.addOrUpdate(delUser);
	}

	public List<User> findByConditions(Conditions conditions) {
		return userDao.findByConditions(conditions);
	}

	public void updateRoles(String userId, HashSet<Role> roles) {
		User user = userDao.findById(userId);
		user.setRoleSet(roles);
		userDao.addOrUpdate(user);
	}
	
}
