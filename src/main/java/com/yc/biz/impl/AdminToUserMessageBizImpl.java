package com.yc.biz.impl;

import java.io.FileNotFoundException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.AdminToUserMessage;

import com.yc.biz.AdminToUserMessageBiz;
import com.yc.dao.BaseDao;
import com.yc.dao.DbHelper;

public class AdminToUserMessageBizImpl implements AdminToUserMessageBiz {
	private DbHelper db=new DbHelper();


	@Override
	public void addMessageToUser(AdminToUserMessage adminToUserMessage) throws FileNotFoundException, SQLException {
		String sql="insert into AdminToUserMessage(u_id,atum_time,atum_content,atum_status,atum_title) values( ?,?,?,1,?)";
		List<Object>  params = new ArrayList<Object>();
		params.add(adminToUserMessage.getU_id());
		params.add(adminToUserMessage.getAtum_time());
		params.add(adminToUserMessage.getAtum_content());
		params.add(adminToUserMessage.getAtum_title());

	    db.doUpate(sql, params);
	}

	

}
