<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

<script type="text/javascript">
		$(function(){     //函数是等页面一执行完就会调用的,如果不写函数，就要把js代码放在页面下面
			$('#userMessageTable').edatagrid({
				url : 'back/findAllUserMessage.action', //查询时加载的URL
				pagination:true,  //显示分页
				pageSize: 10,  //默认分页的条数
				pageList:  [5,10,20,20,50],  //可选分页数
				fitColumns: true,  //自适应列
				fit : true,  //自动补全
				idField : "u_id",   //标识，会记录我们选中的一行的id,不一定是id,通常都是主键
				title: "用户个人借贷信息管理",
				rownumbers: "true",  //显示行号
				nowrap: "true",//不换行显示
				sortName: "um_id",  //排序的列  这个参数会传到后台的servlet上,所以要有后台对应的接收
				sortOrder: "desc",  //排序方式
				singleSelect: true,
				
				//以上的四种增删改查操作,只要失败,都会回掉这个onError
				onError: function(a,b){
					$.message.alert("错误","操作失败");
				},
				columns:[[{
					field:'um_id',
					title:'用户详细表编号',
					width:20,
					align:'center',
					hidden:'true',
				},{
					field:'um_age',
					title:'借贷人年龄',
					width:20,
					align:'center',
				},{
					field:'um_description',
					title:'借贷人详细信息',
					width:50,
					align:'center',
				},{
					field:'um_idCard',
					title:'身份证信息',
					width:30,
					align:'center',
				},{
					field:'um_incomeinfo',
					title:'收入信息',
					width:20,
					align:'center',
				},{
					field:'um_nowPlace',
					title:'借贷居住地地址',
					width:30,
					align:'center',
				},{
					field:'um_reallyName',
					title:'借贷人真实姓名',
					width:30,
					align:'center',
				},{
					field:'um_sex',
					title:'借贷人性别',
					width:20,
					align:'center', 
				},{
					field:'um_workinfo',
					title:'借贷人工作信息',
					width:20,
					align:'center',
				},{
					field:'bi_idCard',
					title:'银行卡卡号',
					width:20,
					align:'center',
				/* 	formatter: function(value,row,index){
						//alert(row.attentionMark.am_id)
						var refundway="";
						if(row.userDebitIn.udi_refundway==1){
							refundway="月还贷";
						}
						if(row.userDebitIn.udi_refundway==0){
							refundway="一次性还贷";
						}else{
							return refundway; 	
							}
						} */			
				}
				]],
			
			});
		});
		
		
		
		
		
		
</script>


<table id="userMessageTable"></table>
    