<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

<script type="text/javascript">
		$(function(){     //函数是等页面一执行完就会调用的,如果不写函数，就要把js代码放在页面下面
			$('#manAttentionTable').edatagrid({
				url : 'back/attentionMark.action', //查询时加载的URL
				pagination:true,  //显示分页
				pageSize: 50,  //默认分页的条数
				pageList:  [10,20,30,50],  //可选分页数
				fitColumns: true,  //自适应列
				fit : true,  //自动补全
				idField : "nid",   //标识，会记录我们选中的一行的id,不一定是id,通常都是主键
				title: "新闻管理",
				rownumbers: "true",  //显示行号
				nowrap: "true",//不换行显示
				sortName: "nid",  //排序的列  这个参数会传到后台的servlet上,所以要有后台对应的接收
				sortOrder: "desc",  //排序方式
				singleSelect: true,
				
				//以上的四种增删改查操作,只要失败,都会回掉这个onError
				onError: function(a,b){
					$.message.alert("错误","操作失败");
				},
				columns:[[{
					field:'nid',
					title:'新闻编号',
					width:30,
					align:'center',
					hidden:'true'
				},{
					field:'title',
					title:'新闻标题',
					width:120,
					align:'center',
				},{
					field:'auth',
					title:'作者',
					width:80,
					align:'center',
				},{
					field:'tid',
					title:'新闻类型',
					width:80,
					align:'center',
				},{
					field:'views',
					title:'浏览次数',
					width:80,
					align:'center',
				},{
					field:'weight',
					title:'新闻权重',
					width:80,
					align:'center',
				} ,{
					field:'_operate',
					title:'操作',
					width:80,
					align:'center',
					formatter:formatOper,
				} 
				]],
			});
		});
		
 	    function formatOper(row,index){  
	        return "<a href='javascript:void(0)' onclick='editUser('+index+')'>修改</a>";  
	    }   
	    
  	    function editUser(index){  
  	    	alert(index);
	      //  $('#dataTree').datagrid('selectRow',index);// 关键在这里 
	       // var row = $('#dataTree').datagrid('getSelected');
	     //       $('#dataTree').dialog('open').dialog('setTitle','修改学生信息');  
	           // url = '${ctx}updateStudent.do?id='+row.id;  
	        }    
		 
/* 	    $('#dd').dialog({
	        title: 'My Dialog',
	        width: 400,
	        height: 200,
	        closed: false,
	        cache: false,
	        href: 'get_content.php',
	        modal: true
	    });
	    $('#dd').dialog('refresh', 'new_content.php'); */
		
		
</script>

  
<!-- <div id="dd">Dialog Content.</div>
  <div id="dd" class="easyui-dialog" title="My Dialog" style="width:400px;height:200px;"
            data-options="iconCls:'icon-save',resizable:true,modal:true">
        Dialog Content.
    </div> -->
<table id="manAttentionTable"></table>

