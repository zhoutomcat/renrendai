<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#dd').dialog({
			title : '备份',
			width : 600,
			height : 400,
			closed : false,
			cache : false,
			//href: 'get_content.php',
			modal : true
		});

		//获取下拉框中的值
		$.ajax({
			   url: "admin/database.action?op=dataBaseList",
			   type: "POST",
			   dataType: "JSON",
			   success: function (data) {
			         var ddl = $("#tt");//列表框id
			          //方法1：添加默认节点
			         //ddl.append("<option value='-1'>--请选择--</option>");
			         //循环遍历 下拉框绑定
			         $(data.rows).each(function (key) {
				         //第一种方法
				         var opt = $("<option></option>").text(data.rows[key].Tables_in_res).val(data.rows[key].Tables_in_res);
				         ddl.append(opt);
			         });
			   }
		});
	});

	function path() {
		var value = $('#adname').val();
		$.ajax({
			url : "admin/database.action?op=checked",
			type : "POST",
			data : "path=" + value,
			dataType : "json",
			success : function(d) {
				if (d.code == 0) {
					alert(d.code);
					$('#btn').linkbutton('disable');
				} else {
					$('#btn').linkbutton('enable');
				}
			}
		});
	}

	function Save() {
		var addressname = $('#adname').val();
		var val = $('input:radio[name="rd"]:checked').val();
		var table = $('#tt').val();
		//alert(table);
		$.ajax({
			url : "admin/database.action?op=savedb",
			type : "POST",
			data : "addressname=" + addressname + "&types=" + val + "&table="
					+ table,
			dataType : "json",
			success : function(d) {
				if (d.code == 1) {
					alert("备份成功");
					$('#adname').val(" ");
				} else {
					alert(d.msg);
				}
			}
		});
	}
</script>





<body class="easyui-layout">
	<div id="dd">




		<div data-options="region:'center' fit:true " style="margin: 80px 80px 10px">
			备份后的文件名:
			<textarea id="adname" style="width: 200px; height: 20px;" onblur="path()"></textarea>
		</div>
		<div style="margin: 30px 80px">
			<label>
				请选择要备份的表:<select id="tt" name="tt" class="table"></select>
			</label>
			<form action="POST" method="get">
				<label style="margin-left: 80px">
					<input name="rd" type="radio" checked="checked" value="结构" />
					结构
				</label>
				<label style="margin-left: 100px">
					<input name="rd" type="radio" value="数据和结构" />
					数据+结构
				</label>
			</form>
			<div style="margin: 20px 0px 80px 320px">
				<a id="btn" href="javascript:void(0)" onclick="Save()" class="easyui-linkbutton" style="width: 80px; magin-right: 10px">备份</a>
			</div>
		</div>
	</div>
</body>
</html>