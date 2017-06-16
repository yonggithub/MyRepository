package cn.itcast.bos.dao.basic.impl;

import org.springframework.stereotype.Repository;

import cn.itcast.bos.dao.basic.RegionDao;
import cn.itcast.core.hibernate.impl.HibernateDaoImpl;

@Repository("regionDao")
public class RegionDaoImpl extends HibernateDaoImpl implements RegionDao {

}
