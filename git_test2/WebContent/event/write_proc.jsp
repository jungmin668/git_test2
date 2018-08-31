<%@page import="util.JavascriptUtil"%>
<%@page import="event.HospitalDAO"%>
<%@page import="event.EventDTO"%>
<%@page import="event.FileUtil"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
 
<%@page import="util.PagingUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<%
//파일명 : write_proc_photo.jsp

//한글깨짐처리
request.setCharacterEncoding("UTF-8");

//파일업로드를 위한 모델(비즈니스로직) 호출
MultipartRequest mr = FileUtil.upload(request, request.getServletContext().getRealPath("/Upload"));
		
	int sucOrFail;
	String b_flag = null;
	if(mr != null){
	
	//나머지 파라미터를 MultipartRequest객체를 통해받음	String title = mr.getParameter("title");
	String title = mr.getParameter("title");
	String content = mr.getParameter("content");
	String name = mr.getParameter("name");
	//멀티게시판 추가
	//b_flag = mr.getParameter("b_flag");
	//파일추가
	String chumfile = mr.getFilesystemName("chumfile");

	//DTO객체 생성 및 값 설정
	EventDTO dto = new EventDTO();
	dto.setE_title(title);
	dto.setE_content(content);
	//dto.setE_id(session.getAttribute("USER_ID").toString());
	//멀티게시판 추가
	//dto.setB_flag(b_flag);
	//첨부파일 추가
	dto.setE_id(name);
	dto.setChumfile(chumfile);

	//커넥션풀로 변경
	HospitalDAO dao = new HospitalDAO();
	int affected = dao.insert(dto);
	 
	sucOrFail = 1;
	dao.close();
}
else{
	sucOrFail = -1;
}

if(sucOrFail==1){
	//DB입력성공일때
	response.sendRedirect("../Event/EventList");
}
else{
	//DB입력실패 혹은 파일업로드 실패시
	JavascriptUtil.jsAlertBack("글쓰기에 실패하였습니다", out);
}
%>