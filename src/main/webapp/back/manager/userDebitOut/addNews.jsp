<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

<script type="text/javascript"  src="back/manager/ckeditor/ckeditor.js"></script> 

<head>
<script type="text/javascript">
	$(function(){
		//页面加载完,查询所有的新闻类别,显示到select中
		showNewsType();
		
		$("#addBtn").click(function(){
			//异步请求
			$.ajax({
				type:"POST",
				url: "back/news.action",
				data: $("#addNewsForm").serialize(),
				dataType: "json",    //替换 eval('('+xmlHttp.responseText+')')
				success: function(data){
					if(data.code==1){
						$.messager.alert('Warning','添加成功');
						$("#tname").val('');
					}else{
						$.messager.alert('Warning','添加失败',+data.errorMsg);
					}
					
				}
			});
		});
	});
	
	function showNewsType(){
		var url="back/newsType.action";
		$.ajax({
			type:"POST",
			url: url,
			data: "op=findAll&status=1",
			dataType: "json",    //替换 eval('('+xmlHttp.responseText+')')
			success: function(data){
				//data rows total
				str="";
				for(var i=0; i<data.rows.length;i++){
					var newstype = data.rows[i];
					str+="<option value='"+newstype.tid+"'>"+newstype.tname+"</option>";
				}
				$("#tid").html(str);
			}
		});
	}
	

    /**
    选择图片，马上预览
    使用方式  <input type="file"  name="pic" id="pic"    onchange="showUploadImg(this,'showpic')" 
		  accept="image/*"/>
    参数说明: obj:input=file的表单文件对象
    picid:用于显示图片的<img />标签的id号
    */
    function showUploadImg(obj,picid) {
    	//判断浏览器是否支持FileReader接口
    	   if (typeof FileReader == 'undefined') {
             $.messager.alert('Warning','当前浏览器不支持FileReader接口')
                //使选择控件不可操作
              obj.setAttribute("disabled","disabled");
             return ;
            }
        var file = obj.files[0];
        var reader = new FileReader();

        reader.onload = function (e) {
         $("#"+picid).attr("src",e.target.result);
        }
        reader.readAsDataURL(file)
    }

	
</script>

<title>添加新闻</title>
</head>
<body>

	<center>
			发布新闻
			<hr />
			<form id="addNewsForm" action="back/newsAdd.action" method="post"  enctype="multipart/form-data" >
			<div style="text-align:left;">
			<input	 type="hidden" name="op"  value="add"  />
			新闻类别:<select id="tid" name="tid">
			
			</select><br />
			新闻标题:<input type="text"  name="title" id="title"   /><br />
			新闻权重:<input type="text"  name="weight" id="weight"   /><br />
			新闻首页图片:<input type="file"  name="pic" id="pic"    onchange="showUploadImg(this,'showpic')" 
			  accept="image/*"/><br />
                <input type="button" value="隐藏图片" onclick="document.getElementById('showpic').style.display = 'none';"/>
                <input type="button" value="显示图片" onclick="document.getElementById('showpic').style.display = 'block';"/>
				<br />
				<img id="showpic" ><br />
				新闻内容:
				<textarea class="ckeditor"  name="content"></textarea>
			<br />
			<input type="submit"   id="addBtn"  value="添加"   />
			</div>
			</form>
	</center>









</body>
</html>