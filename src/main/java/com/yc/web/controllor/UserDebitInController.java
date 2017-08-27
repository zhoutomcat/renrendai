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
import com.yc.utils.RequestUtil;
import com.yc.web.model.JsonModel;

@RestController // 类注解,同时使用@Controller 和@ResponseBody
public class UserDebitInController {
	@Resource(name = "userDebitInBizImpl")
	private UserDebitInBiz userDebitInBiz;

	/**
	 * 查找散标的所有历史记录
	 * 
	 * @param userDebitIn
	 * @param session
	 * @return
	 */
	@RequestMapping("/findAllSanbiaoHistory.action")
	public JsonModel findAllSanbiaoHistory(UserDebitIn userDebitIn, HttpSession session) {
		JsonModel jm = new JsonModel();
		userDebitIn.setOrderway("desc");
		userDebitIn.setOrderby("udi_id");
		int start = (userDebitIn.getPages() - 1) * userDebitIn.getPagesize();
		userDebitIn.setStart(start);
		jm.setPages(userDebitIn.getPages());
		jm.setPagesize(userDebitIn.getPagesize());
		try {
			List<UserDebitIn> list = userDebitInBiz.findAllSanbiaoHistory(userDebitIn);
			jm.setRows(list);
			jm.setCode(1);
			int result = userDebitInBiz.findAllSanbiaoHistoryCount();
			jm.setTotal(result);
			// session.setAttribute("allSanbiaoHistoryJsonModel", jm);
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
			jm.setMsg(e.getMessage());
		}
		return jm;
	}

	/**
	 * 查找所有的u计划的历史记录
	 * 
	 * @return
	 */
	@RequestMapping("/findAllUplanHistory.action")
	public JsonModel findAllUplanHistory(UserDebitIn userDebitIn, HttpSession session) {
		JsonModel jm = new JsonModel();
		userDebitIn.setOrderway("desc");
		userDebitIn.setOrderby("udi_id");
		int start = (userDebitIn.getPages() - 1) * userDebitIn.getPagesize();
		userDebitIn.setStart(start);
		jm.setPages(userDebitIn.getPages());
		jm.setPagesize(userDebitIn.getPagesize());
		try {
			List<UserDebitIn> list = userDebitInBiz.findAllUplanHistory(userDebitIn);
			jm.setRows(list);
			jm.setCode(1);
			int result = userDebitInBiz.findAllUplanHistoryCount();
			jm.setTotal(result);
			// session.setAttribute("allUplanHistoryModel", jm);
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
			jm.setMsg(e.getMessage());
		}
		return jm;
	}

