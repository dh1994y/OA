package com.nsn.oa.service;


import java.util.ArrayList;
import java.util.List;

import com.nsn.oa.dao.IMenuDao;
import com.nsn.oa.dao.utils.Conditions;
import com.nsn.oa.dao.utils.Conditions.Operator;
import com.nsn.oa.domain.Menu;
import com.nsn.oa.domain.utils.MenuConfig;
import com.nsn.oa.domain.utils.MenuItem;

public class MenuService {
	private IMenuDao menuDao;

	/**
	 * 获取菜单配置
	 */
	public MenuConfig getMenuConfig() {
		//创建MenuConfig对象
		MenuConfig config = new MenuConfig();
		List<String> mainNavList = new ArrayList<>();
		List<List<MenuItem>> leftNavList = new ArrayList<>();
		Conditions conditions = new Conditions();
		conditions.addCondition("isUse", 1, Operator.EQUALS);
		conditions.addCondition("level", 1, Operator.EQUALS);
		conditions.addOrderBy("orderValue", true);
		List<Menu> menuList = menuDao.findByConditions(conditions);
		for(Menu menu : menuList){
			mainNavList.add(menu.getName());
			List<MenuItem> menuItemList = new ArrayList<>();
			leftNavList.add(menuItemList);
			conditions.clear();
			conditions.addCondition("isUse", 1, Operator.EQUALS);
			conditions.addCondition("parentId", menu.getId(), Operator.EQUALS);
			conditions.addOrderBy("orderValue", true);
			List<Menu> mList = menuDao.findByConditions(conditions);
			for(Menu m : mList){
				MenuItem menuItem = new MenuItem();
				menuItem.setName(m.getName());
				menuItem.setUrl(m.getUrl());
				menuItemList.add(menuItem);
			}
		}
		/*
		//按条件检索出所有菜单
		Conditions conditions = new Conditions();
		conditions.addCondition("isUse", 1, Operator.EQUALS);
		conditions.addOrderBy("level", true);
		conditions.addOrderBy("orderValue", true);
		List<Menu> menuList = menuDao.findByConditions(conditions);
		//设置MenuConfig对象内容
		for (Menu menu : menuList) {
			if(menu.getLevel()==1){
				mainNavList.add(menu.getName());
				List<MenuItem> menuItemList = new ArrayList<>();
				leftNavList.add(menuItemList);
				for(Menu m : menuList){
					if(m.getParentId().equals(menu.getId())){
						MenuItem menuItem = new MenuItem();
						menuItem.setName(m.getName());
						menuItem.setUrl(m.getUrl());
						menuItemList.add(menuItem);
					}
				}
			}
		}
		*/
		config.setLeftNavList(leftNavList);
		config.setMainNavList(mainNavList);
		return config;
	}

	public IMenuDao getMenuDao() {
		return menuDao;
	}

	public void setMenuDao(IMenuDao menuDao) {
		this.menuDao = menuDao;
	}

}
