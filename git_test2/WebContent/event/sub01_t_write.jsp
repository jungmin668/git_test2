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

<script type="text/javascript">
	 
</script>
<body>
	<div class="container">
		<%@ include file="../include/sourcecopy_header.jsp"%>
		<center>
			<div id="wrap">

				<div class="contents_box">

					<div class="right_contents">

						<div>
							<!-- 컨텐츠 영역 -->
							<form name="writeFrm" method="post" action="../event/write"
								onsubmit="return isValidate(this);">

								<table class="table table-bordered">
									<colgroup>
										<col width="20%" />
										<col width="*" />
									</colgroup>
									<tbody>
										<tr>
											<th class="text-center" style="vertical-align: middle;">작성자</th>
											<td><input type="text" name="name" class="form-control"
												style="width: 100px;" /></td>
										</tr>

										<tr>
											<th class="text-center" style="vertical-align: middle;">제목</th>
											<td><input type="text" class="form-control" name="title" />
											</td>
										</tr>
										<tr>
											<th class="text-center" style="vertical-align: middle;">내용</th>
											<td><textarea rows="10" class="form-control"
													name="content"></textarea></td>
										</tr>

									</tbody>
								</table>

								<div class="row text-center" style="">
									<!-- 각종 버튼 부분 -->

									<button type="submit" class="btn btn-danger">전송하기</button>
									<button type="reset" class="btn">Reset</button>
									<button type="butto n" class="btn btn-warning"
										onclick="location.href='../Event/EventList';">리스트보기</button>
								</div>
							</form>
							<!-- 끝 -->

						</div>
					</div>
				</div>

			</div>

		</center>
		<%@ include file="../include/sourcecopy_bottom.jsp"%>
	</div>
</body>
</html>