<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>
<title>人人贷管理系统后台欢迎您</title>
<script type="text/javascript">
	$(function() {
		var treeDatauserDebitInTree = [ {
			"text" : "用户借贷信息管理",
			"state" : "closed",
			"children" : [
 					{
						"text" : "用户上传资料维护",
						"attributes" : {
							//"url":"back/manager/newstype/addType.jsp"
							"url" : "<iframe width='100%' height='100%'  src='back/manager/userDebitIn/userMessageInfo.jsp' />"
						}
					}, 
					{
						"text" : "借贷信息未审核维护",
						"attributes" : {
							//"url":"back/manager/newstype/addType.jsp"
							"url" : "<iframe width='100%' height='100%'  src='back/manager/userDebitIn/userDebitInunCheckInfo.jsp' />"
						}
					}, 
					{
						"text" : "借贷信息以审核维护",
						"attributes" : {
							//"url":"back/manager/newstype/addType.jsp"
							"url" : "<iframe width='100%' height='100%'  src='back/manager/userDebitIn/userDebitInCheckInfo.jsp' />"
						}
					
					} ,	{
						"text" : "用户借贷权重管理",
						"attributes" : {
							//"url":"back/manager/newstype/addType.jsp"
							"url" : "<iframe width='100%' height='100%'  src='back/manager/userDebitIn/userDebitInWeightManager.jsp' />"
						}
					} ]
		} ];

		var treeDatauserDebitOutTree = [ {
			"text" : "放贷信息管理",
			"state" : "closed",
			"children" : [
					{
						"text" : "放贷信息维护",
						"attributes" : {
							//"url":"back/manager/newstype/addType.jsp"
							"url" : "<iframe width='100%' height='100%'  src='back/manager/userDebitOut/userDebitOutInfo.jsp' />"
						}
					}
					]
		} ];

		var treeDataUser = [ {
			"text" : "用户管理",
			"state" : "closed",
			"children" : [ {
				"text" : "可用用户显示",
				"attributes" : {
					//"url":"back/manager/newstype/addType.jsp"
					"url" : "<iframe width='100%' height='100%'  src='back/manager/user/managerUserforbidlogin.jsp' />"
				}
			},
			{
				"text" : "不可用用户显示",
				"attributes" : {
					//"url":"back/manager/newstype/addType.jsp"
					"url" : "<iframe width='100%' height='100%'  src='back/manager/user/managerUserallowlogin.jsp' />"
				}
			}]
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
			} ]
			/* "text" : "关注用户管理",
			"state" : "closed",
			"children" : [ {
				"text" : "关注用户维护",
				"attributes" : {
					//"url":"back/manager/newstype/addType.jsp"
					"url" : "<iframe width='100%' height='100%'  src='back/attention/attentionUser.jsp' />"
				}
			} ] */
		} ];
		
		
		var treeDataMessageTypeTree = [ {
			"text" : "消息管理",
			"state" : "closed",
			"children" : [ {
				"text" : "推送消息",
				"attributes" : {
					"url" : "<iframe width='100%' height='100%'  src='back/manager/message/addMessageToUser.jsp' />"
				}
			},
			{
				"text" : "消息管理信息",
				"attributes" : {
					"url" : "<iframe width='100%' height='100%'  src='back/manager/message/MessageUserInfo.jsp' />"
				}
			}]
		} ];
		
		var treeDataUplanTree = [ {
			"text" : "U计划管理",
			"state" : "closed",
			"children" : [ {
				"text" : "发布新U计划",
				"attributes" : {
					"url" : "<iframe width='100%' height='100%'  src='back/manager/uplan/addNewUplan.jsp' />"
				}
			},
			{
				"text" : "U计划管理信息",
				"attributes" : {
					"url" : "<iframe width='100%' height='100%'  src='back/manager/uplan/uplanManagerInfo.jsp' />"
				}
			}]
		} ];
		
		
		showTree("UplanInfoTree", treeDataUplanTree);
		showTree("MessageTypeTree", treeDataMessageTypeTree);
		showTree("userDebitInTree", treeDatauserDebitInTree);
		showTree("userDebitOutTree", treeDatauserDebitOutTree);
		showTree("userTree", treeDataUser);
		showTree("AttentionTypeTree", DataAttentions);
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
		<div style="position: absolute; right: 0px; bottom: 5px;">
			<a href="javascript:void(0);" class="easyui-menubutton"
				data-options="menu:'#layout_north_pfMenu',iconCls:'icon-ok'">更换皮肤</a>
				</div>
			<div id="layout_north_pfMenu" style="width: 120px; display: none;">
<!-- 			<div onclick="changeTheme('default');">默认皮肤</div>
			<div onclick="changeTheme('gray');">灰色惬意</div>
			<div onclick="changeTheme('metro-green');">现代绿色</div>
			<div onclick="changeTheme('metro-orange');">现代橙色</div>
			<div onclick="changeTheme('metro-red');">深红沐浴</div> -->
			<div>默认皮肤</div>
			<div>灰色惬意</div>
			<div>现代绿色</div>
			<div>现代橙色</div>
			<div>深红沐浴</div>
		</div>
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
	<div data-options="region:'west',split:true " title="主功能栏" style="width: 150px; overflow: auto;">
		<div class="easyui-accordion" style="overflow: auto; width: 140px; height: 500px;">
			<div title="权限管理" style="overflow: auto; padding: 10px;">
				<ul id="userTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
				</ul>
			</div>
			<div title="借贷信息管理" style="overflow: auto; padding: 10px;">
				<!-- <div class="easyui-panel" style="padding: 5px"></div> -->
					<ul id="userDebitInTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
					</ul>
			</div>
			<div title="放贷信息管理" style="overflow: auto; padding: 10px;">
					<ul id="userDebitOutTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
					</ul>
			</div>
			<div title="关注管理" style="overflow: auto; padding: 10px;">
					<ul id="AttentionTypeTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
					</ul>
			</div>
			<div title="消息管理" style="overflow: auto; padding: 10px;">
			<ul id="MessageTypeTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
					</ul>
			</div>
			<div title="U计划管理" style="overflow: auto; padding: 10px;">
			<ul id="UplanInfoTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
					</ul>
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