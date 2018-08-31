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
		String[] id = req.getParameterValues("id");
		String res_num = req.getParameter("res_num");
		String nowPage = req.getParameter("nowPage");
		
		//리스트 체크박스 삭제
		String[] checkDel = req.getParameterValues("checkDel");	//?????
		req.setAttribute("res_num", res_num);
		req.setAttribute("id", id);
		
		//삭제후 페이지이동 위해 영역에 저장
		req.setAttribute("nowPage", nowPage);
		
		//기존게시물의 첨부파일명 가져오기
		reserveDAO dao = new reserveDAO();
		//reserveDTO dto = dao.selectView(res_num);
		
		int sucOrFail = 0;
		//int sucOrFail2 = 0;
		
		for(int i=0; i<checkDel.length; i++) {
			System.out.println("check는?"+checkDel[i]);	
			System.out.println("id는?"+id);
		
			//레코드 삭제
			sucOrFail = dao.delete(checkDel[i]);		
			//sucOrFail2 = dao.deleteAdmin(checkDel[i]);
		}
		
		//레코드 삭제성공시 파일도 같이 삭제
		if (sucOrFail == 1) {

			System.out.println("삭제 성공");
			req.getRequestDispatcher("/reserve/resList").forward(req, resp);
		} 
		else {
			System.out.println("삭제 실패 ");
			 
		}
		req.setAttribute("sucOrFail", sucOrFail);
		req.getRequestDispatcher("/reserve/resList").forward(req, resp);
	}	
}
