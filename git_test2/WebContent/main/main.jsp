<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<!DOCTYPE html>
 
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="Pragma" CONTENT="no-cache">
<meta http-equiv="Expires" CONTENT="-1">

<meta name="Description" content="아파고 병원">
<title>인제대학교 서울백병원</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/common/css/base.css">
<link rel="stylesheet" href="/common/css/ui_style.css?180711">
<link rel="stylesheet" href="/common/css/common.css?180604">
<link rel="stylesheet" href="/common/css/layout.css?180315">
<link rel="stylesheet" href="/common/css/content.css?1807172">
<link rel="stylesheet" href="/common/css/colorChange.css">
<link rel="stylesheet" href="/common/css/content_seoul.css?1805141">
<script type="text/javascript" src="/common/js/libs/jquery-1.11.2.js"></script>
<script type="text/javascript" src="/common/js/libs/jquery-ui-1.12.1.js"></script>
<script type="text/javascript" src="/common/js/libs/jquery.browser.check.js"></script>
<script type="text/javascript" src="/common/js/libs/modernizr.min.js?180413"></script>
<script type="text/javascript" src="/common/js/plugins.js"></script>
<script type="text/javascript" src="/common/js/ui.js?1807051"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="/common/js/libs/html5shiv-printshiv.js"></script>
<![endif]-->

