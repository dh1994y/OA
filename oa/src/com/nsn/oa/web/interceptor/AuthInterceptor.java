package com.nsn.oa.web.interceptor;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import com.nsn.oa.domain.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;


/**
 * 权限拦截器
 * @author Administrator
 *
 */
public class AuthInterceptor extends AbstractInterceptor{

		// 请求路径白名单
		private Set<String> whitePath = new HashSet<String>();
		private Set<String> commonPath = new HashSet<String>();

		@Override
		public void init() {
			// 初始白名单
			whitePath.add("userAction_login");
			commonPath.add("userAction_logout");
			commonPath.add("matterAction_home");
			commonPath.add("matterAction_edit");
			commonPath.add("matterAction_update");
			commonPath.add("personalInfoAction_home");
			commonPath.add("personalInfoAction_edit");
			commonPath.add("personalInfoAction_save");
			commonPath.add("personalInfoAction_editPwd");
			commonPath.add("personalInfoAction_updatePwd");
			commonPath.add("authAction_getMenuConfig");
		}

		@Override
		public String intercept(ActionInvocation actionInvocation) throws Exception {
			ActionContext actionContext = actionInvocation.getInvocationContext();

			// (为了下面开发的方便) 把权限检查屏蔽掉,等项目完成时,再打开
			boolean mark = false;
			if (mark) {
				return actionInvocation.invoke();
			}
			// 本次的请求路径 , 也就是本次请求的action的名字
			String actionName = actionContext.getName();
			System.out.println(actionName + "----------------------------------------");
			// 判断是否在白名单中
			if (whitePath.contains(actionName)) {
				// 放行,该到哪去到哪去
				return actionInvocation.invoke();
			}

			
			User user = (User) actionContext.getSession().get("user");
			@SuppressWarnings("unchecked")
			Collection<String> pList =  (Collection<String>) actionContext.getSession().get("pList");

			if (user == null) {
				// 缺少权限(需要配置全局的result)
				return "authError";
			}
			// 判断是否在通用功能中
			if (commonPath.contains(actionName)) {
				// 放行,该到哪去到哪去
				return actionInvocation.invoke();
			}
			// 判断此用户是否拥有此权限
			for (String permission : pList) {
				if(permission.equals(actionName)){
					// 放行,该到哪去到哪去
					return actionInvocation.invoke();
				}
			}

			// 此用户没有此功能的权限
			return "authError";
		}

}
