package com.yc.biz.impl;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.UserDebitIn;
import com.yc.bean.UserDebitInType;
import com.yc.bean.UserDebitOut;
import com.yc.biz.UserDebitInBiz;
import com.yc.dao.BaseDao;

@Service
@Transactional
public class UserDebitInBizImpl implements UserDebitInBiz {

	@Resource(name = "baseDao")
	// private BaseDao<VoteUser> baseDao;
	private BaseDao baseDao;

	@Override
	@Transactional(readOnly=true,propagation=Propagation.SUPPORTS,isolation=Isolation.DEFAULT)
	public List<UserDebitInType> findAllUserDebitInType() {
		List<UserDebitInType> list = baseDao.findAll(UserDebitInType.class, "findAllUserDebitInType");
		return list;
	}

	@Override
	@Transactional(readOnly=true,propagation=Propagation.SUPPORTS,isolation=Isolation.DEFAULT)
	public double findAllUserDebitInMoneyByUserDebitInTypeName(UserDebitInType userDebitInType) {
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("udit_name", userDebitInType.getUdit_name());
		double result = 0 ;
		UserDebitIn userDebitIn = (UserDebitIn) baseDao.findOne(UserDebitIn.class, "findAllUserDebitInMoneyByUserDebitInTypeName", parameterMap);
		result = userDebitIn.getTotalMoney();
		return result;
	}

	@Override
	@Transactional(readOnly=true,propagation=Propagation.SUPPORTS,isolation=Isolation.DEFAULT)
	public List<UserDebitIn> findAllUplanData() {
		List<UserDebitIn> list = this.baseDao.findAll(UserDebitIn.class, "findAllUplanData");
		return list;
	}

	@Override
	@Transactional(readOnly=true,propagation=Propagation.SUPPORTS,isolation=Isolation.DEFAULT)
	public List<UserDebitIn> findAllUplanHistory(UserDebitIn userDebitIn) {
		List<UserDebitIn> list = this.baseDao.findAll(userDebitIn, "findAllUpanHistory");
		return list;
	}

	@Override
	@Transactional(readOnly=true,propagation=Propagation.SUPPORTS,isolation=Isolation.DEFAULT)
	public int findAllUplanHistoryCount() {
		int result = (int) this.baseDao.findOne(UserDebitIn.class, "findAllUpanHistoryCount");
		return result ;
	}

	@Override
	@Transactional(readOnly=true,propagation=Propagation.SUPPORTS,isolation=Isolation.DEFAULT)
	public List<UserDebitIn> findAllSanbiaoHistory(UserDebitIn userDebitIn) {
		List<UserDebitIn> list = this.baseDao.findAll(userDebitIn, "findSanbiaoHistory");
		return list;
	}

	@Override
	@Transactional(readOnly=true,propagation=Propagation.SUPPORTS,isolation=Isolation.DEFAULT)
	public int findAllSanbiaoHistoryCount() {
		int result = (int) this.baseDao.findOne(UserDebitIn.class, "findAllSanbiaoHistoryCount");
		return result;
	}

}
