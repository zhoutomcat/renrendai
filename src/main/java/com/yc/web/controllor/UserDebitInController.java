package com.yc.web.controllor;

import java.lang.reflect.Type;
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
import com.yc.bean.UserDebitInType;
import com.yc.biz.UserBiz;
import com.yc.biz.UserDebitInBiz;
import com.yc.web.model.JsonModel;

@RestController // 类注解,同时使用@Controller 和@ResponseBody
public class UserDebitInController {
	@Resource(name = "userDebitInBizImpl")
	private UserDebitInBiz userDebitInBiz;

	
	@RequestMapping("/findAllUserDebitIn.action")
	public JsonModel findAllUserDebitInType(User user,HttpServletRequest request, HttpServletResponse resp,HttpSession session) throws Exception {
		JsonModel jm = new JsonModel();
		try {
			List<UserDebitInType> list = (List<UserDebitInType>) userDebitInBiz.findAllUserDebitInType();
			jm.setRows(list);
			jm.setCode(1);
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
			jm.setMsg(e.getMessage());
		}
		return jm;
	}

}
