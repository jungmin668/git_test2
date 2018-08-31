<%@page import="event.EventDTO"%>
<%@page import="event.HospitalDAO"%>
<%@page import="util.PagingUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap3.3.7/css/bootstrap.min.css" />
<script
	src="<%=request.getContextPath()%>/bootstrap3.3.7/js/bootstrap.min.js"></script>
<script>

function gogo(){
$('input:checkbox[name="check"]').each(function() {

    if(this.value == "true"){ //값 비교

           this.checked = true; //checked 처리

     }

  });
}  
</script>
<body>
	<div class="container">
		<%@ include file="../include/sourcecopy_header.jsp"%>
		<center>
			<div id="wrap">

				<div class="contents_box">

					<div class="right_contents">

						<div>
							<br />
							</p>
							<div class="row text-right"
								style="margin-bottom: 0px; padding-right: 0px;">
								<!-- 검색부분 -->
								<!-- 내용이 나오는 부분s -->
								<!-- Contents영역 시작-->
								<!-- 검색 -->
								<div class="row text-right"
									style="margin-bottom: 20px; padding-right: 10px;">
									<form class="form-inline">
										<input type="hid-den" name="backUrl" value="${param.backUrl}" />
										<div class="form-group">
											<select name="searchColumn" class="form-control">
												<option value="e_title">제목</option>
												<option value="e_content">내용</option>
												<option value="both">제목+내용</option>
											</select>
										</div>
										<div class="input-group">
											<input type="text" name="searchWord" class="form-control" />
											<div class="input-group-btn">
												<button type="submit" class="btn btn-info">
													<i class="glyphicon glyphicon-search"> </i>
												</button>
											</div>
										</div>
									</form>
								</div>

								<!-- 게시판 리스트  -->
								<!-- table>tr*2>td*6 -->
								<form action="../event/push" method="post">
									<table class="table table-bordered table-hover">
										<colgroup>
											<col width="80px" />
											<col width="*" />
											<col width="120px" />


										</colgroup>

										<tbody>
											<c:choose>
												<c:when test="${empty lists }">
													<!-- 등록된 게시물이 없을때... -->
													<tr>
														<td colspan="3">등록된 글 없씸 ㅜㅜ;</td>
													</tr>
												</c:when>
												<c:otherwise>
													<!-- 등록된 글이 있을때 반복하면서 리스트 출력 -->
													<c:forEach items="${lists }" var="row" varStatus="loop">
														<div class="col-md-4">
															<div class="thumbnail">
																<a href="../View/eventView?e_num=${row.e_num }&nowPage=${param.nowPage}">
																	<input type="hidden" name="h_num"  value ="${row.e_num }"/>
																	<img src="../Upload/${row.chumfile }" alt="겔러리이미지"
																	width="100%">
																	<div class="caption">
																		<p>
																			<a href="../View/eventView?e_num=${row.e_num }&nowPage=${param.nowPage }">
																				${row.e_title } <input type="checkbox" name="check" value="${row.e_num }"  />

																			</a>
																		</p>
																	</div>
																</a>
															</div>
														</div>
													</c:forEach>
												</c:otherwise>
											</c:choose>
									</table>
							
								<!-- 각종 버튼 -->
								<div class="row text-right" style="padding-right: 0px;">
									<button type="button" class="btn btn-primary"
										onclick="location.href='../event/sub01_t_write.jsp';">글쓰기</button>
									<button type="submit" class="btn btn-primary">
									체크된 이벤트 를 메인에 노출  </button>
								</div>
						</form>
								<!-- 페이지번호 -->
								<div class="row text-center">
									<ul class="pagination">${pagingImg }
									</ul>
								</div>
								<!-- Contents영역 끝-->
								<!-- 내용이 나오는 부분e -->

							</div>

						</div>
					</div>

				</div>
		</center>

		<%@ include file="../include/sourcecopy_bottom.jsp"%>
	</div>
</body>
</html>