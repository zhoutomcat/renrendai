package com.yc.biz;

import java.util.Map;

import com.yc.bean.UserMessage;

public interface DebitMoneyBiz {
	/**
	 * 添加借贷信息个人详细表
	 * @param um
	 * @return
	 */

	public boolean addDebitMoney(UserMessage um);
	
	/**
	 * 修改用户详细表的数据
	 * @param um
	 * @return
	 */
	public boolean updateUserMessageMoney(UserMessage um);
	


	/**
	 * 查询用户详细表中的个人详细表
	 * @param parameterMap
	 * @return
	 */
	public UserMessage isUserMessageIdExist(UserMessage um);


}
