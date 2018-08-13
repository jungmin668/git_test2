<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
 
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="../bootstrap3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../bootstrap3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style type="text/css">
@import url("../css/new.css");
</style>
 
<script type="text/javascript">

function fnJuminFocus(obj){
//입력된 값이 6자리 라면 .  
	if(obj.value.length == 6){
	//ju2 쪽으로 포커스를 이동시켜라.
	document.getElementById("ju2").focus();
	}
}


function focusMove(obj, m_length, next_obj){
// 사용자로부터 입력받은 값의 길이가 매개변수의 최대 길이와 같을때 
	if(obj.value.length==m_length)
	{	//DOM 객체로 받아온 다음 객체의 값을 이동시켜라 .
	document.getElementById(next_obj).focus();
	}
}

 
	function searchCheck(f) {
		if (f.searchWord.value == "") {
			alert("검색할 단어를 입력하세요");
			f.searchWord.focus();
			return false;
		}
	}
	function zipcodeFind() {
		new daum.Postcode({
			oncomplete : function(data) {
				var fn = document.memberFrm;
				fn.zipcode.value = data.zonecode;//우편번호
				fn.addr1.value = data.address;//기본주소
				fn.addr2.focus();//상세주소로 포커스 이동
			}
		}).open();
	}
	
	 
