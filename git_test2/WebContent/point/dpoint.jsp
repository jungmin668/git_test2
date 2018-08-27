<%@page import="point.PointDAO"%>
<%@page import="point.PointDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
PointDAO dao = new PointDAO();
int idx = Integer.parseInt(session.getAttribute("IDX").toString());
//게시물 가져오기
List<PointDTO> bbs = dao.selectList(idx); 
//공유, 김태희의 게시물 2개가 bbs에 저장됨

int num1 = 0, num2 = 0;
for(PointDTO dto : bbs){
	if(dto.getDname().equals("공유")){
		num1 = dto.getP_num();
	}else if(dto.getDname().equals("김태희")){
		num2 = dto.getP_num();
	}
}
//PointDTO dto = dao.selectView(p_num);
PointDTO dto1 = dao.selectView_d(num1);
PointDTO dto2 = dao.selectView_d(num2);
System.out.println(dto1.getP_kind());

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아파GO 평점관리</title>
<link rel="stylesheet" href="../bootstrap3.3.7/css/bootstrap.min.css" />
<script src="../bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>
<script src="../bootstrap3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../include/sourcecopy_header.jsp" %>
<div class="container">	
	<div class="inner">
		<!-- aside -->
		<aside id="aside">
			<!-- snb wrap -->
				<div class="snb-wrap">
				<h2 class="tit-snb">평점 관리</h2>
				<nav class="snb">
					<ul>
						<li class="current">
							<a href="../point/HpointList" class="depth1">우리 병원 평점</a>
						</li>
						<li>
							<a href="dpoint.jsp" class="depth1">의사별 평점</a>
						</li>
					</ul>
				</nav>
			</div>

			<!--// snb wrap -->
		</aside>
		<!--// aside -->
		<hr>
		<!-- contents -->
		<article class="contents">
		<br/>
		<div class="box-type srch-box">
			<span class="tit-box">의료진 검색</span>
			<div class="srch">
				<form name="searchFrm" action="search.asp" method="post" onsubmit="return nullchk();">
				<input type="text" name="st" class="size354" placeholder="의사명으로 검색해주세요" title="의료진명 검색어 입력"></span>
				<button type="submit" class="btn btn-md btn-primary"><em>검색하기</em></button>
				</form>
			</div>
		</div>
		<div id="doctorList" class="section mar-t60">
				
					<h3 class="tit-line">치과</h3>
					<div class="list-wrap">
						
						<ul>
							
							<li>
								<div class="doctor-list">
									<span class="thumb" data-img="/git_test2/file/gongyu2.png" style="background-image: url(&quot;/git_test2/file/gongyu2.png&quot;);"></span>
									<div class="info">
										<strong class="name">공유 교수</strong>
										<ul>
											<li><i>진료과</i> 치과</li>
											<li><i>전문분야</i> <span>임플란트, 보존</span></li>
										</ul>
										<div class="btn-area w150">
											<a data-toggle="modal" href="#myModal" class="btn btn-song btn-line" id="doctor1" data-id="<%=num1%>"><em>평점</em></a>
										</div>
									</div>
								</div>
							</li>
							
							<li>
								<div class="doctor-list">
									<span class="thumb" data-img="/git_test2/file/taehee3.png" style="background-image: url(&quot;/git_test2/file/taehee3.png&quot;);"></span>
									<div class="info">
										<strong class="name">김태희 교수</strong>
										<ul>
											<li><i>진료과</i> 치과</li>
											<li><i>전문분야</i> <span>보철</span></li>
										</ul>
										<div class="btn-area w150">
											<a data-toggle="modal" href="#myModal" class="btn btn-song btn-line" id="doctor2" data-id="<%=num2%>"><em>평점</em></a>
										</div>
									</div>
								</div>
							</li>
							
						</ul>
<script type="text/javascript">
    $(function () {
        $("#doctor1").click(function () {
            var num1 = $(this).data('id');
            var kind1 = '<%=dto1.getP_kind()%>';
            var sat1 = '<%=dto1.getP_sat()%>'; 
            var total1 = '<%=dto1.getP_total()%>';
            var visitdate1 = '<%=dto1.getP_visitdate()%>';
            $(".modal-body #hiddenValue").val(num1);
            $(".modal-body #kind").text(kind1);
            $(".modal-body #sat").text(sat1);
            $(".modal-body #total").text(total1);
            $(".modal-body #visitdate").text(visitdate1);
        })
        $("#doctor2").click(function () {
            var num2 = $(this).data('id');
            var kind2 = '<%=dto2.getP_kind()%>';
            var sat2 = '<%=dto2.getP_sat()%>'; 
            var total2 = '<%=dto2.getP_total()%>';
            var visitdate2 = '<%=dto2.getP_visitdate()%>';
            $(".modal-body #hiddenValue").val(num2);
            $(".modal-body #kind").text(kind2);
            $(".modal-body #sat").text(sat2);
            $(".modal-body #total").text(total2);
            $(".modal-body #visitdate").text(visitdate2);
        })
    });
</script>
<!-- 평점 모달 창 -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
	<form name="dpointFrm">
		
	<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">				
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">평점(의사)</h4>				
			</div>
			<div class="modal-body">
				<p class="form-inline">
				<input type="hid-den" name="p_num" id="hiddenValue" value=""/>
				<table class="table table-bordered table-striped" style="font-size:1.2em;">
				<tr>
					<th>친절도</th>
					<td><span id="kind"></span>점</td>
				</tr>
				<tr>
					<th>진료만족도</th>
					<td><span id = "sat"></span>점</td>
				</tr>
				<tr>
					<th>총 평점</th>
					<td><span id = "total"></span>점</td>
				</tr>
				<tr>
					<th>병원내원일</th>
					<td><span id = "visitdate"></span></td>
				</tr>									
				</table>
				</p>
				<p class="form-inline">
				<!-- 댓글리스트 시작-->
				<%
				/* 
				for(CommentBoardDTO dto_c : bbs)
				{
				 */
				for(int i=0;i<5;i++){
				%>
				<div class="media">	
					<div class="media-body row text-left">
						<p style="font-size:1.1em;">
							<code>작성자</code> : b&nbsp;&nbsp;&nbsp;&nbsp;
							<code>작성일</code> : 2018-08-21
						</p>
						<p class="bg-info" style="padding:10px; font-size:1.1em;">
							댓글 내용
						</p>
					</div>		
				</div>
				<hr>
				<%
				}
				/* 
				}
				 */
				%>
				<!-- 댓글리스트 끝-->
				</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
		</form>		  
	</div>
</div>
					</div>
					
				</div>
			</div>
		</div>
		</article>
		<!--// Contents -->
	</div>	
</div>


<%@ include file="../include/sourcecopy_bottom.jsp" %>
</body>
</html>