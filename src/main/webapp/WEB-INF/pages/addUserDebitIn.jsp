<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="header.jsp"%>
<!-- <script type="text/javascript" src="js/add.js"></script> -->   

 <script type="text/javascript">
$(function(){
	$("#addbutton").click(function(){
		$.ajax({
			type:"POST",
			url:"user/AddUserDebitInAndUserDebitInType.action",
			data:$("#myform").serialize(),
			dataType:"JSON",
			success:function(data){
				if(data.code==1){
					alert("上传借贷信息成功！");
					location.href="index.action";
				}else{
					alert("上传借贷信息失败，原因："+data.msg);
				}
			}
		});
	});	
});
</script>


<div id="regLogin" class="wrap">
	<div class="dialog">
		<dl class="clearfix">
			<dt>借款信息填写处</dt>
			<dd class="past">填写借款人详细信息</dd>
		</dl>
		<div class="box">
			 <form method="post" action=""  id="myform"> 
		<!-- 	 <form id="DebitMoney_add_action" name="DebitMoney_add_action" action="user/DebitMoneyAdd.action" method="post">  -->
				<div class="infos">   
					<table class="field">
						<tr>
							<td class="field">借贷标题：</td>
							<td>
								<input type="text" name="udi_title"  id="House_add_action_title" class="text"  value="U计划"/>
							</td>
						</tr>
						<tr>
							<td class="field">借贷金额：</td>
							<td>
								<input type="text" name="udi_money"  id="House_add_action_title" class="text"  value="100000"/>
							</td>
						</tr>
						<tr>
							<td class="field">借贷用途：</td>
							<td>
								<input type="text" name="udi_use"  id="House_add_action_title" class="text"  value="买房子"/>
							</td>
						</tr>
						<tr>
							<td class="field">还款方式：</td>
							<td>
						<%-- 	 <select class="text" name="udi_type" id="udi_refundway">
									<c:forEach items="${userDebitInTypeList }" var="userDebitInType">									
										<option value="${userDebitInType.id }" >${userDebitInType.udi_refundway}</option>				
								</c:forEach>
								</select>  --%>
								<input type="text" name=" udi_refundway" value="1"  id="House_add_action_floorage" class="text" />
							</td>
						</tr>
 						<tr>
							<td class="field">借贷期限：</td>
							<td>
								<input type="text" name="udit_month" value="24" id="House_add_action_price" class="text" />
							</td>
						</tr>
						<tr>
							<td class="field">借贷利率：</td>
							<td>
								<input type="text" value="6.6" name="udit_profit" />
							</td>
						</tr> 
					</table>
					<div class="buttons">
					<!-- 	 <input type="submit" id="House_add_action_0" value="立即发布" />  -->
							 <input type="button" id="addbutton" value="添加"/> 
					</div>
				</div>
			</form>
		</div>
	</div>
</div>







<%@ include file="bottom.jsp"%>



