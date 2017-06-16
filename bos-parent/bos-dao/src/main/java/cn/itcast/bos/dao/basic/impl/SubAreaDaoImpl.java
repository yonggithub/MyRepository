package cn.itcast.bos.dao.basic.impl;

import org.springframework.stereotype.Repository;

import cn.itcast.bos.dao.basic.SubAreaDao;
import cn.itcast.core.hibernate.impl.HibernateDaoImpl;

@Repository("subAreaDao")
public class SubAreaDaoImpl extends HibernateDaoImpl implements SubAreaDao {

}
