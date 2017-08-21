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

}
