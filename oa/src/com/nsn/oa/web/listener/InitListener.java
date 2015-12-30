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

	/**
	 * 初始化数据字典
	 */
	public void initDictionary(ServletContextEvent e){
		Dictionary dict = Dictionary.getInstance();
		e.getServletContext().setAttribute("dict", dict);
	}

	@Override
	public void contextInitialized(ServletContextEvent e) {
		//初始化数据字典
		initDictionary(e);
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent e) {
		
	}

}
