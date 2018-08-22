<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
  상세보기의 경우 작성자 본인이 아니더라도 열람할수 
있어야 한다.
  대신 수정, 삭제의 경우에만 회원인증을 통하여 작성자
본인만 할수 있도록 처리한다.
*/

String num = request.getParameter("num");
/* 
//커넥션풀로 변경
//HomepyDAO dao = new HomepyDAO();

//조회수 증가
dao.updateVisitCount(num); 

//게시물 가져오기
HomepyBoardDTO dto = dao.selectView(num,board_flag);

//EL식 사용위해 페이지 영역에 저장하기
pageContext.setAttribute("dto", dto);

dao.close();//DB자원반납
 */
%>  
<script type="text/javascript">
	function isDelete(){
		var ans = confirm("정말로 삭제하시겠습니까?");
		if(ans==true){
			//삭제처리페이지로 전송
			var f = document.writeFrm;
			f.action="DeleteProc.jsp";
			f.method="post";
			f.submit();
		}
	}
</script>
 <body>
	<center>
	<div id="wrap">
		
		<div class="contents_box">
			
			<div class="right_contents">
				
				<div>

<form name = "writeFrm">
<%-- <input type = "hid-den" name = "num" value="<%=dto.getNum()%>"/> --%>
<table class="table table-bordered">
<colgroup>
	<col width="20%"/>
	<col width="30%"/>
	<col width="20%"/>
	<col width="*"/>
</colgroup>
<tbody>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">작성자</th>
		<td>
			${dto.name }
		</td>
		<th class="text-center" 
			style="vertical-align:middle;">작성일</th>
		<td>
			${dto.postDate }
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">이메일</th>
		<td>
			${dto.email }
		</td>
		<th class="text-center" 
			style="vertical-align:middle;">조회수</th>
		<td>
			${dto.visitcount }
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">제목</th>
		<td colspan="3">
			${dto.title }
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">내용</th>
		<td colspan="3">
			${dto.content }
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">첨부파일</th>
		<td colspan="3">
			${dto.chumfile }
		</td>
	</tr>
</tbody>
</table>

<div class="row text-center" style="">
	<!-- 각종 버튼 부분 -->
	<button type="button" class="btn btn-primary" onclick="location.href='sub01_edit.jsp?num=${dto.num}';">
	수정하기</button>
	<button type="button" class="btn btn-success" onclick="isDelete();">삭제하기</button>	
	<button type="button" class="btn btn-warning" onclick="location.href='sub01_list.jsp?';">리스트보기</button>
</div>
</form> 

				</div>
			</div>
		</div>
		
	</div>

	</center>
 </body>
</html>