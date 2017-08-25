package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.yc.bean.UserDebitInType;
import com.yc.biz.UserDebitInTypeBiz;
import com.yc.dao.BaseDao;
@Service
public class UserDebitInTypeBizImpl implements UserDebitInTypeBiz {
	@Resource(name="baseDao")
	private BaseDao baseDao;



	@Override
	public List<UserDebitInType> getTypeList() {
		List<UserDebitInType> types=null;
		types=baseDao.findAll(UserDebitInType.class, "getAllUserDebitInType");
		return types;
	}

}
