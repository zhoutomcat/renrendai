<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

<script type="text/javascript">
		$(function(){     //函数是等页面一执行完就会调用的,如果不写函数，就要把js代码放在页面下面
			$('#userDebitTable').edatagrid({
				url : 'back/findAllUserDebitIn.action', //查询时加载的URL
				pagination:true,  //显示分页
				pageSize: 3,  //默认分页的条数
				pageList:  [3,5,10,20,30,50],  //可选分页数
				fitColumns: true,  //自适应列
				fit : true,  //自动补全
				idField : "u_id",   //标识，会记录我们选中的一行的id,不一定是id,通常都是主键
				title: "借贷信息管理",
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
					width:30,
					align:'center',
					hidden:'true',
					formatter: function(value,row,index){
						//alert(row.attentionMark.am_id)
						return row.userDebitIn.udi_id;
					}		
				},{
					field:'u_name',
					title:'借贷人姓名',
					width:30,
					align:'center',
				},{
					field:'u_creditdegree',
					title:'借贷人信誉等级',
					width:30,
					align:'center',
				},{
					field:'u_tel',
					title:'借贷人电话',
					width:30,
					align:'center',
				},{
					field:'udi_money',
					title:'借贷金额',
					width:30,
					align:'center',
					formatter: function(value,row,index){
						//alert(row.attentionMark.am_id)
						return row.userDebitIn.udi_money;
					}	
				},{
					field:'udi_publishdate',
					title:'借贷开始时间',
					width:30,
					align:'center',
					formatter: function(value,row,index){
						//alert(row.attentionMark.am_id)
						return row.userDebitIn.udi_publishdate;
					},
				/* 	formatter:function(subscribe_time){
					 var tt= new Date(parseInt(subscribe_time) * 1000).toLocaleString().substr(0,17)
					    return  tt;  
					} 	 */
				},{
					field:'udi_date',
					title:'借贷成功时间',
					width:30,
					align:'center',
					formatter: function(value,row,index){
						return row.userDebitIn.udi_date;
					},
				/* 	formatter:function(subscribe_time){
						 var tt= new Date(parseInt(subscribe_time) * 1000).toLocaleString().substr(0,17)
						    return  tt;  
						}	 */
				},{
					field:'udi_refundrealitydate',
					title:'实际还贷时间',
					width:30,
					align:'center',
					formatter: function(value,row,index){
						return row.userDebitIn.udi_refundrealitydate;
					},
					 formatter:function(subscribe_time){
						 var tt= new Date(parseInt(subscribe_time) * 1000).toLocaleString().substr(0,17)
						    return  tt;  
						}	 
				},{
					field:'udi_title',
					title:'借贷标题',
					width:30,
					align:'center',
					formatter: function(value,row,index){
						//alert(row.attentionMark.am_id)
						return row.userDebitIn.udi_title;
					}
				},{
					field:'udi_refundway',
					title:'还贷方式',
					width:30,
					align:'center',
					formatter: function(value,row,index){
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
						}
						
				},{
					field:'udi_status',
					title:'借贷状态',
					width:30,
					align:'center',
					formatter: function(value,row,index){
						//alert(row.attentionMark.am_id)
						return row.userDebitIn.udi_status;
					}
				},{
					field:'udi_weight',
					title:'借贷权重',
					width:30,
					align:'center',
					formatter: function(value,row,index){
						//alert(row.attentionMark.am_id)
						return row.userDebitIn.udi_weight;
					}
				},{
					field:'udit_month',
					title:'还贷期限',
					width:30,
					align:'center',
					formatter: function(value,row,index){
						//alert(row.attentionMark.am_id)
						return row.userDebitIn.userDebitInType.udit_month;
					}
				},{
					field:'udit_name',
					title:'借贷归属名字',
					width:30,
					align:'center',
					formatter: function(value,row,index){
						//alert(row.attentionMark.am_id)
						return row.userDebitIn.userDebitInType.udit_name;
					}
				},{
					field:'udit_profit',
					title:'借贷利率',
					width:30,
					align:'center',
					formatter: function(value,row,index){
						//alert(row.attentionMark.am_id)
						return row.userDebitIn.userDebitInType.udit_profit;
					}
				}
				

				]],
			
			});
		});
		
		
</script>


<table id="userDebitTable"></table>


