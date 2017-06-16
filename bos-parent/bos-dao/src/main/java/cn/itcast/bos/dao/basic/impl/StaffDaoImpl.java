package cn.itcast.bos.dao.basic.impl;

import org.springframework.stereotype.Repository;

import cn.itcast.bos.dao.basic.StaffDao;
import cn.itcast.core.hibernate.impl.HibernateDaoImpl;

@Repository("staffDao")
public class StaffDaoImpl extends HibernateDaoImpl implements StaffDao {

}
