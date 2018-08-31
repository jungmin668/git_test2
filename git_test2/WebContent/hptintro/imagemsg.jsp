<%@page import="hptintro.introDAO"%>
<%@page import="hptintro.introDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>병원이미지관리</title>
</head>
<%
String mem_idx = request.getParameter("mem_idx");

introDAO dao = new introDAO();

introDTO dto = dao.selectView(mem_idx);

pageContext.setAttribute("dto", dto);
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
<!-- 본문 내용 -->
	<div>	
	<form name="fileFrm" method="post"
			enctype="multipart/form-data"
			action="../hptintro/imageShow";">
	<input type="hid den" name="mem_idx" value="<%=mem_idx %>" /><br />		
		현재 병원 사진입니다.<br />
		<p style="text-align:center">
			<img src="../Upload/${dto.mem_img }" />
		</p>
		<br />
		<br />
		사진업로드 : <input type="file" name='mem_img' value="${dto.mem_img }"/>
		<br />
		<br />
	<p style="text-align:center;">
		<input type="submit" class="btn btn-primary" value="사진변경하기" />
	</p>	
	</form>
	<br /><br /><br /><br /><br /><br /><br /><br /><br />
	</div>
</article>
</div>
</div>
<%@ include file="../include/sourcecopy_bottom.jsp" %>
</body>
</html>