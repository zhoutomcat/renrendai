package com.yc.web.controllor;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.bean.User;
import com.yc.bean.UserMessage;
import com.yc.biz.DebitMoneyBiz;
import com.yc.utils.RequestUtil;
import com.yc.web.model.JsonModel;

@RestController // 类注解,同时使用@Controller 和@ResponseBody
public class DebitMoneyController {
	@Resource(name = "debitMoneyBizImpl")
	private DebitMoneyBiz debitMoneyBiz;

/*	@RequestMapping("/user/DebitMoneyAdd.action")
	public void DebitMoneyAdd(UserMessage um, HttpSession session,HttpServletResponse response) throws IOException {
		User user=(User) session.getAttribute("user");
		um.setU_id(user.getU_id());	
		JsonModel jsonModel=new JsonModel();
		boolean r=debitMoneyBiz.addDebitMoney(um);
		if(r){
			jsonModel.setCode(1);
		}else{
			jsonModel.setCode(0);
		}
		response.sendRedirect("WEB-INF/pages/index.jsp");
		
	}
		
		//response.sendRedirect("/WEB-INF/pages/index.jsp");
	}*/
	

	@RequestMapping("/user/addUserMessageMoney.action")
	public JsonModel DebitMoneyAdd(UserMessage um,HttpSession session,HttpServletRequest request) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		JsonModel jm=new JsonModel();
		//um=RequestUtil.getParemeter(request, UserMessage.class);
		User user=(User) session.getAttribute("user");
		um.setU_id(user.getU_id());	
		
		//if(user.getU_id()==um.getU_id()){
		try {
			this.debitMoneyBiz.addDebitMoney(um);
			session.setAttribute("userMessage", um);
			jm.setCode(1);
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
			jm.setMsg(e.getMessage());
		}	
		return jm;
	}

	
}

	
	

