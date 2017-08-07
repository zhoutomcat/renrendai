/*$(function(){
			$('#westpanel').panel({
				href:'back/manager/westpanel.html'
			});
		});*/



//相当于 $(document).ready(function(){});
/* 		
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
		 */
		
		
		var treeDataUsers = [ {
			"text" : "人人贷用户管理",
			"state" : "closed",
			"children" : [
					{
						"text" : "人人贷用户维护",
						"attributes" : {
							//"url":"back/manager/newstype/addType.jsp"
							"url" : "<iframe width='100%' height='100%'  src='back/manager/user/findAllUser.jsp' />"
						}
					} ]
		} ];
		

/* 		showTree("newsTypeTree", treeData);
		showTree("newsTree", treeDataNews); */
		showTree("findAllUserTree", treeDataUsers);


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
		}); 
	});*/

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
