<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="header.jsp"%>

<script>
	$(function() {
		$("#button").click(
				function() {
					$.ajax({
						type : "POST",
						url : "user/addUplanUserDebitOut.action?udit_id="
								+ document.getElementById("udit_id").value,
						data : $("#myform").serialize(),
						dataType : "JSON",
						success : function(data) {
							if (data.code == 1) {
								alert("chenggong");
								window.location.href = window.location.href;
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
	<input id="udit_id" name="udit_id" type="hidden" value="<%=request.getParameter("udit_id")%>" />
	<form id="myform" method="post" >
		请输入要投标的金额 :
		<input type="text" id="udo_money" name="udo_money" />
		<input id="button" type="button" value="确定"/>
		<div id="warning" style="color:red">aa</div>
	</form>
</center>

<%@include file="bottom.jsp"%>