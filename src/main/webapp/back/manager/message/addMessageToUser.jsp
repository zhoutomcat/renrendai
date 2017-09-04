<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript">
/*  	$(function(){		
		$("#addBtn").click(function(){
			//异步请求
			$.ajax({
				type:"POST",
				url: "back/toAdminMessagetoUser.action",
				data: $("#addMessageForm").serialize(),
				dataType: "json",    //替换 eval('('+xmlHttp.responseText+')')
				success: function(data){
					if(data.code==1){
						$.messager.alert('Warning','添加成功');
						// $("#tname").val('');      //清空新闻类别
					}else{
						$.messager.alert('Warning','添加失败',+data.errorMsg);
					}
					
				}
			});
		});
	}); 
	 */

	
</script>

<title>推送消息</title>


	<center>
			发布消息
			<hr />
			<form id="addMessageForm" action="back/addMessageToUser.action" method="post"  enctype="multipart/form-data" >
			<div style="text-align:left;">
			<!-- <input	 type="hidden" name="op"  value="add"  /> -->
			消息标题:<input type="text"  name="atum_title" id="atum_title"   /><br />
			用户编号:<input type="text"  name="u_id" id="u_id"   /><br />
			消息内容:
				<textarea class="ckeditor"  name="atum_content"></textarea>
			<br />
			<input type="submit"   id="addBtn"  value="添加"   />
			</div>
			</form>
	</center>