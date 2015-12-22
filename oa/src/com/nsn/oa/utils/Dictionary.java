package com.nsn.oa.utils;

import java.net.URL;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.junit.Test;

/**
 * 单例的数据字典类
 * @author Administrator
 *	el ognl strutsui
 *	el ${}
 *	ognl %{#application.map.key}
 *	ui  select 
 */
public class Dictionary {
	private static Dictionary instance;
	//定义数据结构 提供getset方法 使得表达式语言能够访问
	private Map<String,Map<String,String>> dictMap;//包含分组的所有item信息，不包含组value
	private Map<String,String> groupMap;//包含所有组的key和value
	private Map<String,String> itemMap;//包含所有item的key和value 用于快速检索item 前提 key不重复 使用组前缀
	
	private Dictionary(){	
	}
	
	public static synchronized Dictionary getInstance(){
		if(instance==null){
			instance = new Dictionary();
			instance.init();
		}
		return instance;
	}
	/**
	 * 解析xml文件
	 */
	private void init(){
		System.out.println("=============初始化数据字典开始===============");
		dictMap = new LinkedHashMap<>();
		groupMap = new LinkedHashMap<>();
		itemMap = new LinkedHashMap<>();
		
		URL filePath = Dictionary.class.getResource("/dictionary.xml");
		SAXReader reader = new SAXReader();
		
		try{
			Document document = reader.read(filePath);
			Element rootElement = document.getRootElement();
			List<Element> groupList = rootElement.elements();
			for (Element groupElement : groupList) {
				String groupKey = groupElement.attributeValue("key");
				String groupValue = groupElement.attributeValue("value");
				
				//合法性校验
				if(CommonUtils.hasEmpty(groupKey,groupValue)){
					throw new RuntimeException("数据字典项不合法");
				}
				//groupMap 存值
				groupMap.put(groupKey, groupValue);
				List<Element> itemList = groupElement.elements();
				Map<String,String> tempMap = new LinkedHashMap<>();
				tempMap.put(null, "====");
				for (Element itemElement : itemList) {
					String itemKey = itemElement.attributeValue("key");
					String itemValue = itemElement.attributeValue("value");
					//合法性校验
					if(CommonUtils.hasEmpty(itemKey,itemValue)){
						throw new RuntimeException("数据字典项不合法");
					}
					//itemMap 存值
					itemMap.put(itemKey, itemValue);
					//tempMap 存值
					tempMap.put(itemKey, itemValue);
				}
				//dictMap 存值
				dictMap.put(groupKey, tempMap);
			}
		}catch(Exception e){
			throw new RuntimeException("解析异常"+e);
		}
		
		System.out.println("=============初始化数据字典结束===============");
	}
	
	@Test
	public static synchronized void reload(){
		if(instance==null){
			getInstance();
		}else{
			instance.init();
		}
	}

	public Map<String, Map<String, String>> getDictMap() {
		return dictMap;
	}

	public void setDictMap(Map<String, Map<String, String>> dictMap) {
		this.dictMap = dictMap;
	}

	public Map<String, String> getGroupMap() {
		return groupMap;
	}

	public void setGroupMap(Map<String, String> groupMap) {
		this.groupMap = groupMap;
	}

	public Map<String, String> getItemMap() {
		return itemMap;
	}

	public void setItemMap(Map<String, String> itemMap) {
		this.itemMap = itemMap;
	}
	
}
