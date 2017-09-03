package com.yc.biz;


import java.util.Map;

import com.yc.bean.UserDebitOut;
import com.yc.web.model.JsonModel;


public interface UserDebitOutBiz {

	/**
	 * 查询所有的放贷
	 * @param map 
	 * 
	 * @return
	 */
	public JsonModel<UserDebitOut> findAllUserDebitOut(Map<String, Integer> map);


	/**
	 * 通过借贷类型的id查询借贷标的id
	 * 
	 */
	public int findUserDebitInIdByUserDebitInTypeId(Map<String , Object> parameterMap);
	
	/**
	 * 添加放贷数据
	 */
	public void addUplanUserDebitOut(Map<String , Object> parameterMap);
	
	/**
	 * 查询还可以放多少贷(例如查询u计划还可以放多少款)  查询放贷的金额
	 */
	public UserDebitOut findDebitOutBalance(Map<String, Object> parameterMap);
	
	/**
	 * 筹款达到数目之后修改标的状态   由状态1-->> 2 
	 */
	public void updateDebitOutStatus( Map<String, Object> parameterMap );

}
