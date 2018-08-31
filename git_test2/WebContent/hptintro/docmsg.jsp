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
<title>의사관리</title>
<link rel="stylesheet" href="../bootstrap3.3.7/css/bootstrap.min.css" />
<script src="../bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>
<script src="../bootstrap3.3.7/js/bootstrap.min.js"></script>
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

List<docDTO> bbs = dao.docList(mem_idx);

/* EL식 사용위해 페이지 영역에 저장하기
pageContext.setAttribute("dto", dto);
 */

dao.close();//DB자원반납
%>

<script>
	function goBack(){
		history.back(-1);
	}
</script>

<script src="../jquery/jquery-3.2.1.js"></script>
<script>
//의사 추가,삭제 버튼
$(document).ready(function(){
	$('#addDoc').click(function(){         
	    var addStaffText =  '<tr name="trDoc">'+
	        '   <td>의사</td>'+ 
	        '   <td>'+ 	        
	        '       <input type="text" name="doc_name" style="width:80px;" placeholder="성명">'+
	        '       <input type="text" name="doc_major" style="width:100px;" placeholder="진료과목">'+
	        '       <input type="text" name="doc_gender" style="width:80px;" placeholder="성별">'+
	        '       <input type="text" name="doc_age" style="width:50px;" placeholder="나이">'+
	        '       <input type="text" name="doc_career" style="width:300px;" placeholder="경력">'+
	        '       <input type="text" name="doc_sc" style="width:100px;" placeholder="스케줄">'+
	        '   </td>'+
	        '</tr>';
	         
	    var trHtml = $( "tr[name=trDoc]:last" ); 
	     
	    trHtml.after(addStaffText); 
	});  
	
	$('#delDoc').click(function(){
		var trHtml = $( "tr[name=trDoc]:last" );
        trHtml.remove();		
	});
});
  
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
			<h2 class="tit-snb">병원 관리</h2>
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
<div style="text-align:right;">
<input type="button" id="addDoc" class="btn btn-primary" value="의사 추가하기">
<input type="button" id="delDoc" class="btn btn-warning" value="의사 삭제하기">
</div>
<div>
	<form name="" action="../hptintro/docShow" method="post">
	<input type="hid den" name="mem_idx" value="<%=mem_idx %>" />
	<table class="table table-bordered">
	<colgroup>
		<col width="50px;"/>
		<col width="*"/>
	</colgroup>
<%
	for(docDTO doc : bbs)
	{
%>
		<tr name="trDoc">
			<td>의사</td>
			<td>
				<input type="hidden" name="doc_idx" value="<%=doc.getDoc_idx() %>"/>
				<input type="text" name="doc_name" style="width:80px;" value="<%=doc.getDoc_name() %>">
                <input type="text" name="doc_major" style="width:100px;" value="<%=doc.getDoc_major() %>">
                <input type="text" name="doc_gender" style="width:80px;" value="<%=doc.getDoc_gender() %>">
                <input type="text" name="doc_age" style="width:50px;" value="<%=doc.getDoc_age() %>">                    
                <input type="text" name="doc_career" style="width:300px;" value="<%=doc.getDoc_career() %>">                    
                <input type="text" name="doc_sc" style="width:100px;" value="<%=doc.getDoc_sc() %>">			
			</td>
		</tr>
<%
	}
%>		
	</table>
</div>
<!-- 버튼 -->
	<div style="text-align:center;">
		<input type="submit" class="btn btn-primary" value="확인"/>
		<button type="button" class="btn btn-warning" onclick="goBack();">취소</button>	
	</div>
	</form>
		<br /><br /><br />
	</article>
	</div>
</div>
<%@ include file="../include/sourcecopy_bottom.jsp" %>
</body>
</html>