<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


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
<div id="container">
      <!-- container-header -->
      
      <div class="container-header">
         <div class="inner">
            <h1 class="tit-page">총괄관리자 로그인</h1>
            <p class="summary">로그인을 하시면 다양한 서비스를 편리하게 이용하실 수 있습니다.</p>
         </div>
      </div>
      <!--// container-header -->

      <!-- contents-wrap -->
      <div class="contents-wrap">
         <div class="inner">
            <!-- contents -->
            <article class="contents snb-none">
               <div class="box-type login-box site-login">
                  <div class="login-inputWrap row">
                     <div class="col left">
                        <div class="tit-wrap clearfix">
                           <h3>아파GO 로그인</h3>
                           <!--span class="label-form label-sm fr">
                              <label><input type="radio" name="mem_yn" value="1" checked="checked" ><span>회원</span></label>
                              <label><input type="radio" name="mem_yn" value="0"><span>비회원 예약 조회</span></label>
                           </span-->
                        </div>
<script type="text/javascript">
   function loginValidate(f){
      if(f.id.value==""){
         alert("아이디를 입력하세요");
         f.id.focus();
         return false;
      }
      if(f.pass.value==""){
         alert("패스워드를 입력하세요");
         f.pass.focus();
         return false;
      }
   }
</script>
                        <div class="login-input">
                           <form method="post" action="./login_process_admin.jsp" name="loginFrm" id="login1" onsubmit="return loginValidate(this);">
                           <input type="hid-den" name="backUrl" value="${param.backUrl}"/>
                           <input type="hidden" name="hpid" value="DA">
                           <input type="hidden" name="r_url" id="r_url" value="/seoul/member/join.asp%3F%26rnd%3D70554">
                           <fieldset>
                              <legend>로그인 영역</legend>
                              <%
                              //세션영역에 회원정보가 없다면 로그인화면 출력
                              if(session.getAttribute("USER_ID")==null)
                              {
                              %>
                              <div class="row gutter6">                                 
                                 <div class="col col8">
                                    <input type="text" value="" name="id" id="r_id" placeholder="아이디" title="아이디 입력">
                                    <input type="password" maxlength="24" name="pass" id="r_passwd" placeholder="비밀번호" title="비밀번호 입력">
                                 </div>
                                 <div class="col col4">
                                    <button type="submit" class="btn btn-primary btn-login"><em>로그인</em></button>
                                 </div>
                              </div>
                              <div class="remember-area clearfix">
                                 <div class="fl">
                                    <span class="label-form label-sm">
                                       <label><input type="checkbox" name="auto_login" value="on"><span>아이디저장</span></label>
                                    </span>
                                 </div>
                                 <div class="fr r">
                                    <a href="/seoul/member/id_pw_find.asp" class="link">아이디/비밀번호 찾기<i class="ico ico-arrow"></i></a><br>
                                    <!--a href="/seoul/reservation/cancel.asp" class="link dis_inBlock mar-t10">예약조회<i class="ico ico-arrow"></i></a-->
                                 </div>
                              </div>
                              <% }else{ %>
                                 <div class="login_box01">
                                    admin님, 반갑습니다. <br />
                                    	로그인 하셨습니다. <br /> 
                                     <button type="button" onclick="location.href='';"> 회원정보수정</button>
                                    <button type="button" onclick="location.href='../member/logout.jsp';"> 로그아웃</button>
                                 </div>
                              <% } %>
                           </fieldset>
                           </form>
                        </div>
                        <div class="login-input none-member">
                           <fieldset>
                              <legend>로그인 영역</legend>
                              <div class="row gutter6">
                                 <div class="col col9">
                                    <dl>
                                       <dt>환자성명</dt>
                                       <dd>
                                          <input type="text" title="환자성명 입력">
                                       </dd>
                                       <dt>주민번호 앞자리</dt>
                                       <dd>
                                          <!-- 주민번호 -->
                                          <span class="inum-type">
                                             <input type="text" maxlength="6" value="" title="주민번호 앞자리">
                                             <i class="dash"></i>
                                             <input type="password" maxlength="7" value="" title="주민번호 뒷자리">
                                          </span>
                                          <!--// 주민번호 -->
                                       </dd>
                                       <dt>연락처</dt>
                                       <dd>
                                          <!-- 전화번호 -->
                                          <span class="phone-type">
                                             <select name="i_cel1" id="i_cel1">
<option value=""> 선택 </option>
<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="018">018</option>
<option value="019">019</option>
</select>

                                             <i class="dash"></i>
                                             <input type="text" maxlength="4" value="" placeholder="0000" title="가운데 번호">
                                             <i class="dash"></i>
                                             <input type="text" maxlength="4" value="" placeholder="0000" title="끝 번호">
                                          </span>
                                          <!--// 전화번호 -->
                                       </dd>
                                    </dl>
                                 </div>
                                 <div class="col col3">
                                    <button type="submit" class="btn btn-primary btn-login"><em>예약조회</em></button>
                                 </div>
                              </div>
                           </fieldset>
                        </div>
                     </div>
                  </div>
					
                  <div class="join-explain" >
                     <div class="txt">
                        <p>
                        
                          	 아직 아이디가 없으신 분은 먼저 <em>온라인 회원등록</em>을 통해 인터넷 진료예약, 각종 상담글의 작성 등 기타 서비스들을 <em>편리하게 이용하실 수 있습니다.</em><br>
                           	회원등록 즉시 이용이 가능하며, 회원탈퇴와 함께 회원의 개인정보를 완전히 삭제 하실 수 있습니다.
                        </p>
                        <a href="./join.jsp" class="btn btn-md"><em>회원가입</em></a>
                     </div>
                  </div>
               </div>

            </article>
            <!--// Contents -->
         </div>
      </div>
      <!--// contents-wrap -->
      
   </div>
<%@ include file="../include/sourcecopy_bottom.jsp" %>

</body>
</html>