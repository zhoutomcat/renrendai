package com.yc.biz.impl;


import java.util.List;

import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.yc.bean.User;
import com.yc.biz.UserBiz;
import com.yc.dao.BaseDao;
import com.yc.web.model.JsonModel;

@Service
@Transactional
public class UserBizImpl implements UserBiz {
	@Resource(name="baseDao")
	//private BaseDao<VoteUser> baseDao;
	private BaseDao baseDao;


	/**
	 * 用户注册
	 */
	@Override
	public boolean register(User user) throws Exception {
		try {
			baseDao.save(user, "saveUser");
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}


	@Override
	public User login(User user) throws Exception {
		try {
			user = (User) this.baseDao.findOne(user, "getUserByLogin");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return user;
	}


	@Override
	public User isUnameExist(User user) {
		return null;
	}


	@Override
	public void saveOrUpdate(User user) {
		
	}

	/**
	 * 找到所有的用户   查所有
	 */
	@Override
	public JsonModel searchUser(Map<String, Integer> map) {
			List<User> list=baseDao.findAll(User.class, "findUserCondition", map);
			int total=(int) baseDao.getFunc(User.class, "findUserConditionCount",map);
			
			JsonModel<User> jsonModel=new JsonModel<User>();
			jsonModel.setRows(list);
			jsonModel.setTotal(total);
			jsonModel.setPages(Integer.parseInt(map.get("page").toString()));
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
	}
	
	
	
}


