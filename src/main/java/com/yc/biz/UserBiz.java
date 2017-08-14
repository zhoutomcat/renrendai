package com.yc.biz;

import java.util.Map;

import com.yc.bean.User;
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

	public User isUnameExist(User user);

	public void saveOrUpdate(User user);


	public JsonModel searchUser(Map<String, Integer> map);

	public boolean updateUser(User user);

	public boolean delUser(User user);

}
