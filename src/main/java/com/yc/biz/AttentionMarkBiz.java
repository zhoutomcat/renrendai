package com.yc.biz;

import java.util.List;
import java.util.Map;

import com.yc.bean.AttentionMark;
import com.yc.bean.User;
import com.yc.bean.UserDebitIn;
import com.yc.web.model.JsonModel;

public interface AttentionMarkBiz {

	/**
	 * 
	 * @param am
	 * @return
	 */
	public AttentionMark attentionMarkIsNotExist(AttentionMark am);

	/**
	 * 查找所有的用户关注投标信息 关联用户表 借贷表
	 * 
	 * @param map
	 * @return
	 */
	public JsonModel findAllAttentionMark(Map<String, Integer> map);

	/**
	 * 修改关注投标的信息
	 * 
	 * @param am
	 * @return
	 */
	public boolean updateAttentionMark(AttentionMark am);

	/**
	 * 删除投标
	 * 
	 * @param am
	 * @return
	 */
	public boolean delAttentionMark(AttentionMark am);

	/**
	 * 添加关注
	 * 
	 * @param am
	 */
	public void addAttentionMark(AttentionMark am);

	/**
	 * 查询一个用户的投标
	 * 
	 * @param am
	 * @return
	 */
	public List<User> findAllAttentionMarkByUser(AttentionMark am);

	/**
	 * 统计一个用户的投标
	 * 
	 * @return
	 */
	public int findAllAttentionMarkByUserCount(AttentionMark am);

}
