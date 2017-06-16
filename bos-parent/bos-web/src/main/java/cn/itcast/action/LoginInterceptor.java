package cn.itcast.action;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import cn.itcast.bos.entity.identity.User;
import cn.itcast.bos.service.identity.IdentityService;
import cn.itcast.core.common.Constant;
import cn.itcast.core.common.CookieTools;

public class LoginInterceptor extends AbstractInterceptor{

	@Autowired
	private IdentityService identityService;
	
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		System.out.println("进入了hello拦截器");
		User user = (User) invocation.getInvocationContext().getSession().get(Constant.SESSION_USER);
		if (user == null) {
			Cookie cookie = CookieTools.getCookie(Constant.COOKIE_NAME);
			if (cookie!=null) {
				String userId = cookie.getValue();
				user = identityService.getUser(userId);
				invocation.getInvocationContext().getSession().put(Constant.SESSION_USER, user);
			}
		}
		return user ==null ? Action.LOGIN: invocation.invoke();
	}

}
