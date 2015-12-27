package com.nsn.oa.domain;

import java.util.HashSet;
import java.util.Set;

public class Menu {

	private String id;//菜单id
	private String name;//菜单名
	private int level;//菜单等级
	private int orderValue;//菜单顺序 数字越小越靠前
	private String parentId;//父节点id
	private String url;//映射地址
	private int isUse;//是否启用
	
	private Set<Permission> permissionSet = new HashSet<>();//权限列表
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getIsUse() {
		return isUse;
	}
	public void setIsUse(int isUse) {
		this.isUse = isUse;
	}
	public int getOrderValue() {
		return orderValue;
	}
	public void setOrderValue(int orderValue) {
		this.orderValue = orderValue;
	}
	public Set<Permission> getPermissionSet() {
		return permissionSet;
	}
	public void setPermissionSet(Set<Permission> permissionSet) {
		this.permissionSet = permissionSet;
	}

}
