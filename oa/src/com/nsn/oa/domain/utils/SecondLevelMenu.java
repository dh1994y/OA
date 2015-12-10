package com.nsn.oa.domain.utils;

import java.util.ArrayList;
import java.util.List;

public class SecondLevelMenu {

	private String text;
	private List<ThirdLevelMenu> items = new ArrayList<ThirdLevelMenu>();
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public List<ThirdLevelMenu> getItems() {
		return items;
	}
	public void setItems(List<ThirdLevelMenu> items) {
		this.items = items;
	}
}
