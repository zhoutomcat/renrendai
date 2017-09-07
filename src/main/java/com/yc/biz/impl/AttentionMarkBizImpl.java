package com.yc.biz.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.AttentionMark;
import com.yc.bean.User;
import com.yc.biz.AttentionMarkBiz;
import com.yc.dao.BaseDao;
import com.yc.web.model.JsonModel;

@Service
@Transactional
public class AttentionMarkBizImpl implements AttentionMarkBiz {
	@Resource(name = "baseDao")
	private BaseDao baseDao;

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT)
	public JsonModel findAllAttentionMark(Map<String, Integer> map) {
		List list = baseDao.findAll(AttentionMark.class, "findAttentionMarkConditionResultMap", map);
		int total = (int) baseDao.getFunc(AttentionMark.class, "findAttentionMarkConditionResultMapCount", map);

		JsonModel jsonModel = new JsonModel();
		jsonModel.setRows(list);
		jsonModel.setTotal(total);
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
	public void addAttentionMark(AttentionMark am) {
		this.baseDao.save(am, "addAttentionMark");
	}

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT)
	public List<User> findAllAttentionMarkByUser(AttentionMark am) {
		return this.baseDao.findAll(am, "findAllAttentionMarkByUser");
	}

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT)
	public int findAllAttentionMarkByUserCount( AttentionMark am ) {
		int result = (int) this.baseDao.findOne(am, "findAllAttentionMarkByUserCount");
		return result;
	}

	@Override
	public AttentionMark attentionMarkIsNotExist(AttentionMark am) {
		am = (AttentionMark) baseDao.findOne(am, "attentionMarkIsNotExist");
		return am;
	}

}
