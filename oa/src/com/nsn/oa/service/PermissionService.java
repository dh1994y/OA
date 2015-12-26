package com.nsn.oa.service;

import com.nsn.oa.dao.IPermissionDao;

public class PermissionService {
	private IPermissionDao permissionDao;

	public IPermissionDao getPermissionDao() {
		return permissionDao;
	}

	public void setPermissionDao(IPermissionDao permissionDao) {
		this.permissionDao = permissionDao;
	}
	
}
