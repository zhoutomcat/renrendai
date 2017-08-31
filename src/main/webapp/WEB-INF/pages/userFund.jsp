<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>

<%@ include file="nav.jsp"%>

<script type="text/javascript">
	$(function() {
		$.ajax({
			type : "POST",
			data : "",
			url : "user/findUserFundInfoByUser.action",
			dataType : "JSON",
			success : function(data) {
				var str = '账户余额：' + data.obj.uf_balance + '&nbsp;&nbsp;&nbsp;<a href="toChongzhi.action">充值</a>' + '<br/>' + '<br/>';
				str += '可用余额：' + data.obj.uf_available + '&nbsp;&nbsp;&nbsp;<a href="toWithdraw.action">提现</a>' + '<br/>' + '<br/>';
				str += '冻结余额：' + data.obj.uf_freeze + '<br/>' + '<br/>';
				document.getElementById("userBalance").innerHTML = str;
			}
		});
	});
</script>
<br />
<center>
	<div id="userBalance"></div>
	
</center>
