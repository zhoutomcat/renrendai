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

public interface AdminToUserMessageBiz1 {
	



	/**
	 * 添加消息推送
	 * @param adminToUserMessage
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 */
	public void addMessageToUser(AdminToUserMessage adminToUserMessage) throws FileNotFoundException, SQLException;







}
