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
<%@ include file="../include/sourcecopy_header.jsp" %>
<div class="container">	
	<br/>
	<div style="text-align:center;">
	<b><span style="color:red; font-size:20pt">우리 병원의 총 평점은   점 입니다.</span></b>
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
	font-size: 1.8em;
}
td{
	font-size: 1.3em;
}
</style>

			<div class="box-type srch-box">
					<form>
<!-- 게시판 리스트  -->
<!-- table>tr*2>td*6 -->
<table class="table table-bordered table-hover">
<colgroup>
	<col width="80px" />
	<col width="*" />
	<col width="120px" />
	<col width="120px" />
	<col width="80px" />
	<col width="50px" />
</colgroup>
<thead>
	<tr>
		<th class="text-center">번호</th>
		<th class="text-center">제목</th>
		<th class="text-center">작성자</th>
		<th class="text-center">작성일</th>
		<th class="text-center">조회수</th>
	</tr>
</thead>
<tbody>
<%
//if(bbs.isEmpty()){
	//컬렉션에 저장된 데이터가 없는경우
%>
<!-- 
		<tr>
			<td colspan="5" align="center">
				등록된 게시물이 없습니다^^
			</td>
		</tr>
 -->
<%
/* 
}
else
{
	//컬렉션에 저장된 데이터가 있는경우 for-each문을통해
	//내용 출력
	int vNum = 0;
	int countNum = 0;
 	for(HomepyBoardDTO dto : bbs){
 		pageContext.setAttribute("dto", dto);
 		vNum = totalRecordCount - 
			(((nowPage-1)*pageSize)+countNum++);
 		//String fileName = request.getServletContext().getRealPath("/Upload")+File.separator+dto.getChumfile();
 */
%>	
	<!-- 반복시작 -->	
	<tr>
		<td class="text-center"><a href="#">번호</a></td>
		<td class="text-center">게시글</td>
		<td class="text-center">작성자</td>
		<td class="text-center">작성일</td>
		<td class="text-center">조회수</td>
	</tr>
	<!-- 반복끝 -->
<%
/* 
	}//for-each문 끝
}//if문 끝
 */
%>
</table>
</form>

<!-- 페이지번호 -->
<div class="row text-center">
	<ul class="pagination">
		<!-- <li><span class="glyphicon 
			glyphicon-fast-backward"></span></li>
		
		<li class="active"><a href="#">1</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		
		<li><span class="glyphicon 
			glyphicon-fast-forward"></span></li> -->
		<%-- <%=PagingUtil.pagingHomepy(totalRecordCount,
			pageSize, 
			blockPage,
			nowPage,
			"sub03.jsp?"+queryStr) %> --%>
	</ul>
</div>
			</div>

		</article>
		<!--// Contents -->
	</div>	
</div>
<%@ include file="../include/sourcecopy_bottom.jsp" %>
</body>
</html>