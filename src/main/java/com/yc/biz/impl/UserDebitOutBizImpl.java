package com.yc.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.UserDebitIn;
import com.yc.bean.UserDebitInType;
import com.yc.bean.UserDebitOut;
import com.yc.biz.UserDebitInBiz;
import com.yc.biz.UserDebitOutBiz;
import com.yc.dao.BaseDao;

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
	public int findUserDebitInIdByUserDebitInTypeId(Map<String , Object> parameterMap) {
		Integer result = (Integer.parseInt( this.baseDao.findOne(UserDebitOut.class, "findUserDebitInIdByUserDebitInTypeId", parameterMap).toString()) );
		return result;
	}

}
