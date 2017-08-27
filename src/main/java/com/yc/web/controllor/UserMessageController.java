package com.yc.web.controllor;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.yc.bean.User;
import com.yc.bean.UserDebitIn;
import com.yc.bean.UserDebitInType;
import com.yc.bean.UserDebitOut;
import com.yc.bean.UserMessage;
import com.yc.biz.UserBiz;
import com.yc.biz.UserDebitInBiz;
import com.yc.biz.UserMessageBiz;
import com.yc.utils.RequestUtil;
import com.yc.web.model.JsonModel;

@RestController // 类注解,同时使用@Controller 和@ResponseBody
public class UserMessageController {
	@Resource(name = "userMessageBizImpl")
	private UserMessageBiz userMessageBiz;

	

	/**
	 * 后台查找所有的借贷信息
	 * 
	 * @param user
	 * @param request
	 * @param resp
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/back/findAllUserMessage.action")
	public JsonModel findAllUserDebitIn(UserMessage userMessage, HttpServletRequest request, HttpSession session)
			throws Exception {
		int pages = Integer.parseInt(request.getParameter("page").toString());
		int pagesize = Integer.parseInt(request.getParameter("rows").toString());
		int start = (pages - 1) * pagesize;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("pagesize", pagesize);
		JsonModel jm = (JsonModel) userMessageBiz.findAllUserMessage(map);
		return jm;

	}

	

}
