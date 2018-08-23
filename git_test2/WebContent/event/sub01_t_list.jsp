<%@page import="event.EventDTO"%>
<%@page import="event.HospitalDAO"%>
<%@page import="util.PagingUtil"%> 
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap3.3.7/css/bootstrap.min.css" />
<script src="<%=request.getContextPath() %>/bootstrap3.3.7/js/bootstrap.min.js"></script>
<body>
	<%@ include file="../include/sourcecopy_header.jsp" %>
<div class="container">
	<center>
	<div id="wrap">
		
		<div class="contents_box">
			
			
			<div class="right_contents">
				
				<div>
<div class="row text-right" style="margin-bottom:20px;
		padding-right:50px;">
<!-- 검색부분 -->
<!-- 내용이 나오는 부분s -->
				<!-- Contents영역 시작-->		
<!-- 검색 -->
<div class="row text-right" style="margin-bottom:20px;
	padding-right:50px;">
<form class="form-inline">
	<div class="form-group">
		<select name="searchColumn" class="form-control">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="name">작성자</option>
		</select>
	</div>
	<div class="input-group">
		<input type="text" name="searchWord" class="form-control" />
		<div class="input-group-btn">
			<button type="submit" class="btn btn-info">
				<i class="glyphicon glyphicon-search">
				</i>
			</button>
		</div>				
	</div>
</form>	
</div>

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
								<th class="text-center">index</th>
								<th class="text-center">title</th>
								<th class="text-center">contents</th>
								<th class="text-center">Date</th>
								<th class="text-center">VisitCount</th> 
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${empty lists }">
								<!-- 등록된 게시물이 없을때... -->
								<tr>
									<td colspan="6">
										등록된 글 없씸 ㅜㅜ;
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<!-- 등록된 글이 있을때 반복하면서 리스트 출력 -->
								<c:forEach items="${lists }" var="row" varStatus="loop">
									<tr>
										<td class="text-center">
											${map.totalCount - (((map.nowPage-1) * map.pageSize) + loop.index) }				         
										</td>
										<th class="text-left">
											<a href="../View/eventView?e_num=${row.e_num }&nowPage=${param.nowPage }">
												${row.e_title }
											</a>					
										</th>
										<td class="text-center">${row.e_content }</td>
										<td class="text-center">${row.e_postdate }</td>
										<td class="text-center">${row.e_hits }</td>
										  
										</td>
									</tr>
								</c:forEach>		
							</c:otherwise>	
						</c:choose>
						</table>
						
						<!-- 각종 버튼 -->
						<div class="row text-right" style="padding-right:50px;">
							<button type="button" class="btn btn-primary"
								onclick="location.href='../Community/CommWrite';">
								글쓰기</button>
						</div> 
						
						<!-- 페이지번호 -->
						<div class="row text-center">
							<ul class="pagination">
								${pagingImg }
							</ul>
						</div>
										<!-- Contents영역 끝-->
				<!-- 내용이 나오는 부분e -->


				</div>
			
			</div>
		</div>
		
	</div>

	</center>
	
</div>
	<%@ include file="../include/sourcecopy_bottom.jsp" %>
 </body>
</html>