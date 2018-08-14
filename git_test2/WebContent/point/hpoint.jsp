<%@page import="util.PagingUtil"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제목은 여기에</title>
<link rel="stylesheet" href="../common/bootstrap3.3.7/css/bootstrap.min.css" />
<script src="../common/bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="container">
	<%@ include file="../sourcecopy_header.jsp" %>
	<br/>
	<div style="text-align:center;">
	<b><span style="color:red; font-size:20pt">우리 병원의 총 평점은   점 입니다.</span></b>
	</div>
	<br/><br/>
	<div class="inner">
		<!-- aside -->
		<aside id="aside">
			<!-- snb wrap -->
				<div class="snb-wrap">
				<h2 class="tit-snb">의료진 / 진료과</h2>
				<nav class="snb">
					<ul>
						<li class="current">
							<a href="/seoul/treatment/search.asp" class="depth1">의료진</a>
						</li>
						<li>
							<a href="/seoul/treatment/treatment_parts.asp" class="depth1">진료과</a>
						</li>
						<li class="fold">
							<a href="/seoul/treatment/center_clinic.asp" class="depth1">센터 / 클리닉</a>
							<ul class="snb_depth2">
								<li class="node2"><a href="/seoul/treatment/center_clinic.asp?tabIndex=0" class="depth2">- 전문진료센터</a></li>
								<li class="node2"><a href="/seoul/treatment/center_clinic.asp?tabIndex=1" class="depth2">- 특수클리닉</a></li>
							</ul>
						</li>
						<li class="fold">
							<a href="/seoul/treatment/ethics_info.asp" class="depth1">기타부서</a>
							<ul class="snb_depth2">
								<li class="node2"><a href="/seoul/treatment/medicaments_info.asp" class="depth2">- 약제부</a></li>
								<li class="node2"><a href="http://www.e-irb.com/index.jsp?irbcd=20b237a1cb4549745266b0588a7f12a8" target="_blank" class="depth2">- 임상시험심사위원회</a></li>
								<!-- li class="node2"><a href="/seoul/treatment/nurse_info.asp" class="depth2">- 간호부</a></li -->
								<!-- li class="node2"><a href="/seoul/treatment/training_info.asp" class="depth2">- 교육수련부</a></li -->
							</ul>
						</li>
					</ul>
				</nav>
			</div>

								<div class="department-srch" style="top: 0px;">
				<h3 class="tit-srch">진료과/센터/클리닉 바로가기</h3>
				<div class="in-sec">
					<div class="row">
						<label for="select04" class="tit">진료과</label>
						
						<button type="button" class="btn btn-gray2 btn-go" title="상세페이지 이동"><em>이동</em></button>
					</div>
					<div class="row">
						<label for="select05" class="tit">센터</label>
						
						<button type="button" class="btn btn-gray2 btn-go" title="상세페이지 이동"><em>이동</em></button>
					</div>
					
					<div class="row btn-wrap">
						<a href="/seoul/health/intro.asp" class="btn btn-md dis_block btn-depart1"><em>건강증진센터</em></a>
						<!-- <a href="/seoul/cooperate/main.asp" class="btn btn-md dis_block btn-depart2"><em>진료협력센터</em></a> -->
					</div>
				</div>
			</div>

			<!--// snb wrap -->
		</aside>
		<!--// aside -->
		<hr>
		<!-- contents -->
		<article class="contents">

			<div class="box-type srch-box">
				<h3 class="tit-box">의료진 검색</h3>
				<div class="srch">
					<form name="searchFrm" action="search.asp" method="post" onsubmit="return nullchk();">
					<input type="hidden" name="hp" value="DA">
					<span class="input-srch"><input type="text" name="st" class="size354" placeholder="의료진명으로 검색해주세요" title="의료진명 검색어 입력"></span>
					<button type="submit" class="btn btn-md btn-primary"><em>검색하기</em></button>
					</form>
				</div>
			</div>

			<div class="tab-wrap mar-t30 ui-tabs ui-corner-all ui-widget ui-widget-content">
				<ul class="tab-nav ui-tabs-nav ui-corner-all ui-helper-reset ui-helper-clearfix ui-widget-header" role="tablist">
					<li role="tab" tabindex="0" class="ui-tabs-tab ui-corner-top ui-state-default ui-tab ui-tabs-active ui-state-active" aria-controls="uiTabContent01" aria-labelledby="ui-id-7" aria-selected="true" aria-expanded="true"><a href="#uiTabContent01" role="presentation" tabindex="-1" class="ui-tabs-anchor" id="ui-id-7">진료과</a></li>
					<li role="tab" tabindex="-1" class="ui-tabs-tab ui-corner-top ui-state-default ui-tab" aria-controls="uiTabContent02" aria-labelledby="ui-id-8" aria-selected="false" aria-expanded="false"><a href="#uiTabContent02" role="presentation" tabindex="-1" class="ui-tabs-anchor" id="ui-id-8">전문센터</a></li>
					<li role="tab" tabindex="-1" class="ui-tabs-tab ui-corner-top ui-state-default ui-tab" aria-controls="uiTabContent03" aria-labelledby="ui-id-9" aria-selected="false" aria-expanded="false"><a href="#uiTabContent03" role="presentation" tabindex="-1" class="ui-tabs-anchor" id="ui-id-9">특수클리닉</a></li>
				</ul>

				<!-- 진료과 리스트 -->
				<div id="uiTabContent01" class="tab-box ui-tabs-panel ui-corner-bottom ui-widget-content" aria-labelledby="ui-id-7" role="tabpanel" aria-hidden="false">
					<div class="medical-teamList">						
						
					</div>
				</div>
				<!--// 진료과 리스트 -->
				
					
				
				</div>
				
			</div>
		</article>
		<!--// Contents -->
	</div>
	
	<form>
