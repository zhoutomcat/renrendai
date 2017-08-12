package com.yc.dao.test;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//以后有spring来管理所有的bean
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:beans.xml")  //classpath表示从类的根路径读，不配则从当前TestDao2所在的包读
public class TestVoteUserBiz{
		
		@Autowired
		ApplicationContext ac;
	

		@Test
		public void testLogin() throws Exception{


		}
		
		
		
	
	
}
