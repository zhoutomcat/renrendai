package com.yc.web.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RightFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			response.sendRedirect("toLogin.action");
		}
		if (session.getAttribute("admin") == null) {
			response.sendRedirect(request.getContextPath()+"/back/login.html");
		} else {
			arg2.doFilter(request, response);
		}

		/**
		 * HttpServletRequest req = (HttpServletRequest)request; HttpSession
		 * session = req.getSession(); if(session.getAttribute("cust")==null){
		 * req.getRequestDispatcher("../login.jsp").forward(req, response);
		 * }else{ chain.doFilter(request, response); }
		 */

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
