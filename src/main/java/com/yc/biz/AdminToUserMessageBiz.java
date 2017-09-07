package com.yc.biz;

import java.io.FileNotFoundException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.yc.bean.AdminToUserMessage;
import com.yc.bean.AttentionMark;
import com.yc.bean.User;
import com.yc.bean.UserDebitIn;
import com.yc.bean.UserMessage;
import com.yc.web.model.JsonModel;

public interface AdminToUserMessageBiz {
	/**
	 * 后台查找所有的消息推送信息
	 * @param map
	 * @return
	 */
	public JsonModel findAllAdminToUserMessage(Map<String, Integer> map);
	








}