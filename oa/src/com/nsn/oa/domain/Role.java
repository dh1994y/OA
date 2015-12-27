package com.nsn.oa.domain;

import java.util.HashSet;
import java.util.Set;


/**
 * 角色类
 * @author Administrator
 *
 */
public class Role {
	private String id;//id
	private String roleName;//角色名称
	private Set<Menu> menuSet = new HashSet<>();//菜单列表
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public Set<Menu> getMenuSet() {
		return menuSet;
	}
	public void setMenuSet(Set<Menu> menuSet) {
		this.menuSet = menuSet;
	}
	
}
