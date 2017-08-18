package com.yc.web.controllor;

import java.lang.reflect.InvocationTargetException;
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
import com.yc.bean.AttentionMark;
import com.yc.bean.User;
import com.yc.biz.AttentionMarkBiz;
import com.yc.biz.UserBiz;
import com.yc.utils.RequestUtil;
import com.yc.web.model.JsonModel;

@RestController // 类注解,同时使用@Controller 和@ResponseBody
public class AttentionMarkController {
	@Resource(name = "attentionMarkBizImpl")
	private AttentionMarkBiz attentionMarkBiz;

	
	
	/**
	 * 后台查询所有的用户
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
		int start=(page-1)*pagesize;
		Map<String,Integer> map=new HashMap<String,Integer>();
		map.put("start", start);
		map.put("pagesize", pagesize);
		JsonModel jm= attentionMarkBiz.findAllAttentionMark(map);
		//System.out.println(jm);
		
		
		return jm;
	}
	
	
	
	@RequestMapping("/back/updateAttention.action")
	private JsonModel updateAttentionMark(AttentionMark am,HttpServletRequest request, HttpServletResponse response) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		JsonModel jm=new JsonModel();
		am=RequestUtil.getParemeter(request, AttentionMark.class);
		 boolean result=attentionMarkBiz.updateAttentionMark(am);
		 
		 if(result){
			 jm.setCode(1);
		 }else{
			 jm.setCode(0);
		 }
		 return jm;
	}
	
	
	
	
	
	@RequestMapping("/back/delAttention.action")
	private JsonModel delAttentionMark(AttentionMark am,HttpServletRequest request, HttpServletResponse response) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		JsonModel jm=new JsonModel();
		am=RequestUtil.getParemeter(request, AttentionMark.class);
		boolean result=attentionMarkBiz.delAttentionMark(am);
		 if(result){
			 jm.setCode(1);
		 }else{
			 jm.setCode(0);
		 }
		 return jm;
	}
	
	
	@RequestMapping("/back/addAttentionMark.action")
	private JsonModel addAttentionMark(AttentionMark am){
		JsonModel jm=new JsonModel();
		try {
			this.attentionMarkBiz.saveOrUpdate(am);
			jm.setCode(1);
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
			jm.setMsg(e.getMessage());
		}
		return jm;
	}
	

}
	
	
	


	


