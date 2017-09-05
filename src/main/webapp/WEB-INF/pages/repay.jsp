<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="header.jsp"%>

<%@ include file="nav.jsp"%>

<script type="text/javascript">
	$(function() {
		gopage(1);
	})

	function gopage(pages) {
		$
				.ajax({
					type : "POST",
					data : "pages=" + pages,
					url : "user/findAllUserDebitInInfo.action",
					dataType : "JSON",
					success : function(data) {
						if (data.code == 1) {
							$("#DebitInList").html("");
							$(data.rows)
									.each(
											function(index, item) {
												 var tt= new Date(parseInt( item.udi_date * 1000 )).toLocaleString().substr(0,9)
												var str = '<tr class="even"> '
														+ ' <td class="rate">'
														+ item.userDebitInType.udit_profit
														+ '<span>%</span></td>'
														+ ' <td class="name">'
														+ item.udi_title
														+ '</td>'
														+ ' <td class="time">'
														+ tt
														+ '</td>'
														+ ' <td class="money"><span>'
														+ item.udi_money
														+ '</span>元</td>'
														+ ' <td class="progress" data-percent="100">'
														+ ' 	<div class="percentage-text"> '
														+ '100%'
														+ '</div>'
														+ ' <div class="outer">'
														+ ' 		<span class="inner" style="width: 120px;"></span>'
														+ ' 	</div>'
														+ ' </td>'
														+ ' <td class="action"><a class="disabled"' + 
									' 	href="toRepayment.action?udi_id=' + item.udi_id + '" target="_blank" > 我要还款 </a>'
														+ ' </td>' + ' </tr>';
												$("#DebitInList").html(
														$("#DebitInList")
																.html()
																+ str);
											});
							/* $.createPageBar(data, "pagebeandiv"); */
						} else {
							alert("查询失败！原因" + data.msg);
						}
					}
				});
	}
</script>
<br />
<br />
<center>
	<div class="fund-wrap regular-container debt-container">
		<div class="caption clearfix">
			<div class="l-title">
				<div>还款列表</div>
				<span>自主投资 期限灵活</span>
			</div>
			<a class="r-more" href="#"> <span class="more-link">查看更多</span> <img class="more-bg"
				src="images/index.png">
			</a>
		</div>
		<div class="table">
			<table class="t-caption">
				<thead>
					<tr>
						<th class="rate regular-rate">年利率</th>
						<th class="name">借款标题</th>
						<th class="time">还款时间</th>
						<th class="money">金额</th>
						<th class="progress">募集进度</th>
						<th class="action">操作</th>
					</tr>
				</thead>

				<tbody class="data-list" id="DebitInList">

				</tbody>
			</table>
			<center>
				<div id="pagebeandiv"></div>
			</center>
		</div>
	</div>
</center>