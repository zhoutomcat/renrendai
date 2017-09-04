<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

<script type="text/javascript">
		$(function(){     //函数是等页面一执行完就会调用的,如果不写函数，就要把js代码放在页面下面
			$('#MessageUserInfoTable').edatagrid({
				url : 'back/findAllAdminToUserMessage.action', //查询时加载的URL
				pagination:true,  //显示分页
				pageSize: 10,  //默认分页的条数
				pageList:  [5,10,20,30,50],  //可选分页数
				fitColumns: true,  //自适应列
				fit : true,  //自动补全
				idField : "atum_id",   //标识，会记录我们选中的一行的id,不一定是id,通常都是主键
				title: "新闻管理",
				rownumbers: "true",  //显示行号
				nowrap: "true",//不换行显示
				sortName: "atum_id",  //排序的列  这个参数会传到后台的servlet上,所以要有后台对应的接收
				sortOrder: "desc",  //排序方式
				singleSelect: true,
				
				//以上的四种增删改查操作,只要失败,都会回掉这个onError
				onError: function(a,b){
					$.message.alert("错误","操作失败");
				},
				columns:[[{
					field:'atum_id',
					title:'消息推送编号',
					width:30,
					align:'center',
					hidden:'true'
				},{
					field:'atum_title',
					title:'消息标题',
					width:30,
					align:'center',
				},{
					field:'atum_time',
					title:'消息发送时间',
					width:30,
					align:'center',
					formatter:function(subscribe_time){
						 var tt= new Date(parseInt(subscribe_time) * 1000).toLocaleString().substr(0,20)
						    return  tt;  
						} 
				},{
					field:'atum_content',
					title:'消息内容',
					width:30,
					align:'center',
				},{
					field:'atum_status',
					title:'消息状态',
					width:30,
					align:'center',
				},{
					field:'u_id',
					title:'用户编号',
					width:30,
					align:'center',
				},{
					field:'u_name',
					title:'用户名字',
					width:30,
					align:'center',
					formatter: function(value,row,index){
						return row.user.u_name;
					}
				
				} ]],
			
			});
		});
		
		
</script>


<table id="MessageUserInfoTable"></table>


