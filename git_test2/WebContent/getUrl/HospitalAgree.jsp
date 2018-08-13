<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
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
<%
URL url = new URL("https://www.paik.ac.kr/seoul/member/agreement.asp");

InputStreamReader reader = new InputStreamReader(url.openStream());
BufferedReader br = new BufferedReader(reader);
String inLine = null;
StringBuffer contents = new StringBuffer();
//URL을 통해 가져온 내용을 라인단위로 읽기
while((inLine=br.readLine()) != null)
{
	contents.append(inLine);
}

//스트림 소멸
br.close();
/* 
String content = contents.toString();
content.replace("?180711","");
out.println(content);
 */

out.println(contents);
 
//String[] halfArr = contents.toString().split("<div class=\"record_result\">"); 
%>
</body>
</html>