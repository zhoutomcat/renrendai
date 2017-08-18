package com.yc.biz;

import java.util.Map;

import com.yc.bean.AttentionMark;
import com.yc.bean.User;
import com.yc.web.model.JsonModel;

public interface AttentionMarkBiz {
	


	/**
	 * 查找所有的用户关注投标信息      关联用户表    借贷表
	 * @param map
	 * @return
	 */
	public JsonModel findAllAttentionMark(Map<String, Integer> map);



	public boolean updateAttentionMark(AttentionMark am);



	public boolean delAttentionMark(AttentionMark am);


	/**
	 * 添加关注
	 * @param am
	 */
	public void saveOrUpdate(AttentionMark am);






}
