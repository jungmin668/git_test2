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

String hp_name = "탑클래스성형외과";

HptDTO dto = dao.selectIntro(hp_name);
//HptDTO docdto = dao.selectDoc(hp_name);

pageContext.setAttribute("dto", dto);
//pageContext.setAttribute("docdto", docdto);

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
		
		<!-- 컨텐츠 영역 -->
		<div class="container-header">
			<div class="inner">
				<h1 class="tit-page">${dto.hp_name }</h1>
				<p class="summary">${dto.hp_genre_name }</p>
				<!-- quick medical -->
								<div class="quick-medical">
					<ul>
						<li><a href=""><i class="ico ico-srch5"></i><span>의료진검색</span></a></li>
						<li><a href=""><i class="ico ico-cal4"></i><span>온라인예약</span></a></li>
						<li><a href=""><i class="ico ico-certificate4"></i><span>증명서발급</span></a></li>
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
			
				<!-- contents -->
				<!-- <article class="contents"> -->					
					
					<h3 class="tit-noneBold">병원소개</h3>
					<div class="periodical-wrap">
						<div class="row">
							<div class="thumb-wrap">
								<div class="thumb-frame">
									<img src="../images/inner1.jpg" alt="병원사진" style="width:750px">
								</div>
								<br />
								<div style="font-size:2em;">
								${dto.hp_explain }
								</div>
							</div>							
						</div>
					</div>
						<br />							
						<h3 class="tit-noneBold">의료진</h3>
							<div class="periodical-wrap">
								윤뎅이 전공의
							</div>
						
						<br />							
						<h3 class="tit-noneBold">진료시간</h3>
							<div class="periodical-wrap">
								평일 오전9시~오후6시
							</div>
						
						<br />						
						<h3 class="tit-noneBold">주소</h3>						
							<div class="periodical-wrap">						
							${dto.hp_addr }
							</div>
						<br />												
						<h3 class="tit-noneBold">전화번호</h3>
							<div class="periodical-wrap">						
							${dto.hp_tel }
							</div>
						<br />
						<h3 class="tit-noneBold">홈페이지</h3>
							<div class="periodical-wrap">						
							<a href="${dto.hp_url }">바로가기</a>
							</div>
					</div>

					<div class="btn-area mar-t50">
						<button type="button" class="btn btn-md btn-info" onclick="location.href='hptintro_edit.jsp?hp_name=<%=dto.getHp_name() %>'"><em>수정하기</em></button>
					</div>	
				<!--// 컨텐츠 영역 끝 -->
			</div>
		
	<hr>


</div>
<%@ include file="../include/sourcecopy_bottom.jsp" %>
</body>
</html>

