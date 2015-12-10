package com.nsn.oa.domain.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * 菜单配置
 * @author Administrator
 *
 */
public class MenuConfig {
	//主菜单list
	private List<String> mainNavList = new ArrayList<>();
	//左侧菜单list
	private List<List<MenuItem>> leftNavList = new ArrayList<>();
	
	public List<String> getMainNavList() {
		return mainNavList;
	}
	public void setMainNavList(List<String> mainNavList) {
		this.mainNavList = mainNavList;
	}
	public List<List<MenuItem>> getLeftNavList() {
		return leftNavList;
	}
	public void setLeftNavList(List<List<MenuItem>> leftNavList) {
		this.leftNavList = leftNavList;
	}
	
	
}
