<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="header.jsp"%>

<%@include file="nav.jsp"%>

<script>
	$(function() {
		$
				.ajax({
					type : "POST",
					data : "udit_id="
							+ document.getElementById("udit_id").value,
					url : "user/attentionMarkIsNotExist.action",
					dataType : "JSON",
					success : function(data) {
						document.getElementById("udi_id").value = data.obj;
						if (data.code == 1) {
							/* var str  = '<input type="button" id="attentionMark" value="关注" />';
							document.getElementById("guanzhu").value = '取消关注'; */
						} else if (data.code == 2) {
							var str = '<input type="button" id="attentionMark" value="关注" onclick = "add()" />';
							document.getElementById("guanzhu").innerHTML = str;
						} else {
							alert("查询失败！原因" + data.msg);
						}
					}
				});

	});

	$(function() {
		$("#submit")
				.click(
						function() {
							$
									.ajax({
										type : "POST",
										url : "user/addUplanUserDebitOut.action?udit_id="
												+ document
														.getElementById("udit_id").value,
										data : $("#myform").serialize(),
										dataType : "JSON",
										success : function(data) {
											if (data.code == 1) {
												alert("chenggong");
												window.location.href = window.location.href;
												window.location.href = "index.jsp";
											} else {
												alert("shibai");
												document
														.getElementById("warning").innerHTML = '您投入的钱过多，最多只能投'
														+ data.obj + '元';
											}
										}
									});
						});
	})

	function add() {
		$.ajax({
			type : "POST",
			url : "user/addAttentionMark.action?udit_id="
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
				}
			}
		});
	}

	$(function() {

	})
</script>

<center>

	<br /> <br />

	<input id="udit_id" name="udit_id" type="hidden" value="<%=request.getParameter("udit_id")%>" />
	<form id="myform" method="post">
		请输入金额 :
		<input type="text" id="udo_money" name="udo_money" />
		<input id="submit" type="button" value="确定" />
		<div id="warning" style="color: red">aa</div>
		<div id="guanzhu">
			<!-- <input type="button" id="attentionMark" value="关注" /> -->
		</div>
		<input type="hidden" id="udi_id" />
	</form>
</center>

<%@include file="bottom.jsp"%>