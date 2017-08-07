<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<script type="text/javascript" src="back/commons/js/main.js"></script>


<body class="easyui-layout  layout panel-noscroll" >


		<div data-options="region:'north' "style="height:50px;">top</div>
		<div data-options="region:'south',split:true"   style="height:50px;">button</div>
		<div data-options="region:'east',split:true " title ="East" style="width:100px;">right</div>
		<div data-options="region:'west',split:true " title ="West" style="width:150px;">
		
		<div class="easyui-accordion" style="overflow:auto; width: 500px; height:300px;" >
		
				<div title="新闻类别管理" style="overflow:auto; padding: 10px;">
						<div class="easyui-panel"  style="padding:5px">
							<ul id="findAllUserTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
							
							</ul>
						</div>
				
				</div>
				
				</div>
				</div>
				
				


		
		<div   data-options=" region:'center',title:'主操作区', iconCls:'icon-ok'">
				<!-- tabs区，有很多的tab -->
				<div id="mainTt"  class="easyui-tabs"  data-options="fit:true,border:false">
						<div title="待处理业务区">欢迎您,源辰信息</div>
				</div>
		
		</div> 
		


</body>
</html>