	/**
	 * 查找所有的借贷类型
	 * 
	 * @param user
	 * @param request
	 * @param resp
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findAllUserDebitIn.action")
	public JsonModel findAllUserDebitInType(User user, HttpServletRequest request, HttpServletResponse resp,
			HttpSession session) throws Exception {
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

	// TODO:代码可优化
	@RequestMapping("/findAllUplanData.action")
	public JsonModel findAllUplanData(User user, HttpServletRequest request, HttpServletResponse resp,
			HttpSession session) throws Exception {
		JsonModel jm = new JsonModel();
		try {
			List<UserDebitIn> list = userDebitInBiz.findAllUplanData();
			// 所有用户总计投入的钱
			double totalMoney = 0;
			// 为用户所赚的钱
			double makeMoney = 0;
			// 总计投入U计划的人数
			int peopleCount = 0;
			peopleCount = list.size();
			// TODO:可把jsonModel中的makeMoney; totalMoney; eopleCount;
			// 放在UserDebitIn中
			for (UserDebitIn u : list) {
				// 借贷标中每个的 利率 * 月数 = 为用户赚的钱
				makeMoney += u.getUdi_money() * u.getUserDebitInType().getUdit_profit() / 100
						* u.getUserDebitInType().getUdit_month() / 12;
				// 所有用户总计投入的钱
				totalMoney += u.getUdi_money();
			}
			totalMoney = Math.floor(totalMoney);
			jm.setTotalMoney(totalMoney);
			makeMoney = Math.floor(makeMoney);
			jm.setMakeMoney(makeMoney);
			jm.setPeopleCount(peopleCount);
			jm.setCode(1);
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
			jm.setMsg(e.getMessage());
		}
		return jm;
	}

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
	@RequestMapping("/back/findAllUserDebitIn.action")
	public JsonModel findAllUserDebitIn(UserDebitIn userDebitIn, HttpServletRequest request, HttpSession session)
			throws Exception {
		int pages = Integer.parseInt(request.getParameter("page").toString());
		int pagesize = Integer.parseInt(request.getParameter("rows").toString());
		int start = (pages - 1) * pagesize;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("pagesize", pagesize);
		JsonModel jm = (JsonModel) userDebitInBiz.findAllUserDebitIn(map);
		return jm;

	}

	/**
	 * 添加借款信息的个人信息
	 * 
	 * @param um
	 * @param session
	 * @return
	 * @throws InvocationTargetException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	@RequestMapping("/user/AddUserDebitInAndUserDebitInType.action")
	public JsonModel AddUserDebitIn(HttpSession session, HttpServletRequest request)
			throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		UserDebitIn udi = new UserDebitIn();
		UserDebitInType udit = new UserDebitInType();
		udi = RequestUtil.getParemeter(request, UserDebitIn.class);
		udit = RequestUtil.getParemeter(request, UserDebitInType.class);
		JsonModel jm = new JsonModel();
		User user = (User) session.getAttribute("user");
		udi.setU_id(user.getU_id());
		// 给一些前台页面中没有显示值的属性设置值
		
		udi.setUdi_status(1);
		udi.setUdi_publishdate(1470955893);
		udi.setUdi_date(1502584941);
		udi.setUdi_refundrealitydate(System.currentTimeMillis());
		udi.setUdi_type(1);
		// 给一些前台页面中没有显示值的属性设置值
		
		udit.setUdit_name("散标");
		try {
			this.userDebitInBiz.AddUserDebitIn(udi);
			this.userDebitInBiz.AddUserDebitInType(udit);
			jm.setCode(1);
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
			jm.setMsg(e.getMessage());
		}
		return jm;
	}

	/*
	 * @RequestMapping("/user/AddUserDebitInAndUserDebitInType.action") public
	 * JsonModel AddUserDebitIn(HttpSession session){ UserDebitIn udi=new
	 * UserDebitIn(); JsonModel jm=new JsonModel(); User user=(User)
	 * session.getAttribute("user"); udi.setU_id(user.getU_id()); try
	 * {//给一些前台页面中没有显示值的属性设置值 udi.setUdi_status(1);
	 * udi.setUdi_publishdate(1470955893); udi.setUdi_date(1502584941);
	 * udi.setUdi_refundrealitydate(System.currentTimeMillis());
	 * udi.setUdi_type(1); this.userDebitInBiz.AddUserDebitIn(udi);
	 * jm.setCode(1); } catch (Exception e) { e.printStackTrace();
	 * jm.setCode(0); jm.setMsg(e.getMessage()); } return jm; }
	 */
	/**
	 * 审核通过借贷信息
	 * @param u_id
	 * @param request
	 * @param session
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws InvocationTargetException
	 */
	@RequestMapping("/back/checkapprove.action")
	public JsonModel checkapprove(Integer  udi_id,HttpServletRequest request, HttpSession session) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		UserDebitIn udi=new UserDebitIn();
		udi.setUdi_id(udi_id);
		udi.setUdi_checkstatus(1);
		 System.out.println(udi);
		 boolean result=userDebitInBiz.updateUserDebitInCheckStatus(udi);
		 JsonModel jm=new JsonModel();
		 if(result){
		 jm.setCode(1);
		 jm.setMsg("修改成功");
		 }else{
			 jm.setCode(0);
			 jm.setMsg("修改失败");
		 }
		 return jm;
	}
	
	
	/**
	 * 审核不通过借贷信息
	 * @param u_id
	 * @param request
	 * @param session
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws InvocationTargetException
	 */
	@RequestMapping("/back/checkunapprove.action")
	public JsonModel checkunapprove(Integer  udi_id,HttpServletRequest request, HttpSession session) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		UserDebitIn udi=new UserDebitIn();
		udi.setUdi_id(udi_id);
		udi.setUdi_checkstatus(0);
		 System.out.println(udi);
		 boolean result=userDebitInBiz.updateUserDebitInCheckStatus(udi);
		 JsonModel jm=new JsonModel();
		 if(result){
		 jm.setCode(1);
		 jm.setMsg("修改成功");
		 }else{
			 jm.setCode(0);
			 jm.setMsg("修改失败");
		 }
		 return jm;
	}

}
