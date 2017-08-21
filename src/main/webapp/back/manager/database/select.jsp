<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#btn').linkbutton({
			iconCls : 'icon-search'
		});

	});
	function selectDetail() {
		//var str = decodeURI($('#selectWord').textbox('getText'));
		var sql = getFieldSelection(document.getElementById('selectWord'));//获取查询的语句
		sql = sql.replace(/%/g, "@");
		//alert(sql);
		$.ajax({
			url : "admin/database.action",
			type : "POST",
			data : "op=dataBaseSelect&sql=" + sql,
			dataType : "JSON",
			success : function(data) {
				if (data.code == 1) {
					arrayList = new Array();
					//标题名
					for ( var prop in data.rows[0]) {
						var list = {};
						list['field'] = prop;
						list['title'] = prop;
						list['width'] = 100;
						list['align'] = 'center';
						arrayList.push(list);
					}
					$('#DetailListTable').datagrid({
						fitColumns : true,
						fit : true,//自适应，将分页框分布在最低端
						idField : "roid",//主键列
						rownumbers : true,
						nowrap : true,//不折叠
						singleSelect : true,//一次只选取一行
						columns : [ arrayList ]
					});
					/*for (var i = 0; i < data.rows.length; i++) {
						$('#DetailListTable').datagrid('appendRow',data.rows[i]);
					}
					$('#DetailListTable').datagrid('reload');*/
					$('#DetailListTable').datagrid('loadData',data);
					
				}else{
					alert(data.msg);
				}
			}
		});
	}
	//选择查询
	function getFieldSelection(select_field)
	{
	    word='';
	    if (document.selection) {
	        var sel = document.selection.createRange();
	        if (sel.text.length > 0) {
	            word = sel.text;
	        }
	    }
	    else if (select_field.selectionStart || select_field.selectionStart == '0') {
	        var startP = select_field.selectionStart;
	        var endP = select_field.selectionEnd;
	        if (startP != endP) {
	            word = select_field.value.substring(startP, endP);
	        }
	        else{
	        	word = select_field.value;
	        }
	    }
	    return word;
	}
</script>


<body class="easyui-layout">
	<div data-options="region:'center'" style="height: 40%">
		<a id="btn" href="javascript:void(0)" onclick="selectDetail()">查询</a>
		<br />
		<textarea id="selectWord" rows='100px' cols='200px'></textarea>
	</div>
	<div data-options="region:'south'" style="height: 60%;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',title:'查询结果'" style="overflow: hidden;">
				<table id="DetailListTable"></table>
			</div>
		</div>
	</div>

</body>
</html>