package com.nsn.oa.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nsn.oa.dao.IMenuDao;
import com.nsn.oa.dao.utils.Conditions;
import com.nsn.oa.dao.utils.Conditions.Operator;
import com.nsn.oa.domain.Menu;
import com.nsn.oa.domain.utils.FirstLevelMenu;
import com.nsn.oa.domain.utils.SecondLevelMenu;
import com.nsn.oa.domain.utils.ThirdLevelMenu;

public class MenuService {
	private IMenuDao menuDao;

	/**
	 * 获取菜单
	 */
	public Object[] getMenu() {
		// 声明菜单数据结构
		List<String> mainMenu = new ArrayList<>();
		List<FirstLevelMenu> fmList = new ArrayList<>();
		//辅助map用于连接二级和三级之间的关联
		Map<SecondLevelMenu,String> secondLevelMenuMap = new HashMap<>();
		// 检索所有menu 只查询一次数据库  必须保证以下检索排序条件
		Conditions conditions = new Conditions();
		conditions.addOrderBy("level", true);// 主排序条件菜单等级
		conditions.addOrderBy("orderValue", true);// 第二排序条件菜单顺序
		conditions.addCondition("isUse", 1, Operator.EQUALS);//只查询启用的菜单
		List<Menu> menuList = menuDao.findByConditions(conditions);

		for (Menu menu : menuList) {
			if (menu.getLevel() == 1) {
				// 添加主菜单名
				mainMenu.add(menu.getName());
				// 添加一级菜单
				FirstLevelMenu fm = new FirstLevelMenu();
				fm.setId(menu.getId());
				// 创建二级菜单List
				List<SecondLevelMenu> smList = new ArrayList<>();
				fm.setMenu(smList);
				fmList.add(fm);
			} else if (menu.getLevel() == 2) {
				//添加二级菜单
				for (FirstLevelMenu fm : fmList) {
					//注意此处易范错误 使用==
					if(fm.getId().equals(menu.getParentId())){
						SecondLevelMenu sm = new SecondLevelMenu();
						sm.setText(menu.getName());
						//此处记录二级菜单id按顺序排列用于维护与三级菜单的联系
						secondLevelMenuMap.put(sm,menu.getId());
						//创建三级菜单List
						List<ThirdLevelMenu> tmList = new ArrayList<>();
						sm.setItems(tmList);
						fm.getMenu().add(sm);
					}
				}
			} else if (menu.getLevel() == 3) {
				// 添加三级菜单
				for(FirstLevelMenu fm : fmList){
					for(SecondLevelMenu sm : fm.getMenu()){
						if(secondLevelMenuMap.get(sm).equals(menu.getParentId())){
							ThirdLevelMenu tm = new ThirdLevelMenu();
							tm.setId(menu.getId());
							tm.setText(menu.getName());
							tm.setHref(menu.getUrl());
							//添加三级菜单
							sm.getItems().add(tm);
						}
					}
				}
			}
		}
		Object[] array = {mainMenu,fmList};
		return array;
	}

	public IMenuDao getMenuDao() {
		return menuDao;
	}

	public void setMenuDao(IMenuDao menuDao) {
		this.menuDao = menuDao;
	}
	
	
}
