package com.nsn.oa.service;


import com.nsn.oa.dao.IMenuDao;
import com.nsn.oa.domain.utils.MenuConfig;

public class MenuService {
	private IMenuDao menuDao;

	/**
	 * 获取菜单配置
	 */
	public MenuConfig getMenuConfig() {
		
		return null;
	}

	public IMenuDao getMenuDao() {
		return menuDao;
	}

	public void setMenuDao(IMenuDao menuDao) {
		this.menuDao = menuDao;
	}

}
