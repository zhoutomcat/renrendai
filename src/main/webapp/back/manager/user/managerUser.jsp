<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

<script type="text/javascript">
		var userEditRow = undefined;
		var userFlag;
		$(function(){     //函数是等页面一执行完就会调用的,如果不写函数，就要把js代码放在页面下面
			var userobject=$('#manUserTable').edatagrid({
				url : 'back/findAllUser.action', //查询时加载的URL
				loadMsg:'数据加载中',
				pagination:true,  //显示分页
				pagesize: 10,  //默认分页的条数
				pageList:  [3,5,10,15,20,30,50],  //可选分页数
				fitColumns: true,  //自适应列
				fit : true,  //自动补全
				//idField : "aid",   //标识，会记录我们选中的一行的id,不一定是id,通常都是主键
				title: "用户管理",
				rownumbers: "true",  //显示行号
				nowrap: "true",//不换行显示
				sortName: "u_id",  //排序的列  这个参数会传到后台的servlet上,所以要有后台对应的接收
				sortOrder: "desc",  //排序方式
				singleSelect: true,      //只允许选择一行
				//以上的四种增删改查操作,只要失败,都会回掉这个onError
				onError: function(a,b){
					$.message.alert("错误","操作失败");
				},
				columns:[[{
					field:"u_ids",
					checkbox:true
					},{
					field:'u_id',
					title:'用户编号',
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true}},
					hidden:'true',
				},{
					field:'u_name',
					title:'用户名',
					width:30,
					editor:{type:"text",options:{required:true}},
					align:'center',
				},{
					field:'u_password',
					title:'用户密码',
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true}},
				},{
					field:'u_creditnumber',
					title:'用户信誉积分',
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true}},
				},{
					field:'u_email',
					title:'用户邮箱',
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
					field:'u_creditdegree',
					title:'用户信誉等级',
					width:30,
					align:'center',
					editor:{type:"text",options:{required:true}},
				},{
					field:'u_registerdate',
					title:'用户注册时间',
					width:30,
					align:'center',
					/* sortable:true,editor:{type:"text",options:{required:true}}, */
					formatter:function(subscribe_time){
						 var tt= new Date(parseInt(subscribe_time) * 1000).toLocaleString().substr(0,17)
						    return  tt;  
						} 
				},{
					field:'u_status',
					title:'用户状态',
					width:30,
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
		    					$.post("back/updateuser.action",row,function(data){
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


<table id="manUserTable"></table>
