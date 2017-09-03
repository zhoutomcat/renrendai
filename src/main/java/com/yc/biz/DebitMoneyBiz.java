package com.yc.biz;

import com.yc.bean.UserMessage;

public interface DebitMoneyBiz {
	/**
	 * 添加借贷信息个人详细表
	 * @param um
	 * @return
	 */
	public boolean addDebitMoney(UserMessage um);

}
