<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="header.jsp"%>

<script>
	$(function() {
		$("#button").click(
				function() {
					$.ajax({
						type : "POST",
						url : "user/addPerFundInfoByUser.action?udi_id="
								+ document.getElementById("udi_id").value,
						data : $("#myform").serialize(),
						dataType : "JSON",
						success : function(data) {
							if (data.code == 1) {
								alert("chenggong");
								window.location.href = "index.jsp";
							} else {
								alert("shibai");
								document.getElementById("warning").innerHTML = '您投入的钱过多，最多只能投' + data.obj + '元';
							}
						}
					});
				});
	})
</script>


<center>
	<input id="udi_id" name="udi_id" type="hidden" value="<%=request.getParameter("udi_id")%>" />
	<form id="myform" method="post" >
		请输入金额 :
		<input type="text" id="udo_money" name="udo_money" />
		<input id="button" type="button" value="确定"/>
		<div id="warning" style="color:red">aa</div>
		<div id="money" value=""></div>
	</form>
</center>

<%@include file="bottom.jsp"%>