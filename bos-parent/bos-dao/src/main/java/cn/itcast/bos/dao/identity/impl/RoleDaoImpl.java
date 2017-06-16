package cn.itcast.bos.dao.identity.impl;

import org.springframework.stereotype.Repository;

import cn.itcast.bos.dao.identity.RoleDao;
import cn.itcast.core.hibernate.impl.HibernateDaoImpl;

@Repository("roleDao")
public class RoleDaoImpl extends HibernateDaoImpl implements RoleDao {

}
