<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="header.jsp"%>

<script>
	$(function() {
		$("#button").click(
				function() {
					$.ajax({
						type : "POST",
						url : "addUplanUserDebitOut.action?udit_id="
								+ document.getElementById("udit_id").value,
						data : $("#myform").serialize(),
						dataType : "JSON",
						success : function(data) {
							if (data.code == 1) {
								alert("chenggong");
								window.location.href="index.jsp";
								window.location.reload();
							} else {
								alert("shibai");
							}
						}
					});
				});
	})
</script>


<center>
	<input id="udit_id" name="udit_id" type="hidden" value="<%=request.getParameter("udit_id")%>" />
	<%-- 	<%=request.getParameter("udit_id") %> --%>
	<form action="" method="post" id="myForm"></form>
	请输入要投标的金额 :
	<input type="text" name="udo_money" />
	<input id="button" type="button" value="确定">
</center>

<%@include file="bottom.jsp"%>