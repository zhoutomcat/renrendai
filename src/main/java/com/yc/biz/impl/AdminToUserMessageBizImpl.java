package com.yc.biz.impl;

import java.util.List;


import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.yc.bean.AdminToUserMessage;
import com.yc.biz.AdminToUserMessageBiz;
import com.yc.dao.BaseDao;
import com.yc.web.model.JsonModel;

@Service
@Transactional
public class AdminToUserMessageBizImpl implements AdminToUserMessageBiz {
	@Resource(name = "baseDao")
	private BaseDao baseDao;

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT)
	public JsonModel findAllAdminToUserMessage(Map<String, Integer> map) {
		List<AdminToUserMessage> list = baseDao.findAll(AdminToUserMessage.class, "findAllAdminToUserMessageResultMap", map);
		int total = (int) baseDao.getFunc(AdminToUserMessage.class, "findAllAdminToUserMessageResultMapCount", map);

		JsonModel<AdminToUserMessage> jsonModel = new JsonModel<AdminToUserMessage>();
		jsonModel.setRows(list);
		jsonModel.setTotal(total);
		return jsonModel;
	}

	
}