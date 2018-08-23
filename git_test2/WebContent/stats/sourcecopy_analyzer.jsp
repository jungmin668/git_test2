<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 - 통계 페이지</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<script src="../bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>

<!--  통계 그래프를 위한 CDN (script & link) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
<script language="javascript">
function chart_GenderAge(){
	var f=document.form;
	if(f.type[0].checked==true){
		document.all.cattery.style.visibility="hidden";
	}
	else{
		document.all.cattery.style.visibility="visible";
	}
}
</script>


</head>
<body>
<!-- 상단영역 -->
<%@ include file="../include/sourcecopy_header.jsp" %>

<!-- analyzer chart start -->

<div class="container" >
		<!-- contents-wrap start -->
		<div class="contents-wrap">
			<div class="inner">
				<!-- 좌측 작은 메뉴(aside) -->
				<aside id="aside">
					<!-- snb wrap -->
						<div class="snb-wrap">
						<h2 class="tit-snb">통계 자료</h2>
						<nav class="snb">
							<ul style="text-align:left;">
								<li>
									<a href="/seoul/treatment/center_clinic.asp" class="depth1">***병원 실시간 검색 현황보고서</a>
									<ul class="snb_depth2" style="display:block;">
										<li class="node2"><a href="" class="depth2">- 실시간 ***병원 검색보고서</a></li>
										<li class="node2"><a href="" class="depth2">- 실시간 대기자수</a></li>
									</ul>
								</li>
								<li class="current">
									<a href="" class="depth1">월별 보고서</a>
									<ul class="snb_depth2" style="display:block;">
										<li class="node2 current"><a href="" class="depth2">- 성별/연령분포표</a></li>
										<li class="node2"><a href="" class="depth2">- 온라인 예약 현황</a></li>
										<li class="node2"><a href="" class="depth2">- 요일별 내원 현황</a></li>
									</ul>
								</li>
								<li class="fold">
									<a href="/seoul/treatment/ethics_info.asp" class="depth1">예약 보고서</a>
									<ul class="snb_depth2" style="display:block;">
										<li class="node2"><a href="" class="depth2">- 월별 예약 현황</a></li>
										
									</ul>
								</li>
							</ul>
						</nav>
					</div>
				</aside>
				<!--// aside -->
<!--// 좌측 작은 메뉴(aside) -->

				<hr>
				<!-- contents(이번달 보고서) -->
				<article class="contents">
					<div class="report_thismonth" style="text-align:left;">
						<h3 style="padding-bottom:5px;">이번달 내원환자</h3>
						<h5>이번달 병원내원 환자수 입니다.</h5>
					</div>

					<div class="cont"><!-- 그래프 div -->
						<div class="chartjs-wrapper">
<!-- 라인그래프 -->
							<canvas id="chartjs-0" class="chartjs" width="undefined" height="undefined"></canvas>
							<script>
							new Chart(document.getElementById("chartjs-0"),{
								"type":"line",
								"data":{
									"labels":["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
									"datasets":[{
										"label":"올해 내원자수",
										"data":[65,59,80,81,56,55,40,12,53,84,55,59],
										"fill":false,
										"borderColor":"rgb(75, 192, 192)",
										"lineTension":0.1
										}]
								},
								"options":{
									
								}
							});
							</script>
<!--// 라인그래프 -->
						</div><!--// 그래프 div -->

<!-- 중간 탭 메뉴(Onclick 속성 부여 test) -->
					<div class="tab-wrap mar-t30">
						<ul class="tab-nav tab-type3" style="padding-bottom:46px; padding-top:50px">
							<li class="current">
								<a href="/seoul/treatment/medicaments_info.asp" onclick="chart_GenderAge()">성별/연령 분포표</a>
							</li>
							<li><a href="/seoul/treatment/medicaments_data.asp">온라인 예약 현황</a></li>
							<li><a href="/seoul/treatment/medicaments_notice.asp">요일별 내원 현황</a></li>
						</ul>
					</div>
<!--// 중간 탭 메뉴 -->
				<!-- 성별/연령 분포도 시작 -->
					<div class="mypichart">
						<h4>성별 분포표</h4>
							<canvas id="chartjs-gender" class="chartjs" width="undefined" height="undefined"></canvas>
							<script>
							new Chart(document.getElementById("chartjs-gender"),{
								"type":"doughnut",
								"data":{
									"labels":["남자","여자"],
									"datasets":[{
										"label":"내원자 성별 분포표",
										"data":[209,168],
										"backgroundColor":["rgb(54, 162, 235)","rgb(255, 99, 132)"]
									}]
								}
							});
							</script>
						<h4>연령 분포표</h4>
						<canvas id="chartjs-age" class="chartjs" width="undefined" height="undefined"></canvas>
							<script>
							new Chart(document.getElementById("chartjs-age"),{
								"type":"radar",
								"data":{
									"labels":["10대","20대","30대","40대","50대","60대","70대","80대","90대"],
										"datasets":[{
											 "label":"연령별 분포표",
											 "data":[10,20,30,40,50,60,70,80,90],
											 "fill":true,
											 "backgroundColor":"rgba(255, 99, 132, 0.2)",
											 "borderColor":"rgb(255, 99, 132)",
											 "pointBackgroundColor":"rgb(255, 99, 132)",
											 "pointBorderColor":"#fff",
											 "pointHoverBackgroundColor":"#fff",
											 "pointHoverBorderColor":"rgb(255, 99, 132)"
											 },
											]},
													 
								"options":{"elements":{"line":{"tension":0,"borderWidth":3}}}});
							</script>
					</div>
				<!-- 성별/연령 분포도 끝 -->
					
					</div>
				</article>
				<!--// Contents -->
				<!-- contents(***병원 실시간 검색현황 보고서) -->
			</div>
		</div>
		<!--// contents-wrap -->
</div>
<!-- analyzer chart end -->
<!-- 하단영역 -->
<%@ include file="../include/sourcecopy_bottom.jsp" %>
</body>
</html>