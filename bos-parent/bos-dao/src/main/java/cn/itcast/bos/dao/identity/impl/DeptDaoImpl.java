package cn.itcast.bos.dao.identity.impl;

import org.springframework.stereotype.Repository;

import cn.itcast.bos.dao.identity.DeptDao;
import cn.itcast.core.hibernate.impl.HibernateDaoImpl;

@Repository("deptDao")
public class DeptDaoImpl extends HibernateDaoImpl implements DeptDao {

}
