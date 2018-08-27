package point;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewCtrl extends HttpServlet{
	/*
	 서블릿에서 요청을 받을 때 doGet()혹은 doPost()로 처리할 걸 service()메소드 하나로 대체 가능
	 */
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//p_num값 받기
		String p_num = req.getParameter("p_num");
		
		PointDAO dao = new PointDAO();
		PointDTO dto = dao.selectView(Integer.parseInt(p_num));
		
		dao.close();
		
		req.setAttribute("dto", dto);
		/*
		CommentDAO c_dao = new CommentDAO();
		
		List<CommentDTO> c_lists = c_dao.selectPaging();
		*/
		dao.close();
		
		//req.setAttribute("c_lists", c_lists);
		
		RequestDispatcher dis = req.getRequestDispatcher("/point/hpoint_view.jsp");
		dis.forward(req, resp);
	}
}
