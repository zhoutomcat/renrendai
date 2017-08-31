package com.yc.biz;

import java.util.Map;

import com.yc.bean.User;
import com.yc.bean.UserFund;
import com.yc.web.model.JsonModel;

public interface UserBiz {
	
	/**
	 * 登录
	 * @param sid
	 * @return
	 */
	public User login(User user) throws Exception;

	/**
	 * 注册
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public boolean register(User user) throws Exception;
	/**
	 * 判断用户是否存在
	 * @param user
	 * @return
	 */
	public User isUnameExist(User user);

	public void saveOrUpdate(User user);

	/**
	 * 查找所有的用户
	 * @param map
	 * @return
	 */
	public JsonModel searchUser(Map<String, Integer> map);
	/**
	 * 修改用户
	 * @param user
	 * @return
	 */
	public boolean updateUser(User user);
	/**
	 * 删除用户
	 * @param user
	 * @return
	 */
	public boolean delUser(User user);

	//	<!-- 禁止用户登录 -->
	public boolean updatestatus(User user);
	
	//查询用户的账户
	public UserFund findUserFundInfoByUser(User user);
	
	//充值用户账户
	public void chongzhiUserFund(Map<String, Integer> map);
	
	//从用户账户提现
	public void withdrawUserFund(Map<String, Integer> map);
	

}
