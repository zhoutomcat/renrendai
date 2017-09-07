package com.yc.biz;

import java.util.List;
import java.util.Map;

import com.yc.bean.PerRefund;
import com.yc.bean.User;
import com.yc.bean.UserDebitIn;
import com.yc.bean.UserFund;
import com.yc.web.model.JsonModel;

public interface UserBiz {
	
	/**
	 *  查找用户所有的未还款的借款信息
	 * @param map
	 * @return
	 */
	public List<UserDebitIn> findAllUserDebitInInfo(Map<String, Object> map);
	
	/**
	 * 用户还完所有的款之后修改借贷的状态
	 */
	public void updatePerFundInfoByUdi_id(Map<String, Object> map);
	
	/**
	 * 添加用户还款信息
	 */
	public  void addPerFundInfoByUser(PerRefund perRefund);
	
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

	/**
	 * 修改用户状态  禁止用户登录
	 * @param user
	 * @return
	 */
	public boolean updatestatus(User user);
	
	//查询用户的账户
	public UserFund findUserFundInfoByUser(User user);
	
	//充值用户账户
	public void chongzhiUserFund(Map<String, Object> map);
	
	//从用户账户提现
	public void withdrawUserFund(Map<String, Object> map);
	
	//放贷之后为用户账户的增加钱数 （冻结金额）
	public void updateUserFundFreeze(Map<String, Object> map);
	
	/**
	 * 查找所有的可用的用户
	 * @param map
	 * @return
	 */
	JsonModel searchallowUser(Map<String, Integer> map);
	/**
	 * 查找所有的不可用用户
	 * @param map
	 * @return
	 */
	JsonModel searchforbidUser(Map<String, Integer> map);
	

}
