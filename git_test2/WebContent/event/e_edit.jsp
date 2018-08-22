<%@page import="util.JavascriptUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("USER_ID")==null){
	 JavascriptUtil.jsAlertLocation("로그인 정보가 없습니다.", "../member/login.jsp", out);
	 /*위의 JS함수 동작 후 return이 없으면 아래 JSP코드가 실행될 수 있기 때문에
	 반드시 return으로 실행을 멈춰줘야 한다.*/
	 return;
}
//수정하기는 기본적으로 상세보기와 동일하고, 가져온 내용을 글쓰기 폼의 value속성에 삽입해주면 된다.
String num = request.getParameter("num");

/*
작성자 본인만 수정할 수 있도록 하기 위해서 해당페이지에서도 세션영역의 아이디와
게시물의 작성자를 비교하여 처리한다.
*/
String session_id = session.getAttribute("USER_ID").toString();

//if(!(session_id.equals(dto.getId()))){
%>
<!-- 
	<script>
		alert("작성자 본인만 수정할 수 있습니다.");
		history.back();
	</script>
 -->	
<%	
	//return;
//}

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkWrite(f){
		if(f.title.value==""){
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}if(f.content.value==""){
			alert("내용을 입력하세요");
			f.content.focus();
			return false;
		}
	}
</script>
</head>
<body>
<center>
	<div id="wrap">
		

		<img src="../images/space/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			
			<div class="right_contents">
				
<div>
<!-- <form enctype="multipart/form-data"> -->
<form name = "writeFrm" method = "post" action="EditProc.jsp" onsubmit="return checkWrite(this);">
<table class="table table-bordered">
<colgroup>
	<col width="20%"/>
	<col width="*"/>
</colgroup>

<tbody>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">작성자</th>
		<td>
			<input type="text" class="form-control" name="id" value="${dto.id}"
				style="width:100px;" />
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">이메일</th>
		<td>
			<input type="text" class="form-control" name="email" value="${dto.email}"
				style="width:400px;" />
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">제목</th>
		<td>
			<input type="text" class="form-control" name="title" value="${dto.title}"/>
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">내용</th>
		<td>
			<textarea rows="10" class="form-control" name="content">${dto.content }</textarea>
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">첨부파일</th>
		<td>
			<input type="file" class="form-control" name="chumfile" value="${dto.chumfile}"/>
		</td>
	</tr>
</tbody>
</table>

<div class="row text-center" style="">
	<!-- 각종 버튼 부분 -->
	
	<button type="submit" class="btn btn-danger">작성완료</button>
	<button type="reset" class="btn">Reset</button>
	<button type="button" class="btn btn-warning" 
		onclick="sub01_t_list.jsp">리스트보기</button>
</div>
</form> 
				</div>
			</div>
		</div>

	</div>


	</center>
</body>
</html>