package com.yc.biz;

import java.util.Map;

import com.yc.web.model.JsonModel;

public interface UserMessageBiz {

	public JsonModel findAllUserMessage(Map<String, Integer> map);

}
