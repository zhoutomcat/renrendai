package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.UserDebitIn;
import com.yc.bean.UserDebitInType;
import com.yc.biz.UserDebitInBiz;
import com.yc.dao.BaseDao;

@Service
@Transactional
public class UserDebitInBizImpl implements UserDebitInBiz {

	@Resource(name = "baseDao")
	// private BaseDao<VoteUser> baseDao;
	private BaseDao baseDao;

	@Override
	public List<UserDebitInType> findAllUserDebitInType() {
		List<UserDebitInType> list = baseDao.findAll( UserDebitInType.class, "findAllUserDebitInType" );
		return list;
	}
}
