package com.yc.biz;

import java.util.Map;


public interface UserDebitOutBiz {

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
