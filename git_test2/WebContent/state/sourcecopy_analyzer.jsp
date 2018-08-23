<!-- 
	※ 모든 태그의 id는 중복불가..
	※ 모든 태그의 id는 중복불가..
	※ 모든 태그의 id는 중복불가..
	※ 모든 태그의 id는 중복불가..
	※ 모든 태그의 id는 중복불가..
 -->


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



</head>
<body>
<!-- 상단영역 -->
<%@ include file="../include/sourcecopy_header.jsp" %>

<!-- analyzer chart start -->

<div class="container" >
		<!-- container-header -->
		<div class="container-header">
			<div class="inner">
				<h1 class="tit-page">통계자료</h1>
				<p class="summary">$$$병원의 통계자료를 확인하실 수 있습니다.</p>
				<!-- quick medical -->
								<div class="quick-medical">
					<ul>
						<li><a href="/seoul/treatment/search.asp"><i class="ico ico-srch5"></i><span>의료진검색</span></a></li>
						<li><a href="/seoul/reservation/reservation.asp"><i class="ico ico-cal4"></i><span>온라인예약</span></a></li>
						<li><a href="/seoul/reservation/certificate.asp?tabIndex=1"><i class="ico ico-certificate4"></i><span>증명서발급</span></a></li>
					</ul>
				</div>
				<!--// quick medical -->
			</div>
		</div>
		<!--// container-header -->
		
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
								<li class="current">
									<a href="/seoul/treatment/search.asp" class="depth1">이번달 보고서</a>
								</li>
								<li>
									<a href="/seoul/treatment/treatment_parts.asp" class="depth1">아파GO $$$병원 실시간 검색 현황보고</a>
								</li>
								<li>
									<a href="/seoul/treatment/center_clinic.asp" class="depth1">평점관리 보고서</a>
									<ul class="snb_depth2" style="display: block;">
										<li class="node2"><a href="/seoul/treatment/center_clinic.asp?tabIndex=0" class="depth2">- 병원평점 관리</a></li>
										<li class="node2"><a href="/seoul/treatment/center_clinic.asp?tabIndex=1" class="depth2">- 담당의 평점 관리</a></li>
									</ul>
								</li>
								<li class="fold">
									<a href="/seoul/treatment/ethics_info.asp" class="depth1">병원 후기</a>
									<ul class="snb_depth2" style="display: block;">
										<li class="node2 current"><a href="/seoul/treatment/medicaments_info.asp" class="depth2">- 병원평점 한눈에 보기</a></li>
										<li class="node2"><a href="http://www.e-irb.com/index.jsp?irbcd=20b237a1cb4549745266b0588a7f12a8" target="_blank" class="depth2">- 담당의 평점 한눈에 보기</a></li>
										
									</ul>
								</li>
							</ul>
						</nav>
					</div>
				</aside>
				<!--// aside -->
<!--// 좌측 작은 메뉴(aside) -->

				<hr>
				<!-- contents -->
				<article class="contents">
					<div class="report_thismonth" style="text-align:left;">
						<h3 style="padding-bottom:5px;">이번달 내원환자</h3>
						<h5>이번달 병원내원 환자수 입니다.</h5>
					</div>

					<div class="cont"><!-- 그래프 div -->
						<div class="chartjs-wrapper">
<!-- 바 그래프 -->
<!-- 
							<canvas id="myChart" style="background-color:lightgray" width="10px" height="10px"></canvas>
							<script>
							var ctx = document.getElementById("myChart").getContext('2d');
							var myChart = new Chart(ctx, {												//차트선언
							    type: 'bar',															//차트타입
							    data: {																	//차트데이터 Object배열
							        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],		//라벨배열
							        datasets: [{														//데이터 Object 배열
							            label: '# of Votes',											//차트라벨명
							            data: [12, 19, 3, 5, 2, 3],										//데이터 배열
							            backgroundColor: [
							                'rgba(255, 99, 132, 0.2)',									//차트배경색
							                'rgba(54, 162, 235, 0.2)',
							                'rgba(255, 206, 86, 0.2)',
							                'rgba(75, 192, 192, 0.2)',
							                'rgba(153, 102, 255, 0.2)',
							                'rgba(255, 159, 64, 0.2)'
							            ],
							            borderColor: [
							                'rgba(255,99,132,1)',										//차트 테두리색
							                'rgba(54, 162, 235, 1)',
							                'rgba(255, 206, 86, 1)',
							                'rgba(75, 192, 192, 1)',
							                'rgba(153, 102, 255, 1)',
							                'rgba(255, 159, 64, 1)'
							            ],
							            borderWidth: 1 													//차트 테두리 두께
							        }]
							    },
						    	options: {																//옵션 : 추가하고싶은 옵션이 있을때 사용
							    		layout: {
							    			padding: {
						    					left: 0,
						    					right: 0,
						    					top: 0,
						    					bottom: 0 }
				    					}
								        scales: {
								            yAxes: [{														//y축 관련된 옵션
								                ticks: {
								                    beginAtZero:true 										//데이터 표기를 '0'부터 표기한다.
								                }
								            }]
					       	 			}
						    	}
							});
							</script>
 -->
<!--// 바 그래프 -->
<!-- 라인그래프 -->
							<canvas id="chartjs-0" class="chartjs" width="undefined" height="undefined"></canvas>
							<script>
							new Chart(document.getElementById("chartjs-0"),{
								"type":"line",
								"data":{
									"labels":["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
									"datasets":[{
										"label":"My First Dataset",
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

<!-- 중간 탭 메뉴 -->
					<div class="tab-wrap mar-t30">
						<ul class="tab-nav tab-type3" style="padding-bottom: 46px;">
							<li class="current">
								<a href="/seoul/treatment/medicaments_info.asp">성별/연령 분포표</a>
							</li>
							<li><a href="/seoul/treatment/medicaments_data.asp">자료실</a></li>
							<li><a href="/seoul/treatment/medicaments_notice.asp">공지사항</a></li>
						</ul>
					</div>
<!--// 중간 탭 메뉴 -->
					<div class="mypichart" style="align:left;">
						<h4>성별 분포표</h4>
							<canvas id="chartjs-4" class="chartjs" width="undefined" height="undefined"></canvas>
							<script>
							new Chart(document.getElementById("chartjs-4"),{
								"type":"doughnut",
								"data":{
									"labels":["남자","여자"],
									"datasets":[{
										"label":"My First Dataset",
										"data":[209,168],
										"backgroundColor":["rgb(54, 162, 235)","rgb(255, 99, 132)"]
									}]
								}
							});
							</script>
					</div>
					
					</div>
				</article>
				<!--// Contents -->
			</div>
		</div>
		<!--// contents-wrap -->

		
</div>
<!-- analyzer chart end -->
<!-- 하단영역 -->
<%@ include file="../include/sourcecopy_bottom.jsp" %>
</body>
</html>