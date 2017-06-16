package cn.itcast.bos.service.identity.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.itcast.bos.dao.identity.DeptDao;
import cn.itcast.bos.dao.identity.JobDao;
import cn.itcast.bos.dao.identity.ResourceDao;
import cn.itcast.bos.dao.identity.RoleDao;
import cn.itcast.bos.dao.identity.UserDao;
import cn.itcast.bos.entity.identity.User;
import cn.itcast.bos.service.identity.IdentityService;
import cn.itcast.core.action.VerifyAction;
import cn.itcast.core.common.Constant;
import cn.itcast.core.common.CookieTools;
import cn.itcast.core.security.MD5;

@Service("identityService")
public class IdentityServiceImpl implements IdentityService {

	@Autowired
	private DeptDao deptDao;
	@Autowired
	private JobDao jobDao;
	@Autowired
	private ResourceDao resourceDao;
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private UserDao userDao;

	@Override @Transactional
	public Map<String, Object> login(String userId, String password, String vcode, String key) {
		//0.成功 1.密码账号为空 2.密码账号错误 3.验证码错误
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("status", 0);
			
			String vcodeA = (String) ActionContext.getContext().getSession()
					.get(VerifyAction.VERIFY_CODE);
			User user = userDao.get(User.class,userId);
			//System.out.println("1111111"+user);
			if (StringUtils.isNotBlank(userId) && StringUtils.isNotBlank(password) && StringUtils.isNotBlank(vcode)) {
				if (user!=null) {
					if (userId.equalsIgnoreCase(user.getUserId()) || MD5.getMD5(password).equals(user.getPassword())) {
						if (vcode.equals(vcodeA)) {
							ActionContext.getContext().getSession().put(Constant.SESSION_USER, user);
							//成功登录!!
							map.put("status", 0);
							if (key!=null) {
								//TODO存到cookie 7天
								CookieTools.addCookie(Constant.COOKIE_NAME, user.getUserId(),Constant.MAX_AGE);
							}
						}else {
							map.put("status", 3);
							map.put("tip", "验证码错误!!");
						}
						
					}else {
						map.put("status", 2);
						map.put("tip", "账号或密码错误");
					}
					
				}else {
					map.put("status", 2);
					map.put("tip", "账号或密码错误");
				}
			}else {
				map.put("status", 1);
				map.put("tip", "账号或密码或验证码为空!");
			}
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("登录时异常!", e);
		}
	}

	/** 根据id获取用户
	 * userId 
	 */
	@Override
	public User getUser(String userId) {
		return userDao.get(User.class, userId);
	}
	
	
}

