<%@page import="util.JavascriptUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
	<center>
	<div id="wrap">
		<div class="contents_box">
			<div class="right_contents">
				<div>

<script>
	function isValidate(fn){
		if(fn.title.value==""){
			alert("제목을 입력해주세요");
			fn.title.focus();
			return false;
		}
		if(fn.content.value==""){
			alert("내용을 입력해주세요");
			fn.content.focus();
			return false;
		}
		if(fn.chumfile.value==""){
			alert("파일을 첨부해주세요");
			fn.chumfile.focus();
			return false;
		}
	}
</script>
<form name="writeFrm" method="post" 
	action="write_proc.jsp" 
	onsubmit="return isValidate(this);">
	
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
			<input type="text" class="form-control" 
				style="width:100px;" value="${USER_ID }" 
				disabled />
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">이메일</th>
		<td>
			<input type="text" class="form-control" 
				style="width:400px;" value="${USER_EMAIL }" 
				disabled />
		</td>
	</tr>	
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">제목</th>
		<td>
			<input type="text" class="form-control" 
				name="title" />
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">내용</th>
		<td>
			<textarea rows="10" class="form-control"
				name="content"></textarea>
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">첨부파일</th>
		<td>
			<input type="file" class="form-control" name="chumfile"/>
		</td>
	</tr>
</tbody>
</table>

<div class="row text-center" style="">
	<!-- 각종 버튼 부분 -->
	
	<button type="submit" class="btn btn-danger">전송하기</button>
	<button type="reset" class="btn">Reset</button>
	<button type="button" class="btn btn-warning" 
		onclick="location.href='sub01_list.jsp';">
		리스트보기</button>
</div>
</form>

				</div>
			</div>
		</div>
	</div>
	</center>
 </body>
</html>