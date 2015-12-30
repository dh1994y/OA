package com.nsn.oa.domain.utils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import com.nsn.oa.dao.IMenuDao;
import com.nsn.oa.dao.IRoleDao;
import com.nsn.oa.dao.utils.Conditions;
import com.nsn.oa.dao.utils.Conditions.Operator;
import com.nsn.oa.domain.Menu;
import com.nsn.oa.domain.Permission;
import com.nsn.oa.domain.Role;
import com.nsn.oa.service.MenuService;
import com.nsn.oa.service.RoleService;


/**
 * 角色拥有的菜单项
 * @author Administrator
 *
 */
public class RoleMenu{
	//TreeMap如不指定排序器，默认将按照key值进行升序排序，如果指定了排序器，则按照指定的排序器进行排序。
	private Map<Integer,String> mainMenuMap = new TreeMap<>();//主导航栏    <顺序值，菜单名>
	private Map<Integer,Map<Integer,MenuItem>> leftMenuMap = new TreeMap<>();//侧边导航栏 <主导航顺序值，<侧导航顺序值，二级菜单项>>
	private Map<String,String> permissionMap = new HashMap<>();//权限项    <权限id，权限action_method>
	/**
	 * 合并 roleMenu
	 * @param roleMenu
	 */
	public void addRoleMenu(RoleMenu roleMenu){
		//合并主导航栏
		mainMenuMap.putAll(roleMenu.getMainMenuMap());
		//合并侧导航栏
		Set<Integer> orderSet = roleMenu.getLeftMenuMap().keySet();
		for (Integer order : orderSet) {
			if(!leftMenuMap.containsKey(order)){
				//若不包含直接put
				Map<Integer,MenuItem> map = new TreeMap<>();
				leftMenuMap.put(order, map);
				map.putAll(roleMenu.getLeftMenuMap().get(order));
			}else{
				//存在则更新 
				leftMenuMap.get(order).putAll(roleMenu.getLeftMenuMap().get(order));
			}
		}
		//合并权限
		permissionMap.putAll(roleMenu.getPermissionMap());
	}
	
	/**
	 * 根据当前配置创建MenuConfig对象
	 * @return
	 */
	public MenuConfig createMenuConfig(){
		//创建对象
		MenuConfig config = new MenuConfig();
		List<String> mainList = config.getMainNavList();
		List<List<MenuItem>> leftList = config.getLeftNavList();
		//转化mainMenu
		mainList.addAll(mainMenuMap.values());
		//转化leftMenu
		Collection<Map<Integer, MenuItem>> coll = leftMenuMap.values();
		for (Map<Integer, MenuItem> map : coll) {
			List<MenuItem> menuItemList = new ArrayList<>();
			menuItemList.addAll(map.values());
			leftList.add(menuItemList);
		}
		return config;
	}
	/**
	 * 根据当前配置创建权限Collection对象
	 * @return
	 */
	public Collection<String> createPermission(){
		return permissionMap.values();
	}
	
	
	public void init(MenuService menuService, RoleService roleService, RoleEnum roleEnum){
		init(menuService.getMenuDao(),roleService.getRoleDao(),roleEnum);
	}
	/**
	 * 根据角色名初始化RoleMenu对象
	 * @param roleName
	 */
	public void init(IMenuDao menuDao, IRoleDao roleDao, RoleEnum roleEnum){
		//获取一级菜单辅助map 便于检索
		Conditions conditions = new Conditions();
		conditions.addCondition("isUse", 1, Operator.EQUALS);
		conditions.addCondition("level", 1, Operator.EQUALS);
		List<Menu> mainMenuList = menuDao.findByConditions(conditions);
		Map<String,Entry> mainMap = new HashMap<>();
		for (Menu menu : mainMenuList) {
			mainMap.put(menu.getId(),new Entry(menu.getOrderValue(), menu.getName()));
		}
		//处理角色
		String roleName = roleEnum.getRoleName();
		//根据角色名查找角色 获取对应菜单 以及对应权限
		conditions.clear();
		conditions.addCondition("roleName", roleName, Operator.EQUALS);
		List<Role> roleList = roleDao.findByConditions(conditions);
		if(roleList==null||roleList.size()==0){
			throw new RuntimeException("角色不存在");
		}
		//获取对应角色
		Role role = roleList.get(0);
		Set<Menu> menuSet = role.getMenuSet();
		for (Menu menu : menuSet) {
			//创建menuItem
			MenuItem item = new MenuItem();
			item.setName(menu.getName());
			item.setUrl(menu.getUrl());
			//创建entry
			String pId = menu.getParentId();
			Entry entry = mainMap.get(pId);
			if(!mainMenuMap.containsKey(entry.getKey())){
				//赋值主导航栏
				mainMenuMap.put(entry.getKey(), entry.getValue());
				//赋值侧导航栏
				leftMenuMap.put(entry.getKey(), new TreeMap<>());
			}
			leftMenuMap.get(entry.getKey()).put(menu.getOrderValue(), item);
			//赋值权限
			Set<Permission> permissionSet = menu.getPermissionSet();
			for (Permission permission : permissionSet) {
				permissionMap.put(permission.getId(), permission.getActionName());
			}
		}
	}
	/**
	 * 构造方法
	 * @param menuDao
	 * @param roleDao
	 * @param roleEnum
	 */
	public RoleMenu(IMenuDao menuDao, IRoleDao roleDao, RoleEnum roleEnum) {
		//构造时初始化
		init(menuDao, roleDao,roleEnum);
	}
	
	public RoleMenu(MenuService menuService, RoleService roleService, RoleEnum roleEnum) {
		//构造时初始化
		init(menuService, roleService,roleEnum);
	}
	
	public RoleMenu(RoleMenu roleMenu) {
		mainMenuMap.putAll(roleMenu.getMainMenuMap());
		leftMenuMap.putAll(roleMenu.getLeftMenuMap());
		permissionMap.putAll(roleMenu.getPermissionMap());
	}
	
	public RoleMenu() {
	}

	public Map<Integer, String> getMainMenuMap() {
		return mainMenuMap;
	}

	public void setMainMenuMap(Map<Integer, String> mainMenu) {
		this.mainMenuMap = mainMenu;
	}

	public Map<Integer, Map<Integer, MenuItem>> getLeftMenuMap() {
		return leftMenuMap;
	}

	public void setLeftMenuMap(Map<Integer, Map<Integer, MenuItem>> leftMenu) {
		this.leftMenuMap = leftMenu;
	}

	public Map<String,String> getPermissionMap() {
		return permissionMap;
	}

	public void setPermissionMap(Map<String,String> functionMap) {
		this.permissionMap = functionMap;
	}

	/**
	 * 枚举角色
	 * @author Administrator
	 *
	 */
	public enum RoleEnum{
		ADMIN("系统管理员"),EQUIP("设备管理员"),MANAGE("经理"),GENERAL("通用");
		private String roleName;
		private RoleEnum(String roleName) {
			this.roleName = roleName;
		}
		public String getRoleName(){
			return roleName;
		}
	}
	/**
	 * 辅助类
	 * @author Administrator
	 *
	 */
	public class Entry{
		private Integer key;
		private String value;
		
		public Entry() {
		}
		
		public Entry(Integer key, String value) {
			this.key = key;
			this.value = value;
		}

		
		public Integer getKey() {
			return key;
		}
		public void setKey(Integer key) {
			this.key = key;
		}
		public String getValue() {
			return value;
		}
		public void setValue(String value) {
			this.value = value;
		}
	}
	
}
