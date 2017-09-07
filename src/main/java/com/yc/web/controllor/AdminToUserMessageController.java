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
import com.yc.bean.AdminToUserMessage;
import com.yc.bean.User;
import com.yc.bean.UserDebitIn;
import com.yc.bean.UserDebitInType;
import com.yc.bean.UserDebitOut;
import com.yc.bean.UserMessage;
import com.yc.biz.AdminToUserMessageBiz;
import com.yc.biz.UserBiz;
import com.yc.biz.UserDebitInBiz;
import com.yc.biz.UserMessageBiz;
import com.yc.utils.RequestUtil;
import com.yc.web.model.JsonModel;

@RestController // 类注解,同时使用@Controller 和@ResponseBody
public class AdminToUserMessageController {
	@Resource(name="adminToUserMessageBizImpl")
	private AdminToUserMessageBiz adminToUserMessageBiz;

	

/**
 * 后台发送消息给用户
 * @param adminToUserMessage
 * @param request
 * @param session
 * @return
 * @throws Exception
 */
/*	@RequestMapping("/back/addMessageToUser.action")
	public JsonModel addMessageToUser(AdminToUserMessage adminToUserMessage, HttpServletRequest request, HttpSession session)
			throws Exception {
		JsonModel jm=new JsonModel();
		User user=(User) session.getAttribute("user");
		adminToUserMessage.setU_id(user.getU_id());	
		try {
			this.adminToUserMessageBiz.addMessageToUser(adminToUserMessage);
			jm.setCode(1);
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
			jm.setMsg(e.getMessage());
		}	
		return jm;
	}*/
	
	/**
	 * 后台查找所有的消息推送信息
	 * 
	 * @param user
	 * @param request
	 * @param resp
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/back/findAllAdminToUserMessage.action")
	public JsonModel findAllAdminToUserMessage(AdminToUserMessage atum, HttpServletRequest request, HttpSession session)
			throws Exception {
		int pages = Integer.parseInt(request.getParameter("page").toString());
		int pagesize = Integer.parseInt(request.getParameter("rows").toString());
		int start = (pages - 1) * pagesize;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("pagesize", pagesize);
		JsonModel jm = adminToUserMessageBiz.findAllAdminToUserMessage(map);
		return jm;
	}

	

	

	

}