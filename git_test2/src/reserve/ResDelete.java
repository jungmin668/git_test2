package reserve;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class ResDelete extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//폼값받기
		String res_num = req.getParameter("res_num");
		String nowPage = req.getParameter("nowPage");
		
		//삭제후 페이지이동 위해 영역에 저장
		req.setAttribute("nowPage", nowPage);
		
		//기존게시물의 첨부파일명 가져오기
		reserveDAO dao = new reserveDAO();
		reserveDTO dto = dao.selectView(res_num);
		
		//레코드 삭제
		int sucOrFail = dao.delete(res_num); 
		
		//레코드 삭제성공시 파일도 같이 삭제
		if (sucOrFail == 1) {

			System.out.println("삭제 성공");
			req.getRequestDispatcher("/reserve/resList").forward(req, resp);
		} 
		 
		else {
			System.out.println("삭제 실패 ");
			 
		}
		
	}
	
	
}
