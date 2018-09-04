<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>apago_header</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/base.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/ui_style.css?180711">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css?180604">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/layout.css?180315">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/content.css?1807172">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/colorChange.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/content_seoul.css?1805141">
<!-- 
<script type="text/javascript" src="/common/js/libs/jquery-1.11.2.js"></script>
<script type="text/javascript" src="/common/js/libs/jquery-ui-1.12.1.js"></script>
<script type="text/javascript" src="/common/js/libs/jquery.browser.check.js"></script>
<script type="text/javascript" src="/common/js/libs/modernizr.min.js?180413"></script>
<script type="text/javascript" src="/common/js/plugins.js"></script>
<script type="text/javascript" src="/common/js/ui.js?1807051"></script>
 -->
<!-- <link rel="stylesheet" href="../common/bootstrap3.3.7/css/bootstrap.min.css" />
<script src="../common/bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script> -->
</head>
<body>
	
	<!-- header -->
	<header id="header">
		<div class="inner">
			<div class="logo"><a href="<%=request.getContextPath() %>/main/main.jsp"><img src="<%=request.getContextPath() %>/images/go_big.png" style="width:300px; height:60px;" alt="apago_logo" /></a></div>
			<div class="gnb">
				<ul>
				
				<%
               //세션영역에 회원정보가 없다면...로그인 전 화면 출력
               if(session.getAttribute("USER_ID")==null)
               {
               %>
									
					<!-- Before Login -->
					<li><a href="<%=request.getContextPath() %>/member/login.jsp" class="btn-login">로그인</a></li>
					<li><a href="<%=request.getContextPath() %>/Captcha" class="btn-join">회원가입</a></li>
					<!--// Before Login -->
					
			  <% } else { %>
                  <!-- 로그인후 -->
                  <li><a href="<%=request.getContextPath() %>/member/logout.jsp">로그아웃</a></li>
                  <li><a href="#">회원정보수정</a></li>
               <% } %>
                
					
					
					
					<li>
						<div class="ui-select">
							<button type="button" class="ui-select-val"><span>KOR</span></button>
							<div class="ui-select-wrap">
								<ul class="ui-select-menu">
									<li class="current"><a href="http://www.paik.ac.kr/seoul/main.asp" target="_blank" title="새창 열기">KOR</a></li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</div>
	
				<!-- //LNB -->
				<span class="lnb-line left"></span>
				<span class="lnb-line mid"></span>
				<span class="lnb-line right"></span>
				<button type="button" class="btn-srchWrap"><span class="ico ico-srch">검색</span></button>
			</div>
			<!-- 우측 바(네비게이션 바) -->
			<%-- <%@ include file="../include/quick.jsp" %> --%>
		</div>

		<div class="bg-lnb"><!-- lnb bg --></div>

		<div class="search-wrap">
			<div class="inner">
				<span class="input-search">
					<form name="searchFrm" method="post" action="/seoul/etc/search_result.asp">
					<input type="hidden" name="i_s" value="">
					<input type="text" maxlength="50" name="i_t" placeholder="검색어를 입력해주세요." title="통합검색">
					<button type="submit" class="btn-srch"><span class="ico ico-srch">검색</span></button>
					</form>
				</span>
			</div>
		</div>
	</header>

</body>
</html>