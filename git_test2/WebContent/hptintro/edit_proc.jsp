<%@page import="java.net.URLEncoder"%>
<%@page import="HptIntro.HptDAO"%>
<%@page import="HptIntro.HptDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//파일명 : write_proc.jsp

//한글깨짐처리
request.setCharacterEncoding("UTF-8");

//폼값받기
String hp_name = request.getParameter("hp_name");
String hp_explain = request.getParameter("hp_explain");
String hp_addr = request.getParameter("hp_addr");
String hp_tel = request.getParameter("hp_tel");

String[] doc_nameArr = request.getParameterValues("doc_name");
String[] doc_majorArr = request.getParameterValues("doc_major");
String[] doc_genderArr = request.getParameterValues("doc_gender");
String[] doc_ageArr = request.getParameterValues("doc_age");
String[] doc_careerArr = request.getParameterValues("doc_career");
String[] doc_scArr = request.getParameterValues("doc_sc");
String[] hp_nameArr = request.getParameterValues("hp_name");
//out.println(doc_name);

//DTO객체 생성 및 값 설정
HptDTO dto = new HptDTO();
dto.setHp_name(hp_name);
dto.setHp_explain(hp_explain);
dto.setHp_addr(hp_addr);
dto.setHp_tel(hp_tel);

//DB연결
HptDAO dao = new HptDAO();
int index = 0;
int affected1 = 0;
for(int i=0 ; i < doc_nameArr.length ; i++){
	index++;
}
for(int i=0 ; i < index ; i++){
	dto.setDoc_name(doc_nameArr[i]);
	dto.setDoc_major(doc_majorArr[i]);
	dto.setDoc_gender(doc_genderArr[i]);
	dto.setDoc_age(doc_ageArr[i]);
	dto.setDoc_career(doc_careerArr[i]);
	dto.setDoc_sc(doc_scArr[i]);
	affected1 = dao.docEdit(dto);
}


int affected2 = dao.hptIntroEdit(dto);

if(affected1==1 && affected2==1){
	//수정에 성공했을때...
	String name = URLEncoder.encode(hp_name,"UTF-8");
	response.sendRedirect("./hptintro.jsp?hp_name="+ name);
}
else{
	//글쓰기에 실패했을때...	
%>
	<script>
		alert("글쓰기에 실패하였습니다.");
		history.go(-1);
	</script>
<%	
}
%>