<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="header.jsp"%>

<%@ include file="nav.jsp"%>

<script>
	$(function() {
		$
				.ajax({
					type : "POST",
					url : "findAllUplanData.action",
					dataType : "JSON",
					success : function(data) {
						if (data.code == 1) {
							/* 	var makeMoney = data.makeMoney;
							var totalMoney = data.totalMoney;
										var peopleCount = data.peopleCount; */
							var str = '<dl class="fn-left   text-center   border-right-gray">'
									+ '	<dd>'
									+ '<em class="number">'
									+ (data.totalMoney / 10000)
									+ '</em><em class="unit">万元</em>'
									+ '	</dd>'
									+ '<dt class="text">加入U计划</dt>'
									+ '</dl>'
									+ '<dl class="fn-left  text-center   border-right-gray">'
									+ '<dd>'
									+ '	<em class="number">'
									+ (data.makeMoney / 10000)
									+ '</em><em class="unit">万元</em>'
									+ '</dd>'
									+ '<dt class="text">为用户赚取</dt>'
									+ '</dl>'
									+ '<dl class="fn-left text-center ">'
									+ '<dd>'
									+ '	<em class="number">'
									+ data.peopleCount
									+ '</em><em class="unit">次</em>'
									+ '</dd>'
									+ '<dt class="text">加入总人次</dt>' + '</dl>';
							$("#uplanData").html(str);
						} else {
							alert("shibai ");
						}
					}
				})
	})

	function gopage(pages) {
		$
				.ajax({
					type : "POST",
					url : "findAllUplanHistory.action",
					data : "pages=" + pages,
					dataType : "JSON",
					success : function(data) {
						if (data.code == 1) {
							$("#uplanHistory").html("");
							$(data.rows)
									.each(
											function(index, item) {
												var status = '';
												if (item.udi_status == 1) {
													status = '凑款状态';
												}
												if (item.udi_status == 2) {
													status = '收益中';
												}
												if (item.udi_status == 3
														|| item.udi_status == 4) {
													status = '已结束';
												}
												var makeMoney = item.udi_money
														/ 100
														* item.userDebitInType.udit_profit
														* item.userDebitInType.udit_month
														/ 12;
												makeMoney = makeMoney
														.toFixed(2);
												var str = '<tr class="list" data-reactid=".1.1.0.1.$0"> '
														+ ' <td class="name" data-reactid=".1.1.0.1.$0.0"><a title="' + item.udi_title + '" ' +
					' target="_blank" href="/pc/uplan/14719.html" data-reactid=".1.1.0.1.$0.0.0">'
														+ item.udi_title
														+ '</a></td> '
														+ ' <td class="join-num" data-reactid=".1.1.0.1.$0.1"><span data-reactid=".1.1.0.1.$0.1.0">'
														+ item.peopleCount
														+ '</span><span ' +
					' data-reactid=".1.1.0.1.$0.1.1">人</span></td> '
														+ ' <td class="amount" data-reactid=".1.1.0.1.$0.2"><span data-reactid=".1.1.0.1.$0.2.0">'
														+ item.udi_money
														+ '</span><span ' +
					' data-reactid=".1.1.0.1.$0.2.1">元</span></td> '
														+ ' <td class="rate" data-reactid=".1.1.0.1.$0.3"><span data-reactid=".1.1.0.1.$0.3.0">'
														+ item.userDebitInType.udit_profit
														+ '</span><em ' +
					' data-reactid=".1.1.0.1.$0.3.1">%</em></td> '
														+ ' <td class="earn" data-reactid=".1.1.0.1.$0.4"><span data-reactid=".1.1.0.1.$0.4.0">'
														+ makeMoney
														+ '</span><span ' +
					' data-reactid=".1.1.0.1.$0.4.1">元</span></td> '
														+ ' <td class="status" id="uplanStatus" data-reactid=".1.1.0.1.$0.5">'
														/* 	+ checkStatus(item.udi_status) */
														+ status
														+ '</td> '
														+ ' </tr>';
												$("#uplanHistory").html(
														$("#uplanHistory")
																.html()
																+ str);
											});
							$.createPageBar(data, "pagebeandiv");
						} else {
							alert("shibai ");
						}
					}
				})
	}

	//vssrbfvhuj
	$(function() {
		gopage(1);
	})
</script>

