<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>
<!-- <script type="text/javascript">
		$(function(){
			$('#westpanel').panel({
				href:'back/manager/westpanel.html'
			});
		});
	</script> -->
<title>新闻管理系统后台欢迎您</title>	
<script type="text/javascript">
//相当于 $(document).ready(function(){});
		
	$(function() {
		var treeData = [ {
			"text" : "类别管理",
			"state" : "closed",
			"children" : [
					{
						"text" : "新增类别",
						"attributes" : {
							//"url":"back/manager/newstype/addType.jsp"
							"url" : "<iframe width='100%' height='100%'  src='back/manager/newstype/addType.jsp' />"
						}
					},
					{
						"text" : "类别维护",
						"attributes" : {
							//"url":"back/manager/newstype/addType.jsp"
							"url" : "<iframe width='100%' height='100%'  src='back/manager/newstype/manType.jsp' />"
						}
					} ]
		} ];

		var treeDataNews = [ {
			"text" : "新闻管理",
			"state" : "closed",
			"children" : [
					{
						"text" : "新增新闻",
						"attributes" : {
							//"url":"back/manager/newstype/addType.jsp"
							"url" : "<iframe width='100%' height='100%'  src='back/manager/news/addNews.jsp' />"
						}
					},
					{
						"text" : "新闻维护",
						"attributes" : {
							//"url":"back/manager/newstype/addType.jsp"
							"url" : "<iframe width='100%' height='100%'  src='back/manager/news/manNews.jsp' />"
						}
					} ]
		} ];
		
		
		
		var treeDataAdmins = [ {
			"text" : "权限管理",
			"state" : "closed",
			"children" : [
					{
						"text" : "用户维护",
						"attributes" : {
							//"url":"back/manager/newstype/addType.jsp"
							"url" : "<iframe width='100%' height='100%'  src='back/manager/admins/manadmins.jsp' />"
						}
					} ]
		} ];
		
		var DataNews = [ {
			"text" : "新闻管理",
			"state" : "closed",
			"children" : [
					{
						"text" : "新闻维护",
						"attributes" : {
							//"url":"back/manager/newstype/addType.jsp"
							"url" : "<iframe width='100%' height='100%'  src='back/manager/data/manNews.jsp' />"
						}
					} ]
		} ];

		showTree("newsTypeTree", treeData);
		showTree("newsTree", treeDataNews);
		showTree("adminsTree", treeDataAdmins);
		showTree("dataTree", DataNews);

		/* $("#newsTypeTree").tree({
			data:treeData,   //将这里改成:   url: right.action    这个地址会得到一个上面  treeDate这样的字符串
			onClick: function(node){
				//alert(node.text);
				 if( node.attributes){
					//alert(node.attribute.url);
					openTab( node); 
				}
			}
		});

		
		$("#newsTree").tree({
		data:treeDataNews,   //将这里改成:   url: right.action    这个地址会得到一个上面  treeDate这样的字符串
		onClick: function(node){
			//alert(node.text);
			 if( node.attributes){
				//alert(node.attribute.url);
				openTab( node); 
			}
		}
		}); */
	});

	//显示树
	//参数1:要显示树的容器 ul  标签的id号，  data  要树的节点内容  json格式
	function showTree(treeId, data) {

		$("#" + treeId).tree({
			data : data, //将这里改成:   url: right.action    这个地址会得到一个上面  treeDate这样的字符串
			onClick : function(node) {
				//alert(node.text);
				if (node.attributes) {
					//alert(node.attribute.url);
					openTab(node);
				}
			}
		});
	}

	function openTab(node) {
		if ($("#mainTt").tabs("exists", node.text)) {
			$("#mainTt").tabs("select", node.text);
		} else {
			$("#mainTt").tabs("add", {
				title : node.text,
				selected : true,
				closed : true,
				tools : [ {
					iconCls : 'icon-cancel',    //icon.css中查找的
					handle : function() {
						alert('save')
					}
				} ],
				//href:node.attribute.url
				content : node.attributes.url

			})
		}
	}
</script>

</head>
<body class="easyui-layout  layout panel-noscroll" >


		<div data-options="region:'north' "style="height:50px;">top</div>
		<div data-options="region:'south',split:true"   style="height:50px;">button</div>
		<div data-options="region:'east',split:true " title ="East" style="width:100px;">right</div>
		<div data-options="region:'west',split:true " title ="West" style="width:150px;">
		
		<div class="easyui-accordion" style="overflow:auto; width: 500px; height:300px;" >
		
				<div title="新闻类别管理" style="overflow:auto; padding: 10px;">
						<div class="easyui-panel"  style="padding:5px">
							<ul id="newsTypeTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
							
							</ul>
						</div>
				
				</div>
				<div title="新闻管理" style="overflow:auto; padding: 10px;">
				<div class="easyui-panel"  style="padding:5px">
							<ul id="newsTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
							
							</ul>
				</div>
				
				</div>
				<div title="数据字典" style="overflow:auto; padding: 10px;">数据字典</div>
				<div title="系统备份还原" style="overflow:auto; padding: 10px;">
				<div class="easyui-panel"  style="padding:5px">
							<ul id="dataTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
						<!-- 	  <li data-options="field:'_operate',width:80,align:'center',formatter:formatOper">操作</li>  --> 
							
							</ul>
							</div>
				系统备份还原的</div>
				<div title="权限管理" style="overflow:auto; padding: 10px;">
							<ul id="adminsTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
							
							</ul>
				</div>
				</div>
				</div>
				
				

		
<!-- 	</div>  -->
		
		<div   data-options=" region:'center',title:'主操作区', iconCls:'icon-ok'">
				<!-- tabs区，有很多的tab -->
				<div id="mainTt"  class="easyui-tabs"  data-options="fit:true,border:false">
						<div title="待处理业务区">欢迎您,源辰信息</div>
				</div>
		
		</div> 
		






