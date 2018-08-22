<%@page import="util.PagingUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//한글깨짐처리
request.setCharacterEncoding("UTF-8");
/*
  상세보기의 경우 작성자 본인이 아니더라도 열람할수 
있어야 한다.
  대신 수정, 삭제의 경우에만 회원인증을 통하여 작성자
본인만 할수 있도록 처리한다.
*/
String num = request.getParameter("num");
/* 
//커넥션풀로 변경
HomepyDAO dao = new HomepyDAO();

//조회수 증가
dao.updateVisitCount(num); 

//게시물 가져오기
HomepyBoardDTO dto = dao.selectView(num,board_flag);

//EL식 사용위해 페이지 영역에 저장하기
pageContext.setAttribute("dto", dto);
System.out.println(dto.getNum());

List<CommentBoardDTO> bbs = dao.selectList_c(); 

dao.close();//DB자원반납
 */
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아파GO 평점관리</title>
<link rel="stylesheet" href="../bootstrap3.3.7/css/bootstrap.min.css" />
<script src="../bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="container">
	<%@ include file="../sourcecopy_header.jsp" %>
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
<form class="form-inline">
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
<%
/* 
if(bbs.isEmpty()){
	//컬렉션에 저장된 데이터가 없는경우
 */
%>
		<tr>
			<td colspan="4" align="center">
				등록된 게시물이 없습니다
			</td>
		</tr>
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
		<td class="text-center">1</td>
		<td class="text-left"><a href="hpoint_view.jsp?num=">고객님이 남겨주신 우리 병원 평점 1</a></td>
		<td class="text-center">2018-08-21</td>
		<td class="text-center">5점</td>		
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
				<!-- 페이지 번호 부분 -->
					<ul class="pagination">${pagingImg }
					</ul>
				</div>
			</div>
			</div>

		</article>
		<!--// Contents -->
	</div>
	

	<%@ include file="../sourcecopy_bottom.jsp" %>
</div>
</body>
</html>