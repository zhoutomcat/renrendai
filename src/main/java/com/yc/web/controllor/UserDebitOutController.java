package com.yc.web.controllor;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.bean.User;
import com.yc.bean.UserDebitIn;
import com.yc.bean.UserDebitOut;
import com.yc.biz.UserDebitOutBiz;
import com.yc.web.model.JsonModel;

@RestController // 类注解,同时使用@Controller 和 @ResponseBody
public class UserDebitOutController {
	@Resource(name = "userDebitOutBizImpl")
	private UserDebitOutBiz udob;

	@RequestMapping("/userDebit/addUplanUserDebitOut.action")
	public JsonModel addUplanUserDebitOut(UserDebitIn userDebitIn, HttpSession session, HttpServletRequest request) {
		JsonModel jm = new JsonModel();
		Map<String, Object> parameterMap = new HashMap<>();
		User user = (User) session.getAttribute("user");
		parameterMap.put("udit_id", request.getParameter("udit_id"));
		// 根据u计划id查询借贷标id号
		int udi_id = udob.findUserDebitInIdByUserDebitInTypeId(parameterMap);

		parameterMap = new HashMap<>();
		parameterMap.put("udi_id", udi_id);
		parameterMap.put("u_id", user.getU_id());
		long m = Calendar.getInstance().getTimeInMillis();
		parameterMap.put("udo_startdate", m);
		parameterMap.put("udo_date", m + 86400 * 1000);
		parameterMap.put("udo_money", request.getParameter("udo_money"));
		try {
			udob.addUplanUserDebitOut(parameterMap);
			jm.setCode(1);
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
		}
		return jm;
	}

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
	public JsonModel findAllUserDebitOut(UserDebitOut userdebitout, HttpServletRequest request, HttpSession session)
			throws Exception {
		int pages = Integer.parseInt(request.getParameter("page").toString());
		int pagesize = Integer.parseInt(request.getParameter("rows").toString());
		int start = (pages - 1) * pagesize;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("pagesize", pagesize);
		JsonModel jm = (JsonModel) udob.findAllUserDebitOut(map);
		return jm;
	}
}
