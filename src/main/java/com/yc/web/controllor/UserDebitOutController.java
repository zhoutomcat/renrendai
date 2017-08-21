package com.yc.web.controllor;

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
import com.yc.biz.UserBiz;
import com.yc.biz.UserDebitInBiz;
import com.yc.biz.UserDebitOutBiz;
import com.yc.web.model.JsonModel;

@RestController // 类注解,同时使用@Controller 和@ResponseBody
public class UserDebitOutController {
	@Resource(name = "userDebitOutBizImpl")
	private UserDebitOutBiz userDebitOutBiz;

	/**
	 * 查找所有的放贷信息
	 * 
	 * @param user
	 * @param request
	 * @param resp
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/back/findAlluserDebitOutInfo.action")
	public JsonModel findAllUserDebitOut(UserDebitOut userdebitout, HttpServletRequest request, HttpServletResponse resp,
			HttpSession session) throws Exception {
		int pages = Integer.parseInt(request.getParameter("page").toString());
		int pagesize = Integer.parseInt(request.getParameter("rows").toString());
		int start = (pages - 1) * pagesize;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("pagesize", pagesize);
		JsonModel jm = (JsonModel) userDebitOutBiz.findAllUserDebitOut(map);
		return jm;

   }
	
}
