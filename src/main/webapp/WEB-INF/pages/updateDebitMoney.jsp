<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="header.jsp"%>

 <script type="text/javascript">
$(function(){
	$("#addbtn").click(function(){
		for (instance in CKEDITOR.instances) {
			CKEDITOR.instances[instance].updateElement();
		}
		$.ajax({
			type:"POST",
			url:"user/addUserMessageMoney.action",
			data:$("#myform").serialize(),
			dataType:"JSON",
			success:function(data){
				if(data.code==1){
					alert("上传详细信息成功！");
					location.href="user/toAddUserDebitIn.action";
				}else{
					alert("上传详细信息失败，原因："+data.msg);
				}
			}
		});
	});	
});
</script>


<div id="regLogin" class="wrap">
	<div class="dialog">
		<dl class="clearfix">
			<dd class="past">修改借款人详细信息</dd>
			<dd class="past2"><a href="user/toAddUserDebitIn.action" >填写借贷信息</dd>
		</dl>
		<div class="box">
			 <form method="post" action=""  id="myform"> 
		<!-- 	 <form id="DebitMoney_add_action" name="DebitMoney_add_action" action="user/DebitMoneyAdd.action" method="post">  -->
				<div class="infos">   
					<table class="field">
						<tr>
							<td class="field">您的真实姓名：</td>
							<td>
								<input type="text" name="um_reallyName"  id="House_add_action_title" class="text"  value="${userMessage.um_reallyName }"/>
							</td>
						</tr>
						<tr>
							<td class="field">身份证号码：</td>
							<td>
								<input type="text" name="um_idCard"  id="House_add_action_title" class="text"  value="${userMessage.um_idCard} "/>
							</td>
						</tr>
						<tr>
							<td class="field">居住地地址：</td>
							<td>
								<input type="text" name="um_nowPlace" value="${userMessage.um_nowPlace }"  id="House_add_action_floorage" class="text" />
							</td>
						</tr>
						<tr>
							<td class="field">工作信息：</td>
							<td>
								<input type="text" name="um_workinfo" value="${userMessage.um_workinfo }" id="House_add_action_price" class="text" />
							</td>
						</tr>
						<tr>
							<td class="field">收入信息：</td>
							<td>
								<input type="text" class="text" name="um_incomeinfo"  value="${userMessage.um_incomeinfo }" />
							</td>
						</tr>
						<tr>
							<td class="field">性别：</td>
							<td>
								<input type="text" class="text" name="um_sex" value="${userMessage.um_sex }" />
							</td>
<%-- 							<td>
								区：
								<select class="text" name="district_id" id="houseDistrict" onchange="onchangeDistrict(this.value)">
								<c:forEach items="${districtList }" var="district">
									<option value="${district.id }">${district.name }</option>
								</c:forEach>
								</select>
								街：
								<select class="text" name="street_id" id="houseStreet"></select>
							</td> --%>
						</tr>
						<tr>
							<td class="field">年龄：</td>
							<td>
								<input type="text" name="um_age" value="${userMessage.um_age }"  id="House_add_action_contact" class="text" />
							</td>
						</tr>
						<tr>
							<td class="field">银行卡卡号：</td>
							<td>
								<input type="text" name="bi_idCard" value="${userMessage.bi_idCard }"  id="House_add_action_contact" class="text" />
							</td>
						</tr>
						<tr>
							<td class="field">详细信息：</td>
							<td>
								<textarea id="ck" class="ckeditor" name="um_description" value="${userMessage.um_description }"></textarea>
							</td>
						</tr>
					</table>
					<div class="buttons">
					<!-- 	 <input type="submit" id="House_add_action_0" value="立即发布" />  -->
							 <input type="button" id="addbtn" value="修改"/> 
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<%@ include file="bottom.jsp"%>



