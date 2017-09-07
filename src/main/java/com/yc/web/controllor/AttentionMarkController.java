package com.yc.web.controllor;

import java.lang.reflect.InvocationTargetException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.bean.AttentionMark;
import com.yc.bean.User;
import com.yc.biz.AttentionMarkBiz;
import com.yc.biz.UserDebitOutBiz;
import com.yc.utils.RequestUtil;
import com.yc.web.model.JsonModel;

@RestController // 类注解,同时使用@Controller 和@ResponseBody
public class AttentionMarkController {
	@Resource(name = "attentionMarkBizImpl")
	private AttentionMarkBiz attentionMarkBiz;

	@Resource(name = "userDebitOutBizImpl")
	private UserDebitOutBiz udob;

	@RequestMapping("/user/attentionMarkIsNotExist.action")
	public JsonModel attentionMarkIsNotExist(HttpServletRequest request, HttpSession session) throws Exception {
		JsonModel jm = new JsonModel();
		Map<String, Object> parameterMap = new HashMap<>();
		User user = (User) session.getAttribute("user");
		// TODO:此次查询id可优化
		// 根据u计划id查询借贷标id号
		parameterMap.put("udit_id", request.getParameter("udit_id"));
		int udi_id = udob.findUserDebitInIdByUserDebitInTypeId(parameterMap);
		jm.setObj(udi_id);
		//判断udi_i是否有关注记录
		try {
			AttentionMark am = new AttentionMark();
			am.setU_id(user.getU_id());
			am.setUdi_id(udi_id);
			am  = attentionMarkBiz.attentionMarkIsNotExist(am);
			if(am!=null){
//				session.setAttribute("am", am);
				jm.setCode(1);		//这里的1代表存在
				return jm;
			}else{
				jm.setCode(2);		//2代表不存在
				return jm;
			}
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
		}
		return jm;
	}

	/**
	 * 后台查询所有的投标
	 * 
	 * @param user
	 * @param request
	 * @param resp
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/back/findAllAttentionMark.action")
	public JsonModel findAllAttentionMark(HttpServletRequest request) throws Exception {
		int page = Integer.parseInt(request.getParameter("page").toString());
		int pagesize = Integer.parseInt(request.getParameter("rows").toString());
		int start = (page - 1) * pagesize;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("pagesize", pagesize);
		JsonModel jm = attentionMarkBiz.findAllAttentionMark(map);
		System.out.println(jm);
		return jm;
	}

	/**
	 * 用户个人关注投标信息
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/user/findAllAttentionMarkByUser.action")
	public JsonModel findAllAttentionMarkByUser(AttentionMark am, HttpServletRequest request, HttpSession session)
			throws Exception {
		JsonModel jm = new JsonModel();
		am.setOrderway("desc");
		am.setOrderby("u_id");
		// am=RequestUtil.getParemeter(request, AttentionMark.class);
		// request.setAttribute("am_id", am);
		int start = (am.getPages() - 1) * am.getPagesize();
		am.setStart(start);
		jm.setPages(am.getPages());
		jm.setPagesize(am.getPagesize());
		User user = (User) session.getAttribute("user");
		am.setU_id(user.getU_id());
		try {
			List<User> list = attentionMarkBiz.findAllAttentionMarkByUser(am);
			jm.setRows(list);
			jm.setCode(1);
			// 获取关注投标数有错误
			int result = attentionMarkBiz.findAllAttentionMarkByUserCount(am);
			jm.setTotal(result);
			// session.setAttribute("am_id", list);
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
			jm.setMsg(e.getMessage());
		}
		return jm;
	}

	@RequestMapping("/back/updateAttention.action")
	private JsonModel updateAttentionMark(AttentionMark am, HttpServletRequest request, HttpServletResponse response)
			throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		JsonModel jm = new JsonModel();
		am = RequestUtil.getParemeter(request, AttentionMark.class);
		boolean result = attentionMarkBiz.updateAttentionMark(am);
		if (result) {
			jm.setCode(1);
		} else {
			jm.setCode(0);
		}
		return jm;
	}

	@RequestMapping("/user/delAttention.action")
	private JsonModel delAttentionMark(AttentionMark am, HttpServletRequest request, HttpSession session)
			throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		JsonModel jm = new JsonModel();
		am = RequestUtil.getParemeter(request, AttentionMark.class);
		boolean result = attentionMarkBiz.delAttentionMark(am);
		Map<String, Object> parameterMap = new HashMap<>();
		User user = (User) session.getAttribute("user");
		parameterMap.put("am_id", request.getParameter("am_id"));
		if (result) {
			jm.setCode(1);
		} else {
			jm.setCode(0);
		}
		return jm;
	}

	/**
	 * 添加关注投标（即关注）
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping("/user/addAttentionMark.action")
	private JsonModel addAttentionMark(HttpSession session, HttpServletRequest request) {
		JsonModel jm = new JsonModel();
		AttentionMark am = new AttentionMark();
		Map<String, Object> parameterMap = new HashMap<>();
		User user = (User) session.getAttribute("user");
		parameterMap.put("udit_id", request.getParameter("udit_id"));
		// TODO:此次查询id可优化
		// 根据u计划id查询借贷标id号
		int udi_id = udob.findUserDebitInIdByUserDebitInTypeId(parameterMap);
		
		//TODO:下午要做的   判断是关注还是取消关注  
		
		
		am.setUdi_id(udi_id);
		am.setU_id(user.getU_id());
		// 获取当前系统时间（即借款时间）
		long m = Calendar.getInstance().getTimeInMillis();
		am.setAm_time(m);
		try {
			this.attentionMarkBiz.addAttentionMark(am);
			jm.setCode(1);
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
			jm.setMsg(e.getMessage());
		}
		return jm;
	}

}
