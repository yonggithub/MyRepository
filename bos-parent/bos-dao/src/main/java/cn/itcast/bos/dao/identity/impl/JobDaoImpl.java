package cn.itcast.bos.dao.identity.impl;

import org.springframework.stereotype.Repository;

import cn.itcast.bos.dao.identity.JobDao;
import cn.itcast.core.hibernate.impl.HibernateDaoImpl;

@Repository("JobDao")
public class JobDaoImpl extends HibernateDaoImpl implements JobDao {

}
