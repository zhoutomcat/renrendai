package com.yc.biz.impl;

import java.util.HashMap;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Isolation;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.yc.bean.UserMessage;
import com.yc.biz.DebitMoneyBiz;
import com.yc.dao.BaseDao;
import com.yc.web.model.JsonModel;

@Service
@Transactional
public class DebitMoneyBizImpl implements DebitMoneyBiz {

	@Resource(name = "baseDao")
	private BaseDao baseDao;

	@Override
	public boolean addDebitMoney(UserMessage um) {
		baseDao.save(um, "addDebitMoney");
		return true;
	}



	@Override
	public boolean updateUserMessageMoney(UserMessage um) {
		baseDao.update(um, "updateUserMessageMoney");
		return true;
	}



	@Override
	@Transactional(readOnly=true,propagation=Propagation.SUPPORTS)
	public UserMessage isUserMessageIdExist(UserMessage um) {
		UserMessage userMessage=(UserMessage)this.baseDao.findOne(um, "isUserMessageIdExist");
		return userMessage;
	}


}
