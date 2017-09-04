package com.yc.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.PerRefund;
import com.yc.bean.User;
import com.yc.bean.UserDebitIn;
import com.yc.bean.UserFund;
import com.yc.biz.UserBiz;
import com.yc.dao.BaseDao;
import com.yc.utils.Encrypt;
import com.yc.web.model.JsonModel;

@Service
@Transactional
public class UserBizImpl implements UserBiz {
	@Resource(name = "baseDao")
	// private BaseDao<VoteUser> baseDao;
	private BaseDao baseDao;

	/**
	 * 用户注册
	 */
	@Override
	public boolean register(User user) throws Exception {
		try {
			user.setU_password(Encrypt.md5AndSha(user.getU_password()));
			baseDao.save(user, "saveUser");
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public User login(User user) throws Exception {
		user.setU_password(Encrypt.md5AndSha(user.getU_password()));
		User u = (User) baseDao.findOne(user, "getUserByLogin");
		return u;
	}

	@Override
	public User isUnameExist(User user) {
		return null;
	}

	@Override
	public void saveOrUpdate(User user) {

	}

	/**
	 * 找到所有的可用的用户 查所有
	 */
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT)
	public JsonModel searchallowUser(Map<String, Integer> map) {
		List<User> list = baseDao.findAll(User.class, "findUserallowloginCondition", map);
		int total = (int) baseDao.getFunc(User.class, "findUserallowloginConditionCount", map);
		JsonModel<User> jsonModel = new JsonModel<User>();
		jsonModel.setRows(list);
		jsonModel.setTotal(total);
		return jsonModel;
	}

	/**
	 * 找到所有的不可用的用户 查所有
	 */
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT)
	public JsonModel searchforbidUser(Map<String, Integer> map) {
		List<User> list = baseDao.findAll(User.class, "findUserforbidloginCondition", map);
		int total = (int) baseDao.getFunc(User.class, "findUserforbidloginConditionCount", map);
		JsonModel<User> jsonModel = new JsonModel<User>();
		jsonModel.setRows(list);
		jsonModel.setTotal(total);
		return jsonModel;
	}

	@Override
	public boolean updateUser(User user) {
		user.setU_password(Encrypt.md5AndSha(user.getU_password()));
		baseDao.update(user, "updateuser");
		return true;
	}

	@Override
	public boolean delUser(User user) {
		baseDao.del(user, "deluser");
		return true;
	}

	@Override
	public boolean updatestatus(User user) {
		baseDao.update(user, "updateUstatus");
		return true;
	}

	// 查询用户的账户
	@Override
	public UserFund findUserFundInfoByUser(User user) {
		UserFund userFund = (UserFund) baseDao.findOne(user, "findUserFundInfoByUser");
		return userFund;
	}

	@Override
	public void chongzhiUserFund(Map<String, Object> map) {
		baseDao.update(User.class, "chongzhiUserFund", map);
	}

	@Override
	public void withdrawUserFund(Map<String, Object> map) {
		baseDao.update(User.class, "withdrawUserFund", map);
	}

	@Override
	public void updateUserFundFreeze(Map<String, Object> map) {
		baseDao.update(User.class, "updateUserFundFreeze", map);
	}

	@Override
	public List<UserDebitIn> findAllUserDebitInInfo(Map<String, Object> map) {
		List<UserDebitIn> list = baseDao.findAll(User.class, "findAllUserDebitInInfo" , map);
		return list;
	}

	/**
	 * 添加用户还款信息
	 */
	@Override
	public void addPerFundInfoByUser(PerRefund perRefund) {
		baseDao.save(perRefund, "addPerFundInfoByUser");
	}

	@Override
	public void updatePerFundInfoByUdi_id(Map<String, Object> map) {
		baseDao.update(PerRefund.class, "updatePerFundInfoByUdi_id", map);
	}

}
