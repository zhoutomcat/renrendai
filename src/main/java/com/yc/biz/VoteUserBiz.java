package com.yc.biz;

import com.yc.bean.VoteUser;

public interface VoteUserBiz {
	
	/**
	 * 登录
	 * @param sid
	 * @return
	 */
	public VoteUser login(VoteUser voteUser) throws Exception;

	public boolean register(VoteUser voteUser) throws Exception;

	public VoteUser isUnameExist(VoteUser voteUser);

	public void saveOrUpdate(VoteUser voteUser);

}
