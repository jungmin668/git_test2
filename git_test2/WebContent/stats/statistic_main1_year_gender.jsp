<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/login_check.jsp" %>
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


<!-- 검색 스크립트 -->
<script type="text/javascript">
	function Check_h_idx(f){

		if(f.search_h_idx.value==""){
			alert("h_idx를 입력하세요.");
			return false;
		}
		document.searchFrm.submit();
	} 
</script>


</head>
<body>
<!-- 상단영역 -->
<%@ include file="../include/sourcecopy_header.jsp" %>

<!-- analyzer chart start -->


<div class="container">
	
		<!-- 좌측메뉴 + 우측메뉴 -->
		<!-- contents-wrap start -->
		<div class="contents-wrap">
			
			<div class="inner">
				<!-- 좌측 작은 메뉴(aside) -->
				<!-- 상단영역 -->
				<%@ include file="../include/statistics_LeftMenu.jsp" %>
				
				<!--// aside -->
<!--// 좌측 작은 메뉴(aside) -->

				<hr>
				<!-- contents(이번달 보고서) -->
				<article class="contents">

					<div class="report_thismonth" style="text-align:left;">
						<h3 style="padding-bottom:5px;">${LoginView.h_name } 이번달 내원환자</h3>
						<h5>${LoginView.h_name } 이번달 내원 환자수 입니다.</h5>
					</div>
<!-- 검색창의 name값을 통해서 값전달, input태그의 value -->
<!-- 1차 데이트 피커 test
<div class="row text-left">
   <form class="form-inline" name="searchFrm" method="post" action="Statsview">
   	<div class="form-group">
         <input type="text" style="text-align:center; width:150px; height:25px;" value="2018-05-21"
         		class="form-control" id="search_sday" name="search_sday" placeholder="시작일자" />
         <input type="search" name="search_h_idx" class="form-control" placeholder="병원idx를 입력하세요." style="width:50px;" value="1" autofocus />
            <button type="submit" id="btn_search" class="btn btn-default" style="width:50px; height:25px; text:center;">검색</button>
     </div>
   </form>
</div>  
 -->
 <div class="row text-left" style="margin-bottom:20px; padding-left:15px;" >
	<form class="form-inline" name="searchFrm" method="post" action="../stats/Year">
	<div class="form-group">
		<select name="search_year" id="">
			<option value="18">2018년</option>
			<option value="17">2017년</option>
			<option value="16">2016년</option>
		</select>
		<!-- 
		<select name="search_month" id="">
			<option value="01">1월</option>
			<option value="02">2월</option>
			<option value="03">3월</option>
		</select>
			<input type="text"  class="form-control" id="search_sday" name="search_sday" placeholder="시작일자" />
 		- <input type="text"  class="form-control" id="search_eday" name="search_eday" placeholder="종료일자" />
		 -->
		<input type="hid-den" name="search_h_idx" class="form-control" placeholder="h_idx를 입력하세요." value="1" autofocus/>
		<button type="submit" id="btn_search" class="btn btn-default" >검색</button>
	</div>		
	</form>
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
										"label":"월별 내원자수",
										"data":[
											"${stats_month.month_01}",
											"${stats_month.month_02}",
											"${stats_month.month_03}",
											"${stats_month.month_04}",
											"${stats_month.month_05}",
											"${stats_month.month_06}",
											"${stats_month.month_07}",
											"${stats_month.month_08}",
											"${stats_month.month_09}",
											"${stats_month.month_10}",
											"${stats_month.month_11}",
											"${stats_month.month_12}"
										],
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
								<a href="../stats/statistic_main1_year_gender.jsp">성별 분포표</a>
							</li>
							<li>
								<a href="../stats/statistic_main1_year_age.jsp">연령 분포표</a>
							</li>
							<!-- <li><a href="/seoul/treatment/medicaments_notice.asp">요일별 내원 현황</a></li> -->
						</ul>
					</div>
<!--// 중간 탭 메뉴 -->
				<!-- 성별 분포도 시작 -->
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
										"data":["${stats_month_w.visit_count_w}","${stats_month_m.visit_count_m}"],
										"backgroundColor":["rgb(54, 162, 235)","rgb(255, 99, 132)"]
									}]
								}
							});
							</script>
				<!-- 성별 분포도 끝 -->
				<!-- 연령 분포도 시작 -->
				<!-- 
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
				 -->
				<!-- 연령 분포도 끝 -->
					
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