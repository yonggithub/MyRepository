package cn.itcast.bos.dao.handlecenter.impl;

import org.springframework.stereotype.Repository;

import cn.itcast.bos.dao.handlecenter.WorkBillDao;
import cn.itcast.core.hibernate.impl.HibernateDaoImpl;

@Repository("workBillDao")
public class WorkBillDaoImpl extends HibernateDaoImpl implements WorkBillDao {

}
