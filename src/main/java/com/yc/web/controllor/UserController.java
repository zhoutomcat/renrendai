package com.yc.web.controllor;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Type;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.yc.bean.PerRefund;
import com.yc.bean.User;
import com.yc.bean.UserDebitIn;
import com.yc.bean.UserFund;
import com.yc.biz.UserBiz;
import com.yc.utils.RequestUtil;
import com.yc.web.model.JsonModel;

@RestController // 类注解,同时使用@Controller 和@ResponseBody
public class UserController {
	@Resource(name = "userBizImpl")
	private UserBiz userBiz;

	/**
	 * 添加还款信息
	 * 
	 * 暂时实现只能一次性还款
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/user/addPerFundInfoByUser.action")
	public JsonModel addPerFundInfoByUser( HttpServletRequest request) {
		JsonModel jm = new JsonModel();
		int udi_id = Integer.parseInt( request.getParameter("udi_id") );
		double pr_money = Double.parseDouble( request.getParameter("udo_money") );
		int pr_status = 1;
		//获取当前系统时间（即借款时间）
		long m = Calendar.getInstance().getTimeInMillis();
		PerRefund pr = new PerRefund();
		pr.setUdi_id(udi_id);
		pr.setPr_money(pr_money);
		//暂时实现只能一次性还款
		pr.setPr_status(pr_status);
		pr.setPr_date(m);
		
		try {
			userBiz.addPerFundInfoByUser(pr);
			Map<String, Object> map = new HashMap<>();
			map.put("udi_id", udi_id);
			userBiz.updatePerFundInfoByUdi_id(map);
			jm.setCode(1);
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
		}
		return jm;
	}
	
	
	// 查找用户所有借款信息
	@RequestMapping("/user/findAllUserDebitInInfo.action")
	public JsonModel findAllUserDebitInInfo( HttpServletRequest request, HttpSession session,
			HttpServletResponse response ) throws ServletException, IOException {
		JsonModel jm = new JsonModel();
		Map<String, Object> map = new HashMap<>();
		User user = (User) session.getAttribute("user");
		map.put("u_id", user.getU_id());
		List<UserDebitIn> list;
		try {
			list = userBiz.findAllUserDebitInInfo(map);
			jm.setRows(list);
			jm.setCode(1);
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
		}
		return jm;
	}

	// 充值用户账户
	@RequestMapping("/user/withdrawUserFund.action")
	public JsonModel withdrawUserFund(HttpServletRequest request, HttpSession session, HttpServletResponse response)
			throws ServletException, IOException {
		JsonModel jm = new JsonModel();
		User user = (User) session.getAttribute("user");
		double money = Double.parseDouble(request.getParameter("money").toString());
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("balance", money);
			map.put("u_id", user.getU_id());
			userBiz.withdrawUserFund(map);
			jm.setCode(1);
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
		}
		return jm;
	}

	// 充值用户账户
	@RequestMapping("/user/chongzhiUserFund.action")
	public JsonModel chongzhiUserFund(HttpServletRequest request, HttpSession session, HttpServletResponse response)
			throws ServletException, IOException {
		JsonModel jm = new JsonModel();
		User user = (User) session.getAttribute("user");
		int money = Integer.parseInt(request.getParameter("money").toString());
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("balance", money);
			map.put("u_id", user.getU_id());
			userBiz.chongzhiUserFund(map);
			jm.setCode(1);
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
		}
		return jm;
	}

	// 查询用户账户余额
	@RequestMapping("/user/findUserFundInfoByUser.action")
	public JsonModel findUserFundInfoByUser(HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws ServletException, IOException {
		JsonModel jm = new JsonModel();
		User user = (User) session.getAttribute("user");
		UserFund userFund = null;
		try {
			userFund = userBiz.findUserFundInfoByUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		jm.setObj(userFund);
		jm.setCode(1);
		return jm;
	}

	// 用户退出
	@RequestMapping("/user/user_layout.action")
	public void layout(User user, HttpServletRequest request, HttpSession session, HttpServletResponse response)
			throws ServletException, IOException {
		session.removeAttribute("user");
		request.getRequestDispatcher("../WEB-INF/pages/index.jsp").forward(request, response);
	}

	// 用户登录
	@RequestMapping("/user_login.action")
	public JsonModel login(User user, HttpServletRequest request, HttpSession session, Map map) {
		JsonModel jm = new JsonModel();
		// 为什么有三个参数? 因为name，password是user对象中有的，且zccode是在类中没有的，所以要在request中取
		// 另外rand是存在session中，所以还要Httpsession
		// String zccode = request.getParameter("zccode");
		String zccode = request.getParameter("yanzhengma");
		String rand = session.getAttribute("rand").toString();
		if (!rand.equals(zccode)) {
			jm.setCode(0);
			jm.setMsg("验证码错误");
		} else {
			try {
				user = userBiz.login(user);
				if (user != null) {
					if (user.getU_status() == 1) {
						session.setAttribute("user", user);
						// System.out.println("------------------" +
						// session.getAttribute("user"));
						jm.setCode(1);
						user.setU_password(null); // 设为空后，密码就不会传到页面
						jm.setObj(user);
					} else {
						if (user.getU_status() == 1) {
							session.setAttribute("user", user);
							// System.out.println("------------------" +
							// session.getAttribute("user"));
							jm.setCode(1);
							user.setU_password(null); // 设为空后，密码就不会传到页面
							user.setReu_password(null);
							jm.setObj(user);
						} else {
							jm.setCode(0);
							jm.setMsg("您因为信誉度低,已经被禁止登录！");
						}
					}
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
	 * 禁止用户登录
	 * 
	 * @param u_id
	 * @param request
	 * @param session
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws InvocationTargetException
	 */
	@RequestMapping("/back/forbidlogin.action")
	public JsonModel forbidlogin(Integer u_id, HttpServletRequest request, HttpSession session)
			throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		User user = new User();
		user.setU_id(u_id);
		user.setU_status(0);
		System.out.println(user);
		boolean result = userBiz.updatestatus(user);
		JsonModel jm = new JsonModel();
		if (result) {
			jm.setCode(1);
			jm.setMsg("修改成功");
		} else {
			jm.setCode(0);
			jm.setMsg("修改失败");
		}
		return jm;
	}

	/**
	 * 允许用户登录
	 * 
	 * @param u_id
	 * @param request
	 * @param session
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws InvocationTargetException
	 */
	@RequestMapping("/back/allowlogin.action")
	public JsonModel allowlogin(Integer u_id, HttpServletRequest request, HttpSession session)
			throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		User user = new User();
		user.setU_id(u_id);
		user.setU_status(1);
		System.out.println(user);
		boolean result = userBiz.updatestatus(user);
		JsonModel jm = new JsonModel();
		if (result) {
			jm.setCode(1);
			jm.setMsg("修改成功");
		} else {
			jm.setCode(0);
			jm.setMsg("修改失败");
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
	@RequestMapping("/user/user_register.action")
	public JsonModel register(User user, HttpServletRequest request, HttpSession session) {
		JsonModel jm = new JsonModel();
		String repwd = request.getParameter("reu_password");
		String zccode = request.getParameter("zccode");
		String rand = session.getAttribute("rand").toString();
		String mobile_code = session.getAttribute("mobile_code").toString();
		String zcMobile_code = request.getParameter("smscode").toString();
		if( !mobile_code.equals(zcMobile_code) ){
			jm.setCode(0);
			jm.setMsg("手机验证码错误");
			return jm;
		}
		
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
			user.setU_registerdate(System.currentTimeMillis());
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

	/**
	 * 后台查询所有的可用的用户
	 * 
	 * @param user
	 * @param request
	 * @param resp
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/back/findAllAllowUser.action")
	public JsonModel findAllAllowUser(User user, HttpServletRequest request, HttpServletResponse resp,
			HttpSession session) throws Exception {
		int pages = Integer.parseInt(request.getParameter("page").toString());
		int pagesize = Integer.parseInt(request.getParameter("rows").toString());
		int start = (pages - 1) * pagesize;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("pagesize", pagesize);
		JsonModel jm = userBiz.searchallowUser(map);
		/*
		 * Gson gson=new Gson(); Type jsonType=new TypeToken<JsonModel>(){
		 * }.getType(); String jsonStr=gson.toJson(jm, jsonType);
		 */ // jsonModel型是不需要转成gson型的
		return jm;
	}

	/**
	 * 后台查询所有的不可用的用户
	 * 
	 * @param user
	 * @param request
	 * @param resp
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/back/findAllForbidUser.action")
	public JsonModel findAllForbidUser(User user, HttpServletRequest request, HttpServletResponse resp,
			HttpSession session) throws Exception {
		int pages = Integer.parseInt(request.getParameter("page").toString());
		int pagesize = Integer.parseInt(request.getParameter("rows").toString());
		int start = (pages - 1) * pagesize;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("pagesize", pagesize);
		JsonModel jm = userBiz.searchforbidUser(map);
		/*
		 * Gson gson=new Gson(); Type jsonType=new TypeToken<JsonModel>(){
		 * }.getType(); String jsonStr=gson.toJson(jm, jsonType);
		 */ // jsonModel型是不需要转成gson型的
		return jm;
	}
	/**
	 * 修改用户个人信息
	 * @param user
	 * @param request
	 * @param response
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws InvocationTargetException
	 */
	@RequestMapping("/back/updateuser.action")
	private JsonModel updateUser(User user, HttpServletRequest request, HttpServletResponse response)
			throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		JsonModel jm = new JsonModel();
		user = RequestUtil.getParemeter(request, User.class);
		boolean result = userBiz.updateUser(user);

		if (result) {
			jm.setCode(1);
		} else {
			jm.setCode(0);
		}
		return jm;
	}

	@RequestMapping("/back/deluser.action")
	private JsonModel delUser(User user, HttpServletRequest request, HttpServletResponse response)
			throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		JsonModel jm = new JsonModel();
		user = RequestUtil.getParemeter(request, User.class);
		boolean result = userBiz.delUser(user);
		if (result) {
			jm.setCode(1);
		} else {
			jm.setCode(0);
		}
		return jm;
	}
}