<div class="main-content">
	<div id="uplanIndex">
		<div class="wdg-index-banner">
			<div class="banner-box react-slick" id="banner-box">
				<div class="slick-initialized slick-slider" data-reactid=".0">
					<div class="slick-list" data-reactid=".0.0">
						<div class="slick-track" data-reactid=".0.0.0"
							style="opacity: 1; width: 4557.6px; transform: translate3d(0px, 0px, 0px);">
							<div class="slick-slide slick-active banner" data-index="-1" data-reactid=".0.0.0.$cloned-1"
								style="width: 1519.2px;">
								<div class="img_box" data-reactid=".0.0.0.$cloned-1.$0">
									<a href="javascript:" target="_blank" data-reactid=".0.0.0.$cloned-1.$0.0"><img
										src="//www.we.com/cms/58b528189826fb2215fd730b/index/banner0516.png"
										data-reactid=".0.0.0.$cloned-1.$0.0.0"></a>
								</div>
							</div>
							<div class="slick-slide slick-active banner" data-index="0" data-reactid=".0.0.0.$original0"
								style="width: 1519.2px;">
								<div class="img_box" data-reactid=".0.0.0.$original0.$0">
									<a href="javascript:" target="_blank" data-reactid=".0.0.0.$original0.$0.0"><img
										src="//www.we.com/cms/58b528189826fb2215fd730b/index/banner0516.png"
										data-reactid=".0.0.0.$original0.$0.0.0"></a>
								</div>
							</div>
							<div class="slick-slide slick-active banner" data-index="1" data-reactid=".0.0.0.$cloned1"
								style="width: 1519.2px;">
								<div class="img_box" data-reactid=".0.0.0.$cloned1.$0">
									<a href="javascript:" target="_blank" data-reactid=".0.0.0.$cloned1.$0.0"><img
										src="//www.we.com/cms/58b528189826fb2215fd730b/index/banner0516.png"
										data-reactid=".0.0.0.$cloned1.$0.0.0"></a>
								</div>
							</div>
						</div>
					</div>
					<button type="button" data-role="none" class="slick-arrow slick-prev" style="display: block;"
						data-reactid=".0.1">Previous</button>
					<button type="button" data-role="none" class="slick-arrow slick-next" style="display: block;"
						data-reactid=".0.2">Next</button>
				</div>
			</div>
			<div class="uc-amount-box">
				<p class="uc-amount">10.0</p>
			</div>
		</div>

		<%@ include file="uplan.jsp"%>

		<%@ include file="uplanCalculator.jsp"%>

		<div class="container_12_1080   " id="uplanIndexData">
			<!--UA,UB,UC U计划投资数据-->
			<div class="ui-title fn-clear">
				<div class="fn-left ">U计划投资数据</div>
				<div class="fn-right">数据来源人人贷内部统计,实时更新</div>
			</div>
			<div id="uplanData" class="fn-clear ui-invest-dl-info color-white-bg"></div>
		</div>
		<div class="container_12_1080" id="uplanIndexList">
			<div id="uIndexProductListBox" data-reactid=".1">
				<div class="title-box" data-reactid=".1.0">历史期数与利息收益</div>
				<div class="list-box" data-reactid=".1.1">
					<table class="react-history-table" data-reactid=".1.1.0">
						<thead data-reactid=".1.1.0.0">
							<tr class="table-head" data-reactid=".1.1.0.0.0">
								<th data-reactid=".1.1.0.0.0.0">计划名称</th>
								<th data-reactid=".1.1.0.0.0.1">加入人次</th>
								<th data-reactid=".1.1.0.0.0.2">计划金额</th>
								<th data-reactid=".1.1.0.0.0.3"><span data-reactid=".1.1.0.0.0.3.0">预期年化利率</span><span
									class="icon-we-tip-info" data-reactid=".1.1.0.0.0.3.1"><div class="info-tips-box"
											data-reactid=".1.1.0.0.0.3.1.0">
											<span class="triangle" data-reactid=".1.1.0.0.0.3.1.0.0"></span><span class="info-tips"
												data-reactid=".1.1.0.0.0.3.1.0.1">预期年化利率不代表实际利息收益</span>
										</div></span></th>
								<th data-reactid=".1.1.0.0.0.4">累计利息收益</th>
								<th class="status" data-reactid=".1.1.0.0.0.5">状态</th>
							</tr>
						</thead>
						<tbody data-reactid=".1.1.0.1" id="uplanHistory">
							<!-- <tr class="list" data-reactid=".1.1.0.1.$0">
								<td class="name" data-reactid=".1.1.0.1.$0.0"><a title="点击查看U计划-24月-20170813-1期详情"
									target="_blank" href="/pc/uplan/14719.html" data-reactid=".1.1.0.1.$0.0.0">U计划-24月-20170813-1期</a></td>
								<td class="join-num" data-reactid=".1.1.0.1.$0.1"><span data-reactid=".1.1.0.1.$0.1.0">0</span><span
									data-reactid=".1.1.0.1.$0.1.1">人</span></td>
								<td class="amount" data-reactid=".1.1.0.1.$0.2"><span data-reactid=".1.1.0.1.$0.2.0">20000000</span><span
									data-reactid=".1.1.0.1.$0.2.1">元</span></td>
								<td class="rate" data-reactid=".1.1.0.1.$0.3"><span data-reactid=".1.1.0.1.$0.3.0">9.8</span><em
									data-reactid=".1.1.0.1.$0.3.1">%</em><span data-reactid=".1.1.0.1.$0.3.2"> + 0.2</span><em
									data-reactid=".1.1.0.1.$0.3.3">%</em></td>
								<td class="earn" data-reactid=".1.1.0.1.$0.4"><span data-reactid=".1.1.0.1.$0.4.0">0</span><span
									data-reactid=".1.1.0.1.$0.4.1">元</span></td>
								<td class="status" data-reactid=".1.1.0.1.$0.5">等待开放加入</td>
							</tr> -->
						</tbody>
					</table>
					<br /> <br />
					<center>
						<div id="pagebeandiv"></div>
					</center>
					<br /> <br />
				</div>
				<div class="list-loading hide" data-reactid=".1.3"></div>
			</div>
		</div>
	</div>
</div>
</div>

<%@ include file="bottom.jsp"%>

