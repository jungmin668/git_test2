<%@page import="util.JavascriptUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
if(session.getAttribute("USER_ID")==null){
	 JavascriptUtil.jsAlertLocation("로그인 정보가 없습니다.", "../main/main.jsp", out);
	 /*위의 JS함수 동작 후 return이 없으면 아래 JSP코드가 실행될 수 있기 때문에
	 반드시 return으로 실행을 멈춰줘야 한다.*/
	 return;
}
request.setCharacterEncoding("UTF-8");
String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");
//커넥션풀로 변경
//BbsDAO dao = new BbsDAO();
/* 
int affected = dao.updateEdit(dto);  
if(affected ==1){
	//수정하기에 성공했을때는 상세보기 화면으로 돌아간다.
	response.sendRedirect("sub0"+flag+"_view.jsp?num="+dto.getNum());
 */	
%>
	<script>
	history.go(-2);
	</script>
<%
/* 
}
else{
 */		
%>
	<script>
		alert("수정하기에 실패하였습니다.");
		history.go(-1);
	</script>
<%
/* 
}
 */
%>