package com.yc.biz;

import com.yc.bean.User;

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

}
