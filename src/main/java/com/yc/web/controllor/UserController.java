package com.yc.web.controllor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.bean.User;
import com.yc.biz.UserBiz;
import com.yc.web.model.JsonModel;

@RestController // 类注解,同时使用@Controller 和@ResponseBody
public class UserController {
	@Resource(name = "userBizImpl")
	private UserBiz userBiz;

	@RequestMapping("/user_login.action")
	public JsonModel login(User user, HttpServletRequest request, HttpSession session) {
		JsonModel jm = new JsonModel();
		// 为什么有三个参数? 因为name，password是user对象中有的，且zccode是在类中没有的，所以要在request中取
		// 另外rand是存在session中，所以还要Httpsession
		String zccode = request.getParameter("zccode");
		String rand = session.getAttribute("rand").toString();
		if (!rand.equals(zccode)) {
			jm.setCode(0);
			jm.setMsg("验证码错误");
		} else {
			try {
				user = userBiz.login(user);
				if (user != null) {
					session.setAttribute("user", user);
					jm.setCode(1);
					user.setU_password(null); // 设为空后，密码就不会传到页面
					jm.setObj(user);
				} else {
					jm.setCode(0);
					jm.setMsg("用户名或密码错误");
				}
			} catch (Exception e) {
				e.printStackTrace();
				jm.setCode(0);
				jm.setMsg(e.getMessage());
			}
		}
		return jm;
	}

	/**
	 * 用户注册
	 * 
	 * @param User
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/user_register.action")
	public JsonModel register(User user, HttpServletRequest request, HttpSession session) {
		JsonModel jm = new JsonModel();
		String repwd = request.getParameter("reu_password");
		String zccode = request.getParameter("zccode");
		String rand = session.getAttribute("rand").toString();
		if (!rand.equals(zccode)) {
			jm.setCode(0);
			jm.setMsg("验证码错误");
			return jm;
		}
		if (!repwd.equals(user.getU_password())) {
			jm.setCode(0);
			jm.setMsg("两次输入的密码不一致");
			return jm;
		}
		try {
			userBiz.register(user); // 添加时User没有id 但更新一定有 所以可以写到一起
			jm.setCode(1);
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
			jm.setMsg(e.getMessage());
		}
		return jm;
	}

	/*
	 * @RequestMapping("/User_isUnameExist.action") public JsonModel
	 * isUnameExist(User user){ JsonModel jm=new JsonModel(); try { User
	 * vu=userBiz.isUnameExist(user); if(vu==null){ jm.setCode(1); }else{
	 * jm.setCode(0); } } catch (Exception e) { e.printStackTrace();
	 * jm.setCode(0); jm.setMsg(e.getMessage()); } return jm; }
	 */

}