<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>

<%@ include file="nav.jsp"%>

<script type="text/javascript">
	$(function() {
		$("#button").click(function() {
			$.ajax({
				type : "POST",
				url : "user/chongzhiUserFund.action",
				data : $("#myform").serialize(),
				dataType : "JSON",
				success : function(data) {
					if (data.code == 1) {
						alert("chenggong");
						window.location.href = "toUserFund.action";
					} else {
						alert("shibai");
					}
				}
			});
		});
	})
</script>

<br />

<center>
	<form id="myform" method="POST">
		请输入你要充值的金额：
		<input name="money" type="text" />
		<input id="button" type="button" value="确定">
	</form>
</center>