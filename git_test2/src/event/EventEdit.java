package event;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.oreilly.servlet.MultipartRequest;

import event.EventDTO;
import event.HospitalDAO;

public class EventEdit extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//수정페이지 띄워주기
		
		String idx = req.getParameter("e_num");
		
		HospitalDAO dao = new HospitalDAO();
		EventDTO dto = dao.selectView(idx);
		
		req.setAttribute("dto", dto);
		
		req.getRequestDispatcher("/event/sub01_t_edit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		//한글처리
		req.setCharacterEncoding("UTF-8");
		
		//파일업로드를 위한 모델(비즈니스로직) 호출
		 
		int sucOrFail;
		 
			//수정처리를 위한 파라미터
			String idx = req.getParameter("e_num");
			String nowPage = req.getParameter("nowPage");
			 
			
			//수정처리후 상세보기로 이동하므로 idx저장해야함
			req.setAttribute("e_num", idx);
			req.setAttribute("nowPage", nowPage);
			
			//나머지 파라미터를 MultipartRequest객체를 통해받음
			String id = req.getParameter("id");
			String title = req.getParameter("title"); 
			String content = req.getParameter("content");
			String postdate = req.getParameter("postdate");
			   	
			EventDTO dto = new EventDTO();
		 
			dto.setE_content(content);
			dto.setE_title(title);
			dto.setE_id(id);
			//dto.setE_postdate(postdate);
			//게시물 수정을 위한 idx 세팅
			dto.setE_num(idx);
			
			HospitalDAO dao = new HospitalDAO();
			sucOrFail = dao.update(dto);
			
			System.out.println(sucOrFail);
			//업데이트가 성공이고, 새로운 파일을 업로드 했다면
			if(sucOrFail==1)
			{
				 
				//리퀘스트영역에 메세지 출력을 위한 저장
				//req.setAttribute("SUC_FAIL", sucOrFail);
	 
				req.getRequestDispatcher("/View/eventView").forward(req, resp);	
				 
			}
			
			//dao.close();
		 
		else{
			System.out.println("다시하자");
			req.getRequestDispatcher("/event/modify").forward(req, resp);	
		}
		
	}
}
