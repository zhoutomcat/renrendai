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
import com.yc.biz.UserBiz;
import com.yc.biz.UserDebitInBiz;
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

}
