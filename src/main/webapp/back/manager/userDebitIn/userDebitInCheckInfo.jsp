<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>


<script type="text/javascript">
		var userDebitInEditRow = undefined;
		var userDebitInFlag;
		$(function(){     //函数是等页面一执行完就会调用的,如果不写函数，就要把js代码放在页面下面
			var userDebitInobject=$('#userDebitTable').edatagrid({
				url : 'back/findAllUserDebitInCheck.action', //查询时加载的URL
				loadMsg:'数据加载中',
				pagination:true,  //显示分页
				pageSize: 10,  //默认分页的条数
				pageList:  [5,10,20,20,50],  //可选分页数
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
				columns:[[
				          {
					field:"udi_ids",
					checkbox:true
					},{
					field:'udi_id',
					title:'借贷表编号',
					width:20,
					align:'center',
					hidden:'true',
					formatter: function(value,row,index){
						//alert(row.attentionMark.am_id)
						return row.userDebitIn.udi_id;
					}		
				},{
					field:'u_name',
					title:'借贷人姓名',
					width:20,
					align:'center',
				},{
					field:'u_creditdegree',
					title:'借贷人信誉等级',
					width:20,
					align:'center',
				},{
					field:'u_tel',
					title:'借贷人电话',
					width:20,
					align:'center',
				},{
					field:'udi_money',
					title:'借贷金额',
					width:20,
					align:'center',
					formatter: function(value,row,index){
						//alert(row.attentionMark.am_id)
						return row.userDebitIn.udi_money;
					}	
				},{
					field:'udi_publishdate',
					title:'借贷开始时间',
					width:50,
					align:'center',
					formatter: function(value,row,index){
						//alert(row.attentionMark.am_id)
						 var tt= new Date(parseInt(row.userDebitIn.udi_publishdate) * 1000).toLocaleString().substr(0,20);
						return tt;
					},
				  
				},{
					field:'udi_date',
					title:'借贷成功时间',
					width:50,
					align:'center',
					formatter: function(value,row,index){
						 var tt= new Date(parseInt(row.userDebitIn.udi_date) * 1000).toLocaleString().substr(0,20);
						return tt;
					},
				},{
					field:'udi_refundrealitydate',
					title:'实际还贷时间',
					width:50,
					align:'center',
					formatter: function(value,row,index){
						 var tt= new Date(parseInt(row.userDebitIn.udi_refundrealitydate) * 1000).toLocaleString().substr(0,17);
						return tt;
					},	 
				},{
					field:'udi_title',
					title:'借贷标题',
					width:20,
					align:'center',
					formatter: function(value,row,index){
						//alert(row.attentionMark.am_id)
						return row.userDebitIn.udi_title;
					}
				},{
					field:'udi_refundway',
					title:'还贷方式',
					width:20,
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
					width:20,
					align:'center',
					formatter: function(value,row,index){
						//alert(row.attentionMark.am_id)
						return row.userDebitIn.udi_status;
					}
				},{
					field:'udi_weight',
					title:'借贷权重',
					width:20,
					align:'center',
					formatter: function(value,row,index){
						//alert(row.attentionMark.am_id)
						return row.userDebitIn.udi_weight;
					},
						editor:{type:"combobox",
						options:{required:true,
							//date:updateweight,
							data:[{"text":"1"},{"text":"2"}], /* "text":"3","text":"4","text":"5","text":"6","text":"7","text":"8","text":"9","text":"10"*/
							//data:[{label: '先收费',value: '1',selected:true},{label: '后收费',value: '2'},],
							valueField:'text',  
							textField:'text',
							//value:1
							}
					},
					
				},{
					field:'udit_month',
					title:'还贷期限',
					width:20,
					align:'center',
					formatter: function(value,row,index){
						//alert(row.attentionMark.am_id)
						return row.userDebitIn.userDebitInType.udit_month;
					}
				},{
					field:'udit_name',
					title:'借贷归属名字',
					width:20,
					align:'center',
					formatter: function(value,row,index){
						//alert(row.attentionMark.am_id)
						return row.userDebitIn.userDebitInType.udit_name;
					}
				},{
					field:'udit_profit',
					title:'借贷利率',
					width:20,
					align:'center',
					formatter: function(value,row,index){
						//alert(row.attentionMark.am_id)
						return row.userDebitIn.userDebitInType.udit_profit;
					}
				},{
					field:'udi_checkstatus',
					title:'审核状态',
					width:20,
					align:'center',
					formatter: function(value,row,index){
						//alert(row.attentionMark.am_id)
						return row.userDebitIn.udi_checkstatus;
					}
				},{
					field : '_operate',
					title : '操作',
					width : 70,
					align : 'center',
					formatter : function formatOper(val,row, index) {
						/* var str = '<a href="javascript:void(0)" onclick="checkapprove('+ index + ')">审核通过</a>' */
						 var str = '<a href="javascript:void(0)" onclick="updateuserdebitinstatus('+ index + ')">修改用户借贷状态</a>';
						 str += ' <a href="javascript:void(0)" onclick="checkunapprove('+ index + ')">审核不通过</a> ';
						 //str += ' <a href="javascript:void(0)" onclick="checkunapprove('+ index + ')">保存</a> ';
						 return str;
					},
				}
				]],
			 	  toolbar:[{
			 		 	text:"修改",
	    			iconCls: 'icon-edit',
	    			handler: function(){
	    				if(userDebitInEditRow!=undefined){
	    					userDebitInobject.datagrid('rejectChanges');//结束编辑
	    					userDebitInEditRow=undefined;
	    				}
	    				var row = userDebitInobject.datagrid("getChecked")[0];
	    				//var row=userDebitInobject.row.userDebitIn.udi_weight;
	    				if(row==undefined){
	    					$.messager.show({title:'温馨提示',msg:'请选择或编辑您要修改的数据',timeout:2000,showType:'slide'});
	    				}else{
	    					userDebitInEditRow = userDebitInobject.datagrid('getRowIndex',row);
	    					 var ed = $('#userDebitTable').datagrid('getEditor', {index:3,field:'userDebitInobject.row.userDebitIn.udi_weight'});
	    				 /* 	$(ed.target).text('setValue',row.userDebitIn.udi_weight); 
	    					userDebitInobject.datagrid("beginEdit",userDebitInEditRow);//结束编辑  */
	    			 		 //url = "back/updateuser.action";  
	    					userDebitInFlag = "修改";
	    				}
	    			}
			  },'-', 
			  {
	    			text:"保存",
	    			iconCls: 'icon-save',
	    			handler: function(){
	    				if(userDebitInEditRow!=undefined){
	    					userDebitInobject.datagrid("endEdit",userDebitInEditRow);//结束编辑
	    					userDebitInEditRow=undefined;
	    				}
	    				var row = userDebitInobject.datagrid("getChanges")[0];
	    				if(row==undefined){//没有修改数据 提示
	    					$.messager.show({title:'温馨提示',msg:'请编辑您要'+userDebitInFlag+'的数据',timeout:2000,showType:'slide'});
	    					
	    				}else{
	    					$.post("back/updateUserDebitInWeight.action",row,function(data){
	    					// row["op"] = deptOp;
	    					//$.post("../deptServlet",row,function(data){ 
	    						data = parseInt( $.trim( data ) );
	    						if(data>0){
	    							$.messager.alert('失败提示','用户信息'+userDebitInFlag+'失败','error');
	    						}else{
	    							$.messager.show({title:'温馨提示',msg:'用户信息'+userDebitInFlag+'成功',timeout:2000,showType:'slide'});
	    							userDebitInobject.datagrid("reload");
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
		
		
		//修改用户借贷状态操作
		function updateuserdebitinstatus(index) {
			$('#userDebitTable').datagrid('selectRow', index);//关键在这里
			var row = $('#userDebitTable').datagrid('getSelected');
			$.ajax({
				 url : "back/updateuserdebitinstatus.action", 
				type : "POST",
				data : "udi_id=" + row.userDebitIn.udi_id+"&udi_status="+row.userDebitIn.udi_status,
				//data : "udi_id=" + row.userDebitIn.udi_id,
				dataType : "JSON",
				success : function(data) {
					$.messager.confirm('确认提示', '一旦修改数据将不能恢复，您确定要修改嘛？', function(r){
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
		
		
		//审核不通过操作
		function checkunapprove(index) {
			$('#userDebitTable').datagrid('selectRow', index);//关键在这里
			var row = $('#userDebitTable').datagrid('getSelected');
			$.ajax({
				 url : "back/checkunapprove.action", 
				type : "POST",
				data : "udi_id=" + row.userDebitIn.udi_id,
				dataType : "JSON",
				success : function(data) {
					$.messager.confirm('确认提示', '一旦修改数据将不能恢复，您确定要修改嘛？', function(r){
					if(r){
					if (data.code == 1) {
						alert("审核借贷信息不允许通过");
						$('#userDebitTable').datagrid('reload');
					} else {
						alert(data.msg);
					}
					}
					});
				}					
			});
		}
		
		//保存操作
		function checkunapprove(index) {
			$('#userDebitTable').datagrid('selectRow', index);//关键在这里
			var row = $('#userDebitTable').datagrid('getSelected');
			$.ajax({
				 url : "back/updateUserDebitInWeight.action", 
				type : "POST",
				data : "udi_id=" + row.userDebitIn.udi_id,
				dataType : "JSON",
				success : function(data) {
				/* 	$.messager.confirm('确认提示', '一旦修改保存将不能恢复，您确定要修改嘛？', function(r){
					if(r){ */
					if (data.code == 1) {
						alert("保存成功");
						$('#userDebitTable').datagrid('reload');
					} else {
						alert(data.msg);
					}
					}
					//});
				//}					
			});
		}
		
		
		
/* 		 for(updateweight;updateweight<13;updateweight++){
		data.push({"text":updateweight});
		}  */
		
		
/* 		$('#userDebitTable').datagrid({    
				data: 'back/updateUserDebitInWeight.action',
			}).datagrid('enableCellEditing').datagrid('gotoCell', {    
				index: 10,    
				field: 'udi_weight'
				});
			 */
		
		
			
</script>


<table id="userDebitTable"></table>


