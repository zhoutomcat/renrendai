package com.yc.biz.impl;


import java.util.List;

import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.yc.bean.User;
import com.yc.biz.AttentionMarkBiz;
import com.yc.biz.UserBiz;
import com.yc.dao.BaseDao;
import com.yc.web.model.JsonModel;

@Service
@Transactional
public class AttentionMarkBizImpl implements AttentionMarkBiz{
	@Resource(name="baseDao")
	//private BaseDao<VoteUser> baseDao;
	private BaseDao baseDao;

	@Override
	public JsonModel searchUser(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delUser(User user) {
		// TODO Auto-generated method stub
		return false;
	}


	
	/**
	 * 找到所有的用户   查所有
	 */
/*	@Override
	public JsonModel searchUser(Map<String, Integer> map) {
			List<User> list=baseDao.findAll(User.class, "findUserCondition", map);
			int total=(int) baseDao.getFunc(User.class, "findUserConditionCount",map);
			
			JsonModel<User> jsonModel=new JsonModel<User>();
			jsonModel.setRows(list);
			jsonModel.setTotal(total);
			jsonModel.setPage(map.get("page"));
			jsonModel.setPagesize(map.get("pagesize"));
			return jsonModel;
		}


	@Override
	public boolean updateUser(User user) {
		baseDao.update(user, "updateuser");
		return true;
	}


	@Override
	public boolean delUser(User user) {
		baseDao.del(user, "deluser");
		return true;
	}*/
	
	
	
}