<!-- 게시판 리스트  -->
<!-- table>tr*2>td*6 -->
<table class="table table-bordered table-hover">
<colgroup>
	<col width="80px" />
	<col width="*" />
	<col width="120px" />
	<col width="120px" />
	<col width="80px" />
	<col width="50px" />
</colgroup>
<thead>
	<tr>
		<th class="text-center">번호</th>
		<th class="text-center">제목</th>
		<th class="text-center">작성자</th>
		<th class="text-center">작성일</th>
		<th class="text-center">조회수</th>
	</tr>
</thead>
<tbody>
<%
//if(bbs.isEmpty()){
	//컬렉션에 저장된 데이터가 없는경우
%>
		<tr>
			<td colspan="5" align="center">
				등록된 게시물이 없습니다^^*
			</td>
		</tr>
<%
/* 
}
else
{
	//컬렉션에 저장된 데이터가 있는경우 for-each문을통해
	//내용 출력
	int vNum = 0;
	int countNum = 0;
 	for(HomepyBoardDTO dto : bbs){
 		pageContext.setAttribute("dto", dto);
 		vNum = totalRecordCount - 
			(((nowPage-1)*pageSize)+countNum++);
 		//String fileName = request.getServletContext().getRealPath("/Upload")+File.separator+dto.getChumfile();
 */
%>	
	<!-- 반복시작 -->	
	<tr>
		<td class="text-center"><a href="#">번호</a></td>
		<td class="text-center">작성자</td>
		<td class="text-center">작성일</td>
		<td class="text-center">조회수</td>
	</tr>
	<!-- 반복끝 -->
<%
/* 
	}//for-each문 끝
}//if문 끝
 */
%>
</table>
</form>
<!-- 각종 버튼 -->
<!-- <div class="row text-right" style="padding-right:50px;">
	<button type="button" class="btn btn-primary"
		onclick="location.href='sub03_write.jsp?board_flag=free';">
		평점쓰기</button>
	<button type="button" class="btn btn-success">
		수정하기</button>
	<button type="button" class="btn btn-info">
		삭제하기</button>
	<button type="button" class="btn btn-warning">
		답글쓰기</button>
	<button type="button" class="btn btn-danger">
		리스트보기</button>
	<button type="button" class="btn btn-default">
		전송하기</button>
	<button type="button" class="btn">
		Reset</button>
</div> -->

<!-- 페이지번호 -->
<div class="row text-center">
	<ul class="pagination">
		<!-- <li><span class="glyphicon 
			glyphicon-fast-backward"></span></li>
		
		<li class="active"><a href="#">1</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		
		<li><span class="glyphicon 
			glyphicon-fast-forward"></span></li> -->
		<%-- <%=PagingUtil.pagingHomepy(totalRecordCount,
			pageSize, 
			blockPage,
			nowPage,
			"sub03.jsp?"+queryStr) %> --%>
	</ul>
</div>
	
	<%@ include file="../sourcecopy_bottom.jsp" %>
</div>
</body>
</html>