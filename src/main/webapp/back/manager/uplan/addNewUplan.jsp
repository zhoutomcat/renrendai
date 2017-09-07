<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
/* 	function checkUsername(uname){
	if(!uname){
		alert("用户名不能为空!");
		$("#submit").attr("disabled",true);    //attr=attribute        禁用注册按钮
		return;
	}
	$.ajax({
		type:"post",
		data:"uname="+encodeURIComponent(uname),      // encodeURIComponent 解决用户名乱码问题
		url:"voteUser_isUnameExist.action",
		dataType:"json",
		success:function(data){
			if(data.code== 1){
				$("#submit").attr("disabled",false);
				$("#result").html("用户名可以使用");
			}else{
				$("#submit").attr("disabled",true);
				$("#result").html("用户名已经存在，请更换用户名");
			}
		}
	});
} */
</script>
    <title>U计划</title>
	<center>
			<h1>发出U计划</h1>
			<hr />
			<form id="addNewUplanForm" action="back/addNewUplan.action" method="POST"  accept-charset="UTF-8">
			<div style="text-align:left;">
			发布标题:<input type="text"  name="udi_title"  id="udi_title"  value="U计划"   /><br />
			加入金额:<input type="text"  name="udi_money" id="udi_money" value="500000"   /><br />
			发布时间:<input type="date"  name="udi_publishdate" id="udi_publishdate" /><br />
			生效时间:<input type="date"  name="udi_date" id="udi_date" /><br />
			到期时间:<input type="date"  name="udi_refundrealitydate" id="udi_refundrealitydate" /><br />
			还贷方式:<input type="text"  name="udi_refundway" id="udi_refundway" value="1"  /><br />
			预期年利率:<input type="text"  name="udit_profit" id="udit_profit" value="8.8"   /><br />
			投资期限:<input type="text"  name="udit_month" id="udit_month" value="6"   /><br />
				<input type="submit"   id="addBtn"  value="添加"   />
			</div>
			</form>
	</center>
    
<!--  	   udi_title 		varchar(100) not null, 
       udi_money 		double, 
       udi_status 		int , 
       udi_publishdate         long,
       udi_date 		long,
       udi_refundrealitydate	long,
       udi_refundway		int, 	     
       udi_type          int,   
       
       udit_profit  double,  
	   udit_month double,	  -->    