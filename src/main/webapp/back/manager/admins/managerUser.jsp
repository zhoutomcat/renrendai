<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

<script type="text/javascript">
		$(function(){     //函数是等页面一执行完就会调用的,如果不写函数，就要把js代码放在页面下面
			$('#manUserTable').edatagrid({
				url : 'back/findAllUser.action', //查询时加载的URL
				pagination:true,  //显示分页
				pageSize: 50,  //默认分页的条数
				pageList:  [10,20,30,50],  //可选分页数
				fitColumns: true,  //自适应列
				fit : true,  //自动补全
				idField : "aid",   //标识，会记录我们选中的一行的id,不一定是id,通常都是主键
				title: "用户管理",
				rownumbers: "true",  //显示行号
				nowrap: "true",//不换行显示
				sortName: "u_id",  //排序的列  这个参数会传到后台的servlet上,所以要有后台对应的接收
				sortOrder: "desc",  //排序方式
				singleSelect: true,
				
				//以上的四种增删改查操作,只要失败,都会回掉这个onError
				onError: function(a,b){
					$.message.alert("错误","操作失败");
				},
				columns:[[{
					field:'u_id',
					title:'用户编号',
					width:30,
					align:'center',
					hidden:'true'
				},{
					field:'u_name',
					title:'用户名',
					width:30,
					align:'center',
				},{
					field:'u_password',
					title:'用户密码',
					width:30,
					align:'center',
				},{
					field:'u_creditnumber',
					title:'用户信誉积分',
					width:30,
					align:'center',
				},{
					field:'u_email',
					title:'用户邮箱',
					width:30,
					align:'center',
				},{
					field:'u_tel',
					title:'用户电话',
					width:30,
					align:'center',
				},{
					field:'u_creditdegree',
					title:'用户信誉等级',
					width:30,
					align:'center',
				},{
					field:'u_registerdate',
					title:'用户注册时间',
					width:30,
					align:'center',
				
					
					formatter:function(subscribe_time){
						 var tt= new Date(parseInt(subscribe_time) * 1000).toLocaleString().substr(0,17)
						    return  tt;  
						} 
				}
	
				]],
			
			});
		});
		
		
</script>


<table id="manUserTable"></table>
