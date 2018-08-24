
<%@page import="util.PagingUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap3.3.7/css/bootstrap.min.css" />
<script src="<%=request.getContextPath()%>/bootstrap3.3.7/js/bootstrap.min.js"></script>
<body>
		<%@ include file="../include/sourcecopy_header.jsp"%>
	<div class="container">
		<center>
			<div id="wrap">
				<div class="contents_box">
					<div class="right_contents">
						<div>
							<div class="row text-right" style="margin-bottom: 20px; padding-right: 50px;">
								<!-- 검색부분 -->
								<!-- 내용이 나오는 부분s -->
								<!-- Contents영역 시작-->
								<!-- 검색 -->
								<div class="row text-right"
									style="margin-top: 30px; margin-bottom: 30px; padding-right: 0px;">
									<form class="form-inline" name="searchFrm"
										onsubmit="return searchCheck(this);">
										<div class="form-group">
											<select name="searchColumn" class="form-control">
												<option value="res_id">아이디</option>											
												<option value="res_hname">병원명</option>
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

								<!-- 게시판 리스트  -->
								<!-- table>tr*2>td*6 -->
								<table class="table table-bordered table-hover">
									<colgroup>
										<col width="80px" />
										<col width="100px" />
										<col width="100px" />
										<col width="100px" />
										<col width="100px" />
										<col width="200px" />
										<col width="50px" />
									</colgroup>
									<thead>
										<tr>
											<th class="text-center">예약번호</th>
											<th class="text-center">병원명</th>
											<th class="text-center">진료과목</th>
											<th class="text-center">예약일</th>
											<th class="text-center">예약시간</th>
											<th class="text-center">예약내용</th>
											<th class="text-center">아이디</th>
										</tr>
									</thead>
									<tbody>

										<c:choose>
											<c:when test="${empty lists }">
												<!-- 등록된 게시물이 없을때... -->
												<tr>
													<td colspan="7">예약내용이 없습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
											
												<!-- 등록된 글이 있을때 반복하면서 리스트 출력 -->
												<c:forEach items="${lists }" var="row" varStatus="loop">
													<tr>
														<td class="text-center">${map.totalCount - (((map.nowPage-1) * map.pageSize) + loop.index) }
														</td>

														<td class="text-left">
														<a href="../reserve/resView?res_num=${row.res_num }&nowPage=${param.nowPage }">${row.res_hname }</a>
														</td>
														<td class="text-center">${row.res_sub }</td>
														<td class="text-center">${row.res_date }</td>
														<td class="text-center">${row.res_time}</td>
														<td class="text-center">${row.res_note}</td>
														<td class="text-center">${row.res_id}</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>

									</tbody>
								</table>

								<!-- 페이지번호 -->
								<div class="row text-center">
									<ul class="pagination">${pagingImg }
									</ul>
								</div>

								<!-- Contents영역 끝-->
		
							</div>

						</div>
					</div>

				</div>
		</center>

	</div>
		<%@ include file="../include/sourcecopy_bottom.jsp"%>
</body>
</html>