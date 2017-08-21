package com.yc.dao.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.bean.AttentionMark;
import com.yc.bean.User;
import com.yc.biz.AttentionMarkBiz;

//以后有spring来管理所有的bean
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:beans.xml") // classpath表示从类的根路径读，不配则从当前TestDao2所在的包读
public class TestUserAttentionMark {

	@Autowired
	ApplicationContext ac;

	@Test
	public void testA() throws Exception {
		AttentionMarkBiz udib = (AttentionMarkBiz) ac.getBean("attentionMarkBizImpl");
		AttentionMark am = new AttentionMark();
		am.setU_id(1);
		List<User> list = udib.findAllAttentionMarkByUser(am);
		for(User m: list){
			System.out.println(m);
		}
		
	}

}