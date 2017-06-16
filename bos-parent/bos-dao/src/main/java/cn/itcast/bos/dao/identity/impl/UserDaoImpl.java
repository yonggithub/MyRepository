package cn.itcast.bos.dao.identity.impl;

import org.springframework.stereotype.Repository;

import cn.itcast.bos.dao.identity.UserDao;
import cn.itcast.core.hibernate.impl.HibernateDaoImpl;

@Repository("userDao")
public class UserDaoImpl extends HibernateDaoImpl implements UserDao {

}
