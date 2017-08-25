<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8" />
<title>人人贷 - 用户登录</title>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">

<link type="text/css" rel="stylesheet" href="css/style.css" />
<link type="text/css" rel="stylesheet" href="css/nav.css" />
<link type="text/css" rel="stylesheet" href="css/b.css" />
<link type="text/css" rel="stylesheet" href="css/c.css" />
<link type="text/css" rel="stylesheet" href="css/d.css" />
<link type="text/css" rel="stylesheet" href="css/e.css" />
<link type="text/css" rel="stylesheet" href="css/f.css" />
<link type="text/css" rel="stylesheet" href="css/g.css" />
<link type="text/css" rel="stylesheet" href="css/h.css" />
<link type="text/css" rel="stylesheet" href="css/i.css" />
<link type="text/css" rel="stylesheet" href="css/calculate.css" />
<script type="text/javascript" src="js/function.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/add.js"></script>
<script type="text/javascript" src="js/ycPageBar.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>

</head>
<body>
	<div id="header" class="wrap">
		<div id="logo">
			<img src="images/logo.png" />
		</div>
	</div>