package com.yc.dao.test;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.bean.User;
import com.yc.bean.UserDebitIn;
import com.yc.bean.UserFund;
import com.yc.biz.UserBiz;
import com.yc.biz.UserDebitInBiz;
import com.yc.biz.UserDebitOutBiz;

//以后有spring来管理所有的bean
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:beans.xml") // classpath表示从类的根路径读，不配则从当前TestDao2所在的包读
public class TestUserFund {

	@Autowired
	ApplicationContext ac;
	
	/**
	 * 放贷表测试
	 * @throws Exception
	 */
	@Test
	public void testFindUserFundByUser() throws Exception {
		UserBiz userBiz =  (UserBiz) ac.getBean("userBizImpl");
		User user = new User();
		user.setU_id(1);
		UserFund userFund = userBiz.findUserFundInfoByUser(user);
		System.out.println(userFund);
	}

}
