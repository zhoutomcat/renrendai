<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="header.jsp" %>


    
<div id="regLogin" class="wrap">
		<div class="dialog">
			<div class="box">
				<h4>用户登录</h4>
				<form id="User_login_action" name="User_login_action" action="user_login.action" method="post">
					<div class="infos">
						<table class="field">
							<tr>
								<td  colspan="2" style="text-align:center; color:red"></td>
							</tr>
							<tr>
								<td class="field">用 户 名：</td>
								<td>
									 <input type="text" name="username" value="" id="User_login_action_username" class="text" required="true"/>
								</td>
							</tr>
							<tr>
								<td class="field">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
								<td>
									<input type="password" name="password" id="User_login_action_password" class="text" required="true"/>
								</td>
							</tr>
						 <tr>
							<td class="field">验 证 码：</td>
							<td><input type="text"  name="zccode" id="zccode" style="font-size:14px; width:100px"/>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<img src="image.jsp" onclick="changeVilidateCode(this)" border="0" title="点击图片刷新验证码" size="10" />
							</td>
						</tr> 
						</table>
						<div class="buttons">
							<input type="submit" id="User_login_action_0" value="立即登录"/>

							<input type='button' value='注册' onclick='document.location="toRegister.action"' />
						</div>
					</div>
					
				</form>
				
				<div id="result">${errormsg}</div>




			</div>
		</div>
	</div>
	
	
	<%@ include file="bottom.jsp" %>
