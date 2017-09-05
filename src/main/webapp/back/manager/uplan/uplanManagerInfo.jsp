<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

<script type="text/javascript">
		$(function(){     //函数是等页面一执行完就会调用的,如果不写函数，就要把js代码放在页面下面
			$('#uplanManagerInfoTable').edatagrid({
				url :'back/findAllUplanManagerInfo.action', //查询时加载的URL
				pagination:true,  //显示分页
				pageSize: 10,  //默认分页的条数
				pageList:  [5,10,20,20,50],  //可选分页数
				fitColumns: true,  //自适应列
				fit : true,  //自动补全
				idField : "udi_id",   //标识，会记录我们选中的一行的id,不一定是id,通常都是主键
				title: "U计划信息管理",
				rownumbers: "true",  //显示行号
				nowrap: "true",//不换行显示
				sortName: "udi_id",  //排序的列  这个参数会传到后台的servlet上,所以要有后台对应的接收
				sortOrder: "desc",  //排序方式
				singleSelect: true,
				
				//以上的四种增删改查操作,只要失败,都会回掉这个onError
				onError: function(a,b){
					$.message.alert("错误","操作失败");
				},
				columns:[[{
					field:'udi_id',
					title:'借贷表编号',
					width:20,
					align:'center',
					hidden:'true',
				},{
					field:'udi_title',
					title:'借贷标题',
					width:20,
					align:'center',
				},{
					field:'udi_weight',
					title:'借贷权重',
					width:20,
					align:'center',
				},{
					field:'udi_money',
					title:'借贷金额',
					width:20,
					align:'center',
				},{
					field:'udi_status',
					title:'借贷状态',
					width:20,
					align:'center',  
				},{
					field:'udi_publishdate',
					title:'借贷发起时间',
					width:50,
					align:'center',
					formatter:function(subscribe_time){
						// substr(0,17)修改成substr(0,20)  精确到秒
						var tt= new Date(parseInt(subscribe_time) * 1000).toLocaleString().substr(0,20)
						    return  tt;  
						} 
				},{
					field:'udi_date',
					title:'借贷成功时间',
					width:50,
					align:'center',
					formatter:function(subscribe_time){
						// substr(0,17)修改成substr(0,20)  精确到秒
						var tt= new Date(parseInt(subscribe_time) * 1000).toLocaleString().substr(0,20)
						    return  tt;  
						} 
				},{
					field:'udi_refundrealitydate',
					title:'实际还贷时间',
					width:50,
					align:'center',
				/* 	formatter:function(subscribe_time){
						// substr(0,17)修改成substr(0,20)  精确到秒
						var tt= new Date(parseInt(subscribe_time) * 1000).toLocaleString().substr(0,20)
						    return  tt;  
						}  */
				},{
					field:'udi_refundway',
					title:'还贷方式',
					width:20,
					align:'center',
		/* 			formatter: function(value,row,index){
						var refundway="";
						if(udi_refundway==1){
							refundway="月还贷";
						}
						if(udi_refundway==0){
							refundway="一次性还贷";
						}else{
							return refundway; 	
							}
						} */					
				},{
					field:'udi_type',
					title:'借贷类型',
					width:20,
					align:'center',
				},{
					field:'udit_profit',
					title:'借贷利润',
					width:20,
					align:'center',
					formatter: function(value,row,index){
					return row.userDebitInType.udit_profit;
					}
				},{
					field:'udit_month',
					title:'借贷时间',
					width:20,
					align:'center',
					formatter: function(value,row,index){
						return row.userDebitInType.udit_month;
						}
				},{
					field : '_operate',
					title : '操作',
					width : 50,
					align : 'center',
					formatter : function formatOper(val,row, index) {
						var str = '<a href="javascript:void(0)" onclick="checkapprove('+ index + ')">审核通过</a>'
						// str += ' <a href="javascript:void(0)" onclick="checkunapprove('+ index + ')">审核不通过</a> '; 
						return str;
					},
				}
				]],
			});
		});
		
		
/* 		//审核通过操作
		function checkapprove(index) {
			$('#userDebitTable').datagrid('selectRow', index);//关键在这里
			var row = $('#userDebitTable').datagrid('getSelected');
			$.ajax({
				 url : "back/checkapprove.action", 
				type : "POST",
				data : "udi_id=" + row.userDebitIn.udi_id,
				dataType : "JSON",
				success : function(data) {
					$.messager.confirm('确认提示', '一旦删除数据将不能恢复，您确定要删除嘛？', function(r){
					if(r){
					if (data.code == 1) {
						alert("审核借贷信息通过成功");
						$('#userDebitTable').datagrid('reload');
					} else {
						alert(data.msg);
					}
					}
					});
				}					
			});
		}
		 */
	
		
		
		
</script>


<table id="uplanManagerInfoTable"></table>


    