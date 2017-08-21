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

import com.yc.bean.UserDebitIn;
import com.yc.biz.UserDebitInBiz;
import com.yc.biz.UserDebitOutBiz;

//以后有spring来管理所有的bean
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:beans.xml") // classpath表示从类的根路径读，不配则从当前TestDao2所在的包读
public class TestUserDebitOut {

	@Autowired
	ApplicationContext ac;
	
	/**
	 * 放贷表测试
	 * @throws Exception
	 */
	@Test
	public void testAddUplanUserDebitOut() throws Exception {
		UserDebitOutBiz udib = (UserDebitOutBiz) ac.getBean("userDebitOutBizImpl");
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("udit_id", 1);
		int result = udib.findUserDebitInIdByUserDebitInTypeId(parameterMap);
		System.out.println(result);
	}
}
