package com.nsn.oa.domain.utils;

import java.util.ArrayList;
import java.util.List;

public class FirstLevelMenu {

	private String id;
	private List<SecondLevelMenu> menu = new ArrayList<SecondLevelMenu>();

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public List<SecondLevelMenu> getMenu() {
		return menu;
	}
	public void setMenu(List<SecondLevelMenu> menu) {
		this.menu = menu;
	}
}
