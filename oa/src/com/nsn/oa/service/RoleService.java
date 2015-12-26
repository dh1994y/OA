package com.nsn.oa.service;

import org.junit.Test;

import com.nsn.oa.dao.IRoleDao;
import com.nsn.oa.dao.impl.RoleDaoImpl;
import com.nsn.oa.domain.Role;

public class RoleService {
	private IRoleDao roleDao;

	public IRoleDao getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(IRoleDao roleDao) {
		this.roleDao = roleDao;
	}

}
