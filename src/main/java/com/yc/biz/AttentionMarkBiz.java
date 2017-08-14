package com.yc.biz;

import java.util.Map;

import com.yc.bean.User;
import com.yc.web.model.JsonModel;

public interface AttentionMarkBiz {
	


	/**
	 * 查找所有的关注投标信息      关联用户表    借贷表
	 * @param map
	 * @return
	 */
	public JsonModel searchUser(Map<String, Integer> map);

	public boolean updateUser(User user);

	public boolean delUser(User user);

}
