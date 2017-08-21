<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

<head>
<script type="text/javascript">
	$(function(){
		$("#addBtn").click(function(){
			//异步请求
			$.ajax({
				type:"POST",
				url: "back/newsType.action",
				data: $("#addNewsTypeForm").serialize(),
				dataType: "json",    //替换 eval('('+xmlHttp.responseText+')')
				success: function(data){
					if(data.code==1){
						$.messager.alert('Warning','添加成功');
						$("#tname").val('');
					}else{
						$.messager.alert('Warning','添加失败',+data.errorMsg);
					}
					
				}
			});
		});
	});
</script>

<title>添加新闻类别</title>
</head>
<body>


<form id="addNewsTypeForm" method="POST" action="back/newsType.action">
			<input type="hidden"   name="op"  value="add" />
			新闻类别名:<input type="text"  name="tname"  id="tname" /><br />
			<input type="button"  id="addBtn"  value="添加"    /> 
			<!-- <button type="submit">添加</button> -->
</form>

</body>