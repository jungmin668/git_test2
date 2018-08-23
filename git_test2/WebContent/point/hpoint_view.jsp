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
<table class="table table-bordered table-striped">
<colgroup>
	<col width="30%"/>
	<col width="*"/>
</colgroup>
<tbody>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">총 평점</th>
		<td>${dto.name }</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">병원내원일</th>
		<td>${dto.postDate }</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">청결도</th>
		<td>${dto.email }</td>
	</tr>
	<tr>
		<th class="text-center"
			style="vertical-align:middle;">편의시설</th>
		<td>
			${dto.title }
		</td>
	</tr>
	<tr>
		<th class="text-center"
			style="vertical-align:middle;">대기시간</th>
		<td>
			${dto.content }
		</td>
	</tr>
</tbody>
</table>

<!-- 각종 버튼 -->
<div class="row text-center" style="padding-right:50px;">
	<!-- 
	<button type="button" class="btn btn-primary"
		onclick="location.href='WriteSkin.jsp';">
		글쓰기</button>
	
	<button type="submit" class="btn btn-default">
		전송하기</button>
	<button type="reset" class="btn">	
		Reset</button>
	 -->	 
	<!-- <button type="button" class="btn btn-success" onclick="location.href='sub03_edit.jsp?num=${dto.num}&board_flag=${dto.board_flag }';">
		수정하기</button>
	<button type="button" class="btn btn-info" onclick="isDelete();">
		삭제하기</button>
	<button type="button" class="btn btn-warning" onclick="location.href='WriteSkin.jsp'">
		답글쓰기</button> -->
	<button type="button" class="btn btn-danger"
		onclick="location.href='hpoint.jsp';">
		리스트보기</button>
</div>	
							
							
			<!-- 댓글리스트 시작-->
			<%
			/* 
			for(CommentBoardDTO dto_c : bbs)
			{
			 */
			for(int i=0;i<5;i++){
			%>
			<div class="media">	
				<div class="media-body row text-left">
					<p style="font-size:1.1em;">
						<code>작성자</code> : b&nbsp;&nbsp;&nbsp;&nbsp;
						<code>작성일</code> : 2018-08-21
					</p>
					<p class="bg-info" style="padding:10px; font-size:1.1em;">
						댓글 내용
					</p>
				</div>		
			</div>
			<hr>
			<%
			}
			/* 
			}
			 */
			%>
			<!-- 댓글리스트 끝-->
				
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