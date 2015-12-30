package com.nsn.oa.service;


import java.util.ArrayList;
import java.util.List;

import com.nsn.oa.dao.IMenuDao;
import com.nsn.oa.dao.utils.Conditions;
import com.nsn.oa.dao.utils.Conditions.Operator;
import com.nsn.oa.domain.Menu;
import com.nsn.oa.domain.Role;
import com.nsn.oa.domain.utils.MenuConfig;
import com.nsn.oa.domain.utils.MenuItem;

public class MenuService {
	private IMenuDao menuDao;

	
	public IMenuDao getMenuDao() {
		return menuDao;
	}

	public void setMenuDao(IMenuDao menuDao) {
		this.menuDao = menuDao;
	}

	public List<Menu> findByIds(String menus) {
		String[] menuArray = menus.split(",");
		List<Menu> menuList = new ArrayList<Menu>();
		for (String menuId : menuArray) {
			if (menuId != null) {
				Menu menu = menuDao.findById(menuId.trim());
				if (menu != null) {
					menuList.add(menu);
				}
			}
		}
		return menuList;
	}

	public List<Menu> list() {
		return menuDao.findAll();
	}

	public List<Menu> findByConditions(Conditions conditions) {
		return menuDao.findByConditions(conditions);
	}

	public void removeFromSession(List<Menu> newMenuList) {
		menuDao.removeFromSession(newMenuList);
	}

}
