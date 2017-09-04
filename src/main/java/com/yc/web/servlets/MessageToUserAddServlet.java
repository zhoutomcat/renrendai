package com.yc.web.servlets;

import java.io.File;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.yc.bean.Admin;
import com.yc.bean.AdminToUserMessage;
import com.yc.biz.AdminToUserMessageBiz;
import com.yc.biz.AdminToUserMessageBiz1;
import com.yc.biz.impl.AdminToUserMessageBizImpl;
import com.yc.biz.impl.AdminToUserMessageBizImpl1;

public class MessageToUserAddServlet extends HttpServlet {
	private String filepath;   //真实文件位置  tomcat在硬盘上的位置
	private String allowedFilesList = "jpg,png,bmp,gif";
	private String deniedFilesList = "bat,sh,exe,class,html,js,css";
	private long maxFileSize = 2000000;
	private long totalMaxFileSize = 4*maxFileSize;
	private AdminToUserMessageBiz1 adminToUserMessageBiz = new AdminToUserMessageBizImpl1();


	@Override
	public void init(ServletConfig config) throws ServletException {
		if(config.getInitParameter("allowedFilesList")!=null){
			allowedFilesList = config.getInitParameter("allowedFilesList");
		}
		if(config.getInitParameter("deniedFilesList")!=null){
			deniedFilesList = config.getInitParameter("deniedFilesList");
		}
		if(config.getInitParameter("maxFileSize")!=null){
			maxFileSize = Long.parseLong(config.getInitParameter("maxFileSize"));
		}
		if(config.getInitParameter("totalMaxFileSize")!=null){
			totalMaxFileSize = Long.parseLong( config.getInitParameter("totalMaxFileSize"));
		}
		super.init(config);  //调用父类的init方法读取基础配置
	}



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//要回调的客户端的  javascript函数的编号
		SmartUpload su = new SmartUpload();
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		try {
			PageContext context = JspFactory.getDefaultFactory().getPageContext(this, req, resp, null, true, 8*1024, true);	
			su.initialize(context);

			su.setCharset("utf-8");

			//定义允许上传文件类型
			su.setAllowedFilesList(allowedFilesList);
			//不允许上传文件类型
			su.setDeniedFilesList(deniedFilesList);
			//单个文件最大限制
			su.setMaxFileSize(maxFileSize);
			//所有上传文件的总容量限制
			su.setTotalMaxFileSize(totalMaxFileSize);

			su.upload();
			
			//这个request是jspsmartuload组件的request对象,而不是j2ee的HttpServletRequest对象
			// spsmartupload组件的request对象是继承自  HttpServletREquest
			Request request = su.getRequest();
			String title = request.getParameter("atum_title");
			String u_id = request.getParameter("u_id");
			String content = request.getParameter("atum_content");
			
			if( su.getFiles().getCount()>0){
				//获取单个上传文件  java.io.File
				com.jspsmart.upload.File file = su.getFiles().getFile(0);
				//设置文件在服务器的保存位置
				//取filepath所值得tomcat的硬盘路径
				// = "../news_uploadpics/";
				//tomcat中的news项目的路径:   F:\tomcat\apache-tomcat-7.0.47\webapps\news
				String tomcatwebroot =this.getServletConfig().getServletContext().getRealPath("/");   //news路径
				File messageToUserroot = new File( tomcatwebroot);   //取news的父路径
				// F:\tomcat\apache-tomcat-7.0.47\webapps
				File tomcatRootFile = messageToUserroot.getParentFile();

				filepath = tomcatRootFile + "/messages_uploadpics/";  //F:\tomcat\apache-tomcat-7.0.47\webapps/news_uploadpics/
				String webUrl = "../messages_uploadpics/";   //网页上访问图片的路径

				DateFormat df = new SimpleDateFormat("yyyy/MM/");
				String timeDir = df.format(new Date());
				filepath += timeDir;   //filepath  =>  F:\tomcat\apache-tomcat-7.0.47\webapps/news_uploadpics/2017/05/

				webUrl+=timeDir;  //webUrl =>  ../news_uploadpics/2017/05/
				//判断文件夹是否存在,不存在,则创建
				File f  = new File(filepath);
				if(f.exists()==false){
					f.mkdirs();
				}
				if( !file.getFileName().equals("")){
				//拼接要保存的文件的新文件名
				String fileName = genFileName (file.getFileName());
				filepath +=fileName;  //filepath => F:\tomcat\apache-tomcat-7.0.47\webapps/news_uploadpics/2017/05/xxx.png
				webUrl+=fileName; // //webUrl=> ../news_uploadpics/2017/05/xxx.png
				//文件另存为
				file.saveAs(filepath,SmartUpload.SAVE_PHYSICAL);   //以物理路径来保存

				//将文件保存的位置传回到客户端
				//返回"图像"选项并显示图片
				//pic = webUrl;
				}
			}
			
			AdminToUserMessage  atum  = new AdminToUserMessage();
			atum.setAtum_content(content);
			atum.setU_id(Integer.parseInt(u_id));
			atum.setAtum_title(title);
			atum.setAtum_time(System.currentTimeMillis());
			atum.setAtum_status(1);

	
			adminToUserMessageBiz.addMessageToUser(atum);
			resp.sendRedirect("manager/message/successAdd.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();

		
		}
		out.flush();
		out.close();
	}



	private String genFileName(String fileName) {
		String [] strs =fileName.split("\\.");
		DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String prefix  = df.format(new Date());
		return prefix+"."+strs[1];
	}







}
