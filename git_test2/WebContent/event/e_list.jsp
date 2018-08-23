<%@page import="model.EventDTO"%>
<%@page import="model.HospitalDAO"%>
<%@page import="util.PagingUtil"%> 
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//한글처리
request.setCharacterEncoding("UTF-8");
  
//커넥션풀로 변경
HospitalDAO dao = new HospitalDAO();

//매개변수 저장을 위한 컬렉션 생성(DAO로 전달)
Map<String,Object> param = new HashMap<String,Object>();

//문자열 검색 파라미터를 페이지 처리 메소드로
//넘겨주기 위한 변수선언
String queryStr = "";

//폼값받기(검색관련)
String searchColumn = 
	request.getParameter("searchColumn");
String searchWord = 
	request.getParameter("searchWord");
if(searchWord!=null){
	//입력한 검색어가 있다면 맵에 추가함
	param.put("Column", searchColumn);
	param.put("Word", searchWord);
	
	//파라미터 추가
	queryStr = String.format("searchColumn=%s"
		+"&searchWord=%s&", searchColumn,
			searchWord);
}


//페이지 처리를 위한 로직 시작
//1.게시판 테이블의 전체 레코드 갯수 구하기


//2.web.xml에 설정된 값 가져오기
int pageSize = 6;
int blockPage = 4;

//3.전체페이지수 계산하기

//4.페이지번호가 없는경우 무조건 1로 설정
int nowPage = 
  request.getParameter("nowPage")==null
  ? 1 : 
  Integer.parseInt(request.getParameter("nowPage"));

//5.가져올 레코드의 구간을 결정하기 위한 연산
int start = (nowPage-1)*pageSize + 1;
int end = nowPage * pageSize;

//6.파라미터 전달을 위해 map에 추가
param.put("start", start);
param.put("end", end);

/////게시판 페이지 처리 로직 끝

  
/*
게시판에서 레코드를 가져올때는 반드시 "List계열"의 
컬렉션을 사용해야 한다. Set계열의 컬렉션은 저장된 요소의
순서를 보장하지 않기때문에 게시판 목록을 구현할때 문제가 
될수있기 때문이다.
*/
List<EventDTO> bbs = dao.selectList(param); 

dao.close();
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap3.3.7/css/bootstrap.min.css" />
<script src="<%=request.getContextPath() %>/bootstrap3.3.7/js/bootstrap.min.js"></script>
<body>
<%@ include file="../include/sourcecopy_header.jsp" %>
<div class="container">	
	<center>
	<div id="wrap">
		
		<div class="contents_box">
			
			
			<div class="right_contents">
				
				<div>
<div class="row text-right" style="margin-bottom:20px;
		padding-right:50px;">
<!-- 검색부분 -->
<form class="form-inline">
	<div class="form-group">
		<select name="searchColumn" class="form-control">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="both">제목+내용</option>
		</select>
	</div>
	<div class="input-group">
		<input type="text" name="searchWord"  class="form-control"/>
		<div class="input-group-btn">
			<button type="submit" class="btn btn-default">
				<i class="glyphicon glyphicon-search"></i>
			</button>
		</div>
	</div>
</form>	
</div>
<div class="row">
	<form>
	<!-- 게시판리스트부분 -->
	<table class="table table-bordered table-hover">
	<colgroup>
		<col width="80px"/>
		<col width="*"/>
		<col width="120px"/>
		<col width="120px"/>
		<col width="80px"/>
		<col width="50px"/>
	</colgroup>
	<thead>
	<tr class="success">
		<th class="text-center">번호</th>
		<th class="text-left">제목</th>
		<th class="text-center">작성자</th>
		<th class="text-center">작성일</th>
		<th class="text-center">조회수</th>
		<th class="text-center">첨부</th>
	</tr>
	</thead>
	
	<tbody>
<%

	//컬렉션에 저장된 데이터가 없는경우
%>
		<tr>
			<td colspan="5" align="center">
				등록된 게시물이 없습니다^^*
			</td>
		</tr>
<%



	//컬렉션에 저장된 데이터가 있는경우 for-each문을통해
	//내용 출력
	int vNum = 0;
	int countNum = 0;
	for(int i = 0 ; i<5;i++)
	{
		//게시물의 번호를 순서대로 출력하기위한
		//가상번호 생성(게시물의 갯수를 기준)
		
		/*
		전체게시물수 : 121개
		현재페이지 : 1
		페이지사이즈 : 10
1페이지일때 
	1번게시물 : 121 - (((1-1)*10) + 0) => 121
	2번게시물 : 121 - (((1-1)*10) + 1) => 120
2페이지일때 
	1번게시물 : 121 - (((2-1)*10) + 0) => 111
	2번게시물 : 121 - (((2-1)*10) + 1) => 110
		*/
%>
	<!-- 리스트반복 -->
	<tr>
		<td class="text-center"><%=vNum %></td>
		<td class="text-left">
			<a href="">
				이벤트 제목
			</a></td>
		<td class="text-center">관리자</td>
		<td class="text-center">작성일</td>
		<td class="text-center">조회수</td>
		<td class="text-center">
		<c:if test="${not empty dto.chumfile }">
			<span class="glyphicon glyphicon-paperclip"></span>					
		</c:if></td>
	</tr>
	<!-- 리스트반복 -->
<%
	}//for-each문 끝
//if문 끝
%>
	
	</tbody>
	</table>
	</form>
</div>
<div class="row text-right" style="padding-right:50px;">
	<!-- 각종 버튼 부분 -->
	<!-- <button type="reset" class="btn">Reset</button> -->
		
	<button type="button" class="btn btn-success" 
		onclick="location.href='sub01_t_write.jsp?'">글쓰기</button>
				
	<!-- <button type="button" class="btn btn-primary">수정하기</button>
	<button type="button" class="btn btn-success">삭제하기</button>
	<button type="button" class="btn btn-info">답글쓰기</button>
	<button type="button" class="btn btn-warning">리스트보기</button>
	<button type="submit" class="btn btn-danger">전송하기</button> -->
</div>
<div class="row text-center">
	<!-- 페이지번호 부분 -->
	<ul class="pagination">
		<!-- <li><span class="glyphicon glyphicon-fast-backward"></span></li>
		<li><a href="#">1</a></li>		
		<li class="active"><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>		
		<li><a href="#">5</a></li>
		<li><span class="glyphicon glyphicon-fast-forward"></span></li>-->
	</ul>	
</div>


				</div>
			
			</div>
		</div>
		
	</div>

	</center>
		
</div>
<%@ include file="../include/sourcecopy_bottom.jsp" %>
 </body>
</html>