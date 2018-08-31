package hptintro;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class docShow extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//한글처리
		req.setCharacterEncoding("UTF-8");
		
		String mem_idx = req.getParameter("mem_idx");
		
		resp.sendRedirect("./docmsg.jsp?mem_idx="+mem_idx);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//한글처리
		req.setCharacterEncoding("UTF-8");
		
		String mem_idx = req.getParameter("mem_idx");
		String[] doc_name = req.getParameterValues("doc_name");
		String[] doc_major = req.getParameterValues("doc_major");
		String[] doc_gender = req.getParameterValues("doc_gender");
		String[] doc_age = req.getParameterValues("doc_age");
		String[] doc_career = req.getParameterValues("doc_career");
		String[] doc_sc = req.getParameterValues("doc_sc");
		
		introDAO dao = new introDAO();
		docDTO dto = new docDTO();
		
		//기존 DB의 의사 데이터 삭제하기(무한 에러남)		
		//int affected = dao.delDoc(mem_idx); 			
		
		//삭제 성공하면 새 의사 데이터 DB에 입력하기
		int index = 0;
		for(int i=0 ; i<doc_name.length ; i++) {
			index++;
		}
		
		for(int i=0 ; i<index ; i++) {
			
			dto.setDoc_name(doc_name[i]);
			dto.setDoc_major(doc_major[i]);
			dto.setDoc_gender(doc_gender[i]);
			dto.setDoc_age(doc_age[i]);
			dto.setDoc_career(doc_career[i]);
			dto.setDoc_sc(doc_sc[i]);
			
			dao.insertDoc(dto, mem_idx);				
		}					
	
		req.getRequestDispatcher("/hptintro/hptintro.jsp?mem_idx="+mem_idx).forward(req,resp);
	}
}
