<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>
<title>人人贷管理系统后台欢迎您</title>
<script type="text/javascript">
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

		var treeDataUser = [ {
			"text" : "用户管理",
			"state" : "closed",
			"children" : [ {
				"text" : "用户维护",
				"attributes" : {
					//"url":"back/manager/newstype/addType.jsp"
					"url" : "<iframe width='100%' height='100%'  src='back/manager/user/managerUser.jsp' />"
				}
			} ]
		} ];

		var DataAttentions = [ {
			"text" : "关注投标管理",
			"state" : "closed",
			"children" : [ {
				"text" : "关注投标维护",
				"attributes" : {
					//"url":"back/manager/newstype/addType.jsp"
					"url" : "<iframe width='100%' height='100%'  src='back/manager/attention/attentionMark.jsp' />"
				}
			} ],
			"text" : "关注用户管理",
			"state" : "closed",
			"children" : [ {
				"text" : "关注用户维护",
				"attributes" : {
					//"url":"back/manager/newstype/addType.jsp"
					"url" : "<iframe width='100%' height='100%'  src='back/attention/data/attentionUser.jsp' />"
				}
			} ]
		} ];

		showTree("newsTypeTree", treeData);
		showTree("newsTree", treeDataNews);
		showTree("userTree", treeDataUser);
		showTree("AttentionTypeTree", DataAttentions);

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
				closable : true,
				/* closed : true,
				tools : [ {
					iconCls : 'icon-cancel',    //icon.css中查找的
					handle : function() {
						alert('save')
					}
				} ], */
				//href:node.attribute.url
				content : node.attributes.url

			})
		}
	}
</script>
</head>
<body class="easyui-layout  layout panel-noscroll">
	<div data-options="region:'north' " style="height: 80px;">
		<img width="337px" height="70px" src="images/yclogo.png" />
	</div>
	<div data-options="region:'south',split:true" style="height: 50px;">
		<center>衡阳源辰信息科技有限公司</center>
	</div>
	<div data-options="region:'east',split:true " title="工具箱" style="width: 200px;">
		<div class="easyui-calendar calendar" style="width: 185.767px; height: 185.767px;">
			<div class="calendar-header">
				<div class="calendar-title"></div>
			</div>
			<div class="calendar-body" style="height: 123.767px;">
				<table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0">
				</table>
			</div>
		</div>
	</div>
	<div data-options="region:'west',split:true " title="主功能栏" style="width: 150px;">
		<div class="easyui-accordion" style="overflow: auto; width: 140px; height: 500px;">
			<div title="权限管理" style="overflow: auto; padding: 10px;">
				<ul id="userTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
				</ul>
			</div>
			<div title="新闻类别管理" style="overflow: auto; padding: 10px;">
				<div class="easyui-panel" style="padding: 5px">
					<ul id="newsTypeTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
					</ul>
				</div>
			</div>
			<div title="新闻管理" style="overflow: auto; padding: 10px;">
				<div class="easyui-panel" style="padding: 5px">
					<ul id="newsTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
					</ul>
				</div>
			</div>
			<div title="数据字典" style="overflow: auto; padding: 10px;">数据字典</div>
			<div title="关注管理" style="overflow: auto; padding: 10px;">
				<div class="easyui-panel" style="padding: 5px">
					<ul id="AttentionTypeTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
					</ul>
				</div>
				系统备份还原的
			</div>
		</div>
	</div>
	<!-- 	</div>  -->
	<div data-options=" region:'center',title:'主操作区', iconCls:'icon-ok'">
		<!-- tabs区，有很多的tab -->
		<div id="mainTt" class="easyui-tabs" data-options="fit:true,border:false,">
			<div title="待处理业务区" data-options="closable:true">欢迎您,源辰信息</div>
		</div>
	</div>