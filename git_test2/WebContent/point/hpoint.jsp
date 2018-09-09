<%@page import="point.PointDTO"%>
<%@page import="java.util.List"%>
<%@page import="util.PagingUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");

int score = Integer.parseInt(request.getAttribute("score").toString());
System.out.println(score);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아파GO 평점관리</title>
<link rel="stylesheet" href="../bootstrap3.3.7/css/bootstrap.min.css" />
<script src="../bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>
<script src="../bootstrap3.3.7/js/bootstrap.min.js"></script>
<script>
function searchCheck(f){
	if(f.searchWord.value==""){
		alert("검색할 단어를 입력하세요");
		f.searchWord.focus();
		return false;
	}
}
</script>
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
		<br/>
	<div style="text-align:center;"> 
	<b><span style="color:blue; font-size:13pt">우리 병원의 총 평점은 <%@include file="star.jsp" %>&nbsp;&nbsp;  입니다.</span></b>
	</div>
	<br/><br/><br/>

<style>
th{
	font-size: 1.2em;
}
td{
	font-size: 1.1em;
}
</style>
<!-- 검색 -->
<div class="row text-right" style="margin-bottom:20px;
	padding-right:50px;">
<form class="form-inline" onsubmit="return searchCheck(this);">
	<div class="form-group">
		<select name="searchColumn" class="form-control">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="both">제목+내용</option>
		</select>
	</div>
	<div class="input-group">
		<input type="text" name="searchWord" class="form-control" />
		<div class="input-group-btn">
			<button type="submit" class="btn btn-info">
				<i class="glyphicon glyphicon-search">
				</i>
			</button>
		</div>				
	</div>
</form>	
</div>
<form>
<!-- 게시판 리스트  -->
<!-- table>tr*2>td*6 -->
<table class="table table-bordered table-hover">
<colgroup>
	<col width="80px" />
	<col width="*" />
	<col width="160px" />
	<col width="120px" />
</colgroup>
<thead>
	<tr>
		<th class="text-center">번호</th>
		<th class="text-center">제목</th>
		<th class="text-center">병원내원일</th>
		<th class="text-center">총 평점</th>
	</tr>
</thead>
<tbody>
	<c:choose>
		<c:when test="${empty lists }">
			<tr>
				<td colspan="4">
					등록된 글이 없습니다
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<!-- 등록된 글이 있을 때 반복하면서 리스트 출력 -->
			<c:forEach items="${lists }" var="row" varStatus="loop">
				<tr>
					<td class="text-center">
					${map.totalCount - (((map.nowPage - 1) * map.pageSize) + loop.index) }</td>
					<c:choose>
					<c:when test="${row.bstep eq 0}"> 
						<td class="text-left">
							<a href="../point/HpointView?p_num=${row.p_num }&nowPage=${param.nowPage}">
								고객님의 평점
							</a>
						</td>			
					</c:when>
					<c:otherwise> 
						<td class="text-left">
							<a href="../point/HpointView?p_num=${row.p_num }&nowPage=${param.nowPage}">
							${row.title }
							</a>
						</td>
					</c:otherwise>
					</c:choose>
					<td class="text-center">${row.p_visitdate }</td>
					<td class="text-center">${row.p_total }</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>	
</tbody>
</table>
</form>
<!-- 각종 버튼 -->
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
</div>
<%@ include file="../include/sourcecopy_bottom.jsp" %>
</body>
</html>