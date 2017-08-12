package com.yc.web.servlets;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.yc.bean.Admin;
import com.yc.biz.AdminBiz;
import com.yc.biz.impl.AdminBizImpl;
import com.yc.utils.RequestUtil;
public class AdminServlet extends BaseServlet {


	private static final long serialVersionUID = -5446435166013567324L;
	private AdminBiz ab = new AdminBizImpl();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			if("login".equals(op)){
				login(req,resp);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
	
		
	}



	private void login(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String rand = (String) req.getSession().getAttribute("rand");
		String vcode = req.getParameter("zccode");
		if( rand.equals(vcode)){
		Admin admin = RequestUtil.getParemeter(req, Admin.class);   
		admin= ab.login(admin);
		if( admin!=null){
				req.getSession().setAttribute("admin", admin);
				resp.sendRedirect("manager/main.jsp");
				//req.getRequestDispatcher("/back/manager/main.jsp").forward(req, resp);
			}else{
				resp.sendRedirect("login.html");
			}
	}else{
		resp.sendRedirect("login.html");
	}
		}
	
	
	


}
