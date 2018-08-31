<%@page import="hptintro.introDTO"%>
<%@page import="hptintro.introDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보관리</title>
<link rel="stylesheet" href="../bootstrap3.3.7/css/bootstrap.min.css" />
<script src="../bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>
<script src="../bootstrap3.3.7/js/bootstrap.min.js"></script>
</head>
<%
/*
수정하기는 기본적으로 상세보기와 동일하고, 가져온 
내용을 글쓰기 폼의 value속성에 삽입해주면 된다.
*/

String mem_idx = request.getParameter("mem_idx");

/* //세션영역에 저장된 병원 idx 를 가져온다.
String user_id = 
	session.getAttribute("HPT_IDX").toString();
//dao에 정의한 getMemberInfo 메소드를 호출한다.
HomepyMemberDTO dto = dao.getMemberInfo(HPT_IDX);  */

introDAO dao = new introDAO();

introDTO dto = dao.selectView(mem_idx);

//EL식 사용위해 페이지 영역에 저장하기
pageContext.setAttribute("dto", dto);

dao.close();//DB자원반납
%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function goBack(){
		history.back(-1);
	}
	
	function zipcodeFind(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var fn = document.memberFrm;
	            fn.zipcode.value = data.zonecode;//우편번호
	            fn.addr1.value = data.address;//기본주소
	            fn.addr2.focus();//상세주소로 포커스 이동
	        }
	    }).open();
	}
</script>
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
						<a href="../hptintro/infoShow?mem_idx=<%=dto.getMem_idx() %>" class="depth1">병원정보관리</a>
					</li>
					<li>
						<a href="../hptintro/docShow?mem_idx=<%=dto.getMem_idx() %>" class="depth1">의사관리</a>
					</li>
					<li>
						<a href="../hptintro/imageShow?mem_idx=<%=dto.getMem_idx() %>" class="depth1">병원사진관리</a>
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
	<form name="memberFrm" action="../hptintro/infoShow" method="post">
	<input type="hid den" name="mem_idx" value="<%=mem_idx %>" />	
	<table class="table table-bordered">
	<colgroup>
		<col width="30%"/>
		<col width="*"/>
	</colgroup>
		<tr>
			<td>병원명</td>
			<td>
				<input type="text" name="mem_name" style="width:200px;" value="${dto.mem_name }" />			
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<!-- 우편번호 -->
				<input type="text" name="zipcode" value="${dto.zipcode }"  class="join_input" style="width:100px;" />
				
				<a href="javascript:;" title="새 창으로 열림" onclick="zipcodeFind();" onkeypress="">[우편번호검색]</a><br/>
				<input type="text" name="addr1" style="width:300px;" value="${dto.addr1 }"/><br/>
				<input type="text" name="addr2" style="width:500px;" value="${dto.addr2 }"/>
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				<input type="text" name="tel" style="width:150px;" value="${dto.tel }" />
			</td>
		</tr>
		<tr style="height:300px;">
			<td>병원소개</td>
			<td>
				<textarea type="text" name="mem_dis" style="height:300px; width:500px;">
					 ${dto.mem_dis }
				</textarea>
			</td>
		</tr>
	</table>
</div>
	<!-- 버튼 -->
	<div style="text-align:center;">
		<button type="submit" class="btn btn-primary">전송하기</button>
		<button type="reset" class="btn btn-success">리셋하기</button>
		<button type="button" class="btn btn-warning" onclick="goBack();">취소하기</button>	
	</div>

</form>
		<br /><br /><br />
		</article>
		<!--// Contents -->
	</div>
</div>
<%@ include file="../include/sourcecopy_bottom.jsp" %>
</body>
</html>