<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>


<script type="text/javascript">
	function reg() {
		$.ajax({
			type : "POST",
			data : $("#myform").serialize(),
			/* url : "voteUser_register.action", */
			url : "user_register.action",
			dataType : "JSON",
			success : function(data) {
				if (data.code == 1) {
					alert("注册成功！");
					location.href = "index.action";
				} else {
					alert("注册失败！原因" + data.msg);
				}
			}
		});
	}

	/* 	function checkUsername(uname) {
	 if (!uname) {
	 alert("用户名不能为空");
	 $("#submit").attr("disabled", true);
	 return;
	 }
	 $.ajax({
	 type : "POST",
	 data : "uname=" + encodeURIComponent(uname),
	 url : "voteUser_isUsernameExist.action",
	 dataType : "JSON",
	 success : function(data) {
	 if (data.code == 0) {
	 $("#submit").attr("disabled", false);
	 $("#result").html("用户名可以使用");
	 } else {
	 $("#submit").attr("disabled", true);
	 $("#result").html("用户名已经存在，请更换用户名");
	 }
	 }
	 });
	 } */
</script>

<div id="regLogin" class="wrap">
	<div class="dialog">
		<dl class="clearfix">
			<dt>新用户注册</dt>
			<dd class="past">填写个人信息</dd>
		</dl>
		<div class="box">
			<form id="myform" method="post">
				<div class="infos">
					<table class="field">
						<tr>
							<td colspan="2" style="text-align: center; color: red"></td>
						</tr>
						<tr>
							<td class="field">用 户 名：</td>
							<!-- onblur="checkUsername(this.value)" -->
							<td><input type="text" class="text" name="u_name" /></td>
							<div id="result"></div>
						</tr>
						<tr>
							<td class="field">密 码：</td>
							<td><input type="password" class="text" name="u_password" /></td>
						</tr>
						<tr>
							<td class="field">确认密码：</td>
							<td><input type="password" class="text" name="reu_password" /></td>
						</tr>
						<tr>
							<td class="field">电 话：</td>
							<td><input type="text" class="text" name="u_tel" /></td>
						</tr>
						<tr>
							<td class="field">邮箱：</td>
							<td><input type="text" class="text" name="u_email" /></td>
						</tr>
						<tr>
							<td class="field">验 证 码：</td>
							<td><input type="text" id="zccode" name="zccode" style="font-size: 14px; width: 100px;" />
								&nbsp;&nbsp;&nbsp;&nbsp; <img src="image.jsp" onclick="changeVilidateCode(this)" border="0"
								title="点击图片刷新验证码" size="10" /></td>
						</tr>
						<center>
							<input type="button" class="input-button" value="用户注册" id="submit" onclick="reg()" />
						</center>
					</table>

				</div>
			</form>
		</div>
	</div>
</div>
<%@ include file="bottom.jsp"%>