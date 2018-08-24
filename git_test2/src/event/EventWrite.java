package event;

import java.io.IOException; 

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import event.EventDTO;
import event.HospitalDAO;

public class EventWrite extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글쓰기 페이지로 이동(포워드)
		RequestDispatcher dis = req.getRequestDispatcher("/event/sub01_t_write.jsp");
		dis.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글쓰기 관련 폼값 받은후 처리

		// 한글처리
		req.setCharacterEncoding("UTF-8");

		// DB입력성공시:1, 실패시:0, 파일용량초과시:-1
		int sucOrFail;

		// 나머지 파라미터를 MultipartRequest객체를 통해받음
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String content = req.getParameter("content");

		EventDTO dto = new EventDTO();

		dto.setE_id(name);
		dto.setE_content(content);
		dto.setE_title(title);

		HospitalDAO dao = new HospitalDAO();
		sucOrFail = dao.insert(dto);
		dao.close();

		if (sucOrFail == 1) {
			// DB입력성공일때
			System.out.println("들어가냐?");
			//req.getRequestDispatcher("/Event/EventList").forward(req, resp);
			resp.sendRedirect("../Event/EventList");
		} else {
			// DB입력실패 혹은 파일업로드 실패시 
			System.out.println("다시해"); 
			req.getRequestDispatcher("/event/sub01_t_write.jsp").forward(req, resp);
		}
	}
}
