package com.nsn.oa.utils;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * json工具类
 * @author Administrator
 *
 */
public class JsonUtils {
	
	private static Gson gson = new Gson();
	/**
	 * 将对象以json格式传输到客户端
	 * @param src
	 * @param response
	 */
	public static void writeJson(Object src,HttpServletResponse response){
		String json = gson.toJson(src);
		try {
			response.setContentType("text/json;charset=utf-8");
			response.getWriter().print(json);
		} catch (IOException e) {
			throw new RuntimeException("服务端异常");
		}
	}
	/**
	 * 将对象转换为json字符串
	 * @param obj
	 * @return
	 */
	public static String toJson(Object obj){
		return gson.toJson(obj);
	}
}
