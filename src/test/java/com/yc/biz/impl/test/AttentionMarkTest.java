/*package com.yc.biz.impl.test;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.yc.bean.AttentionMark;
import com.yc.bean.User;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

//测试用例
public class AttentionMarkTest extends TestCase { // TestCase测试用例: 可以有多个测试的方法

	static SqlSessionFactory sessionFactory;
	SqlSession session = null;

	static {
		try {
			Reader reader;
			// 加载mybatis的配置文件及其映射文件，返回一个流
			reader = Resources.getResourceAsReader("mybatisConfiguration.xml");
			// 构建sqlsession的工厂 sqlsession ->相当于jdbc中的connection
			sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public static Test suite() { // 测试套件
		TestSuite ts = new TestSuite(AttentionMarkTest.class);
		return ts;
	}


	
	public void testApp() throws IOException {
		// 创建能执行映射文件中 sql的 sqlsession 由工厂来创建sqlsession
		session = sessionFactory.openSession();
		try {
			
			List<User> list = session.selectList(AttentionMark.class.getName()+".findAttentionMarkCondition");	
			session.commit();
			for (User student : list) {
				System.out.println(student);
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}
		session.close();
	}

}
*/