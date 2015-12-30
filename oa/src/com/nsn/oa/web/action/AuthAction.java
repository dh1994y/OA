package com.nsn.oa.web.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.nsn.oa.dao.utils.Conditions;
import com.nsn.oa.dao.utils.Conditions.Operator;
import com.nsn.oa.domain.Menu;
import com.nsn.oa.domain.Role;
import com.nsn.oa.domain.User;
import com.nsn.oa.domain.utils.MenuConfig;
import com.nsn.oa.domain.utils.RoleMenu;
import com.nsn.oa.domain.utils.RoleMenu.RoleEnum;
import com.nsn.oa.service.MenuService;
import com.nsn.oa.service.RoleService;
import com.nsn.oa.service.UserService;
import com.nsn.oa.utils.JsonUtils;
import com.opensymphony.xwork2.ActionSupport;


public class AuthAction extends ActionSupport{

	private UserService userService;
	private RoleService roleService;
	private MenuService menuService;

	private String roleId;
	private String menus;

	public void findFunctionsByRoleId() throws IOException {

		Role role = roleService.findRoleById(roleId);

		// 把此角色所有的菜单的id组合成一个字符串 , 在客户端使用js的indexOf 来判断一个functionId是否包含在此字符串中
		// ,001,002,003,
		StringBuilder builder = new StringBuilder(",");
		if (role != null) {
			Set<Menu> menus = role.getMenuSet();
			if (menus != null) {
				for (Menu menu : menus) {
					builder.append(menu.getId()).append(",");
				}
			}
		}

		ServletActionContext.getResponse().getWriter().print(builder.toString());
	}

	// 1 根据roleId查询到ElecRole对象
	// 2 首先删除所有的权限 , 然后再把新的权限添加进去
	public void updateRole() throws IOException {

		List<Menu> newMenuList = menuService.findByIds(menus);
		roleService.updateMenus(roleId, new HashSet<Menu>(newMenuList));

		//更新上下文
		@SuppressWarnings("unchecked")
		Map<String,RoleMenu> roleMenuMap = (Map<String, RoleMenu>) ServletActionContext.getServletContext().getAttribute("roleMenuMap");
		RoleMenu generalRM = new RoleMenu(menuService, roleService, RoleEnum.GENERAL);
		RoleMenu manageRM = new RoleMenu(menuService, roleService, RoleEnum.MANAGE);
		RoleMenu equipRM = new RoleMenu(menuService, roleService, RoleEnum.EQUIP);
		RoleMenu adminRM = new RoleMenu(menuService, roleService, RoleEnum.ADMIN);
		roleMenuMap.put("通用", generalRM);
		roleMenuMap.put("经理", manageRM);
		roleMenuMap.put("设备管理员", equipRM);
		roleMenuMap.put("系统管理员", adminRM);
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		ServletActionContext.getResponse().getWriter().print("保存修改成功!");
	}

	// 准备需要的数据
	public String roleHome() {
		// 1 角色列表数据
		List<Role> roleList = roleService.list();
		ServletActionContext.getRequest().setAttribute("roleList", roleList);

		// 2所有的菜单分组类别
		Conditions conditions = new Conditions();
		conditions.addCondition("level", 2, Operator.EQUALS);
		conditions.addCondition("isUse", 1, Operator.EQUALS);
		List<Menu> menuList = menuService.findByConditions(conditions);
		
		@SuppressWarnings("unchecked")
		Map<String,String> mainMenuMap = (Map<String, String>) ServletActionContext.getServletContext().getAttribute("mainMenuMap");
		
		// 分组
		Map<String, List<Menu>> groupsMap = new HashMap<String, List<Menu>>();
		if (menuList != null) {
			for (Menu menu : menuList) {
				String groups = mainMenuMap.get(menu.getParentId());
				List<Menu> tempList = groupsMap.get(groups);
				if (tempList == null) {
					tempList = new ArrayList<Menu>();
				}
				tempList.add(menu);
				groupsMap.put(groups, tempList);
			}
		}
		ServletActionContext.getRequest().setAttribute("groupsMap", groupsMap);

		// 准备所有的角色的信息(json格式的数据)
		String roleListJson = JsonUtils.toJson(roleList);
		ServletActionContext.getRequest().setAttribute("roleListJson", roleListJson);

		return "roleHome";
	}

	private String account;

	// 响应ajax请求的方法
	public void queryUser() throws IOException {
		Conditions conditions = new Conditions();
		conditions.addCondition("isDelete", false, Operator.EQUALS);
		conditions.addCondition("username", account, Operator.LIKE);

		List<User> userList = userService.findByConditions(conditions);

		// 以哪种格式返回查到的数据
		JsonUtils.writeJson(userList,ServletActionContext.getResponse());

	}

	// 修改用户的角色
	private String roles;// 006, 002, 004
	private String userId;// 00001

	// 先删除所有的用户角色关联信息,在添加新的
	public void updateUserRole() throws IOException {
		List<Role> newRoleList = roleService.findByIds(roles);

		userService.updateRoles(userId, new HashSet<Role>(newRoleList));

		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		ServletActionContext.getResponse().getWriter().print("保存修改成功!");
	}
	
	/**
	 * 获取菜单配置
	 */
	public void getMenuConfig(){
		//获取一级菜单列表
		//MenuConfig config = menuService.getMenuConfig();
		MenuConfig config = (MenuConfig) ServletActionContext.getRequest().getSession().getAttribute("config");
		//通过ServletActionContext解耦servlet
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		//传输json
		JsonUtils.writeJson(config, response);
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public MenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	
	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getMenus() {
		return menus;
	}

	public void setMenus(String menus) {
		this.menus = menus;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getRoles() {
		return roles;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}
