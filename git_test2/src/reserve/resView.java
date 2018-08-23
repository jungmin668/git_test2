package reserve;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;


public class resView extends HttpServlet {
	/*
	서블릿에서 요청을 받을때 doGet() 혹은 doPost()로
	처리할것을 service()메소드 하나로 대체할수 있다.		
	*/
	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		
		//idx값 받기
		String res_num = req.getParameter("res_num");
		
		reserveDAO dao = new reserveDAO();
		reserveDTO dto = dao.selectView(res_num);
		
/*		
 		//줄바꿈처리
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));
*/
		dao.close();
		 
		//리퀘스트 영역에 저장
		req.setAttribute("dto", dto);		
		
		//상세보기 페이지로 포워드
		RequestDispatcher dis = req.getRequestDispatcher("/reserve/res_view.jsp");
		dis.forward(req, resp);
	}
}