<script>
   $(document).ready(function(){

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
</script>
</head>
<body>
<div id="wrapper">
   <!-- banner -->
   
   <div id="eventTopBanner">
      <div class="inner">
         <div class="bxslider">
            
            <a href="#this" target="" class="link-banner"><img src="" alt="전화 한 통화로 쉽게 예약하세요. 전화예약(초진) 2270-0458, 환자와 나의 건강을 위해 병문안을 자제해주세요. 병문안 가능시간, 평일 18:00~20:00 / 주말 공휴일 10:00~12:00, 18:00~20:00"></a>
            
         </div>
      </div>
      <div class="btn-wrap">
         <span id="denyChk" style="position:absolute; top:110px; right:60px;" class="label-form label-sm">
            <label for="denypop"><input type="checkbox" name="denypop" id="denypop" value="DA"><span style="color:#FFF">그만보기</span></label>
         </span>
         <button type="button" class="btn-close" data="DA"><i class="ico ico-close">닫기</i></button>
      </div>
   </div>

   <!--// banner -->

   <!-- header -->
   <%@include file="../sourcecopy_header.jsp" %>

             
            <span class="lnb-line left"></span>
            <span class="lnb-line mid"></span>
            <span class="lnb-line right"></span>
            <button type="button" class="btn-srchWrap"><span class="ico ico-srch">검색</span></button>
         </div>
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

   <!--// header -->
   <hr>

   <!-- Container -->
   <div id="container" class="main">
      <section class="section section01">
         <div class="inner">
            <div class="news-ticker">
               
            </div>
            <div class="visual-wrap type2">
               <div class="img-area">
                  <ul class="bxslider">
                     <li>
                        <span data-img="/seoul/images/main/img_visualType01.jpg"></span>
                        <div class="txt">
                           <em>01</em>
                           <strong>개원 86주년<br/>서울의 중심, 진료의 중심</strong>
                        </div>
                     </li>
                     <li>
                        <span data-img="/seoul/images/main/img_visualType02.jpg"></span>
                        <div class="txt">
                           <em>02</em>
                           <strong>당일 진료-검사-결과<br/>원스톱 진료서비스</strong>
                        </div>
                     </li>
                     <li>
                        <span data-img="/seoul/images/main/img_visualType03.jpg"></span>
                        <div class="txt">
                           <em>03</em>
                           <strong>보호자 간병인 없는<br/>안심병동 운영</strong>
                        </div>
                        <!--a href="#" class="btn-dtl">자세히보기</a-->
                     </li>
                  </ul>
               </div>
            </div>
            <div class="quick-link">
               <dl>
                  <dt>
                     <span>
                        전화 한통화로 쉽게 <br/>예약하세요.
                        <strong class="tit1">전화예약(초진)</strong>
                        <strong class="tit2">2270-0458</strong>
                     </span>
                  </dt>
                  <dd>
                     <ul>
                        <li class="link1"><a href="/seoul/treatment/search.asp">진료과&middot;의료진 검색</a></li>
                        <li class="link2"><a href="https://www.paik.ac.kr/seoul/reservation/intro.asp">온라인 진료예약</a></li>
                        <li class="link3"><a href="https://www.paik.ac.kr/seoul/reservation/quick_reservation.asp">처음진료 빠른예약</a></li>
                        <li class="link4"><a href="https://www.paik.ac.kr/seoul/reservation/cancel.asp">진료예약 조회</a></li>
                     </ul>
                  </dd>
               </dl>
            </div>
         </div>
      </section>
      <section class="section section02">
         <div class="inner">
            <h2 class="tit-sec">센터소개</h2>
            <p class="txt-summery">서울백병원의 우수한 센터를 소개합니다.</p>
            <div class="center-banner">
               <ul class="row gutter4">
                  <li class="col col3"><a href="/refer/seoul" target="_blank" class="referral-center"><strong>진료협력센터</strong><em>PAIK REFERRAL CENTER</em></a></li>
                  <li class="col col3"><a href="./health/intro.asp" target="_blank" class="health-center"><strong>종합검진센터</strong><em>HEALTH PROMOTION CENTER</em></a></li>
                  <li class="col col3"><a href="./dept/?cid=477" class="bloodless-center"><strong>무수혈센터</strong><em>BLOODLESS CENTER</em></a></li>
                  <li class="col col3"><a href="./dept/?cid=408" class="emergency-center"><strong>응급의료센터</strong><em>EMERGENCY CENER</em></a></li>
               </ul>
               <div class="banner-slider">
                  <ul class="bxslider">
                     <li class="slider1"><a href="./dept/?cid=1173"><strong>관절센터</strong></a></li>
                     <li class="slider2"><a href="./dept/?cid=1138"><strong>소화기내시경센터</strong></a></li>
                     <li class="slider3"><a href="./dept/?cid=1083"><strong>항공신체검사센터</strong></a></li>
                     <li class="slider4"><a href="./dept/?cid=399"><strong>두통클리닉</strong></a></li>
                     <li class="slider5"><a href="./dept/?cid=94"><strong>섭식장애클리닉</strong></a></li>
                     <li class="slider6"><a href="./dept/?cid=1061"><strong>비만체형관리센터</strong></a></li>
                     <li class="slider7"><a href="./dept/?cid=898"><strong>남성건강클리닉</strong></a></li>
                     <li class="slider8"><a href="./dept/?cid=1143"><strong>지방간클리닉</strong></a></li>
                  </ul>
               </div>
            </div>
         </div>
      </section>
      <section class="section section03 bg_dark">
         <div class="inner">
            <h2 class="tit-sec">콘텐츠</h2>
            <p class="txt-summery">서울백병원의 다양한 이야기를 소개합니다.</p>
            <div class="row gutter6">
               <div class="col col6">
                  
                  <div class="press-box controls-type2">
                     
                     <ul class="bxslider">
                        
                        <li>
                           <figure data-img="/file/images/2018/05/0458694.jpg">
                              <figcaption>
                                 <em class="category">서울백병원 굿닥터</em>
                                 <a href="http://www.paik.ac.kr/seoul/medicine/good_doctor_view.asp?p_seq=50" target="" class="tit">머릿속의 통증 ′두통′의 명의<strong>신경과 정재면 교수</strong></a>
                              </figcaption>
                           </figure>
                        </li>
                        
                        <li>
                           <figure data-img="/file/images/2018/05/0459072.jpg">
                              <figcaption>
                                 <em class="category">서울백병원 굿닥터</em>
                                 <a href="http://www.paik.ac.kr/seoul/medicine/good_doctor_view.asp??p_seq=56" target="" class="tit">간염 간경변증 간암, 간 질환 전문의<strong>소화기내과 류수형 교수</strong></a>
                              </figcaption>
                           </figure>
                        </li>
                        
                        <li>
                           <figure data-img="/file/images/2018/05/0464830.jpg">
                              <figcaption>
                                 <em class="category">서울백병원 굿닥터</em>
                                 <a href="http://www.paik.ac.kr/seoul/medicine/good_doctor_view.asp?p_seq=62" target="" class="tit">소아천식, 아토피 치료를 책임진다!<strong>소아청소년과 김우경 교수</strong></a>
                              </figcaption>
                           </figure>
                        </li>
                        
                        <li>
                           <figure data-img="/file/images/2018/07/0950474.jpg">
                              <figcaption>
                                 <em class="category">서울백병원 굿닥터</em>
                                 <a href="http://www.paik.ac.kr/seoul/medicine/good_doctor_view.asp?p_seq=68" target="" class="tit">고관절치료의 미래 책임질 젊은 명의<strong>정형외과 윤병호 교수</strong></a>
                              </figcaption>
                           </figure>
                        </li>
                        
                     </ul>
                     
                     <span class="count-area"><strong>1</strong><em>5</em></span>
                  </div>
               </div>
               <div class="col col6">
                  
                  <div class="row">
                     
                     <div class="col col6">
                        <figure class="img-box" tabindex="0" data-img="/file/images/2018/06/1150578.jpg">
                           <figcaption>
                              <em class="category">이달의 건강정보</em>
                              <a href="http://www.paik.ac.kr/seoul/medicine/healthletter_view.asp?i_seq=406" class="tit">걷기, 계단오르기는 훌륭한 생활운동</a>
                           </figcaption>
                        </figure>
                     </div>
                     
                     <div class="col col6">
                        <figure class="img-box" tabindex="0" data-img="/file/images/2018/06/1142040.jpg">
                           <figcaption>
                              <em class="category">영양정보</em>
                              <a href="http://www.paik.ac.kr/seoul/medicine/nutrition_info_view.asp?i_seq=540" class="tit">빈혈환자를 위한 영양정보</a>
                           </figcaption>
                        </figure>
                     </div>
                     <div class="col col6">
                        <div class="link-box naver-post">
                           <a href="/seoul/intro/meet_list.asp">
                              <span class="tit"><em>사람과사람</em><strong>백병원과 좋은인연</strong></span>
                              <!-- <span class="txt-go">보러가기</span> -->
                           </a>
                        </div>
                     </div>
                     <div class="col col6">
                        <div class="link-box health-tv">
                           <span class="tit"><strong>백병원 건강주치의</strong></span>
                           <a href="http://tv.naver.com/paik/" target="_blank" title="새창" class="btn-link"><img src="/seoul/images/main/btn_naverTv.gif" alt="NAVER TV"></a>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <section class="section section04">
         <div class="inner">
            <h2 class="tit-sec">병원 소식</h2>
            <p class="txt-summery">서울백병원의 최신 소식을 전해드립니다.</p>
            <div class="row gutter16">
               <div class="col col3">
                  <div class="news-box news-toggle">
                     <h3>소식</h3>
                     <a href="/seoul/intro/news_list.asp" class="btn-more"><i class="ico ico-more">더보기</i></a>
                     
                     <ul>
                        
                        <li class="open new">
                           <a href="intro/news_view.asp?p_gub=NEWS&p_seq=1282">
                              <span class="tit">하정구 서울백병원 교수, 마르퀴즈 후즈 후 2018년 판 ..</span>
                              <p>  하정구 서울백병원 교수, 마르퀴즈 후즈 후 2018년 판 등재      인제대학교 서울백병원 정형외과 하정구 교수가 세계 3대 인명사전 중 하나인 ‘마르퀴즈 후즈 후 2018년 판(Marquis Who’s Who in the world 2018)’에 등재됐다.     하정구 교수는 30여 편의 SCI급 논문의 주요 저자로 참여해 무릎 반월상연골 이식술과 전방십자인대 수술 후 기능 평가방법, 근력 회복 등에 대한 다양한 연구성과를 인정받아 선정됐다.&nbsp;     마르퀴즈 후즈 후에서는 해마다 분야별 전문가를 선</p>
                              <em class="date">2018-08-10</em>
                           </a>
                        </li>
                        
                        <li class="">
                           <a href="intro/news_view.asp?p_gub=NEWS&p_seq=1281">
                              <span class="tit">서울백병원, ‘서울시 119 안심 협력병원’ 지정</span>
                              <p>  서울백병원, ‘서울시 119 안심 협력병원’ 지정   - ‘소방관 부상 신속 진료 · 건강관리 지원’ 등 의료서비스 제공&nbsp;     인제대학교 서울백병원(원장 홍성우)이 8월 1일부터 ’서울시 119 안심 협력병원’으로 지정됐다. 앞으로 서울소방재난본부 산하 전 소방공무원에게 체계적인 건강관리와 의료서비스를 제공한다.     이번 지정으로 서울백병원은 △현장 활동 소방공무원의 건강관리 지원체계 구축 △구급대원 응급처치 능력향상을 위한 교육지원 △소방현장활동 및 훈련 중 부상자</p>
                              <em class="date">2018-08-06</em>
                           </a>
                        </li>
                        
                        <li class="">
                           <a href="intro/news_view.asp?p_gub=NEWS&p_seq=1279">
                              <span class="tit">하정구 교수, LG 세이커스 프로농구단 필드 닥터 위촉</span>
                              <p> 하정구 교수, LG 세이커스 프로농구단 필드 닥터 위촉  &nbsp;  인제대학교 서울백병원 정형외과 하정구 교수는 지난 6월 1일 2018~2019시즌 LG 세이커스 프로농구단(이하 LG 농구단)의 필드 닥터로 위촉되어 7월 25일 위촉식을 가졌다.  &nbsp;  필드 닥터로 위촉된 하정</p>
                              <em class="date">2018-07-26</em>
                           </a>
                        </li>
                        
                     </ul>
                     
                  </div>
               </div>
               <div class="col col3">
                  <div class="news-box news-toggle">
                     <h3>공지</h3>
                     <a href="/seoul/intro/notice_list.asp" class="btn-more"><i class="ico ico-more">더보기</i></a>
                     
                     <ul>
                        
                        <li class="open ">
                           <a href="intro/notice_view.asp?p_gub=NOTICE&p_seq=1263">
                              <span class="tit">인터넷 진료예약시 실명인증 적용에 관한 안내</span>
                              <p> 서울백병원은 인터넷 진료예약시 주민등록번호에 대한 검증절차로 실명확인 서비스를 적용하게 되었습니다.  아래의 관련 참고사항으로 이해를 돕고자 합니다.     - 실명인증은 신용평가정보업체(SCI평가정보)의 서비스를 이용합니다.  - 환자분의 성명과 주민번호가 정확하게 일치해야 합니다.  - 아래의 경우 실명인증이 되지 않을 수 있습니다.  &nbsp;1) 인증업체에 등록되지 않은 14세 미만의 유,소아  &nbsp;2) 개명을 했으나 해당 정보가 인증업체에 반영되지 않은 경우  &nbsp;3)</p>
                              <em class="date">2018-06-08</em>
                           </a>
                        </li>
                        
                        <li class="">
                           <a href="intro/notice_view.asp?p_gub=NOTICE&p_seq=1229">
                              <span class="tit">2018년도 서울백병원 인턴합격자 발표</span>
                              <p>2018년도 서울백병원 인턴합격자 발표 

