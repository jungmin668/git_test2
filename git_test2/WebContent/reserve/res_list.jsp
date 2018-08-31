
<%@page import="util.PagingUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap3.3.7/css/bootstrap.min.css" />
<script src="<%=request.getContextPath()%>/bootstrap3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
$( document ).ready( function() {
   
   //날짜만
   $("#sday,#eday").datepicker({
      dateFormat : 'y/mm/dd',
      minDate: 0,
      maxDate: 60,
      prevText : '이전 달',
      nextText : '다음 달',
      monthNamesShort : [ '1월', '2월', '3월', '4월','5월', '6월', '7월', '8월', '9월','10월', '11월', '12월' ],
      dayNamesMin : [ '일', '월', '화', '수', '목','금', '토' ],
      changeMonth : true,
      changeYear : true,
      showMonthAfterYear : true,
      yearRange : 'c-5:c+5',
   });
 
   //날짜 선택시 전날선택 안되게 막기

   $('#sday').datepicker("option","minDate", $("#eday").val());

   $('#sday').datepicker("option","onClose",
      function(selectedDate) {
         $("#eday").datepicker(
            "option", "minDate", selectedDate);
         });
   
   //오늘날짜 등록되기
   $('search_date').datepicker({
   });
   var d = new Date();
   var month = d.getMonth()+1;
   var prettyDate = d.getFullYear()+'-'+month +'-'+d.getDate();
   $('#search_date').val(prettyDate);
});
</script>
<!-- 전체선택체크되면 체크박스 모두 체크되기 -->
<script type="text/javascript">

function allCheckFunc( obj ) {
		$("[name=checkDel]").prop("checked", $(obj).prop("checked") );
}

/* 체크박스 체크시 전체선택 체크 여부  
function oneCheckFunc( obj )
{
	var allObj = $("[name=checkAll]");
	var objName = $(obj).attr("name");

	if( $(obj).prop("checked") )
	{
		checkBoxLength = $("[name="+ objName +"]").length;
		checkedLength = $("[name="+ objName +"]:checked").length;

		if( checkBoxLength == checkedLength ) {
			allObj.prop("checked", true);
		} 
		else {
			allObj.prop("checked", false);
		}
	}
	else
	{
		allObj.prop("checked", false);
	}
}

$(function(){
	$("[name=checkAll]").click(function(){
		allCheckFunc( this );
	});
	$("[name=checkDel]").each(function(){
		$(this).click(function(){
			oneCheckFunc( $(this) );
		});
	});
});
*/

//체크박스 회원 삭제 경고창
/* $(function(){
	$("#submit").click(function(){
		var selectedCheck = new Array();
		$('.inputchk:checked').each(function(){
			selectedCheck.push(this.value);
		});
		
		if(selectedCheck.length<1){
			alert("삭제할 회원을 선택해 주세요.");
			return false;
		}
		
		var chk=confirm("삭제하시겠습니까?");
		if(chk){
			
			document.delfrm.action="../reserve/resDelete";
			document.delfrm.submit();
			alert("삭제 완료 되었습니다.");
		}
		else{
			alert("삭제 취소 되었습니다.");
			return false;
		}	
		
	});
}); */
</script>
</head>
<body>
<%@ include file="../include/sourcecopy_header.jsp"%>
<div class="container">
<center>
		<div id="wrap">
			<div class="contents_box">
				<div class="right_contents">
					<div>
					
						<div class="row text-right"
							style="margin-bottom: 20px; padding-right: 50px;">
							<!-- 검색부분 -->
							<!-- 내용이 나오는 부분s -->
							<!-- Contents영역 시작-->


