package com.yc.biz.impl;


import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.VoteUser;
import com.yc.biz.VoteUserBiz;
import com.yc.dao.BaseDao;
import com.yc.utils.Encrypt;

@Service
@Transactional
public class VoteUserBizImpl implements VoteUserBiz {
	@Resource(name="baseDao")
	//private BaseDao<VoteUser> baseDao;
	private BaseDao baseDao;

	@Override
	@Transactional(readOnly=true,propagation=Propagation.SUPPORTS)
	public VoteUser login(VoteUser voteUser) throws Exception {
		voteUser.setPwd(Encrypt.md5AndSha(voteUser.getPwd()));
		VoteUser vu=(VoteUser)this.baseDao.findOne(voteUser, "getUserByLogin");
		return vu;
	}

	@Override
	public boolean register(VoteUser voteUser) throws Exception {
		baseDao.save(voteUser, "saveVoteUser");
		return true;

	}
	/**
	 * 判断用户名是否已经被占用
	 */
	@Override
	@Transactional(readOnly=true,propagation=Propagation.SUPPORTS)
	public VoteUser isUnameExist(VoteUser voteUser) {
		VoteUser vu=(VoteUser)this.baseDao.findOne(voteUser, "isUnameExists");
		return vu;
		
	}

	@Override
	public void saveOrUpdate(VoteUser voteUser) {
		if(voteUser.getUid()!=null&&voteUser.getUid()!=0){
			//更新操作
		}else{
			//保存操作
			voteUser.setPwd(Encrypt.md5AndSha(voteUser.getPwd()));
			this.baseDao.save(voteUser, "saveUser");
		}
		
	}

	

}
