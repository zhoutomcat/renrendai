package com.yc.dao.test;


import static org.junit.Assert.assertNotNull;

import org.junit.Test;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.bean.VoteUser;
import com.yc.biz.VoteUserBiz;
import com.yc.dao.BaseDao;
import com.yc.utils.Encrypt;
//以后有spring来管理所有的bean
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:beans.xml")  //classpath表示从类的根路径读，不配则从当前TestDao2所在的包读
public class TestVoteUserBiz{
		
		@Autowired
		ApplicationContext ac;
	

		@Test
		public void testLogin() throws Exception{
			VoteUserBiz vb=(VoteUserBiz) ac.getBean("voteBizImpl");
			VoteUser vu=new VoteUser();
			vu.setUname("a");
			vu.setPwd(Encrypt.md5AndSha("a"));
			assertNotNull(vb.login(vu));
			System.out.println(vb.login(vu));
		}
		
		
		
	
	
}
