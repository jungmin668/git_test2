<%@page import="java.util.List"%>
<%@page import="hptintro.docDTO"%>
<%@page import="hptintro.introDTO"%>
<%@page import="hptintro.introDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>병원관리</title>
<link rel="stylesheet" href="../bootstrap3.3.7/css/bootstrap.min.css" />
<script src="../bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>
<script src="../bootstrap3.3.7/js/bootstrap.min.js"></script>
</head>
<%
//String mem_idx = "154306";

//세션영역에 저장된 병원 idx 를 가져온다.
String mem_idx = 
	session.getAttribute("IDX").toString();
//dao에 정의한 getMemberInfo 메소드를 호출한다.
/* HomepyMemberDTO dto = dao.getMemberInfo(HPT_IDX); */
introDAO dao = new introDAO(); 

introDTO dto = dao.selectView(mem_idx);
List<docDTO> bbs = dao.docList(mem_idx);
//String hpt_image = request.getAttribute("chumfile").toString();

//EL식 사용위해 페이지 영역에 저장하기
pageContext.setAttribute("dto", dto);

dao.close();//DB자원반납
%>
<body>
<%@ include file="../include/sourcecopy_header.jsp" %>
<div class="container">
	<div class="inner">
	<!-- <h3>병원관리 메뉴 메인 페이지 입니다</h3> -->
	<!-- aside -->
	<aside id="aside">
		<!-- snb wrap -->
		<div class="snb-wrap">
			<h2 class="tit-snb">병원 소개</h2>
			<nav class="snb">
				<ul>
					<li>
						<a href="../hptintro/infoShow?mem_idx=<%=mem_idx %>" class="depth1">병원정보관리</a>
					</li>
					<li>
						<a href="../hptintro/docShow?mem_idx=<%=mem_idx %>" class="depth1">의사관리</a>
					</li>
					<li>
						<a href="../hptintro/imageShow?mem_idx=<%=mem_idx %>" class="depth1">병원사진관리</a>
					</li>
				</ul>
			</nav>
		</div>
		<!--// snb wrap -->
	</aside>
	<br />
	
	<!-- contents -->
	<article class="contents">
	<table class="table table-bordered">
		<tr>
			<td colspan="6" style="text-align:center;">
				<img src="../Upload/${dto.mem_img }" />
			</td>
		</tr>		
		<tr class="success">
			<td style="width:30%;"><span class="dis_inBlock">병원명</span></td>
			<td colspan="5" style="width:*;">${dto.mem_name }</td>
		</tr>
		<tr>
			<td>주소1</td>
			<td colspan="5">${dto.addr1 }</td>
		</tr>
		<tr>
			<td>주소2</td>
			<td colspan="5">${dto.addr2 }</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td colspan="5">${dto.tel }</td>
		</tr>
		<tr style="height:300px;">
			<td>병원소개</td>
			<td colspan="5">${dto.mem_dis }</td>
		</tr>
		<tr>
			<td colspan="6">의사소개</td>
		</tr>
		<tr>
			<th>성명</th>
			<th>진료과목</th>
			<th>성별</th>
			<th>연령</th>
			<th>경력</th>
			<th>스케줄</th>
		</tr>
	<%
		for(docDTO dto2 : bbs){
	%>		
		<!-- 의사 리스트 반복 -->
		<tr>
			<td><%=dto2.getDoc_name() %></td>
			<td><%=dto2.getDoc_major() %></td>
			<td><%=dto2.getDoc_gender() %></td>
			<td><%=dto2.getDoc_age() %></td>
			<td><%=dto2.getDoc_career() %></td>
			<td><%=dto2.getDoc_sc() %></td>
		</tr>
		<!-- 의사 리스트반복 -->		
	
	<%
		}
	%>	
	</table>	
	</div>
	</article>
		<!--// Contents -->
	</div>
</div>
<%@ include file="../include/sourcecopy_bottom.jsp" %>
</body>
</html>