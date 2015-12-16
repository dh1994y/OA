package com.nsn.oa.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 当项目使用struts2时 ,由于struts2会拦截.jsp的请求并把request对象包装成MultiPartRequestWrapper 对象,导致kindeditor上传文件失败,
	解决办法,修改web.xml中struts2核心过滤器拦截的路径为*.action 和*.jsp , 新建一个Servlet,在servletdoPost方法中调用request.getRequestDispatcher("/kindeditor/jsp/upload_json.jsp")
				.forward(request, response);把请求对象转发给upload_json.jsp即可
 * @author Administrator
 *
 */
public class KindEditorServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//转发到upload_json.jsp
		request.getRequestDispatcher("/resource/kindeditor/jsp/upload_json.jsp").forward(request, response);
		return;
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
}
