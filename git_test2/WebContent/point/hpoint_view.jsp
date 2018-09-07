<%@page import="util.PagingUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%

//한글깨짐처리
request.setCharacterEncoding("UTF-8");
/*
  상세보기의 경우 작성자 본인이 아니더라도 열람할수 
있어야 한다.
  대신 수정, 삭제의 경우에만 회원인증을 통하여 작성자
본인만 할수 있도록 처리한다.
*/
%>
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
							<a href="../point/HpointList" class="depth1">우리 병원 평점</a>
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

<style>
th{
	font-size: 1.2em;
}
td{
	font-size: 1.1em;
}
</style>

		<!-- 
		<div class="col-xs-9 col-md-9">
		 -->					
			<!-- Contents 시작 -->
<br/><br/>	
<form>		
<table class="table table-bordered table-striped">
<colgroup>
	<col width="30%"/>
	<col width="*"/>
</colgroup>
<tbody>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">총 평점</th>
		<td>${dto.p_total }</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">병원내원일</th>
		<td>${dto.p_visitdate }</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">청결도</th>
		<td>${dto.p_clean }</td>
	</tr>
	<tr>
		<th class="text-center"
			style="vertical-align:middle;">편의시설</th>
		<td>
			${dto.p_cvn }
		</td>
	</tr>
	<tr>
		<th class="text-center"
			style="vertical-align:middle;">대기시간</th>
		<td>
			${dto.p_wtime }
		</td>
	</tr>
	<tr>
		<th class="text-center"
			style="vertical-align:middle;">기타 내용</th>
		<td>
			${dto.p_content }
		</td>
	</tr>
</tbody>
</table>

<!-- 각종 버튼 -->
<div class="row text-center" style="padding-right:50px;"> 
	<button type="button" class="btn btn-warning" onclick="location.href='../point/HpointReply?p_num=${dto.p_num}&nowPage=${param.nowPage}';">답글달기</button>
	<button type="button" class="btn btn-danger" 		
	onclick="location.href='../point/HpointList?nowPage=${param.nowPage}';">리스트보기</button>
</div>
</form>						
							
		<!-- 댓글리스트
		<c:forEach items="${c_lists }" var="row" varStatus="loop">
		<div class="media">	
			<div class="media-body row text-left">
				<p style="font-size:1.1em;">
					<code>작성자</code> : ${row.com_id }&nbsp;&nbsp;&nbsp;&nbsp;
					<code>작성일</code> : ${row.com_postdate }
				</p>
				<p class="bg-info" style="padding:10px; font-size:1.1em;">
					${row.com_content }
				</p>
			</div>		
		</div>
		<hr>
		</c:forEach>
		-->
				
				</div>
			</div>

		</article>
		<!--// Contents -->
	</div>
	<br/><br/>	
</div>
<%@ include file="../include/sourcecopy_bottom.jsp" %>
</body>
</html>