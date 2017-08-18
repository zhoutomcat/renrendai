<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
	function uplanAmountChange() {
		var x = document.getElementById("uplanAmount").value;
		if (x % 1000 != 0) {
			document.getElementById("uplanAmount-error-label").innerHTML = "投资金额须为1000的整数倍且不能为空";
			document.getElementById("uplanAmount").innerHTML = "10000";
		} else {
			document.getElementById("uplanAmount-error-label").innerHTML = "";
		}
	}

	//TODO:优化这段代码
	$(
			function() {
				$("#calcbt")
						.click(
								function() {
									var num = document
											.getElementById("uplanAmount").value * 0.06 / 12;
									num = num.toFixed(2); // 输出结果为 2.45
									document.getElementById("incomeV1").innerHTML = num
											+ "元";

									var num = document
											.getElementById("uplanAmount").value * 0.066 / 4.0;
									num = num.toFixed(2); // 输出结果为 2.45
									document.getElementById("incomeV3").innerHTML = num
											+ "元";

									var num = document
											.getElementById("uplanAmount").value * 0.072 / 2.0;
									num = num.toFixed(2); // 输出结果为 2.45
									document.getElementById("incomeV6").innerHTML = num
											+ "元";

									var num = document
											.getElementById("uplanAmount").value * 0.088 / 1.0;
									num = num.toFixed(2); // 输出结果为 2.45
									document.getElementById("incomeV12").innerHTML = num
											+ "元";

									var num = document
											.getElementById("uplanAmount").value * 0.1 * 2.0;
									num = num.toFixed(2); // 输出结果为 2.45
									document.getElementById("incomeV24").innerHTML = num
											+ "元";
								})
			})
</script>

<div class="container_12_1080" id="uplan-index-cal">
	<div class="ui-title fn-clear">
		<div class="fn-left">投资计算器</div>
		<div class="fn-right"></div>
	</div>
	<div class="color-white-bg ui-cal fn-clear">
		<div class="fn-left cal-left">
			<div class="u-input-group">
				<input maxlength="8" name="uplanAmount" id="uplanAmount" class="ui-input success-input"
					value="10000" type="text" onchange="uplanAmountChange()">
				<p class="unit">元</p>
				<!-- <label class="ui-term-error error" id="uplanAmount-error-label" style="visibility: hidden;"
							for="uplanAmount">投资金额须为1000的整数倍且不能为空</label> -->
				<label class="ui-term-error error" id="uplanAmount-error-label" for="uplanAmount"></label>
			</div>
			<div class="button-wrapper">
				<input value="开始计算" class="ui-button-cal" id="calcbt" type="button">
			</div>
		</div>
		<div class="fn-left cal-right fn-clear">
			<ul class="fn-left cal-items border-left border-right">
				<li class="item">
					<ul class="cal-result">
						<li class="title">1个月</li>
						<!-- 1个月 -->
						<li class="result fn-clear">
							<div class="result-graph fn-left">
								<span class="cal-income" id="income1" style="width: 35px;"></span>
							</div>
							<div class="result-num fn-left" id="incomeV1">50.00元</div>
						</li>
					</ul>
				</li>
				<li class="item">
					<ul class="cal-result">
						<li class="title">3个月</li>
						<li class="result fn-clear">
							<div class="result-graph fn-left">
								<span class="cal-income" id="income3" style="width: 51px;"></span>
							</div>
							<div class="result-num fn-left" id="incomeV3">165.00元</div>
						</li>
					</ul>
				</li>
				<li class="item">
					<ul class="cal-result">
						<li class="title">6个月</li>
						<li class="result fn-clear">
							<div class="result-graph fn-left">
								<span class="cal-income" id="income6" style="width: 90px;"></span>
							</div>
							<div class="result-num fn-left" id="incomeV6">360.00元</div>
						</li>
					</ul>
				</li>
			</ul>
			<ul class="fn-left cal-items">
				<li class="item">
					<ul class="cal-result">
						<li class="title">12个月</li>
						<li class="result fn-clear">
							<div class="result-graph fn-left">
								<span class="cal-income" id="income12" style="width: 109px;"></span>
							</div>
							<div class="result-num fn-left" id="incomeV12">880.00元</div>
						</li>
					</ul>
				</li>
				<li class="item">
					<ul class="cal-result">
						<li class="title">24个月</li>
						<li class="result fn-clear">
							<div class="result-graph fn-left">
								<span class="cal-income" id="income24" style="width: 138px;"></span>
							</div>
							<div class="result-num fn-left" id="incomeV24">2,000.00元</div>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>
