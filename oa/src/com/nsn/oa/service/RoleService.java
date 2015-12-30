package com.nsn.oa.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import com.nsn.oa.dao.IMenuDao;
import com.nsn.oa.dao.IRoleDao;
import com.nsn.oa.domain.Menu;
import com.nsn.oa.domain.Role;
import com.nsn.oa.domain.User;

public class RoleService {
	private IRoleDao roleDao;
	private IMenuDao menuDao;

	public IRoleDao getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(IRoleDao roleDao) {
		this.roleDao = roleDao;
	}

	public Role findRoleById(String roleId) {
		return roleDao.findById(roleId);
	}

	public void updateMenus(String roleId, HashSet<Menu> menuSet) {
		Role role = roleDao.findById(roleId);
		menuDao.removeFromSession(role.getMenuSet());
		role.setMenuSet(menuSet);
		roleDao.addOrUpdate(role);
	}

	public List<Role> list() {
		return roleDao.findAll();
	}

	public List<Role> findByIds(String roles) {
		String[] roleArray = roles.split(",");
		List<Role> roleList = new ArrayList<Role>();
		for (String roleId : roleArray) {
			if (roleId != null) {
				Role role = roleDao.findById(roleId.trim());
				if (role != null) {
					roleList.add(role);
				}
			}
		}
		return roleList;
	}

	public IMenuDao getMenuDao() {
		return menuDao;
	}

	public void setMenuDao(IMenuDao menuDao) {
		this.menuDao = menuDao;
	}
	
}
