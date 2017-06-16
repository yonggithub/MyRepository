package cn.itcast.bos.dao.identity.impl;

import org.springframework.stereotype.Repository;

import cn.itcast.bos.dao.identity.ResourceDao;
import cn.itcast.core.hibernate.impl.HibernateDaoImpl;

@Repository("resourceDao")
public class ResourceDaoImpl extends HibernateDaoImpl implements ResourceDao {

}
