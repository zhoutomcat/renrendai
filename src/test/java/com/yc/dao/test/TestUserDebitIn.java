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
public class TestUserDebitIn {

	@Autowired
	ApplicationContext ac;

	@Test
	public void testFindAllUpanHistory() throws Exception {
		UserDebitInBiz udib = (UserDebitInBiz) ac.getBean("userDebitInBizImpl");
		UserDebitIn userDebitIn = new UserDebitIn();
		userDebitIn.setOrderway("desc");
		userDebitIn.setOrderby("udi_id");
		// int start = (userDebitIn.getPages() - 1) * userDebitIn.getPagesize();
		// userDebitIn.setStart(start);
		List<UserDebitIn> list = udib.findAllUplanHistory(userDebitIn);
		for (UserDebitIn u : list) {
			System.out.println(u);
		}
	}

	@Test
	public void testFindAllUpanHistoryCount() throws Exception {
		UserDebitInBiz udib = (UserDebitInBiz) ac.getBean("userDebitInBizImpl");
		int result = udib.findAllUplanHistoryCount();
		System.out.println(result);
	}

	@Test
	public void testFindSanbiaoHistory() throws Exception {
		UserDebitInBiz udib = (UserDebitInBiz) ac.getBean("userDebitInBizImpl");
		UserDebitIn userDebitIn = new UserDebitIn();
/*		userDebitIn.setOrderway("desc");
		userDebitIn.setOrderby("udi_id");
		 int start = (userDebitIn.getPages() - 1) * userDebitIn.getPagesize();
		 userDebitIn.setStart(start);*/
		List<UserDebitIn> list = udib.findAllSanbiaoHistory(userDebitIn);
		for (UserDebitIn u : list) {
			System.out.println(u);
		}
	}

	@Test
	public void testFindSanbiaoHistoryCount() throws Exception {
		UserDebitInBiz udib = (UserDebitInBiz) ac.getBean("userDebitInBizImpl");
		int result = udib.findAllSanbiaoHistoryCount();
		System.out.println(result);
	}

}
