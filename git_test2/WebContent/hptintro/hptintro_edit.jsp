<%@page import="HptIntro.HptDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="HptIntro.HptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//한글처리
request.setCharacterEncoding("UTF-8");

//DB연결
HptDAO dao = new HptDAO();


//매개변수 저장을 위한 컬렉션 생성(DAO로 전달)
Map<String,Object> param = new HashMap<String,Object>();

String hp_name = request.getParameter("hp_name");

HptDTO dto = dao.selectIntro(hp_name);

pageContext.setAttribute("dto", dto);

dao.close();
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="Pragma" CONTENT="no-cache">
<meta http-equiv="Expires" CONTENT="-1">

<meta name="Description" content="병원소개">
<title>병원소개</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<!-- <link rel="stylesheet" href="../common/css/base.css">
<link rel="stylesheet" href="../common/css/ui_style.css?180711">
<link rel="stylesheet" href="../common/css/common.css?180604">
<link rel="stylesheet" href="../common/css/layout.css?180315">
<link rel="stylesheet" href="../common/css/content.css?1807172">
<link rel="stylesheet" href="../common/css/colorChange.css">
<link rel="stylesheet" href="../common/css/content_seoul.css?1805141"> -->
<!-- <script type="text/javascript" src="../common/js/libs/jquery-1.11.2.js"></script>
<script type="text/javascript" src="../common/js/libs/jquery-ui-1.12.1.js"></script>
<script type="text/javascript" src="../common/js/libs/jquery.browser.check.js"></script>
<script type="text/javascript" src="../common/js/libs/modernizr.min.js?180413"></script>
<script type="text/javascript" src="../common/js/plugins.js"></script>
<script type="text/javascript" src="../common/js/ui.js?1807051"></script> -->
<!--[if lt IE 9]>
<script type="text/javascript" src="/common/js/libs/html5shiv-printshiv.js"></script>
<![endif]-->

<script>
/* $(document).ready(function(){
	//setSnb('snb1');
    //Tab 호출
    $(".tab-wrap").tabs();
	$(".img-thumb img").css("width","335px");
	$(".magazine-list ul li a img").css("width","126px");
}); */
</script>
</head>
<body>
<%@ include file="../include/sourcecopy_header.jsp" %>
<div class="container">
	
<!-- 상단 영역 -->

	

	
<!--// 상단영역 끝 -->		
	
	<hr>

	<!-- container -->
	<div id="container">
		<!-- container-header -->
		<div class="container-header">
			<div class="inner">
				<h1 class="tit-page">${dto.hp_name }</h1>
				<p class="summary">${dto.hp_genre_name }</p>
				<!-- quick medical -->
								<div class="quick-medical">
					<ul>
						<li><a href="/seoul/treatment/search.asp"><i class="ico ico-srch5"></i><span>의료진검색</span></a></li>
						<li><a href="/seoul/reservation/reservation.asp"><i class="ico ico-cal4"></i><span>온라인예약</span></a></li>
						<li><a href="/seoul/reservation/certificate.asp?tabIndex=1"><i class="ico ico-certificate4"></i><span>증명서발급</span></a></li>
					</ul>
				</div>
				<!--// quick medical -->
			</div>
		</div>
		<!--// container-header -->

		<!-- contents-wrap -->
		<div class="contents-wrap">
			<div class="inner">
				<!-- aside -->
				<aside id="aside">
					<!-- snb wrap -->
						
					<!--// snb wrap -->
				</aside>
				<!--// aside -->
				<hr>
				<!-- contents -->
				<!-- <article class="contents"> -->					
				<form action="edit_proc.jsp" method="post" name="editFrm">
				<%-- <input type="hid den" name="hp_name" value="${dto.hp_name }"/> --%>
					<h3 class="tit-noneBold">병원소개</h3>
					<div class="periodical-wrap">
						<div class="row">
							<div class="thumb-wrap">
								<div class="thumb-frame">
									<img src="../images/inner1.jpg" alt="병원사진" style="width:750px">
								</div>
								<br />
								<div style="font-size:2em;">
									<textarea rows="10" class="form-control" name="hp_explain"><%=dto.getHp_explain() %></textarea>
								</div>
							</div>							
						</div>
					</div>
						<br />							
						<h3 class="tit-noneBold">의료진</h3>
							<div class="periodical-wrap">
							<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
								<input type="button" name="addStaff" value="의사 추가하기">
    <br>
    <br>
    <table border="1" style="width:100%">
        <tbody>
            <tr name="trStaff">
                <td style="width:50px"><strong>의사</strong></td>
                <td>
                    <input type="text" name="doc_name" placeholder="성명" style="width:80px;">
                    <input type="text" name="doc_major" placeholder="진료과목">
                    <input type="text" name="doc_gender" placeholder="성별" style="width:80px;">
                    <input type="text" name="doc_age" placeholder="나이" style="width:80px;">                    
                    <input type="text" name="doc_career" placeholder="경력">                    
                    <input type="text" name="doc_sc" placeholder="스케줄">                    
                    <input type="text" name="hp_name" placeholder="근무병원명" value="${dto.hp_name }">                    
                </td>
            </tr>
            <!-- <tr>
                <td><strong>메모</strong></td>
                <td>
                    <textarea style="width:800px" name="memo" rows="3" placeholder="메모를 남겨주세요."></textarea>
                </td>
            </tr> -->
        </tbody>
    </table>
  
