<%@page import="model.HospitalMemberDTO"%>
<%@page import="java.util.Map"%>
<%@page import="model.HospitalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
HospitalMemberDTO dto = new HospitalMemberDTO();
String mem_idx = null;
mem_idx = request.getParameter("mem_idx");
System.out.println("mem_idx의 값:"+mem_idx);
String id = null, pass = null;
if(mem_idx != null){
	session.setAttribute("IDX", mem_idx);
	dto.setMem_idx(Integer.parseInt(mem_idx));
	System.out.println("세션mem_idx"+session.getAttribute("IDX").toString());
	System.out.println("DTOmem_idx"+dto.getMem_idx()); 
	HospitalDAO dao = new HospitalDAO();
	Map<String, String> memberInfo = dao.memberLogin2(Integer.parseInt(session.getAttribute("IDX").toString()));
	id = memberInfo.get("id"); 
	pass = memberInfo.get("pass");
	
	Map<String, String> memberInfo2 = dao.memberLogin(id, pass);

	if (memberInfo.get("name") != null) {
		//세션영역에 저장
		session.setAttribute("USER_ID", memberInfo.get("id"));
		session.setAttribute("USER_PASS", memberInfo.get("pass"));
		session.setAttribute("USER_NAME", memberInfo.get("name"));
		session.setAttribute("USER_EMAIL", memberInfo.get("email"));
		session.setAttribute("IDX", memberInfo.get("idx"));
		/* 
		if (auto_login != null) {
			Cookie ck = new Cookie ("USER_ID",id);
			ck.setPath(request.getContextPath());
			ck.setMaxAge(0);
			response.addCookie(ck);
		}else{
			Cookie ck = new Cookie("USER_ID",id);
			
			//쿠키가 적용될 경로 지정 
			System.out.println(request.getContextPath());
			ck.setPath(request.getContextPath());
			//유효기간 
			ck.setMaxAge(60*60*24*100);
			response.addCookie(ck);
		}
		 */
	}
}
%>

<!DOCTYPE html>
 
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="Pragma" CONTENT="no-cache">
<meta http-equiv="Expires" CONTENT="-1">

<meta name="Description" content="아파고병원">
<title>인제대학교 서울백병원</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/base.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/ui_style.css?180711">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css?180604">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/layout.css?180315">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/content.css?1807172">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/colorChange.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/content_seoul.css?1805141">
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/libs/jquery-1.11.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/libs/jquery-ui-1.12.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/libs/jquery.browser.check.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/libs/modernizr.min.js?180413"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/plugins.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/ui.js?1807051"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="/common/js/libs/html5shiv-printshiv.js"></script>
<![endif]-->

<script>
   $(function(){

      if (getCookie('Mo')!='false') {
         if(isMobile()){
            if(confirm("모바일기기로 접근하셨습니다. 모바일페이지로 이동하시겠습니까?    ")){
               location.href = "/m/seoul/";
            }else{
               setCookie('Mo', 'false', 1);
            }
         }
      }

      $("[data-img]").each(function(){
         var img =  $(this).attr("data-img");
         $(this).css("background-image","url("+img+")");
      });
      var infiniteLoop = null
         , pager = null
         , liCount = $('.img-area').find('li').length;

      if (liCount <=3) {
         infiniteLoop = false;
         pager = false;
      } else {
         infiniteLoop = true;
         pager = true;
      }

      $('.img-area .bxslider').bxSlider({
         slideWidth: 356,
         slideMargin: 6,
         controls: false,
         stopAutoOnClick: false,
         touchEnabled: false,
         moveSlides:1,
         minSlides:0,
         maxSlides:3,
         pager: pager,
         infiniteLoop: infiniteLoop
      });

      $(".news-ticker .bxslider").bxSlider({
         mode: 'vertical',
         auto: true,
         speed: 400,
         autoControls: false,
         stopAutoOnClick: false,
         controls: false,
         touchEnabled: false,
         pager: false
      });

      // bxsliderThumb('.img-area .bxslider',360,0,0,3,1);
      bxsliderThumb('.banner-slider .bxslider',267,4,0,4,1);
      bxslider('.press-box .bxslider');

   });
</script> --%>
</head>
<body>
<!-- 상단 영역 -->
<%@ include file="../include/sourcecopy_header.jsp" %>
<div class="container">
	<input type="hid-den" name="mem_idx" value="<%=mem_idx%>"/>
	
	<!-- 컨텐츠 영역 -->
	<div class="row">
		<br />
		<img src="../images/inner1.jpg" width="80%" height="600px;" />
	<br /><br /><br /><br /><br />
	<br /><br /><br /><br /><br />
	<br /><br /><br /><br /><br />
	<br /><br /><br /><br /><br />
	<br /><br /><br /><br /><br />
	
	</div>
 
</div>
<%@ include file="../include/sourcecopy_bottom.jsp" %>

</body>
</html>