서울백병원의 한 가족이 되신것을 진심으로 축하드립니다. 

수험번호 성명 

013   김*운
005   김*민
011   문*영
007   박*윤
010   봉*라
001   안*민
008   오*주
004   이*기
012   이*경
006   이*제
009   조*은

- 이상 11명(성명 가나다순.) 


1. 입사서류는 반드시 2월 8일(목)까지 도착할수 있도록 방문접수 혹은 빠른등기우편으로 보내주시기 바랍니다. 

* 보내실 주소 : 우) 04551 
서울시 중구 마른내로 9(저동 2가 85) 인제대학교 서울백병원 교육수련부 이동훈 

○ 인사기</p>
                              <em class="date">2018-02-02</em>
                           </a>
                        </li>
                        
                        <li class="">
                           <a href="intro/notice_view.asp?p_gub=NOTICE&p_seq=1217">
                              <span class="tit">2018년 신규간호사 임상교육 [원내사용 의학용어, 약어 ..</span>
                              <p>2018년 신규간호사 임상교육 [원내사용 의학용어, 약어 모음집]</p>
                              <em class="date">2017-12-27</em>
                           </a>
                        </li>
                        
                     </ul>
                     
                  </div>
               </div>
               <div class="col col3">
                  <div class="news-box type-report">
                     <h3>언론보도</h3>
                     <a href="/seoul/intro/media_list.asp" class="btn-more"><i class="ico ico-more">더보기</i></a>
                     
                     <ul>
                        
                        <li class="open new">
                           <a href="http://news.hankyung.com/article/2018081245471" target="_blank">
                              <span class="tit">[생활속의 건강이야기] 건강에 좋은 음료</span>
                              <em class="write">가정의학과 강재헌 교수</em>
                              <em class="date">2018-08-13</em>
                              <div class="label-wrap">
                                 <span class="label-news">한국경제</span>
                              </div>
                           </a>
                        </li>
                        
                        <li class="open new">
                           <a href="http://news.mk.co.kr/newsRead.php?year=2018&no=499907" target="_blank">
                              <span class="tit">무수혈 수술, 일반수술과 사망률·합병증 차이 없다</span>
                              <em class="write">정형외과 윤병호 교수</em>
                              <em class="date">2018-08-09</em>
                              <div class="label-wrap">
                                 <span class="label-news">매일경제</span>
                              </div>
                           </a>
                        </li>
                        
                     </ul>
                     
                  </div>
               </div>
               <div class="col col3">
                  <ul class="service-link">
                     <li class="link-recruit"><a href="/seoul/intro/recruit_list.asp"><em>채용</em><i>바로가기</i></a></li>
                     <li class="link-bidding"><a href="/seoul/intro/tender_list.asp"><em>입찰</em><i>바로가기</i></a></li>
                     <li class="link-healthChair"><a href="/seoul/medicine/health_list.asp"><em>건강강좌</em><i>바로가기</i></a></li>
                  </ul>
               </div>
            </div>
         </div>
      </section>

      <section class="section section05">
         <div class="inner">
            <h2 class="tit-sec">SNS</h2>
            <p class="txt-summery">서울백병원의 SNS 채널을 소개합니다.</p>
            <div class="row">
               
               <div class="col col3">
                  <div class="sns-box">
                     <h3>페이스북</h3>
                     <a href="https://www.facebook.com/SeoulPaik/posts/1710308935717838" target="_blank" title="새창">
                        <span class="thumb" data-img="/file/images/2018/05/1842585.jpg"><i class="ico ico-facebook"></i></span>
                        <span class="tit">인제대학교 서울백병원, 2018 소비자에게 신뢰받는 착한 브랜드 대상 수상</span>
                        <span class="date">대학병원 부분</span>
                     </a>
                     <a href="https://www.facebook.com/SeoulPaik/" target="_blank" class="btn-more"><i class="ico ico-more">더보기</i></a>
                  </div>
               </div>
               
               <div class="col col3">
                  <div class="sns-box">
                     <h3>네이버포스트</h3>
                     <a href="https://m.post.naver.com/viewer/postView.nhn?volumeNo=16468217&memberNo=36070308" target="_blank" title="새창">
                        <span class="thumb" data-img="/file/images/2018/08/1039575.jpg"><i class="ico ico-post"></i></span>
                        <span class="tit">부부 사이에도 팀워크가 필요하다!</span>
                        <span class="date">정신건강의학과 김원 교수</span>
                     </a>
                     <a href="http://post.naver.com/seoul_paik" target="_blank" class="btn-more"><i class="ico ico-more">더보기</i></a>
                  </div>
               </div>
               
               <div class="col col3">
                  <div class="sns-box">
                     <h3>네이버TV</h3>
                     <a href="https://tv.naver.com/v/3679880" target="_blank" title="새창">
                        <span class="thumb" data-img="/file/images/2018/07/2633230.jpg"><i class="ico ico-naverTv"></i></span>
                        <span class="tit">[Health Focus] 고혈압 Q&A                 </span>
                        <span class="date">심장내과 김병규 교수</span>
                     </a>
                     <a href="http://tv.naver.com/paik/" target="_blank" class="btn-more"><i class="ico ico-more">더보기</i></a>
                  </div>
               </div>
               
               <div class="col col3">
                  <div class="sns-box">
                     <h3>네이버블로그</h3>
                     <a href="https://blog.naver.com/seoul_paik/221322167816" target="_blank" title="새창">
                        <span class="thumb" data-img="/file/images/2018/07/2633391.jpg"><i class="ico ico-blog"></i></span>
                        <span class="tit">서울백병원-한국전력 프로배구단 빅스톰, 지정병원 진료협약 체결</span>
                        <span class="date">배구단 주치의 수행 및 경기 의무지원</span>
                     </a>
                     <a href="http://blog.naver.com/seoul_paik" target="_blank" class="btn-more"><i class="ico ico-more">더보기</i></a>
                  </div>
               </div>
               
            </div>
         </div>
      </section>

      <!-- quick-menuWrap -->
            <div class="quick-menuWrap">
         <div class="inner">
            <!-- share-menu -->
            <div class="share-wrap">
               <strong class="tit">페이지 공유</strong>
               <ul class="share-list">
                  <li><a href="#" onclick="sendSns('twitter', '/seoul/main.asp?', '')" title="트위터"><i class="ico ico-twitter4">트위터로 공유하기</i></a></li>
                  <li><a href="#" onclick="sendSns('facebook', '/seoul/main.asp?', '')" title="페이스북"><i class="ico ico-facebook4">페이스북으로 공유하기</i></a></li>
                  <!--li><a href="#" target="_blank" title="메일"><i class="ico ico-mail4">메일로 공유하기</i></a></li-->
                  <li><a href="#" onclick="sendSns('kakaotalk', '/seoul/main.asp?', '')" title="카카오톡"><i class="ico ico-kakao4">카카오톡으로 공유하기</i></a></li>
                  <li><a href="#" onclick="sendSns('naver', '/seoul/main.asp?', '')" title="네이버"><i class="ico ico-naver4">네이버로 공유하기</i></a></li>
               </ul>
            </div>
            <!-- //share-menu -->
            <!-- quick-menu -->
            <div class="quick-menu dtTable">
               <div class="dtTable dtCol">
                  <h3>진료과</h3>
                  <dl class="dtCol">
                     <dt><em>내과</em></dt>
                     <dd>
                        <ul id="medicalTeamList1">
                           <!-- <li><a href="/seoul/treatment/treatment_index.asp?titVal=내과&iconVal=ico-02">내과</a></li> -->
                           <li><a href="/seoul/dept/?cid=1016">내분비내과</a></li>
                           <!-- <li><a href="/seoul/treatment/treatment_index.asp?titVal=노인내과&iconVal=ico-48">노인내과</a></li> -->
                           <li><a href="/seoul/dept/?cid=1020">류마티스내과</a></li>
                           <li><a href="/seoul/dept/?cid=1014">소화기내과</a></li>
                           <li><a href="/seoul/dept/?cid=1019">신장내과</a></li>
                           <li><a href="/seoul/dept/?cid=1015">심장내과</a></li>
                           <li><a href="/seoul/dept/?cid=1021">혈액종양내과</a></li>
                           <li><a href="/seoul/dept/?cid=1017">호흡기내과</a></li>
                        </ul>
                     </dd>
                  </dl>
                  <dl class="dtCol">
                     <dt><em>ㄱ - ㅅ</em></dt>
                     <dd>
                        <ul id="medicalTeamList2">
                           <li><a href="/seoul/dept/?cid=238">가정의학과</a></li>
                           <li><a href="/seoul/dept/?cid=89">마취통증의학과</a></li>
                           <li><a href="/seoul/dept/?cid=167">병리과</a></li>
                           <li><a href="/seoul/dept/?cid=30">비뇨의학과</a></li>
                           <li><a href="/seoul/dept/?cid=29">산부인과</a></li>
                           <li><a href="/seoul/dept/?cid=155">성형외과</a></li>
                           <li><a href="/seoul/dept/?cid=73">소아청소년과</a></li>
                           <li><a href="/seoul/dept/?cid=235">신경과</a></li>
                           <li><a href="/seoul/dept/?cid=102">신경외과</a></li>
                        </ul>
                     </dd>
                  </dl>
                  <dl class="dtCol">
                     <dt><em>ㅇ-ㅎ</em></dt>
                     <dd>
                        <ul id="medicalTeamList3">
                           <li><a href="/seoul/dept/?cid=286">안과</a></li>
                           <li><a href="/seoul/dept/?cid=76">영상의학과</a></li>
                           <li><a href="/seoul/dept/?cid=284">외과</a></li>
                           <li><a href="/seoul/dept/?cid=408">응급의학과</a></li>
                           <li><a href="/seoul/dept/?cid=408">이비인후과</a></li>
                           <li><a href="/seoul/dept/?cid=24">정신건강의학과</a></li>
                           <li><a href="/seoul/dept/?cid=72">정형외과</a></li>
                           <li><a href="/seoul/dept/?cid=124">진단검사의학과</a></li>
                           <li><a href="/seoul/dept/?cid=287">치과</a></li>
                           <li><a href="/seoul/dept/?cid=285">피부과</a></li>
                           <li><a href="/seoul/dept/?cid=236">흉부외과</a></li>
                        </ul>
                     </dd>
                  </dl>
               </div>
               <div class="dtCol w160">
                  <h3>전문진료센터</h3>
                  <ul id="medicalTeamList4">
                     <li><a href="/seoul/health/">건강증진센터</a></li>
                     <li><a href="/seoul/dept/?cid=715">국제진료센터</a></li>
                     <li><a href="/seoul/dept/?cid=1173">관절센터</a></li>
                     <li><a href="/seoul/dept/?cid=477">무수혈센터</a></li>
                     <li><a href="/seoul/dept/?cid=1061">비만체형관리센터</a></li>
                     <li><a href="/seoul/dept/?cid=1138">소화기내시경센터</a></li>
                     <li><a href="/seoul/dept/?cid=1119">스포츠메디컬센터</a></li>
                     <li><a href="/seoul/dept/?cid=408">응급의료센터</a></li>
                     <li><a href="/seoul/dept/?cid=1121">인공신장실</a></li>
                     <li><a href="/seoul/refer/">진료협력센터</a></li>
                     <li><a href="/seoul/dept/?cid=1139">호흡기센터</a></li>
                  </ul>
               </div>
               <div class="dtCol w345">
                  <h3>특수클리닉</h3>
                  <div class="accordion-wrap">
                     <dl class="accordion-department">
                        <dt class="accordion-tit">ㄱ ~ ㅁ</dt>
                        <dd>
                           <ul id="medicalTeamList5" class="accordion-list">
                              <li><a href="/seoul/dept/?cid=1080">간담췌클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=333">경추(목디스크)클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=435">고관절클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=64">공황장애클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=247">금연클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=898">남성건강클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=543">녹내장클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=48">뇌졸중클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=541">당뇨망막병증클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=379">당뇨병클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=399">두통클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=1175">레이저클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=1085">무릎통증클리닉</a></li>
                           </ul>
                        </dd>
                        <dt class="accordion-tit">ㅂ ~ ㅇ</dt>
                        <dd>
                           <ul id="medicalTeamList6" class="accordion-list">
                              <li><a href="/seoul/dept/?cid=1062">배뇨장애클리닉(여성&middot;남성)</a></li>
                              <li><a href="/seoul/dept/?cid=1079">부비동염클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=1177">부인과 내시경 복강경클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=1073">부종클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=1077">비내외 동시 수술 클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=895">빈혈클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=94">섭식장애클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=596">소아알레르기클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=577">안구건조증클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=943">어깨클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=1063">여성갱년기클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=1075">영양클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=479">우울증&middot;조울증클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=1176">이명클리닉</a></li>
                           </ul>
                        </dd>
                        <dt class="accordion-tit">ㅈ ~ ㅎ</dt>
                        <dd>
                           <ul id="medicalTeamList6" class="accordion-list">
                              <li><a href="/seoul/dept/?cid=1120">정맥류클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=1143">지방간클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=1088">직장인스트레스클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=1106">족부클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=74">천식 및 알레르기클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=1078">코골이/수면무호흡클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=1082">탈장클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=700">통증클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=1123">통풍클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=936">파킨슨병클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=1074">해외여행자클리닉</a></li>
                              <li><a href="/seoul/dept/?cid=1076">황반변성클리닉</a></li>
                           </ul>
                        </dd>
                     </dl>
                  </div>
               </div>
               <div class="dtCol">
                  <h3>바로가기</h3>
                  <ul>
                     <!-- <li><a href="#">국제진료센터</a></li> -->
                     <li><a href="/seoul/health/intro.asp" target="_blank" title="새창 열기">종합검진센터</a></li>
                     <li><a href="/refer/seoul/" target="_blank" title="새창 열기">진료협력센터</a></li>
                     <li><a href="http://spaik.futurenuri.co.kr/" target="_blank" title="새창 열기">의학도서실</a></li>
                     <li><a href="/seoul/info/social_work.asp">사회사업실</a></li>
                     <li><a href="/seoul/info/noInsurance_cost.asp">비급여진료비용</a></li>
                  </ul>
                  <div class="committee">
                     <ul>
                        <li><a href="http://www.e-irb.com/index.jsp?irbcd=20b237a1cb4549745266b0588a7f12a8" target="_blank" title="새 창 열기"><i class="ico ico-eirb2"></i><em>E-IRB</em></a></li>
                        <li><a href="/seoul/contribution/" target="_blank" title="새 창 열기"><i class="ico ico-fund"></i><em>발전기금<br/>운영위원회</em></a></li>
                     </ul>
                  </div>
               </div>
            </div>
            <!--// quick-menu -->
         </div>
      </div>

      <!--// quick-menuWrap -->
   </div>
   <!--// Container -->
   <hr>

   <!-- Footer -->
      <footer id="footer">
      <div class="inner">
         <div class="info">
            <ul class="footer-link">
               <li><a href="#popupPrivacyList" onclick="ajaxPopup('.ajaxPopup', '', '/seoul/etc/privacy_policy.asp', this, '.popup-privacyList'); return false;"><span class="white fs14">개인정보처리방침</span></a></li>
               <li class="link-policy"><a href="#popupVideoPolicy" onclick="ajaxPopup('.ajaxPopup', '', '/seoul/etc/video_policy.asp', this,'.popup-videoPolicy'); return false;">영상정보처리기기운영방침</a></li>
               <li><a href="#popRights" onclick="ajaxPopup('.ajaxPopup', '', '/seoul/etc/popRights.asp', this,'.popup-popRights'); return false;">환자권리장전</a></li>
               <!--<li><a href="#">사이트맵</a></li>-->
            </ul>
            <div class="copyright">
               <address>100-032 (04551) 서울시 중구 마른내로 9 (저동2가 85)</address>
               <span>COPYRIGHT ⓒ 2018 INJE UNIVERSITY SEOUL PAIK HOSPITAL. ALL RIGHTS RESERVED.</span>
            </div>
            <div class="etc">
               <a href="http://www.koiha.or.kr/member/kr/certStatus/certList.do" target="_blank" title="새창"><i class="ico ico-certify">보건복지부 인증 의료기관</i></a>
               <div class="sns-link">
                  <a href="http://post.naver.com/seoul_paik" target="_blank" title="새창"><i class="ico ico-post2">post</i></a>
                  <a href="http://tv.naver.com/paik/" target="_blank" title="새창"><i class="ico ico-navertv">네이버TV</i></a>
                  <a href="http://blog.naver.com/seoul_paik" target="_blank" title="새창"><i class="ico ico-blog2">blog</i></a>
                  <a href="https://twitter.com/paik_hospital" target="_blank" title="새창"><i class="ico ico-twitter2">twitter</i></a>
                  <a href="https://www.facebook.com/SeoulPaik/" target="_blank" title="새창"><i class="ico ico-facebook2">facebook</i></a>
                  <!-- <a href="#" target="_blank" title="새창"><i class="ico ico-instar2">instar</i></a> -->
                  <a href="http://www.youtube.com/INJEPaikHospital" target="_blank" title="새창"><i class="ico ico-youtube2">youtube</i></a>
               </div>
            </div>
         </div>
         <div class="tel-num">
            <dl>
               <dt>대표전화(안내)</dt>
               <dd>02-2270-0114</dd>
            </dl>
         </div>
         <div class="family-site">
            <dl>
               <dt><em>FAMILY SITE</em></dt>
               <dd>
                  <ul>
                     <li><a href="/pmc/">백중앙의료원</a></li>
                     <li><a href="/busan/">부산백병원</a></li>
                     <li><a href="/sanggye/">상계백병원</a></li>
                     <li><a href="/ilsan/">일산백병원</a></li>
                     <li><a href="/haeundae/">해운대백병원</a></li>
                     <li><a href="http://www.inje.ac.kr/" target="_blank" title="새창열림">인제대학교</a></li>
                  </ul>
               </dd>
            </dl>

         </div>
      </div>
      <!-- footer_menu -->
      <div class="footer-menu">
         <div class="inner">
            <ul class="clearfix">
               <li><a href="/seoul/info/outclinic.asp"><i class="ico ico-hosp"></i>병원이용안내</a></li>
               <li><a href="/seoul/info/tell_info.asp"><i class="ico ico-phone"></i>전화번호안내</a></li>
               <li><a href="/seoul/info/direction.asp"><i class="ico ico-pin"></i>오시는길</a></li>
               <li><a href="/seoul/reservation/certificate.asp?tabIndex=0"><i class="ico ico-doc"></i>증명서발급</a></li>
               <li><a href="http://www.e-irb.com/index.jsp?irbcd=20b237a1cb4549745266b0588a7f12a8" target="_blank" title="새창열림"><i class="ico ico-eirb"></i>E-IRB</a></li>
               <li><a href="/seoul/intro/recruit_list.asp"><i class="ico ico-people"></i>채용공고</a></li>
               <li><a href="/seoul/intro/tender_list.asp"><i class="ico ico-stamp"></i>입찰공고</a></li>
            </ul>
            <a href="/seoul/main.asp" class="btn-home"><i class="ico ico-home"></i>HOME</a>
            <button type="button" class="btn-top"><i class="ico ico-top"></i>TOP</button>
         </div>
      </div>
      <!--// footer_menu -->
   </footer>

   <!-- ajax 공통팝업 -->
   <div class="ajaxPopup">
   </div>
   <!-- ajax 공통팝업 -->

   <!--// Footer -->
</div>
</body>
</html>