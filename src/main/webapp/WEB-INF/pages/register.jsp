<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>


<script type="text/javascript">
	//手机接受验证码
	function get_mobile_code() {
		$.ajax({
			type : "POST",
			url : "toSms.action",
			data : {
				mobile : jQuery.trim($('#u_tel').val())
			},
			dataType : "xml",
			success : function(msg) {
				
			}
		});
		RemainTime()
	}
	var iTime = 10;
	var Account;
	function RemainTime() {
		document.getElementById('zphone').disabled = true;
		var iSecond, sSecond = "", sTime = "";
		if (iTime >= 0) {
			iSecond = parseInt(iTime % 60);
			iMinute = parseInt(iTime / 60)
			if (iSecond >= 0) {
				if (iMinute > 0) {
					sSecond = iMinute + "分" + iSecond + "秒";
				} else {
					sSecond = iSecond + "秒";
				}
			}
			sTime = sSecond;
			if (iTime == 0) {
				clearTimeout(Account);
				sTime = '获取手机验证码';
				iTime = 30;
				document.getElementById('zphone').disabled = false;
			} else {
				Account = setTimeout("RemainTime()", 1000);
				iTime = iTime - 1;
			}
		} else {
			sTime = '';
		}
		document.getElementById('zphone').value = sTime;
	}

	function reg() {
		$.ajax({
			type : "POST",
			data : $("#myform").serialize(),
			/* url : "voteUser_register.action", */
			url : "user/user_register.action",
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
							<td><input type="text" class="text" id="u_tel" name="u_tel" value="18874610678" /></td>
							<input id="zphone" type="button" value="获取手机验证码  " onClick="get_mobile_code();">
						</tr>
						<tr>
							 验证码：
							<input type="text" id="smscode" name="smscode" />
							<br />
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