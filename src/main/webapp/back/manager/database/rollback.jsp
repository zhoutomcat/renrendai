<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<script type="text/javascript">
	$(function() {
		//去掉排序，使用默认。。。
		$('#operateListTable')
				.datagrid(
						{
							url : 'admin/database.action?op=operateDetail',
							pagination : true,//分页
							pageSize : 100,
							pageList : [ 20, 30, 60, 80, 100 ],
							fitColumns : true,
							fit : true,//自适应，将分页框分布在最低端
							rownumbers : true,
							nowrap : true,//不折叠
							singleSelect : true,//一次只选取一行
							columns : [ [
									{
										field : 'addressname',
										title : '文件名',
										width : 80,
										align : 'center'
									},
									{
										field : 'address',
										title : '文件路径',
										width : 150,
										align : 'center'

									},
									{
										field : 'person',
										title : '备份人',
										width : 70,
										align : 'center'
									},
									{
										field : 'times',
										title : '备份时间',
										width : 80,
										sortable : true,
										align : 'center'
									},
									{
										field : 'types',
										title : '备份类型',
										width : 80,
										align : 'center'
									},
									{
										field : '_operate',
										title : '操作',
										width : 150,
										align : 'center',
										formatter : function formatOper(val,
												row, index) {
											var str = '<a href="javascript:void(0)" onclick="rollback('
													+ index + ')">还原</a>'
											str += ' <a href="javascript:void(0)" onclick="deleteTable('
													+ index + ')">删除</a> ';
											return str;
										}
									} ] ]
						});
	});

	//删除操作
	function deleteTable(index) {
		$('#operateListTable').datagrid('selectRow', index);//关键在这里
		var row = $('#operateListTable').datagrid('getSelected');
		$.ajax({
			url : "admin/database.action?op=deleteTable",
			type : "POST",
			data : "address=" + row.address,
			dataType : "JSON",
			success : function(data) {
				if (data.code == 1) {
					alert("删除成功");
					$('#operateListTable').datagrid('reload');
				} else {
					alert(data.msg);
				}
			}
		});
		
	}

	//还原操作
	function rollback(index) {
		$('#operateListTable').datagrid('selectRow', index);//关键在这里
		var row = $('#operateListTable').datagrid('getSelected');
		$.ajax({
			url : "admin/database.action?op=rollback",
			type : "POST",
			data : "address=" + row.address,
			dataType : "JSON",
			success : function(data) {
				if (data.code == 1) {
					alert("还原成功");
					$('#operateListTable').datagrid('reload');
				} else {
					alert(data.msg);
				}
			}
		});
		
	}
</script>


<body class="easyui-layout">
	<div data-options="region:'center'" title="还原操作" style="height: 70%">
		<table id="operateListTable"></table>
	</div>
</body>
</html>