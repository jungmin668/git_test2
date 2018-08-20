<%@page import="util.PagingUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제목은 여기에</title>
<link rel="stylesheet" href="../common/bootstrap3.3.7/css/bootstrap.min.css" />
<script src="../common/bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="container">
	<%@ include file="../include/sourcecopy_header.jsp" %>
	<br/>
	<div style="text-align:center;">
	<b><span style="color:blue; font-size:13pt">우리 병원의 총 평점은 <%@include file="star.jsp" %>&nbsp;&nbsp;  입니다.</span></b>
	</div>
	<br/><br/>
	<div class="inner">
		<!-- aside -->
		<aside id="aside">
			<!-- snb wrap -->
				<div class="snb-wrap">
				<h2 class="tit-snb">평점 관리</h2>
				<nav class="snb">
					<ul>
						<li class="current">
							<a href="/seoul/treatment/search.asp" class="depth1">우리 병원 평점</a>
						</li>
						<li>
							<a href="/seoul/treatment/treatment_parts.asp" class="depth1">의사별 평점</a>
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

<style>
th{
	font-size: 1.2em;
}
td{
	font-size: 1.1em;
}
</style>

			<div class="box-type srch-box">
					<form>
			<!-- 게시판 리스트  -->
			<div class="col-xs-9 col-md-9">
				<h3>
					방명록 -(한줄게시판) <small>방명록 입니다.</small>
				</h3>

				<div class="row" style="text-align: right; border-bottom: 1px solid #dddddd; padding: 10px;">
					<button class="btn btn-success" onclick="location.href='write.do';">
						방명록쓰기</button>
				</div>
				<!-- 방명록 반복부분 S -->
				<c:forEach items="${lists }" var="row">
					<div class="media">
					<div class="media-left">
						<img src="../common/img_avatar3.png" class="media-object"
							style="width: 60px">
					</div>
					<div class="media-body">
						<h4 class="media-heading">작성자: ${row.name }(${row.id })</h4>
						<p>
							 ${row.contents }
						</p>
					</div>
					
					<!-- 수정 삭제 버튼  -->
					<div class="media-right">
					<!-- 작성자 본인에게만 수정 / 삭제 버튼 보임 -->
					<c:if test="${sessionScope.siteUserInfo.id eq row.id }">
						<button class="btn btn-primary"onclick="location.href='modify.do?idx=${row.idx}';">수정</button>
						<button class="btn btn-danger"onclick="javascript:deleteRow(${row.idx});">삭제</button>
					</c:if> 	 
					</div>
				</div>
				</c:forEach>
				
				<!-- 방명록 끝부분 E -->
				<!-- 페이지번호 -->
				<div class="row text-center">
				<!-- 페이지 번호 부분 -->
					<ul class="pagination">${pagingImg }
					</ul>
				</div>
			</div>
			</div>

		</article>
		<!--// Contents -->
	</div>
	

	<%@ include file="../include/sourcecopy_bottom.jsp" %>
</div>
</body>
</html>