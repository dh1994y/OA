package com.nsn.oa.utils;
/**
 * 通用工具类
 * @author Administrator
 *
 */
public class CommonUtils {

	/**
	 * 判断当前参数中是否有空对象  若为字符串长度不能为0
	 * @return
	 */
	public static boolean hasEmpty(Object... params){
		for(Object obj : params){
			if(obj==null){
				return true;
			}else if(obj instanceof String){
				if(((String) obj).length()<=0){
					return true;
				}
			}
		}
		return false;
	}
}
