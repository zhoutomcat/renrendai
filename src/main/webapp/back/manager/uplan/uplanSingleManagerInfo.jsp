<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

<script type="text/javascript">
			var userEditRow = undefined;
			var userFlag;
		$(function(){     //函数是等页面一执行完就会调用的,如果不写函数，就要把js代码放在页面下面
			var userobject=$('#uplanSingleManagerInfoTable').edatagrid({
				url :'back/findSinglelUplanManagerInfo.action', //查询时加载的URL
				loadMsg:'数据加载中',
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
					field:"udi_ids",
					checkbox:true
					},{
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
					editor:{type:"text",options:{required:true}},
				},{
					field:'udi_weight',
					title:'借贷权重',
					width:20,
					align:'center',
					editor:{type:"text",options:{required:true}},
				},{
					field:'udi_money',
					title:'借贷金额',
					width:20,
					align:'center',
					editor:{type:"text",options:{required:true}},
				},{
					field:'udi_status',
					title:'借贷状态',
					width:20,
					align:'center',  
					editor:{type:"text",options:{required:true}},
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
				 	formatter:function(subscribe_time){
						// substr(0,17)修改成substr(0,20)  精确到秒
						var tt= new Date(parseInt(subscribe_time) * 1000).toLocaleString().substr(0,20)
						    return  tt;  
						}  
				},{
					field:'udi_refundway',
					title:'还贷方式',
					width:20,
					align:'center',
					editor:{type:"text",options:{required:true}},
		 			formatter: function(value,row,index){
						var refundway="";
						if(row.udi_refundway==1){
							refundway="月还贷";
						}
						if(row.udi_refundway==0){
							refundway="一次性还贷";
						}else{
							return refundway; 	
							}
						} 					
				},{
					field:'udi_type',
					title:'借贷类型',
					width:20,
					align:'center',
					editor:{type:"text",options:{required:true}},
				}
				
				]],
				
				  toolbar:[{
			  			text:"修改",
			  			iconCls: 'icon-edit',
			  			handler: function(){
			  				if(userEditRow!=undefined){
			  					userobject.datagrid('rejectChanges');//结束编辑
			  					userEditRow=undefined;
			  				}
			  				var row = userobject.datagrid("getChecked")[0];
			  				if(row==undefined){
			  					$.messager.show({title:'温馨提示',msg:'请选择或编辑您要修改的数据',timeout:2000,showType:'slide'});
			  				}else{
			  					userEditRow = userobject.datagrid('getRowIndex',row);
			  					userobject.datagrid("beginEdit",userEditRow);//结束编辑
			  					/* url = "back/updateuser.action"; */
			  					userFlag = "修改";
			  				}
			  			}
				  },'-',{
			  			text:"保存",
			  			iconCls: 'icon-save',
			  			handler: function(){
			  				if(userEditRow!=undefined){
			  					userobject.datagrid("endEdit",userEditRow);//结束编辑
			  					userEditRow=undefined;
			  				}
			  				var row = userobject.datagrid("getChanges")[0];
			  				if(row==undefined){//没有修改数据 提示
			  					$.messager.show({title:'温馨提示',msg:'请编辑您要'+userFlag+'的数据',timeout:2000,showType:'slide'});
			  					
			  				}else{
			  					$.post("back/updateSingleNewUplanManagerInfo.action",row,function(data){
			  					/* row["op"] = deptOp;
			  					$.post("../deptServlet",row,function(data){ */
			  						data = parseInt( $.trim( data ) );
			  						if(data>0){
			  							$.messager.alert('失败提示','用户信息'+userFlag+'失败','error');
			  						}else{
			  							$.messager.show({title:'温馨提示',msg:'用户信息'+userFlag+'成功',timeout:2000,showType:'slide'});
			  							userobject.datagrid("reload");
			  						}
			  					},"text");
			  				}
			  			}
			  		},'-',{
			  			text:"撤销",
			  			iconCls: 'icon-undo',
			  			handler: function(){
			  				alert('help')
			  			}
					  }]
				});
			});
				
		
		
		
		
		
		
</script>


<table id="uplanSingleManagerInfoTable"></table>


    