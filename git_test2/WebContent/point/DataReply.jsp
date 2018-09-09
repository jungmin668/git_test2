<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name = "viewport" content="width=device-width,initial-scale=1" >
<link rel="stylesheet" href="../bootstrap3.3.7/css/bootstrap.min.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../bootstrap3.3.7/js/bootstrap.min.js"></script>
<style>
	div{
		border:0px solid #000;
	}
</style>
<title>게시판 답변글쓰기</title>
</head>
<body>
<%@ include file="../include/sourcecopy_header.jsp" %>
<div class="container-fluid">
<div class="row ">
	<div class="col-xs-2 col-md-2">
	</div>
			<!-- Contents영역 시작-->
		<div class="col-xs-8 col-md-8">
		<h3>게시판[답변글쓰기]</h3>
		<script>
			function frmValidate(f){
				if(f.title.value==""){
					alert("제목을 입력하세요");
					f.title.focus();
					return false;
				}
				if(f.content.value==""){
					alert("내용을 입력하세요");
					f.content.focus();
					return false;
				}
			}			
		</script>	
		<!--모두 동일함 
			action="../DataRoom/DataWrite"
			action="./DataWrite"
			action="<c:url value="/DataRoom/DataWrite" />"
		 -->	
		<form name="writeFrm" method="post" action="<c:url value="/point/HpointReply" />"
			onsubmit="return frmValidate(this);">
		<!-- 게시물 수정을 위한 일련번호 추가 -->
		<input type="hid-den" name="p_num" value="${dto.p_num }"/>
		<input type="hid-den" name="nowPage" value="${param.nowPage }"/>
		<!-- 답변글쓰기 추가부분 -->
		<input type="hid-den" name="mem_idx" value="${dto.mem_idx }"/>
		<input type="hid-den" name="bgroup" value="${dto.bgroup }"/><!-- 원글의 그룹번호 -->
		<input type="hid-den" name="bstep" value="${dto.bstep }"/>
		<input type="hid-den" name="bindent" value="${dto.bindent }"/>
		<table class="table table-bordered table-striped">
		<colgroup>
			<col width="20%"/>
			<col width="*"/>
		</colgroup>
		<tbody>
			<tr>
				<th class="text-center" style="vertical-align:middle;">제목</th>
				<td>
					<input type="text" class="form-control" name="title" value=""/>
				</td>
			</tr>
			<tr>
				<th class="text-center" style="vertical-align:middle;">내용</th>
				<td>
					<textarea rows= "10" class="form-control" name="p_content"></textarea>
				</td>
			</tr>
		</tbody>
		</table>
		<!-- 각종 버튼 -->
		<div class="row text-center" style="padding-right:50px;">
			<button type = "submit" class="btn btn-default">
				전송하기</button>
			<button type = "reset" class="btn">
				Reset</button>
			<button type = "button" class="btn btn-danger" onclick="location.href='./HpointList?nowPage=${param.nowPage}';">
				리스트보기</button>
		</div>
		</form>
		<!-- Contents영역 끝-->
	</div>
	<div class="col-xs-2 col-md-2">
	</div>
</div>
</div>
<br/><br/>
<%@ include file="../include/sourcecopy_bottom.jsp" %>
</body>
</html>