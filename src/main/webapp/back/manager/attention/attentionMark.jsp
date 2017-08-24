<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<%@ include file="../head.jsp" %>

<script type="text/javascript">
		var AttentionEditRow = undefined;
		var AttentionFlag;
		$(function(){     //函数是等页面一执行完就会调用的,如果不写函数，就要把js代码放在页面下面
			var Attentionobject=$('#manAttentionTable').edatagrid({
				url : 'back/findAllAttentionMark.action', //查询时加载的URL
				pagination:true,  //显示分页
				pagesize: 5,  //默认分页的条数
				pageList:  [3,5,10,20,30,50],  //可选分页数
				fitColumns: true,  //自适应列
				fit : true,  //自动补全
				idField : "uid",   //标识，会记录我们选中的一行的id,不一定是id,通常都是主键
				title: "关注投标管理",
				rownumbers: "true",  //显示行号
				nowrap: "true",//不换行显示
				sortName: "am_id",  //排序的列  这个参数会传到后台的servlet上,所以要有后台对应的接收
				sortOrder: "desc",  //排序方式
				singleSelect: false,
				
				//以上的四种增删改查操作,只要失败,都会回掉这个onError
				onError: function(a,b){
					$.message.alert("错误","操作失败");
				},
				columns:[[{
					field:"am_ids",
					checkbox:true
					},{
					field:'am_id',
					title:'投标编号',
					width:30,
					align:'center',
					hidden:'true',
					editor:{type:"text",options:{required:true}},
					formatter: function(value,row,index){
						return row.attentionMark.am_id;
					}			
				},{
					field:'u_name',
					title:'用户名字',
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true}},
				},{
					field:'u_creditnumber',
					title:'用户积分',
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true}},
				},{
					field:'u_creditdegree',
					title:'用户等级',
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true}},
				},{
					field:'u_tel',
					title:'用户电话',
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true}},
				},{
					field:'am_status',
					title:'关注状态',
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true}},
					formatter: function(value,row,index){
						//alert(row.attentionMark.am_status)
						return row.attentionMark.am_status;
					}
				} ,{
					field:'udit_profit',
					title:'借贷利润',
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true}},
					formatter: function(value,row,index){
						//alert(row.attentionMark.userDebitIn.userDebitInType.udit_profit)
						return row.attentionMark.userDebitIn.userDebitInType.udit_profit;
					}
				},{
					field:'udit_name',
					title:'借贷计划名字',
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true}},
					formatter: function(value,row,index){
						//alert(row.attentionMark.userDebitIn.userDebitInType.udit_name)
						return row.attentionMark.userDebitIn.userDebitInType.udit_name;
					}
				},{
					field:'udit_month',
					title:'借贷期限',
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true}},
					formatter: function(value,row,index){
						//alert(row.attentionMark.userDebitIn.userDebitInType.udit_month)
						return row.attentionMark.userDebitIn.userDebitInType.udit_month;
					}
				},{
					field:'udi_money',
					title:'借贷金额',
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true}},
					formatter: function(value,row,index){
						//alert(row.attentionMark.userDebitIn.udi_money)
						return row.attentionMark.userDebitIn.udi_money;
					}
				},{
					field:'udi_title',
					title:'借贷标题',
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true}},
					formatter: function(value,row,index){
						//alert(row.attentionMark.userDebitIn.udi_title)
						return row.attentionMark.userDebitIn.udi_title;
					}
				},{
					field:'udi_refundway',
					title:'还贷方式',
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true}},
					formatter: function(value,row,index){
						//alert(row.attentionMark.userDebitIn.udi_refundway)
						return row.attentionMark.userDebitIn.udi_refundway;
					}
				},{
					field:'udi_status',
					title:'借贷状态',      //正在凑款   正在还款
					width:30,
					align:'center',
				//	editor:{type:"text",options:{required:true}},
					formatter: function(value,row,index){
						//alert(row.attentionMark.userDebitIn.udi_status)
						return row.attentionMark.userDebitIn.udi_status;
					},
					editor:{type:"text",options:{required:true}},
				},{
					field:'udi_weight',
					title:'借贷权重',    //权重越大    位置越靠前
					width:30,
					align:'center',
					formatter: function(value,row,index){
						//alert(row.attentionMark.userDebitIn.udi_weight)
						return row.attentionMark.userDebitIn.udi_weight;
					},
					editor:{type:"text",options:{required:true}},
				
				}
				]],
				
		/* 		  toolbar:[{
		    			text:"修改",
		    			iconCls: 'icon-edit',
		    			handler: function(){
		    				if(AttentionEditRow!=undefined){

		    					Attentionobject.datagrid('rejectChanges');//结束编辑
		    					AttentionEditRow=undefined;
		    				}
		    				var row = Attentionobject.datagrid("getChecked")[0];
		    				if(row==undefined){
		    					$.messager.show({title:'温馨提示',msg:'请选择或编辑您要修改的数据',timeout:2000,showType:'slide'});
		    					
		        				
		    				}else{
		    					AttentionEditRow = Attentionobject.datagrid('getRowIndex',row);
		    					Attentionobject.datagrid("beginEdit",AttentionEditRow);//结束编辑
		    					 url = "back/updateuser.action"; 
		    					AttentionFlag = "修改";
		    				}
		    				
		    			}
				  },'-',{
		    			text:"删除",
		    			iconCls: 'icon-remove',
		    			handler: function(){
		    				var rows = Attentionobject.datagrid("getChecked");
		    				
		    				if(rows.length<0){
		    					$.messager.show({title:'温馨提示',msg:'请编辑您要删除的数据',timeout:2000,showType:'slide'});
		    					
		    				}else{
		    					
		    					$.messager.confirm('确认提示', '一旦删除数据将不能恢复，您确定要删除嘛？', function(r){
		    						if (r){
		    							//获取id
		    							var am_ids ="";
		    							console.info(rows);
		    							console.info(rows.length);
		    							for(var i=0,len=rows.length;i<len;i++){
		    								am_ids += rows[i].attentionMark.am_id+",";  
		    								//alert( rows[i].attentionMark.am_id);
		    							}
		    							am_ids+=rows[i].attentionMark.am_id;
		    							
		    							//将数据发送到后台
		    						 	$.post("back/delAttention.action",{am_id:am_ids},function(data){
		    								data = parseInt( $.trim( data ) );
		    								if(data>0){
		    									$.messager.alert('失败提示','用户信息删除失败','error');
		    								}else{
		    									$.messager.show({title:'温馨提示',msg:'用户信息删除成功',timeout:2000,showType:'slide'});
		    									Attentionobject.datagrid("reload");
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
		    				if(AttentionEditRow!=undefined){
		    					Attentionobject.datagrid("endEdit",AttentionEditRow);//结束编辑
		    					AttentionEditRow=undefined;
		    				}
		    				var row = Attentionobject.datagrid("getChanges")[0];
		    				if(row==undefined){//没有修改数据 提示
		    					$.messager.show({title:'温馨提示',msg:'请编辑您要'+AttentionFlag+'的数据',timeout:2000,showType:'slide'});
		    					
		    				}else{
		    					$.post("back/updateAttention.action",row,function(data){
		    			
		    						
		    						data = parseInt( $.trim( data ) );
		    						
		    						if(data>0){
		    							
		    							$.messager.alert('失败提示','用户信息'+AttentionFlag+'失败','error');
		    						}else{
		    							$.messager.show({title:'温馨提示',msg:'用户信息'+AttentionFlag+'成功',timeout:2000,showType:'slide'});
		    							Attentionobject.datagrid("reload");
		    	    					
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
				  }] */
			});
		});
</script>		

<table id="manAttentionTable"></table>


