<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<center>

	<div class="wdg-werenrendai-second-header">
		<div class="main-section current-channel-autoinvest">
			<a href="/" class="brand-logo mt15">
				<h2 class="rrd-logo">人人贷</h2>
			</a>
			<ul class="site-nav">
				<li class="channel-item "><a href="index.action">首页</a></li>
				<li class="channel-item "><a href="toUplan.action">U计划</a></li>
				<li class="channel-item "><a href="/pc/premium.html">优选计划</a></li>
				<li class="channel-item active-channel"><a href="/pc/autoinvest.html">薪计划</a></li>
				<li class="channel-item "><a href="/pc/loan.html">债权</a></li>
				<li class="channel-item "><a href="/pc/college.html" target="_blank">人人学院</a></li>
				<li class="channel-item" style="width: 144px;"><a href="/credit" target="_blank">我要借款/还款</a></li>
				<li class="user-item fn-clear" num=""><c:if test="${user==null}">
						<div class="denglu">
							<a target="_self" href="toRegister.action">注册</a> / <a target="_self" href="toLogin.action">登录</a>
						</div>
					</c:if> <c:if test="${user!=null}">
						<div class="denglu">
							欢迎您：${user.u_name}  <a href="user_layout.action">退出</a>
						</div>
					</c:if></li>
			</ul>
		</div>
	</div>


</center>

