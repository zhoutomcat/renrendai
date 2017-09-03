package com.yc.biz.impl;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.User;
import com.yc.bean.UserDebitIn;
import com.yc.bean.UserDebitInType;
import com.yc.bean.UserDebitOut;
import com.yc.biz.UserDebitInBiz;
import com.yc.dao.BaseDao;
import com.yc.web.model.JsonModel;

@Service
@Transactional
public class UserDebitInBizImpl implements UserDebitInBiz {

	@Resource(name = "baseDao")
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

/*	@Override
	@Transactional(readOnly=true,propagation=Propagation.SUPPORTS,isolation=Isolation.DEFAULT)
	public JsonModel findAllUserDebitIn(Map<String, Integer> map) {
		List<UserDebitIn> list=baseDao.findAll(UserDebitIn.class, "findAllUserDebitInResultMap", map);
		int total=(int) baseDao.getFunc(UserDebitIn.class, "findAllUserDebitInResultMapCount",map);
		//System.out.println(list);
		JsonModel<UserDebitIn> jsonModel=new JsonModel<UserDebitIn>();
		jsonModel.setRows(list);
		jsonModel.setTotal(total);
		return jsonModel;
	}*/

	@Override
	public boolean AddUserDebitIn(UserDebitIn udi) {
		//System.out.println(udi);
		baseDao.save(udi, "addUserDebitIn");
		return true;	
	}

	@Override
	public boolean AddUserDebitInType(UserDebitInType udit) {
		baseDao.save(udit, "addUserDebitInType");
		return true;
	}

	@Override
	public boolean updateUserDebitInCheckStatus(UserDebitIn udi) {
		baseDao.update(udi, "updateUserDebitInCheckStatus");
		return true;
	}

	@Override
	public JsonModel findAllUserDebitInunCheck(Map<String, Integer> map) {
		List<UserDebitIn> list=baseDao.findAll(UserDebitIn.class, "findAllUserDebitInunCheckResultMap", map);
		int total=(int) baseDao.getFunc(UserDebitIn.class, "findAllUserDebitInunCheckResultMapCount",map);
		//System.out.println(list);
		JsonModel<UserDebitIn> jsonModel=new JsonModel<UserDebitIn>();
		jsonModel.setRows(list);
		jsonModel.setTotal(total);
		return jsonModel;
	}

	@Override
	public JsonModel findAllUserDebitInCheck(Map<String, Integer> map) {
		List<UserDebitIn> list=baseDao.findAll(UserDebitIn.class, "findAllUserDebitInCheckResultMap", map);
		int total=(int) baseDao.getFunc(UserDebitIn.class, "findAllUserDebitInCheckResultMapCount",map);
		//System.out.println(list);
		JsonModel<UserDebitIn> jsonModel=new JsonModel<UserDebitIn>();
		jsonModel.setRows(list);
		jsonModel.setTotal(total);
		return jsonModel;
	}

	@Override
	public boolean updateUserDebitInStatus(UserDebitIn udi) {
		baseDao.update(udi, "updateUserDebitInStatus");
		return true;
	}

	
	@Override
	public boolean updateUserDebitInWeight(UserDebitIn udi) {
		baseDao.update(udi, "updateUserDebitInWeight");
		return false;
	}

	@Override
	public JsonModel findAllSingerUserDebitIn(Map<String, Integer> map) {
		List<UserDebitIn> list=baseDao.findAll(UserDebitIn.class, "findAllSingerUserDebitInCondition", map);
		int total=(int) baseDao.getFunc(UserDebitIn.class, "findAllSingerUserDebitInConditionCount",map);
		JsonModel<UserDebitIn> jsonModel=new JsonModel<UserDebitIn>();
		jsonModel.setRows(list);
		jsonModel.setTotal(total);
		return jsonModel;
	}

	@Override
	public boolean updateSingerUserDebitIn(UserDebitIn udi) {
		baseDao.update(udi, "updateSingerUserDebitIn");
		return true;
	}

}
