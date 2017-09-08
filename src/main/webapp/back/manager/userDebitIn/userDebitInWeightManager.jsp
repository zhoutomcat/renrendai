<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

<script type="text/javascript">
		var userEditRow = undefined;
		var userFlag;
		$(function(){     //函数是等页面一执行完就会调用的,如果不写函数，就要把js代码放在页面下面
			var userobject=$('#userDebitInWeightManager').edatagrid({
				url : 'back/findAllSingerUserDebitIn.action', //查询时加载的URL
				loadMsg:'数据加载中',
				pagination:true,  //显示分页
				pagesize: 10,  //默认分页的条数
				pageList:  [5,10,15,20,30,50],  //可选分页数
				fitColumns: true,  //自适应列
				fit : true,  //自动补全
				//idField : "aid",   //标识，会记录我们选中的一行的id,不一定是id,通常都是主键
				title: "用户借贷管理",
				rownumbers: "true",  //显示行号
				nowrap: "true",//不换行显示
				sortName: "udi_id",  //排序的列  这个参数会传到后台的servlet上,所以要有后台对应的接收
				sortOrder: "desc",  //排序方式
				singleSelect: true,      //只允许选择一行
				//以上的四种增删改查操作,只要失败,都会回掉这个onError
				onError: function(a,b){
					$.message.alert("错误","操作失败");
				},
				columns:[[{
					field:"udi_ids",
					checkbox:true
					},{
					field:'udi_id',
					title:'用户借贷编号',
					width:30,
					align:'center',
					hidden:'true',
				},{
					field:'udi_title',
					title:'借贷标题',
					width:30,
					editor:{type:"text",options:{required:true}},
					align:'center',
				},{
					field:'udi_money',
					title:'借贷金额',
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true}},
				},{
					field:'udi_status',
					title:'借贷状态',
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true}},
					formatter: function(value,row,index){
					 	var status="";
						if(row.udi_status==0){
							status="未审核状态";
						}
						if(row.udi_status==1){
							status="凑款状态";
						}if(row.udi_status==2){
							status="筹款完成待放款状态";
						}if(row.udi_status==3){
							status="还款状态";
						}if(row.udi_status==4){
							status="完成还款";
						}else{
							return status;
						} 
						//return row.userDebitIn.udi_status;
					}
				},{
					field:'udi_publishdate',
					title:'借贷发起时间',
					width:40,
					align:'center',
					formatter:function(subscribe_time){
						// substr(0,17)修改成substr(0,20)  精确到秒
						var tt= new Date(parseInt(subscribe_time) * 1000).toLocaleString().substr(0,20)
						    return  tt;  
						} 	
				},{
					field:'udi_date',
					title:'借贷成功时间',
					width:40,
					align:'center',
					formatter:function(subscribe_time){
						// substr(0,17)修改成substr(0,20)  精确到秒
						var tt= new Date(parseInt(subscribe_time) * 1000).toLocaleString().substr(0,20)
						    return  tt;  
						} 	
				},{
					field:'udi_refundrealitydate',
					title:'还贷时间',
					width:40,
					align:'center',
					formatter:function(subscribe_time){
						// substr(0,17)修改成substr(0,20)  精确到秒
						var tt= new Date(parseInt(subscribe_time) * 1000).toLocaleString().substr(0,20)
						    return  tt;  
						} 		
				},{
					field:'udi_use',
					title:'借贷用途',
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true}},
					/* sortable:true,editor:{type:"text",options:{required:true}}, */
				},{
					field:'udi_refundway',
					title:'还款方式',
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true}},
					formatter: function(value,row,index){
						//alert(row.attentionMark.am_id)
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
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true}},
				},{
					field:'udi_weight',
					title:'借贷权重',
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true}},
				},{
					field:'udi_checkstatus',
					title:'借贷审核状态',
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true},
						/* formatter: function(value,row,index){
							//alert(row.attentionMark.am_id)
							alert(row.udi_checkstatus);
							var checkstatus="";
							if(row.udi_checkstatus==0){
								checkstatus="未审核状态";
							}
							if(row.udi_checkstatus==1){
								checkstatus="审核通过状态";
							}else{
								return checkstatus; 	
								}
							} */
					}
				}]],
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
		    			text:"删除",
		    			iconCls: 'icon-remove',
		    			handler: function(){
		    				var rows = userobject.datagrid("getChecked");
		    				if(rows.length<0){
		    					$.messager.show({title:'温馨提示',msg:'请编辑您要删除的数据',timeout:2000,showType:'slide'});
		    				}else{
		    					$.messager.confirm('确认提示', '一旦删除数据将不能恢复，您确定要删除嘛？', function(r){
		    						if (r){
		    							//获取id
		    							var u_ids ="";
		    							console.info(rows);
		    							console.info(rows.length);
		    							for(var i=0,len=rows.length;i<len-1;i++){
		    								u_ids += rows[i].u_id+",";    								
		    							}
		    							u_ids+=rows[i].u_id;
		    							//将数据发送到后台
		    							$.post("back/deluser.action",{u_id:u_ids},function(data){
		    							
		    							/* $.post("../deptServlet",{op:"delDept",deptno:deptnos},function(data){ */
		    								data = parseInt( $.trim( data ) );
		    								if(data>0){
		    									$.messager.alert('失败提示','用户信息删除失败','error');
		    								}else{
		    									$.messager.show({title:'温馨提示',msg:'用户信息删除成功',timeout:2000,showType:'slide'});
		    									userobject.datagrid("reload");
		    								}
		    							},"text");
		    						}else{
		    							return ;
		    						}
		    					});
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
		    					$.post("back/updateSingerUserDebitIn.action",row,function(data){
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
		    					
		    					
/* 		//禁止用户登录操作
		function allowlogin(index) {
			$('#manUserTable').datagrid('selectRow', index);//关键在这里
			var row = $('#manUserTable').datagrid('getSelected');
			$.ajax({
				 url : "back/allowlogin.action", 
				type : "POST",
				data : "u_id=" + row.u_id,
				dataType : "JSON",
				success : function(data) {
					$.messager.confirm('确认提示', '一旦删除数据将不能恢复，您确定要删除嘛？', function(r){
					if(r){
					if (data.code == 1) {
						alert("允许用户登录成功");
						$('#manUserTable').datagrid('reload');
					} else {
						alert(data.msg);
					}
					}
					});
				
				}
					
			});
		} */
		
		
</script>


<table id="userDebitInWeightManager"></table>
