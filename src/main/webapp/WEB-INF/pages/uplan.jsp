<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- <%@ include file="header.jsp" %> --%>

<script type="text/javascript">
	$(function() {
		$
				.ajax({
					type : "POST",
					data : "",
					url : "findAllUserDebitIn.action",
					dataType : "JSON",
					success : function(data) {
						if (data.code == 1) {
							$("#uplan").html("");
							$(data.rows)
									.each(
											function(index, item) {
												var str = '<li><a class="cover" href="toUplanDetail.action?udit_id=' + item.udit_id + '" target="_blank"> '
														+ ' <p class="time"> '
														+ ' <span class="month"><img src="images/time.png"><em>'
														+ item.udit_month
														+ '个月</em></span> <img ' +
						' src="images/uplan.png" class="xian"> '
														+ ' </p> '
														+ ' <p class="rate mtop"> '
														+ ' <span class="num"><i class="fu">'
														+ item.udit_profit
														+ '</i><em>%</em></span> <span class="nian">预期年化利率</span> <span ' +
						' class="highest"></span> '
														+ ' </p> '
														+ ' <p class="name"> '
														+ ' <em><i></i>查看详情</em> '
														+ ' </p> '
														+ ' </a></li>';
												$("#uplan").html($("#uplan").html() + str);
											});
						} else {
							alert("查询失败！原因" + data.msg);
						}
					}
				});
	});
</script>


<a href="javascript:" target="_blank" data-reactid=".0.0.0.$cloned-1.$0.0"><img
	src="images/banner0516.png" width="100%" data-reactid=".0.0.0.$cloned-1.$0.0.0"></a>

<div class="uplan">
	<div class="novice-top">
		<div class="no-top-l">
			<span>U计划</span> <i></i> <em>定期投资 分散投标</em>
		</div>
		<div class="no-top-r hover">
			<a class="tu" href="/pc/uPlan.html"><img src="images/index.png"></a> <a class="zi"
				href="#">查看更多</a>
		</div>
	</div>
	<div class="uplan-list-less">
		<ul id="uplan">
			
		</ul>
	</div>
</div>
