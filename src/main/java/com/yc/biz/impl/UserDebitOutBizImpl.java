package com.yc.biz.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.UserDebitOut;
import com.yc.biz.UserDebitOutBiz;
import com.yc.dao.BaseDao;
import com.yc.web.model.JsonModel;

@Service
@Transactional
public class UserDebitOutBizImpl implements UserDebitOutBiz {

	@Resource(name = "baseDao")
	// private BaseDao<VoteUser> baseDao;
	private BaseDao baseDao;

	@Override
	public void addUplanUserDebitOut(Map<String, Object> parameterMap) {
		this.baseDao.save(UserDebitOut.class, "addUplanUserDebitOut", parameterMap);
	}

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT)
	public JsonModel<UserDebitOut> findAllUserDebitOut(Map<String, Integer> map) {
		List<UserDebitOut> list = baseDao.findAll(UserDebitOut.class, "findAllUserDebitOutResultMap", map);
		int total = (int) baseDao.getFunc(UserDebitOut.class, "findAllUserDebitOutResultMapCount", map);

		JsonModel<UserDebitOut> jsonModel = new JsonModel<UserDebitOut>();
		jsonModel.setRows(list);
		jsonModel.setTotal(total);
		return jsonModel;
	}

	@Override
	public int findUserDebitInIdByUserDebitInTypeId(Map<String, Object> parameterMap) {
		Integer result = (Integer.parseInt(this.baseDao
				.findOne(UserDebitOut.class, "findUserDebitInIdByUserDebitInTypeId", parameterMap).toString()));
		return result;
	}
}