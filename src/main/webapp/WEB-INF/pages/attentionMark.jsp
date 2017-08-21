<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file="header.jsp"%>

<%@ include file="nav.jsp"%>
<script>
$(function() {
	function gopage(pages) {
		$
				.ajax({
					type : "POST",
					url : "findAllAttentionMarkByUser.action",
					data : "pages=" + pages,
					dataType : "JSON",
					success : function(data) {
						if (data.code == 1) {
							$("#attentionMarkHistory").html("");
							$(data.rows)
									.each(
											function(index, item) {
												var status = '';
												if (item.attentionMark.am_status==0) {
													status = '正在关注';
												}
												if (item.attentionMark.am_status==1) {
													status = '未关注';
												}
												var refundway=''; 
												if(item.attentionMark.userDebitIn.udi_refundway==1){
													refundway='月还贷';
												}
												if(item.attentionMark.userDebitIn.udi_refundway==0){
													refundway='一次性还贷';
												}
										 		var makeMoney = item.attentionMark.userDebitIn.udi_money
														/ 100
														* item.attentionMark.userDebitIn.userDebitInType.udit_profit
														* item.attentionMark.userDebitIn.userDebitInType.udit_month
														/ 12;
												makeMoney = makeMoney
														.toFixed(2); 
												var str = '<tr class="list" data-reactid=".1.1.0.1.$0"> '
														+ ' <td class="name" data-reactid=".1.1.0.1.$0.0"><a title="' + item.attentionMark.userDebitIn.udi_title + '" ' +
					' target="_blank" href="/pc/uplan/14719.html" data-reactid=".1.1.0.1.$0.0.0">'
														+ item.attentionMark.userDebitIn.udi_title
														+ '</a></td> '
														+ ' <td class="join-num" data-reactid=".1.1.0.1.$0.1"><span data-reactid=".1.1.0.1.$0.1.0">'
														+ item.u_creditdegree
														+ '</span><span ' +
					' data-reactid=".1.1.0.1.$0.1.1"></span></td> '
														+ ' <td class="amount" data-reactid=".1.1.0.1.$0.2"><span data-reactid=".1.1.0.1.$0.2.0">'
														+ item.attentionMark.userDebitIn.udi_money
														+ '</span><span ' +
					' data-reactid=".1.1.0.1.$0.2.1">元</span></td> '
														+ ' <td class="rate" data-reactid=".1.1.0.1.$0.3"><span data-reactid=".1.1.0.1.$0.3.0">'
														+  item.attentionMark.userDebitIn.userDebitInType.udit_profit
														+ '</span><em ' +
					' data-reactid=".1.1.0.1.$0.3.1">%</em></td> '
														+ ' <td class="earn" data-reactid=".1.1.0.1.$0.4"><span data-reactid=".1.1.0.1.$0.4.0">'
														+ makeMoney
														+ '</span><span ' +
					' data-reactid=".1.1.0.1.$0.4.1">元</span></td> '
														+ ' <td class="status" id="AttentionMarkStatus" data-reactid=".1.1.0.1.$0.5">'
														+ status
														+ '</td> ' 
														+ ' <td class="month" data-reactid=".1.1.0.1.$0.6"><span data-reactid=".1.1.0.1.$0.6.0">'
														+ item.attentionMark.userDebitIn.userDebitInType.udit_month
														+ '</span><span ' +
					' data-reactid=".1.1.0.1.$0.6.1">月</span></td> '
														+ ' <td class="type" data-reactid=".1.1.0.1.$0.7"><span data-reactid=".1.1.0.1.$0.7.0">'
														+ refundway
														+ '</span><span ' +
					' data-reactid=".1.1.0.1.$0.7.1"></span></td> '

														
														+ ' </tr>';
												$("#attentionMarkHistory").html(
														$("#attentionMarkHistory")
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
	
});
	
	</script>

		<div class="container_12_1080   " id="uplanIndexData">
			<!--UA,UB,UC U计划投资数据-->
			<div class="ui-title fn-clear">
				<!-- <div class="fn-left ">U计划投资数据</div>
				<div class="fn-right">数据来源人人贷内部统计,实时更新</div> -->
			</div>
			<div id="uplanData" class="fn-clear ui-invest-dl-info color-white-bg"></div>
		</div>
		<div class="container_12_1080" id="uplanIndexList">
			<div id="uIndexProductListBox" data-reactid=".1">
				<div class="title-box" data-reactid=".1.0">您已关注的投标</div>
				<div class="list-box" data-reactid=".1.1">
					<table class="react-history-table" data-reactid=".1.1.0">
						<thead data-reactid=".1.1.0.0">
							<tr class="table-head" data-reactid=".1.1.0.0.0">
								<th data-reactid=".1.1.0.0.0.0">计划名称</th>
								<th data-reactid=".1.1.0.0.0.1">用户等级</th>
								<th data-reactid=".1.1.0.0.0.2">借贷金额</th>
								<th data-reactid=".1.1.0.0.0.3"><span data-reactid=".1.1.0.0.0.3.0">预期年化利率</span><span
									class="icon-we-tip-info" data-reactid=".1.1.0.0.0.3.1"><div class="info-tips-box"
											data-reactid=".1.1.0.0.0.3.1.0">
											<span class="triangle" data-reactid=".1.1.0.0.0.3.1.0.0"></span><span class="info-tips"
												data-reactid=".1.1.0.0.0.3.1.0.1">预期年化利率不代表实际利息收益</span>
										</div></span></th>
								<th data-reactid=".1.1.0.0.0.4">累计利息收益</th>
								<th class="status" data-reactid=".1.1.0.0.0.5">关注状态</th>
								<th data-reactid=".1.1.0.0.0.6">借贷期限</th>
								<th data-reactid=".1.1.0.0.0.7">还贷方式</th>
								<!-- <th data-reactid=".1.1.0.0.0.8">操作</th> -->
							</tr>
						</thead>
						<tbody data-reactid=".1.1.0.1" id="attentionMarkHistory">
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
					<br />
					<br />
					<center>
						<div id="pagebeandiv"></div>
					</center>
					<br />
					<br />
				</div>
				<div class="ui-pagination" data-reactid=".1.2">
					<ul class="pagination" data-reactid=".1.2.0">
						<li class="previous disabled" data-reactid=".1.2.0.0"><a data-reactid=".1.2.0.0.0">上一页</a></li>
						<li class="active" data-reactid=".1.2.0.1:$key0/=10"><a selected=""
							data-reactid=".1.2.0.1:$key0/=10.0">1</a></li>
						<li data-reactid=".1.2.0.1:$key1/=10"><a data-reactid=".1.2.0.1:$key1/=10.0">2</a></li>
						<li class="next" data-reactid=".1.2.0.2"><a data-reactid=".1.2.0.2.0">下一页</a></li>
					</ul>
				</div>
				<div class="list-loading hide" data-reactid=".1.3"></div>
			</div>
		</div>
	</div>
</div>
</div>

<%@ include file="bottom.jsp"%>



