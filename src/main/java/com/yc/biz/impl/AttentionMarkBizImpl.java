package com.yc.biz.impl;


import java.util.List;

import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.AttentionMark;
import com.yc.bean.User;
import com.yc.biz.AttentionMarkBiz;
import com.yc.biz.UserBiz;
import com.yc.dao.BaseDao;
import com.yc.web.model.JsonModel;

@Service
@Transactional
public class AttentionMarkBizImpl implements AttentionMarkBiz{
	@Resource(name="baseDao")
	private BaseDao baseDao;




	@Override
	public JsonModel findAllAttentionMark(Map<String, Integer> map) {
		List list=baseDao.findAll(AttentionMark.class, "findAttentionMarkCondition", map);
		int total=(int) baseDao.getFunc(AttentionMark.class, "findAttentionMarkConditionCount",map);
		
		JsonModel jsonModel=new JsonModel();
		jsonModel.setRows(list);
		jsonModel.setTotal(total);
		jsonModel.setPage(map.get("page"));
		jsonModel.setPagesize(map.get("pagesize"));
		return jsonModel;
	}




	@Override
	public boolean updateAttentionMark(AttentionMark am) {
		baseDao.update(am, "updateAttentionMark");
		return true;
	}




	@Override
	public boolean delAttentionMark(AttentionMark am) {
		baseDao.del(am, "delAttentionMark");
		return true;
	}




	@Override
	public void saveOrUpdate(AttentionMark am) {
		this.baseDao.save(am, "saveAttentionMark"); 
	}


	
	
	
	
}