<!-------------------------------------검색--------------------------------------------------->
<div class="row text-right" style="margin-top: 30px; margin-bottom: 30px; padding-right: 0px;">
	<form class="form-inline" name="searchFrm" onsubmit="return searchCheck(this);">

		<div class="input-group">
			<input type="text" style="text-align: center; width: 100px;"
				class="form-control" id="sday" name="sday" placeholder="시작일자" /> 
				<input type="text" style="text-align: center; width: 100px;" 
				class="form-control" id="eday" name="eday" placeholder="종료일자" />
			<div class="input-group-btn"></div>
		</div>

		<div class="form-group">
			<select name="searchColumn" class="form-control">
				<option value="mem_name">환자명</option>
				<option value="tel">전화번호</option>
				<option value="res_num">예약번호</option>
				<option value="res_sub">진료과목</option>
				<option value="res_date">날짜</option>
			</select>
		</div>

		<div class="input-group">
			<input type="text" name="searchWord" class="form-control" />
			<div class="input-group-btn">
				<button type="submit" class="btn btn-info">
					<i class="glyphicon glyphicon-search"> 검색 </i>
				</button>
			</div>
		</div>

	</form>
</div>
<!--------------------------------------검색끝-------------------------------------------- -->
<!----------------------------------- 게시판 리스트  ----------------------->
<!-- table>tr*2>td*6 -->
<form action="../sendSMS/index.jsp" method="post">
<table class="table table-bordered table-hover">
				<colgroup>
					<col width="40px" />
					<col width="80px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="30px" />
				</colgroup>
				<thead>
					<tr>
						 
						<th class="text-center">예약번호</th>
						<th class="text-center">병원명</th>
						<th class="text-center">진료과목</th>
						<th class="text-center">예약일</th>
						<th class="text-center">예약시간</th>
						<th class="text-center">환자명</th>
						<th class="text-center">전화번호</th>
						<th class="text-center">선택</th>
					</tr>
				</thead>
<!------------------- 게시물 반복 --------------------->
<tbody>
<c:choose>
	<c:when test="${empty lists}">
		<!-- 등록된 게시물이 없을때... -->
		<tr>
			<td colspan="8">예약내용이 없습니다.</td>
		</tr>
	</c:when>
	<c:otherwise>

		<!-- 등록된 글이 있을때 반복하면서 리스트 출력 -->
		<c:forEach items="${lists }" var="row" varStatus="loop">
			<tr>
				 
				<%-- <input type="hid den" name="num" value="${row.res_num }" />
				<input type="hid den" name="mem_id" value="${row.mem_id }" /> --%>
				<%-- <td class="text-center">
				${map.totalCount-(((map.nowPage-1)*map.pageSize)+loop.index)}
				</td> --%>
				
				<td class="text-center">${row.res_num}</td>
				<td class="text-center">${row.res_hname}</td>
				<td class="text-center">
					<a href="../reserve/resView?res_num=${row.res_num }&nowPage=${param.nowPage}">${row.res_sub}</a>
				</td>
				<td class="text-center">${row.res_date}</td>
				<td class="text-center">${row.res_time}</td>
				<td class="text-center"><a href="../reserve/resView?res_num=${row.res_num }&nowPage=${param.nowPage }">${row.mem_name}</a>
				</td>
				<td class="text-center"><a
					href="../reserve/resView?res_num=${row.res_num }&nowPage=${param.nowPage }">${row.tel}</a>
				</td> 
				<td class="text-center">
					<input type="checkbox" name="check" value="${row.res_num}"/> 
				</td>	
				
			</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
</tbody>
</table>
<!------------------- 게시물 반복끝  --------------------->

<div class="row" style="text-align: right;">
	
	<!-- <p>
		<button type="submit" id="submit" class="btn btn-danger">선택예약삭제</button>
	</p> -->	 
	<p>
		<button type="submit" id="submit" class="btn btn-danger">선택시 문자 발송 하러 가기</button>
	</p>
	</form>
	<!-- 페이지번호 -->
	<div class="row text-center">
		<ul class="pagination">${pagingImg }
		</ul>
	</div>


</div>
<!-- Contents영역 끝-->

						</div>
					</div>
				</div>
			</div>

		</div>
</center>

</div>
<%@ include file="../include/sourcecopy_bottom.jsp"%>
</body>
</html>