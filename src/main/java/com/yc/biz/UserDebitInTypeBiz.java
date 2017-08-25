package com.yc.biz;

import java.util.List;

import com.yc.bean.UserDebitInType;

public interface UserDebitInTypeBiz {
	/**
	 * 查询所有的用户借贷类别
	 * @return
	 */
	public List<UserDebitInType> getTypeList();

}
