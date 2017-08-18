<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
	$(function() {
		gopage(1);
	})
	function gopage(pages) {
		$
				.ajax({
					type : "POST",
					data : "pages=" + pages,
					url : "findAllSanbiaoHistory.action",
					dataType : "JSON",
					success : function(data) {
						if (data.code == 1) {
							$("#sanbiaoHistory").html("");
							$(data.rows)
									.each(
											function(index, item) {
												var str = '<tr ';
												if (index % 2 == 0) {
													str += ' class="even" ';
												}
												str += '>  <td class="rate">' + item.userDebitInType.udit_profit + '<span>%</span></td>'
														+ ' <td class="name">' + item.udi_title + '</td>'
														+ ' <td class="time">' + item.userDebitInType.udit_month + '个月</td>'
														+ ' <td class="money"><span> ' + item.udi_money + '</span>元</td>'
														+ ' <td class="progress" data-percent="100">'
														+ ' 	<div class="percentage-text">100%</div>'
														+ ' 	<div class="outer">'
														+ ' 		<span class="inner" style="width: 120px;"></span>'
														+ ' 	</div>'
														+ ' </td>'
														+ ' <td class="action"><a class="disabled"' +
									' href="#" target="_blank" onclick="return false">还款中</a>'
														+ ' </td>' + ' </tr>';
												$("#sanbiaoHistory").html(
														$("#sanbiaoHistory")
																.html()
																+ str);
											});
							$.createPageBar(data, "pagebeandiv");
						} else {
							alert("查询失败！原因" + data.msg);
						}
					}
				});
	}
</script>


<center>
	<div class="fund-wrap regular-container debt-container">
		<div class="caption clearfix">
			<div class="l-title">
				<div>散标/债权</div>
				<span>自主投资 期限灵活</span>
			</div>
			<a class="r-more" href="/pc/loan.html"> <span class="more-link">查看更多</span> <img
				class="more-bg" src="images/index.png">
			</a>
		</div>
		<div class="table">
			<table class="t-caption">
				<thead>
					<tr>
						<th class="rate regular-rate">年利率</th>
						<th class="name">借款标题</th>
						<th class="time">期限</th>
						<th class="money">金额</th>
						<th class="progress">募集进度</th>
						<th class="action">操作</th>
					</tr>
				</thead>
				<tbody class="data-list" id="sanbiaoHistory">


				</tbody>
			</table>
			<br/>
			<center>
				<div id="pagebeandiv"></div>
			</center>
		</div>
	</div>
</center>


