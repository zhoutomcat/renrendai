package com.yc.biz;

import java.util.List;
import java.util.Map;

import com.yc.bean.UserDebitIn;
import com.yc.bean.UserDebitInType;
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


}
