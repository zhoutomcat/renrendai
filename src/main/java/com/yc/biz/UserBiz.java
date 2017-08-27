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
	/**
	 * 判断用户是否存在
	 * @param user
	 * @return
	 */
	public User isUnameExist(User user);

	public void saveOrUpdate(User user);

	/**
	 * 查找所有的用户
	 * @param map
	 * @return
	 */
	public JsonModel searchUser(Map<String, Integer> map);
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

}
