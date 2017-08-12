package com.yc.dao;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



import com.yc.utils.RequestUtil;



public class DbHelper {
	private Connection conn=null;
	private PreparedStatement pstmt=null;//SQL 语句被预编译并存储在 PreparedStatement 对象中.然后可多次高效地执行
	private ResultSet rs=null;//表示数据库结果集的数据表，通常通过执行查询数据库的语句生成
	/*
	 *  Statement stmt = con.createStatement(
                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                      ResultSet.CONCUR_UPDATABLE);
       ResultSet rs = stmt.executeQuery("SELECT a, b FROM TABLE2");

	 */

	//加载驱动
	static{
		try {
			Class.forName(MyProperties.getInstance().getProperty("jdbc.driverClassName"));//oracle.jdbc.driver.OracleDriver
			/*
			 * Properties 类表示了一个持久的属性集。Properties 可保存在流中或从流中加载。属性列表中每个键及其对应值都是一个字符串。 

一个属性列表可包含另一个属性列表作为它的“默认值”；如果未能在原有的属性列表中搜索到属性键，则搜索第二个属性列表

			 */
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 *获取数据库连接
	 */
	public Connection getConn(){

				try {
					conn=DriverManager.getConnection(MyProperties.getInstance().getProperty("jdbc.url"),MyProperties.getInstance());
				//url:      jdbc:oracle:thin:@localhost:1521:orcl
				} catch (SQLException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				


//		//从容器Tomcat中取出jdbc/bbs的连接池中的连接
//		try {
//			Context initCtx = new InitialContext();//创建一个容器
//			Context envCtx = (Context) initCtx.lookup("java:comp/env");//查找资源
//			DataSource ds = (DataSource)envCtx.lookup("jdbc/productdb");//提供要查找的资源名
//			conn = ds.getConnection();
//		} catch (NamingException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}



		return conn;
	}

	/**
	 * 关闭对象
	 * @param conn
	 * @param pstmt
	 * @param rs
	 */
	public void closeAll(Connection conn,PreparedStatement pstmt,ResultSet  rs){
		//关闭结果集
		if(null!=rs){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//关闭语句对象
		if(null!=pstmt){
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//关闭连接对象
		if(null!=conn){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	/**
	 * 查所有的javabean里封装的类
	 * @param sql
	 * @param params
	 * @param c
	 * @return
	 * @throws Exception
	 */
	public <T> List<T> findObject(String sql,List<Object> params, Class<T> c) 
			throws Exception{
		List<Map<String,Object>>  list=findMultiObject(sql,params);
		List<T> listT = new ArrayList<T>(); 
		if( list!=null){
			for( Map<String,Object> map:list){
				T t = RequestUtil.getParemeter(map,c);
				listT.add(t);
			}
		}
		return listT;
	}





	/**
	 * 查看操作：sql语句可以查询出多条记录
	 * @param sql
	 * @param params
	 * @return
	 * @throws SQLException
	 * @throws FileNotFoundException 
	 */
	public List<Map<String,Object>> findMultiObject(String sql,List<Object> params) throws SQLException, FileNotFoundException{
		List<Map<String,Object>>  list=new ArrayList<Map<String,Object>>();
		Map<String,Object> map=null;
		try{
			conn=this.getConn();
			pstmt=conn.prepareStatement(sql);
			this.setparams(pstmt, params);
			rs=pstmt.executeQuery();
			//获取结果集中所有的列名
			List<String> columnNames=getAllColumnName(rs);
			while(rs.next()){
				map=new HashMap<String,Object>();
				for(String name:columnNames){
					map.put(name,rs.getObject(name));
				}
				list.add(map);
			}
		}finally{
			this.closeAll(conn, pstmt, rs);
		}
		return list;
	}


	/**
	 * 查询操作，   select * from emp where id=?  只有一个结果
	 * @param sql
	 * @param params
	 * @return
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 */

	public Map<String,Object> findSingleObject(String sql,List<Object> params) throws SQLException, FileNotFoundException{
		Map<String,Object>  map=null;
		try{
			conn=this.getConn();
			pstmt=conn.prepareStatement(sql);
			this.setparams(pstmt, params);
			rs=pstmt.executeQuery();
			//获取结果集中所有的列名
			List<String> columnNames=getAllColumnName(rs);
			if(rs.next()){
				map=new HashMap<String,Object>();
				for(String name:columnNames){
					map.put(name,rs.getObject(name));
				}
			}
		}finally{
			this.closeAll(conn, pstmt, rs);
		}
		return map;
	}

	/**
	 * 获取结果集中的所有列表
	 * @param rs2
	 * @return
	 * @throws SQLException
	 */
	private List<String> getAllColumnName(ResultSet rs2) throws SQLException {
		List<String>   coLumnNames =new ArrayList<String>();
		ResultSetMetaData dd=rs.getMetaData();
		for(int i=1;i<=dd.getColumnCount();i++){
			coLumnNames.add(dd.getColumnName(i));
		}
		return coLumnNames;
	}

	/**
	 * 单条sql语句  更新操作  ：增删改
	 * @param sql   语句
	 * @param params  传入的参数
	 * @return
	 * @throws SQLException
	 * @throws FileNotFoundException 
	 */
	public int doUpate(String sql,List<Object> params) throws SQLException, FileNotFoundException {
		int result=0;
		try{
			conn=this.getConn();//获取连接对象
			pstmt=conn.prepareStatement(sql);
			//设置参数
			this.setparams(pstmt, params);
			result=pstmt.executeUpdate();
		}finally{
			//关闭对象
			this.closeAll(conn, pstmt, null);
		}

		return result;
	}


	/**
	 * 多条sql语句的更新操作  批处理  注意：这些sql语句执行的结果要么一起成功，要么一起失败
	 * @param sqls
	 * @param params   对应每一条sql语句所需要的参数值集合
	 * @return
	 * @throws SQLException
	 * @throws FileNotFoundException 
	 */
	public int doUpdate(List<String> sqls,List<List<Object>> params) throws SQLException, FileNotFoundException{
		int result=0;
		try {
			conn=this.getConn();//获取数据库连接
			//设置事物提交方式为手动提交
			conn.setAutoCommit(false);


			if(null!=sqls&&sqls.size()>0){
				//对sql语句进行循环
				for(int i=0;i<sqls.size();i++){
					String sql=sqls.get(i);
					pstmt=conn.prepareStatement(sql);
					this.setparams(pstmt, params.get(i));   //第几条sql语句list集合中的第几个小list
					result=pstmt.executeUpdate();
				}
			}
			conn.commit();//手动提交事务
		} catch (SQLException e) {
			conn.rollback();//事务回滚
		}finally{
			conn.setAutoCommit(true);//恢复事务
			this.closeAll(conn, pstmt, rs);
		}
		return result;

	}




	/**
	 * 设置参数
	 * @param pstmt  预编译对象
	 * @param params 外部传入的参数值   添加值是顺序一样要和？对应值的顺序一致
	 * @throws  SQLException
	 * @throws FileNotFoundException 
	 */
	public void setparams(PreparedStatement pstmt,List<Object> params) {
		if(null!=params&&params.size()>0){
			//图片必须单独处理，传入的输入流，所以从界面上传入文件对象
			for(int i=0;i<params.size();i++){
				//File f =new File("");
				if(params.get(i)  instanceof File){//判断参数是否为文件对象
					//insert into student values(seq_stu_id.nextval,1,?,default,?,?,?,sysdate)
					File file =(File) params.get(i);//强转为文件对象
				
					try {
						InputStream in=new FileInputStream(file);//转为输入流对象
						pstmt.setBinaryStream(i+1, in, (int)file.length());
					} catch (FileNotFoundException | SQLException e) {
						e.printStackTrace();
					}
				}else{
					//System.out.println("----"+params.get(i));
					if(params.get(i)!=null){
						try {
							pstmt.setObject(i+1, params.get(i));
						} catch (SQLException e) {
							e.printStackTrace();
						}  //设置？值
					}
					//pstmt.setString(i+1, params.get(i).toString());
//					if(params.get(i) instanceof Integer){
//						pstmt.setInt(i+1, Integer.parseInt(params.get(i).toString()));
//					}else{
//						pstmt.setInt(i+1, Integer.parseInt(params.get(i).toString()));
//					}
				}
			}
		}

	}

	/**
	 * 聚合函数查询
	 * @param sql
	 * @param params
	 * @return
	 * @throws SQLException
	 * @throws FileNotFoundException 
	 */
	public double getCount(String sql,List<Object>params) throws SQLException, FileNotFoundException{
		double result=0;
		try{
			conn=this.getConn();
			pstmt=conn.prepareStatement(sql);
			setparams(pstmt,params);
			rs=pstmt.executeQuery();
			if(rs.next()){
				result=rs.getDouble(1);  //获取第一列的值
			}
		} finally {
			this.closeAll(conn, pstmt, rs);
		}
		return result;

	}

	public int doUpdate(String sql, List<Object> params) {
		int result=0;
		conn=this.getConn();//获取连接对象
		try {
			pstmt=conn.prepareStatement(sql);
			this.setparams(pstmt, params);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			this.closeAll(conn, pstmt, null);
		}
		return result;
	}




}



