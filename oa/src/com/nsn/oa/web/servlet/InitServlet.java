package com.nsn.oa.web.servlet;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.nsn.oa.dao.IMenuDao;
import com.nsn.oa.dao.IRoleDao;
import com.nsn.oa.dao.utils.Conditions;
import com.nsn.oa.dao.utils.Conditions.Operator;
import com.nsn.oa.domain.Menu;
import com.nsn.oa.domain.utils.MenuConfig;
import com.nsn.oa.domain.utils.MenuItem;
import com.nsn.oa.domain.utils.RoleMenu;
import com.nsn.oa.domain.utils.RoleMenu.RoleEnum;

/**
 *	初始化servlet  用于初始化菜单
 */
public class InitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private void initMenu(ServletContext context,IMenuDao menuDao){
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
		context.setAttribute("config", config);
	}
	@Override
	public void init() throws ServletException {
		super.init();
    	//ApplicationContext ctx = (ApplicationContext)getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
    	ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
    	IMenuDao menuDao = (IMenuDao) ctx.getBean("menuDao");
    	initMenu(this.getServletContext(),menuDao);
    	IRoleDao roleDao = (IRoleDao) ctx.getBean("roleDao");
    	RoleMenu roleMenu = new RoleMenu(menuDao, roleDao, RoleEnum.ADMIN);
    	System.out.println();
	}

}
