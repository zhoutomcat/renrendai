package com.yc.biz.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.User;
import com.yc.bean.UserMessage;
import com.yc.biz.UserMessageBiz;
import com.yc.dao.BaseDao;
import com.yc.web.model.JsonModel;
@Service
@Transactional
public class UserMessageBizImpl implements UserMessageBiz {
	@Resource(name="baseDao")
	private BaseDao baseDao;

	@Override
	@Transactional(readOnly=true,propagation=Propagation.SUPPORTS,isolation=Isolation.DEFAULT)
	public JsonModel findAllUserMessage(Map<String, Integer> map) {
		List<UserMessage> list=baseDao.findAll(UserMessage.class, "findUserMessageCondition", map);
		int total=(int) baseDao.getFunc(UserMessage.class, "findUserMessageConditionCount",map);
		
		JsonModel<UserMessage> jsonModel=new JsonModel<UserMessage>();
		jsonModel.setRows(list);
		jsonModel.setTotal(total);
		return jsonModel;
	}

}
