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
	function isDelete() {
		var ans = confirm("정말로 삭제하시겠습니까?");
		if (ans == true) {
			//삭제처리페이지로 전송
			var f = document.writeFrm;
			f.action = "DeleteProc.jsp";
			f.method = "post";
			f.submit();
		}
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
							<!-- 내용 삽입 s -->

							<form action="../event/modify" method="post" var="param">
								<!-- 게시물 수정을 위한 일련번호 추가 -->
								<input type="hidden" name="e_num" value="${dto.e_num}" />
								<input type="hidden" name="nowPage" value="${param.nowPage }" />
								<table class="table table-bordered table-striped">
									<colgroup>
										<col width="20%" />
										<col width="*" />
									</colgroup>
									<tbody>
										<tr>
											<th class="text-center" style="vertical-align: middle;">작성자</th>
											<td><input type="text" class="form-control"
												style="width: 100px;" name="id" value="${dto.e_id }" /></td>

										</tr>
										<tr>
											<th class="text-center" style="vertical-align: middle;">작성일</th>
											<td><input type="text" class="form-control" style="width:100px;" name="postdate"
											value="${dto.e_postdate }"/>
											</td>
										</tr>
										<tr>

											<th class="text-center" style="vertical-align: middle;">조회수</th>
											<td><input type="text" class="form-control"
												name="visitcount" value="${dto.e_hits }" /></td>
										</tr>
										<tr>
											<th class="text-center" style="vertical-align: middle;">제목</th>
											<td><input type="text" class="form-control" name="title"
												value="${dto.e_title }" /></td>
										</tr>
										<tr>
											<th class="text-center" style="vertical-align: middle;">내용</th>
											<td><textarea rows="10" class="form-control"
													name="content">${dto.e_content }</textarea></td>
										</tr>

									</tbody>
								</table>

								<!-- 각종 버튼 -->
								<div class="row text-center" style="padding-right: 50px;">
									<button type="submit" class="btn btn-default">전송하기</button>
									<button type="reset" class="btn">Reset</button>
									<button type="button" class="btn btn-danger"
										onclick="location.href='../event/modify';">리스트보기</button>
								</div>
							</form>
							<!-- 내용 삽입 e -->
						</div>
					</div>
				</div>

			</div>

		</center>
		<%@ include file="../include/sourcecopy_bottom.jsp"%>
	</div>
</body>
</html>