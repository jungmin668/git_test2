
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="sms.SMS" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap3.3.7/css/bootstrap.min.css" />
<script
	src="<%=request.getContextPath()%>/bootstrap3.3.7/js/bootstrap.min.js"></script>
<!Doctype Html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>SMS프로젝트</title>
</head>
<body>
<%@ include file="../include/sourcecopy_header.jsp"%>
	<form method="post" name="smsForm" action="../sendSMS/smssend.jsp">
		
	 
		<table  class="table table-striped" align="center" >
			<thead>
				<tr> 
				
					<th style="text-align: center;">문자 전송 양식</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<textarea class="form-control" maxlength="45" name="msg"style="height: 220px;" placeholder="해당 병원에서 답글이 달렸습니다."></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<input class="form-control" type="text" name="rphone" value="${dto.tel }" placeholder="${sms }">
						 
						<br />
					</td>
				</tr>
				<tr>
					<td>(받는번호는 010-0000-0000 과 같이 전체 번호로 작성해 주세요. )</td>
					<input type="hidden" value="남은 문자 잔여량 <%= new SMS().getCount()%>" >
				</tr>				 
				<tr>
					<td><input type="hidden" name="action" value="go"> 
					<input type="hidden" name="sphone1" value="010"> 
					<input type="hidden" name="sphone2" value="7184"> 
					<input type="hidden" name="sphone3" value="2976"> 
					<input class="btn btn-primary pull-right" type="submit" value="전송"></td>
				</tr>
			</tbody>
		</table>
		 
	</form>
	<%@ include file="../include/sourcecopy_bottom.jsp"%>
</body>
</html>
