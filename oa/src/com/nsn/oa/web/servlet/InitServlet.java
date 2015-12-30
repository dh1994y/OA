package com.nsn.oa.web.servlet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.nsn.oa.dao.IMenuDao;
import com.nsn.oa.dao.IRoleDao;
import com.nsn.oa.dao.utils.Conditions;
import com.nsn.oa.dao.utils.Conditions.Operator;
import com.nsn.oa.domain.Menu;
import com.nsn.oa.domain.utils.RoleMenu;
import com.nsn.oa.domain.utils.RoleMenu.Entry;
import com.nsn.oa.domain.utils.RoleMenu.RoleEnum;

/**
 *	初始化servlet  用于初始化菜单
 */
public class InitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * 初始化配置
	 * @param context
	 * @param menuDao
	 * @param roleDao
	 */
	private void initMenu(ServletContext context,IMenuDao menuDao,IRoleDao roleDao){
		Map<String,RoleMenu> roleMenuMap = new HashMap<>();
		RoleMenu generalRM = new RoleMenu(menuDao, roleDao, RoleEnum.GENERAL);
		RoleMenu manageRM = new RoleMenu(menuDao, roleDao, RoleEnum.MANAGE);
		RoleMenu equipRM = new RoleMenu(menuDao, roleDao, RoleEnum.EQUIP);
		RoleMenu adminRM = new RoleMenu(menuDao, roleDao, RoleEnum.ADMIN);
		roleMenuMap.put("通用", generalRM);
		roleMenuMap.put("经理", manageRM);
		roleMenuMap.put("设备管理员", equipRM);
		roleMenuMap.put("系统管理员", adminRM);
		context.setAttribute("roleMenuMap", roleMenuMap);
	}
	
	private void initData(ServletContext context,IMenuDao menuDao){
		//获取一级菜单辅助map 便于检索
		Conditions conditions = new Conditions();
		conditions.addCondition("isUse", 1, Operator.EQUALS);
		conditions.addCondition("level", 1, Operator.EQUALS);
		List<Menu> mainMenuList = menuDao.findByConditions(conditions);
		Map<String,String> mainMenuMap = new HashMap<>();
		for (Menu menu : mainMenuList) {
			mainMenuMap.put(menu.getId(),menu.getName());
		}
		context.setAttribute("mainMenuMap", mainMenuMap);
	}
	
	@Override
	public void init() throws ServletException {
		super.init();
    	//ApplicationContext ctx = (ApplicationContext)getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
    	ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
    	IMenuDao menuDao = (IMenuDao) ctx.getBean("menuDao");
    	IRoleDao roleDao = (IRoleDao) ctx.getBean("roleDao");
    	initMenu(this.getServletContext(),menuDao,roleDao);
    	initData(this.getServletContext(),menuDao);
	}

}
