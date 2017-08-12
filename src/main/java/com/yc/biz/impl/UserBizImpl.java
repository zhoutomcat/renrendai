package com.yc.biz.impl;


import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.yc.bean.User;
import com.yc.biz.UserBiz;
import com.yc.dao.BaseDao;

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

}