<script>
    //추가 버튼
    $(document).on("click","input[name=addStaff]",function(){
         
        var addStaffText =  '<tr name="trStaff">'+
            '   <td class="active col-md-1"><strong>의사</strong></td>'+
            '   <td class="col-md-11">'+
            '       <input type="text" class="form-control" name="doc_name" placeholder="성명" style="width:80px;">'+
            '       <input type="text" class="form-control" name="doc_major" placeholder="진료과목">'+
            '       <input type="text" class="form-control" name="doc_gender" placeholder="성별" style="width:80px;">'+
            '       <input type="text" class="form-control" name="doc_age" placeholder="나이" style="width:80px;">'+
            '       <input type="text" class="form-control" name="doc_career" placeholder="경력">'+
            '       <input type="text" class="form-control" name="doc_sc" placeholder="스케줄">'+
            '       <input type="text" class="form-control" name="hp_name" placeholder="근무병원명" value="${dto.hp_name }">'+
            '       <button class="btn btn-default" name="delStaff">삭제</button>'+
            '   </td>'+
            '</tr>';
             
        var trHtml = $( "tr[name=trStaff]:last" ); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
         
        trHtml.after(addStaffText); //마지막 trStaff명 뒤에 붙인다.
         
    });
     
    //삭제 버튼
    $(document).on("click","button[name=delStaff]",function(){
         
        var trHtml = $(this).parent().parent();
         
        trHtml.remove(); //tr 테그 삭제
         
    });
</script>
							</div>
						
						<br />							
						<h3 class="tit-noneBold">진료시간</h3>
							<div class="periodical-wrap">
								평일 오전9시~오후6시
							</div>
						
						<br />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
<script type="text/javascript">
function zipcodeFind(){
    new daum.Postcode({
        oncomplete: function(data) {
            var fn = document.editFrm;
            fn.zipcode.value = data.zonecode;//우편번호
            fn.hp_addr.value = data.address;//기본주소            
        }
    }).open();
}
</script>					
						<h3 class="tit-noneBold">주소</h3>						
							<div class="periodical-wrap">
								<!-- 우편번호 -->
								<input type="text" name="zipcode" value=""  class="join_input" style="width:100px;" />
								<a href="javascript:;" title="새 창으로 열림" onclick="zipcodeFind();" onkeypress="">[우편번호검색]</a>
								<br/>
								<!-- 주소 -->
								<input type="text" name="hp_addr" value="<%=dto.getHp_addr() %>"  class="join_input" style="width:550px; margin-top:5px;" /><br>
																
							</div>
						<br />												
						<h3 class="tit-noneBold">전화번호</h3>
							<div class="periodical-wrap">						
								<input type="text" class="form-control" name="hp_tel" value="<%=dto.getHp_tel() %>" />
							</div>
						<br />
						<h3 class="tit-noneBold">홈페이지</h3>
							<div class="periodical-wrap">						
								<a href="${dto.hp_url }">바로가기</a>
							</div>
					</div>

					<div class="btn-area mar-t50">
						<button type="submit" class="btn btn-md btn-info">확인</button>
						<button type="button" class="btn btn-md btn-warning" onclick="location.href='hptintro.jsp'">취소</button>
					</div>
				</form>		
				<!--// Contents -->
			</div>
		</div>
		<!--// contents-wrap -->
	
	<hr>


</div>
<%@ include file="../include/sourcecopy_bottom.jsp" %>
</body>
</html>

