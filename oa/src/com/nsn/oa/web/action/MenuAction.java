package com.nsn.oa.web.action;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.nsn.oa.domain.Menu;
import com.nsn.oa.domain.User;
import com.nsn.oa.domain.utils.MenuConfig;
import com.nsn.oa.service.MenuService;
import com.nsn.oa.utils.JsonUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class MenuAction extends ActionSupport implements ModelDriven<Menu>{
	
	private Menu menu = new Menu();
	private MenuService menuService;
	
	public String home(){
		return "home";
	}
	
	public String add(){
		return "add";
	}
	
	public String edit(){
		return "edit";
	}
	
	public String detail(){
		return "detail";
	}
	
	public String save(){
		return "home";
	}
	
	public void getMenuConfig(){
		//获取一级菜单列表
		MenuConfig config = menuService.getMenuConfig();
		//通过ServletActionContext解耦servlet
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		//传输json
		JsonUtils.writeJson(config, response);
	}

	public MenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	@Override
	public Menu getModel() {
		return this.menu;
	}
	
	
}
