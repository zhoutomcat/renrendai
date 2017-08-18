package com.yc.dao.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.bean.User;
import com.yc.bean.UserDebitIn;
import com.yc.bean.UserDebitInType;
import com.yc.biz.UserBiz;
import com.yc.biz.UserDebitInBiz;

//以后有spring来管理所有的bean
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:beans.xml") // classpath表示从类的根路径读，不配则从当前TestDao2所在的包读
public class TestVoteUserBiz {

	@Autowired
	ApplicationContext ac;

	@Test
	public void testLogin() throws Exception {
		UserBiz userBiz = (UserBiz) ac.getBean("userBizImpl");
		// System.out.println(userBiz);
		User user = new User();
		user.setU_name("a");
		user.setU_password("a");
		user = userBiz.login(user);
		System.out.println(user);
	}

	@Test
	public void testFindAllUserDebitInType() throws Exception {
		UserDebitInBiz udib = (UserDebitInBiz) ac.getBean("userDebitInBizImpl");
		List<UserDebitInType> list = udib.findAllUserDebitInType();
		System.out.println(list);
	}

	/**
	 * 查询计划的总钱数
	 * 
	 * @throws Exception
	 */
	@Test
	public void testFindAllUserDebitInMoneyByUserDebitInTypeName() throws Exception {
		UserDebitInBiz udib = (UserDebitInBiz) ac.getBean("userDebitInBizImpl");
		UserDebitInType userDebitInType = new UserDebitInType();
		userDebitInType.setUdit_name("U计划");
		double result = udib.findAllUserDebitInMoneyByUserDebitInTypeName(userDebitInType);
		System.out.println(result);
	}

	@Test
	public void testFindAllUplanData() throws Exception {
		UserDebitInBiz udib = (UserDebitInBiz) ac.getBean("userDebitInBizImpl");
		List<UserDebitIn> list = udib.findAllUplanData();
		for (UserDebitIn u : list) {
			System.out.println(u);
		}
	}

}
