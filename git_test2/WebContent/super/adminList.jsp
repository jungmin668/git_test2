<%@page import="util.PagingUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="model.HospitalDAO"%>
<%@page import="model.HospitalMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

HospitalDAO dao = new HospitalDAO();

Map<String,Object> param = new HashMap<String,Object>();

String queryStr = "";

String searchWord = 
request.getParameter("searchWord");
if(searchWord!=null){
//입력한 검색어가 있다면 맵에 추가함
param.put("Word", searchWord);

//파라미터 추가
queryStr = String.format("searchWord=%s&", 
		searchWord);
}


//페이지 처리를 위한 로직 시작
//1.게시판 테이블의 전체 레코드 갯수 구하기
int totalRecordCount = 
dao.getTotalCount(param);   

//2.web.xml에 설정된 값 가져오기
int pageSize = 7;
int blockPage = 2;

//3.전체페이지수 계산하기
int totalPage = 
(int)Math.ceil((double)totalRecordCount/pageSize);

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

List<HospitalMemberDTO> bbs = dao.memberList(param); 
String pagingImg = PagingUtil.pagingImgServlet(totalRecordCount, pageSize, blockPage, nowPage, 
		"adminList.jsp?"+queryStr);

dao.close();

pageContext.setAttribute("pagingImg", pagingImg);

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제목은 여기에</title>
<link rel="stylesheet" href="../bootstrap3.3.7/css/bootstrap.min.css" />
<script src="../bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>
</head>
<script>
function searchCheck(f){
	if(f.searchWord.value==""){
		alert("검색할 단어를 입력하세요");
		f.searchWord.focus();
		return false;
	}
}
</script>
<body>
<%@ include file="../include/sourcecopy_header_admin.jsp" %>
<div class="container">
<br/><br/><br/>
	
	<h2>병원명을 검색하세요.</h2>
<form class="form-inline" name="sFrm" onsubmit="return searchCheck(this);">
	<!-- <div class="form-group">
		<select name="searchColumn" class="form-control">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="both">제목+내용</option>
		</select>
	</div> -->
	<div class="input-group">
		<input type="text" name="searchWord"  class="form-control"/>
		<div class="input-group-btn">
			<button type="submit" class="btn btn-default">
				<i class="glyphicon glyphicon-search"></i>
			</button>
		</div>
	</div>
</form>	
<br/>
		<h4>검색결과</h4>
		<table class="table table-bordered table-striped">
		<colgroup>
			<col width="10%"/>
			<col width="20%"/>
			<col width="10%"/>
			<col width="35%"/>
			<col width="25%"/>			
		</colgroup>
		<tbody>
			<%
if(bbs.isEmpty()){
	//컬렉션에 저장된 데이터가 없는경우
%>
		<tr>
			<td colspan="5" align="center">
				검색결과가 없습니다
			</td>
		</tr>
<%
}
else
{
	//컬렉션에 저장된 데이터가 있는경우 for-each문을통해
	//내용 출력
	int vNum = 0;
	int countNum = 0;
	for(HospitalMemberDTO dto : bbs)
	{
		pageContext.setAttribute("dto", dto);
		//게시물의 번호를 순서대로 출력하기위한
		//가상번호 생성(게시물의 갯수를 기준)
		vNum = totalRecordCount - 
			(((nowPage-1)*pageSize)+countNum++);
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
			<tr>
				<th class="text-center" style="vertical-align:middle;">병원명</th>
				<td>${dto.mem_name }</td>
				<th class="text-center" style="vertical-align:middle;">주소</th>
				<td>
					${dto.addr1}					
				</td>
				<td class="text-center" style="vertical-align:middle;">
				<form action="../main/main.jsp?mem_idx=${dto.mem_idx }">
					<button type="submit">해당병원 관리하러가기</button>
					<input type="hidden" name="mem_idx" value="${dto.mem_idx }"/>
				</form>
				</td>
			</tr>
<%
	}//for-each문 끝
}//if문 끝
%>
		</tbody>
		</table>
		<div class="row text-center">
			<ul class="pagination">
				${pagingImg}
				<!-- 
				<li><span class="glyphicon glyphicon-fast-backward"></span></li>
				
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				
				<li><span class="glyphicon glyphicon-fast-forward"></span></li>
				 -->
			</ul>
		</div>
	<!--	 	
	<form action="../main/main.jsp?mem_idx=154307" onclick="return sessionsave2();">
	<button type="submit">해당병원 관리하러가기</button>
	<input type="hidden" name="mem_idx" value="154307"/>
	</form>
	<form action="../main/main.jsp?mem_idx=154308" onclick="return sessionsave3();">
	<button type="submit">해당병원 관리하러가기</button>
	<input type="hidden" name="mem_idx" value="154308"/>
	</form>
	<form action="../main/main.jsp?mem_idx=154309" onclick="return sessionsave4();">
	<button type="submit">해당병원 관리하러가기</button>
	<input type="hidden" name="mem_idx" value="154309"/>
	</form>
	<form action="../main/main.jsp?mem_idx=154310" onclick="return sessionsave5();">
	<button type="submit">해당병원 관리하러가기</button>
	<input type="hidden" name="mem_idx" value="154310"/>
	</form>
	<form action="../main/main.jsp?mem_idx=154311" onclick="return sessionsave6();">
	<button type="submit">해당병원 관리하러가기</button>
	<input type="hidden" name="mem_idx" value="154311"/>
	</form>
	<form action="../main/main.jsp?mem_idx=154312" onclick="return sessionsave7();">
	<button type="submit">해당병원 관리하러가기</button>
	<input type="hidden" name="mem_idx" value="154312"/>
	</form>
	<form action="../main/main.jsp?mem_idx=154313" onclick="return sessionsave8();">
	<button type="submit">해당병원 관리하러가기</button>
	<input type="hidden" name="mem_idx" value="154313"/>
	</form> -->
	
</div>
	<%@ include file="../include/sourcecopy_bottom.jsp" %>
</body>
</html>