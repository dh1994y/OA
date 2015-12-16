package com.nsn.oa.web.listener;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.nsn.oa.dao.IMenuDao;
import com.nsn.oa.dao.impl.MenuDaoImpl;
import com.nsn.oa.dao.utils.Conditions;
import com.nsn.oa.dao.utils.Conditions.Operator;
import com.nsn.oa.domain.Menu;
import com.nsn.oa.domain.utils.MenuConfig;
import com.nsn.oa.domain.utils.MenuItem;
import com.nsn.oa.utils.Dictionary;
/**
 * 初始化字典数据
 * @author Administrator
 *
 */
public class InitListener implements ServletContextListener{

	private MenuDaoImpl menuDao;
	
	public InitListener() {
		menuDao = new MenuDaoImpl();
		//menuDao.setTemplate(template);
	}
	/**
	 * 初始化菜单配置config
	 */
	private void initMenu(ServletContextEvent e){
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
		config.setLeftNavList(leftNavList);
		config.setMainNavList(mainNavList);
		e.getServletContext().setAttribute("config", config);
	}
	
	/**
	 * 初始化数据字典
	 */
	public void initDictionary(ServletContextEvent e){
		Dictionary dict = Dictionary.getInstance();
		e.getServletContext().setAttribute("dict", dict);
	}

	@Override
	public void contextInitialized(ServletContextEvent e) {
		//初始化菜单配置
		//initMenu(e);
		//初始化数据字典
		initDictionary(e);
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent e) {
		
	}

}
