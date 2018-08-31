<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 - 좌메뉴</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<script src="../bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>

<!--  통계 그래프를 위한 CDN (script & link) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
</head>
<!-- 
http://localhost:8080/TeamProj/stats/StatsViewYear 원본
http://localhost:8080/TeamProj/stats/Statsview
 -->
<body>

				<aside id="aside">
					<!-- snb wrap -->
						<div class="snb-wrap" >
						<h2 class="tit-snb">
							통계 자료
						</h2>
						<nav class="snb">
							<ul style="text-align:left;">
								<li>
									<a href="../stats/statics_main1_year_gender.jsp" class="depth1" value="1">${LoginView.h_name } 병원 현황보고</a>
									<ul class="snb_depth2" style="display:block;">
										<li>
											<form action="StatsViewYear" method="post" >
											<a href="" class="depth2">- ${LoginView.h_name } 년/월별 조회수</a></li>
											<input type="hidden" value="1" name="search_h_idx"/>
											</form>
										<li>
											<form action="StatsViewYear" method="post" >
											<a href="" class="depth2" >
												- ${LoginView.h_name } 최근 1주일 조회수
											<input type="hidden" value="1" name="search_h_idx"/>
											</form>
											</a>
										</li>
										<!-- <li class="node2"><a href="" class="depth2">- ***병원 요일별 누적 조회수</a></li> -->
									</ul>
								</li>
								<!-- 
								<li>
									<a href="" class="depth1">월별 보고서</a>
									<ul class="snb_depth2" style="display:block;">
										<li class="node2 current"><a href="" class="depth2">- 성별/연령분포표</a></li>
					</form>
										<li class="node2"><a href="" class="depth2">- 온라인 예약 현황</a></li>
									</ul>
								</li>
								 -->
								<li>
									<a href="/seoul/treatment/ethics_info.asp" class="depth1">${LoginView.h_name } 예약 보고서</a>
									<ul class="snb_depth2" style="display:block;">
										<li class="node2"><a href="" class="depth2">- ${LoginView.h_name } 월별 예약 현황</a></li>
										
									</ul>
								</li>
							</ul>
						</nav>
					</div>
				</aside>
</body>
</html>