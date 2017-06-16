package cn.itcast.bos.service.identity;

import java.util.Map;

import cn.itcast.bos.entity.identity.User;

public interface IdentityService {

	public Map<String, Object> login(String userId, String password, String vcode, String key) ;

	public User getUser(String userId);
}
