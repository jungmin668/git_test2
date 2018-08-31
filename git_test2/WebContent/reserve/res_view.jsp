 
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
<div class="row text-right" style="margin-bottom:20px; padding-right:50px;">
<!-- 검색부분 -->
<!-- 내용이 나오는 부분s -->
         <!-- Contents 시작 -->
				<table class="table table-bordered table-striped">
					<colgroup>
						<col width="20%" />
						<col width="30%" />
						<col width="20%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th class="text-center" style="vertical-align: middle;">예약번호</th>
							<td>${dto.res_num }</td>
							
							<th class="text-center" style="vertical-align: middle;">아이디</th>
							<td>${dto.res_id }</td>
						</tr>
						
						<tr>
							<th class="text-center" style="vertical-align: middle;">병원명</th>
							<td>${dto.res_hname }</td>
							
							<th class="text-center" style="vertical-align: middle;">진료과목</th>
							<td>${dto.res_sub }</td>
						</tr>
						
						<tr>
							<th class="text-center" style="vertical-align: middle;">예약날짜</th>
							<td >${dto.res_date }</td>
							
							<th class="text-center" style="vertical-align: middle;">예약시간</th>
							<td >${dto.res_time }</td>
						</tr>
						<!-- 환자 인적사항 추가  -->
						<tr>
							<th class="text-center" style="vertical-align: middle;">환자명</th>
							<td >${dto.mem_name }</td>
							
							<th class="text-center" style="vertical-align: middle;">전화번호</th>
							<td >${dto.tel }</td>
						</tr>
						<tr>
							<th class="text-center" style="vertical-align: middle;">생년월일</th>
							<td >${dto.mem_bir }</td>
							
							<th class="text-center" style="vertical-align: middle;">성별</th>
							<td >${dto.mem_gender }</td>
						</tr>
						<tr>
							<th class="text-center" style="vertical-align: middle;">예약내용</th>
							<td colspan="3" style="height: 150px;">${dto.res_note }</td>
						</tr>
					</tbody>
				</table>

				<!-- 각종 버튼 -->
				<div class="row text-center" style="padding-right: 50px;">
					<button type="button" class="btn btn-success"
						onclick="location.href='../reserve/resEdit?res_num=${param.res_num}&mode=edit&nowPage=${param.nowPage }';">
						수정하기</button>
					<button type="button" class="btn btn-info"
						onclick="location.href='../reserve/ResDelete?res_num=${dto.res_num}&mode=delete&nowPage=${param.nowPage }';">
						삭제하기</button>
					<button type="button" class="btn btn-danger"
						onclick="location.href='./resList?nowPage=${param.nowPage}';">
						리스트보기</button>
				</div>

				<!-- Contents 끝 -->
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