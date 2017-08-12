<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>

<script>
	$(function() {
		$("#User_login_action_0").click(function() {
			$.ajax({
				type : "POST",
				data : $("#User_login_action").serialize(),
				url : "user_login.action",
				dataType : "JSON",
				success : function(data) {
					if (data.code == 1) {
						alert("登录成功！");
						location.href = "toHello.action";
					} else {
						alert("登录失败！原因" + data.msg);
					}
				}
			})
		})
	})
</script>

<div id="regLogin" class="wrap">
	<div class="dialog">
		<div class="box">
			<h4>用户登录</h4>
			<form id="User_login_action" name="User_login_action">
				<div class="infos">
					<table class="field">
						<tr>
							<td colspan="2" style="text-align: center; color: red"></td>
						</tr>
						<tr>
							<td class="field">用 户 名：</td>
							<td><input type="text" name="u_name" value="" id="User_login_action_username"
									class="text" required="true" /></td>
						</tr>
						<tr>
							<td class="field">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
							<td><input type="password" name="u_password" id="User_login_action_password" class="text"
									required="true" /></td>
						</tr>
						<tr>
							<td class="field">验 证 码：</td>
							<td><input type="text" id="zccode" name="zccode" style="font-size: 14px; width: 100px;" />
								&nbsp;&nbsp;&nbsp;&nbsp; <img src="image.jsp" onclick="changeVilidateCode(this)" border="0"
								title="点击图片刷新验证码" size="10" /></td>
						</tr>
					</table>
					<div class="buttons">
						<input type="button" id="User_login_action_0" value="立即登录" />
						<input type='button' value='注册' onclick='document.location="toRegister.action"' />
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<%@ include file="bottom.jsp"%>


