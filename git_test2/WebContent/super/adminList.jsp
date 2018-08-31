<%@page import="model.HospitalMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int a = 0;
HospitalMemberDTO dto = new HospitalMemberDTO();
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

function sessionsave1(){
}
</script>
<body>
<%@ include file="../include/sourcecopy_header.jsp" %>
<div class="container">
<br/><br/><br/>
	<form action="../main/main.jsp?mem_idx=154306" onclick="return sessionsave1();">
	<button type="submit">해당병원 관리하러가기</button>
	<input type="hidden" name="mem_idx" value="154306"/>
	</form>
	<br/><br/><br/>
	<form action="../main/main.jsp?mem_idx=154307" onclick="return sessionsave2();">
	<button type="submit">해당병원 관리하러가기</button>
	<input type="hidden" name="mem_idx" value="154307"/>
	</form>
	<br/><br/><br/>
	<form action="../main/main.jsp?mem_idx=154308" onclick="return sessionsave3();">
	<button type="submit">해당병원 관리하러가기</button>
	<input type="hidden" name="mem_idx" value="154308"/>
	</form>
	<br/><br/><br/>
	<form action="../main/main.jsp?mem_idx=154309" onclick="return sessionsave4();">
	<button type="submit">해당병원 관리하러가기</button>
	<input type="hidden" name="mem_idx" value="154309"/>
	</form>
	<br/><br/><br/>
	<form action="../main/main.jsp?mem_idx=154310" onclick="return sessionsave5();">
	<button type="submit">해당병원 관리하러가기</button>
	<input type="hidden" name="mem_idx" value="154310"/>
	</form>
	<br/><br/><br/>
	<form action="../main/main.jsp?mem_idx=154311" onclick="return sessionsave6();">
	<button type="submit">해당병원 관리하러가기</button>
	<input type="hidden" name="mem_idx" value="154311"/>
	</form>
	<br/><br/><br/>
	<form action="../main/main.jsp?mem_idx=154312" onclick="return sessionsave7();">
	<button type="submit">해당병원 관리하러가기</button>
	<input type="hidden" name="mem_idx" value="154312"/>
	</form>
	<br/><br/><br/>
	<form action="../main/main.jsp?mem_idx=154313" onclick="return sessionsave8();">
	<button type="submit">해당병원 관리하러가기</button>
	<input type="hidden" name="mem_idx" value="154313"/>
	</form>
	<br/><br/><br/>
</div>
<%@ include file="../include/sourcecopy_bottom.jsp" %>
</body>
</html>