<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아파GO 평점관리</title>
<link rel="stylesheet" href="../bootstrap3.3.7/css/bootstrap.min.css" />
<script src="../bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>
<script src="../bootstrap3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../include/sourcecopy_header.jsp" %>
<div class="container">	
	<div class="inner">
		<!-- aside -->
		<aside id="aside">
			<!-- snb wrap -->
				<div class="snb-wrap">
				<h2 class="tit-snb">평점 관리</h2>
				<nav class="snb">
					<ul>
						<li class="current">
							<a href="hpoint.jsp" class="depth1">우리 병원 평점</a>
						</li>
						<li>
							<a href="dpoint.jsp" class="depth1">의사별 평점</a>
						</li>
					</ul>
				</nav>
			</div>

			<!--// snb wrap -->
		</aside>
		<!--// aside -->
		<hr>
		<!-- contents -->
		<article class="contents">
		<br/>
		<div class="box-type srch-box">
			<span class="tit-box">의료진 검색</span>
			<div class="srch">
				<form name="searchFrm" action="search.asp" method="post" onsubmit="return nullchk();">
				<input type="text" name="st" class="size354" placeholder="의사명으로 검색해주세요" title="의료진명 검색어 입력"></span>
				<button type="submit" class="btn btn-md btn-primary"><em>검색하기</em></button>
				</form>
			</div>
		</div>
		<div id="doctorList" class="section mar-t60">
				
					<h3 class="tit-line">치과</h3>
					<div class="list-wrap">
						
						<ul>
							
							<li>
								<div class="doctor-list">
									<span class="thumb" data-img="/git_test2/file/gongyu2.png" style="background-image: url(&quot;/git_test2/file/gongyu2.png&quot;);"></span>
									<div class="info">
										<strong class="name">공유 교수</strong>
										<ul>
											<li><i>진료과</i> 치과</li>
											<li><i>전문분야</i> <span>임플란트, 보존</span></li>
										</ul>
										<div class="btn-area w150">
											<a data-toggle="modal" href="#myModal" class="btn btn-song btn-line"><em>평점</em></a>
										</div>
									</div>
								</div>
							</li>
							
							<li>
								<div class="doctor-list">
									<span class="thumb" data-img="/git_test2/file/taehee3.png" style="background-image: url(&quot;/git_test2/file/taehee3.png&quot;);"></span>
									<div class="info">
										<strong class="name">김태희 교수</strong>
										<ul>
											<li><i>진료과</i> 치과</li>
											<li><i>전문분야</i> <span>보철</span></li>
										</ul>
										<div class="btn-area w150">
											<a data-toggle="modal" href="#myModal" class="btn btn-song btn-line"><em>평점</em></a>
										</div>
									</div>
								</div>
							</li>
							
						</ul>
<!-- 평점 모달 창 -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
	<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">				
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">평점(의사)</h4>
			</div>
			<div class="modal-body">
				<p class="form-inline">
				<table class="table table-bordered table-striped" style="font-size:1.2em;">
					<tr>
						<th>친절도</th>
						<td>1점</td>
					</tr>
					<tr>
						<th>진료만족도</th>
						<td>2점</td>
					</tr>
					<tr>
						<th>총 평점</th>
						<td>3점</td>
					</tr>
					<tr>
						<th>병원내원일</th>
						<td>4점</td>
					</tr>										
				</table>
				</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>		  
	</div>
</div>
					</div>
					
				</div>
			</div>
		</div>
		</article>
		<!--// Contents -->
	</div>	
</div>


<%@ include file="../include/sourcecopy_bottom.jsp" %>
</body>
</html>