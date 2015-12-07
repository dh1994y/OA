package com.nsn.oa.web.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.nsn.oa.dao.utils.JsonUtils;
import com.nsn.oa.domain.utils.FirstLevelMenu;
import com.nsn.oa.service.MenuService;
import com.opensymphony.xwork2.ActionSupport;

public class MenuAction extends ActionSupport{
	
	private MenuService menuService;
	
	public String home(){
		
		return "home";
	}
	
	@SuppressWarnings("unchecked")
	public void getMenu(){
		//获取一级菜单列表
		Object[] array = menuService.getMenu();
		List<String> mainMenu = (List<String>) array[0];
		List<FirstLevelMenu> fmList = (List<FirstLevelMenu>) array[1];
		//通过ServletActionContext解耦servlet
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		//传输json
		array = new Object[]{mainMenu,JsonUtils.toJson(fmList)};
		JsonUtils.writeJson(array, response);
	}

	public MenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	
	
}
