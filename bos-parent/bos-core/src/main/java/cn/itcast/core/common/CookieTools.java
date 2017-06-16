package cn.itcast.core.common;

import javax.servlet.http.Cookie;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

public final class CookieTools {
	//获取cookie
	public static Cookie getCookie(String cookieName){
		Cookie[] cookies = ServletActionContext.getRequest().getCookies();
		if (cookies != null && cookies.length>0) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(cookieName)) {
					return cookie;
				}
			}
		}
		return null;
	}
	
	//添加cookie
	public static void addCookie(String cookieName,String cookieValue,int maxAge){
			Cookie cookie = getCookie(cookieName);
			if (cookie ==null ) {
				cookie  = new Cookie(cookieName, cookieValue);
			}
			cookie.setMaxAge(maxAge);
			cookie.setPath("/");
			ServletActionContext.getResponse().addCookie(cookie);
		
	}
	//删除cookie
	public static void removeCookie(String cookieName){
		Cookie cookie = getCookie(cookieName);
		if (cookie!=null) {
			cookie.setMaxAge(0);
			cookie.setPath("/");
		}
		ServletActionContext.getResponse().addCookie(cookie);
	}
	
}
