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
		<%@ include file="../include/sourcecopy_header.jsp"%>
	<div class="container">
		<center>
			<div id="wrap">

				<div class="contents_box">

					<div class="right_contents">

						<div>



							<form name="writeFrm">
								<%-- <input type = "hid-den" name = "e_num" value="<%=dto.getE_num()%>"/> --%>
								<table class="table table-bordered">
									<colgroup>
										<col width="20%" />
										<col width="30%" />
										<col width="20%" />
										<col width="*" />
									</colgroup>
									<tbody>
										<tr>
											<th class="text-center" style="vertical-align: middle;">작성자</th>
											<td>${dto.e_id }</td>
											<th class="text-center" style="vertical-align: middle;">작성일</th>
											<td>${dto.e_postdate }</td>
										</tr>
										<tr>

											<th class="text-center" style="vertical-align: middle;">조회수</th>
											<td>${dto.e_hits }</td>
										</tr>
										<tr>
											<th class="text-center" style="vertical-align: middle;">제목</th>
											<td colspan="3">${dto.e_title }</td>
										</tr>
										<tr>
											<th class="text-center" style="vertical-align: middle;">내용</th>
											<td colspan="3">${dto.e_content }</td>
										</tr>

									</tbody>
								</table>
								<input type="hid-den" value="${dto.e_num }" />
								<div class="row text-center" style="">
									<!-- 각종 버튼 부분 -->
									<button type="button" class="btn btn-primary"
										onclick="location.href='../event/modify?e_num=${dto.e_num}';">
										수정하기</button>
									<button type="button" class="btn btn-success"
										onclick="isDelete();">삭제하기</button>
									<button type="button" class="btn btn-warning"
										onclick="location.href='../Event/EventList';">리스트보기</button>
								</div>
							</form>




						</div>
					</div>
				</div>

			</div>

		</center>
	</div>
		<%@ include file="../include/sourcecopy_bottom.jsp"%>
</body>
</html>