</script>
<title>게시판 리스트</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<!-- 상단영역 -->
		<%-- <%@ include file="../BoardSkin/commonTop.jsp"%> --%>
		</div>
		<div class="row">
			<!-- Body영역 -->
			<div class="col-xs-3 col-md-3">
				<!-- 좌측영역 -->
				<%-- <%@ include file="../BoardSkin/commonLeft.jsp"%> --%>
			</div>
			<div class="col-xs-9 col-md-9">
				<!-- Contents영역 시작-->
				 

				<div id="wrap">
      

      <img src="../images/market/KakaoTalk_20180811_011443658.jpg" id="main_visual" />
     	</p>

      <div class="contents_box">
         <div class="left_contents">
             
           
         </div>
        <div class="right_contents">
         <form name="memberFrm" action="어디로 보낼까~" method="post" onsubmit="return mValidate(this);">
         
            <div class="top_title">
               <img src="../images/join_tit.gif" alt="회원가입폼" class="con_title" />
               <p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;회원가입&nbsp;>&nbsp;개인회원<p></p>
            </div>
            <table cellpadding="0" cellspacing="0" border="0" class="con_table" style="width:100%;">
               <colgroup>
                  <col width="25%" />
                  <col width="*" />
               </colgroup>
               <tbody>
                  <tr>
                     <th>이름</th>
                     <td style="text-align:left;"><input type="text" name="name"  value="" class="join_input" /></td>
                  </tr>
                  <tr>
                     <th>성별</th>  
                     <td style="text-align:left;"><input type="radio" name="gender"  value="남" /> 남
						&nbsp;&nbsp;&nbsp;<input type="radio" name="gender"  value="여" /> 여</td>                  
				</tr>
				<!-- 데이터 피커  -->
                  <tr>
                     <th>생년월일</th>  
                     <td style="text-align:left;">
                     <!-- 넣은곳  -->
				<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
				<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
				<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
				 
				 
				 <script>
				$(function(){
					$("#birthday").datepicker({
					
				dateFormat: 'yy-mm-dd' , 
				prevText: '이전 달',
				nextText: '다음 달',
				monthNamesShort : ['1월' , '2월' , '3월' , '4월' , '5월' , '6월' , '7월' , '8월' , '9월' , '10월' , '11월', '12월'],
				dayNamesMin : ['일','월','화','수','목','금','토'],
				changeMonth:true,
				changeYear : true,
				showMonthAfterYear: true,
				yearRange: 'c-100:c'
					});
				});
				
				
				 </script>
				<style> 
				
				.ui-datepicker{ font-size:12px; width:180px;}
				.ui-datepicker select.ui-datepicker-month{width:50%; font-size:11px;}
				.ui-datepicker select.ui-datepicker-year{width:50%; font-size:11px;}
				.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:first-child a { color:#f00; }
				.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:last-child a { color:#00f; }
				</style> 
				  
  <input type="text" id="birthday" placeholder="날짜넣기">
                     <!-- 넣은곳  -->
                     </td>                   
				</tr>
                  <tr>
                     <th>아이디</th>
                     <td style="text-align:left;"><input type="text" name="id"  value="" class="join_input" /></td>
                  </tr>
                  <tr>
                     <th>비밀번호</th>
                     <td style="text-align:left;"><input type="password" name="pass"  value="" class="join_input" style="width:300px;" /></td>
                  </tr>
                  <tr>
                     <th >어디가 아프신가요</th>
                   <td style="text-align:left;"><input type="text" name=""  value="" class="join_input" /></td> 
                  </tr>
                  <tr>
                     <th>관심질병</th>
                     <td style="text-align:left;"> 
                    <input type="checkbox" name="intr" value="눈">눈
					<input type="checkbox" name="intr" value="코" checked="checked">코
					<input type="checkbox" name="intr" value="입">입
					<input type="checkbox" name="intr" value="귀">귀
					<input type="checkbox" name="intr" value="목">목
					<input type="checkbox" name="intr" value="머리">머리
					<input type="checkbox" name="intr" value="손">손
					<input type="checkbox" name="intr" value="발">발	
									
					</td>    
                  </tr>
                  <tr>
                     <th>전화번호</th>
                     <td style="text-align:left;">
                       
                           <tr>
                              <th>전화번호1(개인휴대폰번호)</th>
                              <td style="text-align:left;"><input type="text" maxlength="3" size="3" name="numc1" id="tel1" value="" class="join_input" style="width:50px;" onkeyup="focusMove(this,3,'tel2');" /> - <input type="text" name="numc2" id="tel2" maxlength="4" size="4" value="" class="join_input" style="width:50px;" onkeyup="focusMove(this,4,'tel3');"/> - <input type="text" name="numc3" maxlength="4" size="4" id="tel3"value="" class="join_input" style="width:50px;" /></td>
                           </tr>
                           <tr>
                              <th>전화번호2(집전화번호)</th>
                              <td style="text-align:left;"><input type="text" maxlength="3" size="3" name="numz1" id="tela1" value="" class="join_input" style="width:50px;" onkeyup="focusMove(this,3,'tela2');" /> - <input type="text" name="numz2" maxlength="4" id="tela2" value="" class="join_input" style="width:50px;" onkeyup="focusMove(this,4,'tela3');"/> - <input type="text" name="numz3" maxlength="4" value="" id="tela3" class="join_input" style="width:50px;" /></td>
                           </tr> 
                     </td>
                  </tr>
                 <tr>
						<th>우편번호</th>
						<td style="text-align:left;" style="padding:0px;">
						<!-- 우편번호 -->
						<input type="text" name="zipcode" value=""  class="join_input" style="width:100px;" />
						
						<a href="javascript:;" title="새 창으로 열림" onclick="zipcodeFind();" onkeypress="">[우편번호검색]</a>
						<br/>
						<!-- 주소 -->
						<input type="text" name="addr1" value=""  class="join_input" style="width:550px; margin-top:5px;" /><br>
						<input type="text" name="addr2" value=""  class="join_input" style="width:550px; margin-top:5px;" />
						
						</td>
					</tr>
                  <tr>
                     <th>이메일</th>
                     <td style="text-align:left;">
                     	<input type="text" name="email1"  value="" class="join_input" style="width:100px;" /> @ <input type="text" name="email2"  value="" class="join_input" style="width:100px;" />    
							<select name="last_email_check2" onChange="email_input(this,this.form);" class="pass" id="last_email_check2" >
								<option selected="" value="">선택해주세요</option>
								<option value="1" >직접입력</option>
								<option value="dreamwiz.com" >dreamwiz.com</option>
								<option value="empal.com" >empal.com</option>
								<option value="empas.com" >empas.com</option>
								<option value="freechal.com" >freechal.com</option>
								<option value="hanafos.com" >hanafos.com</option>
								<option value="hanmail.net" >hanmail.net</option>
								<option value="hotmail.com" >hotmail.com</option>
								<option value="intizen.com" >intizen.com</option>
								<option value="korea.com" >korea.com</option>
								<option value="kornet.net" >kornet.net</option>
								<option value="msn.co.kr" >msn.co.kr</option>
								<option value="nate.com" >nate.com</option>
								<option value="naver.com" >naver.com</option>
								<option value="netian.com" >netian.com</option>
								<option value="orgio.co.kr" >orgio.co.kr</option>
								<option value="paran.com" >paran.com</option>
								<option value="sayclub.com" >sayclub.com</option>
								<option value="yahoo.co.kr" >yahoo.co.kr</option>
								<option value="yahoo.com" >yahoo.com</option>
							</select>
						<input type="checkbox" name="open_email" value="1">
						<span>이메일 수신동의</span></td>
					</td>    
                   </tr>
                  <tr>
                     <th>그다음?</th>
                     <td style="text-align:left;"><input type="text" name="etc"  value="" class="join_input" style="width:400px;" /></td>
                  </tr>
               </tbody>
            </table>
            <p style="text-align:center; margin-bottom:40px"><input type="image" src="../images/btn01.gif" />&nbsp;&nbsp;
            <input type="image" src="../images/btn02.gif" /></p>
         </form>
       </div>
      </div>
      
   </div>
				<!-- Contents영역 끝-->
			</div>
		</div>
		<div class="row"
			style="border-top: 1px solid #bbbbbb; padding-top: 20px; margin-top: 20px;">
			<!-- 하단영역 -->
			<%-- <%@ include file="../BoardSkin/commonBottom.jsp"%> --%>
		</div>
	</div>
</body>
</html>


