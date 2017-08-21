<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<script type="text/javascript">
	$(function(){
		//去掉排序，使用默认。。。
		$('#browserListTable').datagrid({
			url : 'admin/database.action?op=dataBaseList',
			fitColumns : true,
			fit : true,//自适应，将分页框分布在最低端
			idField : "roid",//主键列
			rownumbers : true,
			nowrap : true,//不折叠
			singleSelect : true,//一次只选取一行
			columns : [ [ {
				field : 'Tables_in_res',
				title : '表名',
				width : 40,
				align : 'center'
			}] ],
			  onClickRow:function(){
				var row = $('#browserListTable').datagrid('getSelected');
				//alert(row.Tables_in_res)
				if(row){
					//$('#detailTable').datagrid('loadData',{total:0,rows:[]});//清除整行数据
					$('#detailTable').datagrid({
						url : 'admin/database.action?op=dataBaseDetail&table='+row.Tables_in_res,
						fitColumns : true,
						fit : true,//自适应，将分页框分布在最低端
						rownumbers : true,
						nowrap : true,//不折叠
						singleSelect : true,//一次只选取一行
						columns : [ [ {
							field : 'Field',
							title : '字段',
							width : 30,
							align:'center'
						}, {
							field : 'Type',
							title : '类型',
							width : 30,
							align:'center'
							
						}] ]
					});
					$('#detailTable').datagrid('reload');
				}
			}
		});
	});
</script>





<body class="easyui-layout">

		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',title:'表单'" style="overflow: hidden;  width:50%">
				<table id="browserListTable"></table>
			</div>
			<div  data-options="region:'east',title:'具体字段'" style="width: 200px; overflow: hidden;width:50%">
				<table id="detailTable"></table>
			</div>
		</div>

</body>
</html>