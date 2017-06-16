package cn.itcast.action;

import java.util.HashMap;
import java.util.Map;

import javax.xml.ws.RespectBinding;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

import cn.itcast.bos.service.identity.IdentityService;

public class LoginAction extends ActionSupport {
	
	private Map<String, Object> responseDate = new HashMap<>();	
	
	private String userId ;
	private String password;
	private String vcode;
	private String key;
	
	@Autowired
	private IdentityService identityService;
	
	@Override
	public String execute(){
		System.out.println("进来");
	
			responseDate = identityService.login(userId,password,vcode,key);
		//responseDate.put("status", 0);
		return SUCCESS;
	}


	
	public void setKey(String key) {
		this.key = key;
	}



	public void setIdentityService(IdentityService identityService) {
		this.identityService = identityService;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public void setVcode(String vcode) {
		this.vcode = vcode;
	}



	public Map<String, Object> getResponseDate() {
		return responseDate;
	}

	

	public String getUserId() {
		return userId;
	}



	public String getPassword() {
		return password;
	}



	public String getVcode() {
		return vcode;
	}



	public void setResponseDate(Map<String, Object> responseDate) {
		this.responseDate = responseDate;
	}
	
	
}
