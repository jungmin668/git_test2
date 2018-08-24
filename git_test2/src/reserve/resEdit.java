package reserve;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileUtils;

//import com.oreilly.servlet.MultipartRequest;

public class resEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 수정페이지 띄워주기

		String res_num = req.getParameter("res_num");

		// 원래 게시물 가져오기
		reserveDAO dao = new reserveDAO();
		reserveDTO dto = dao.selectView(res_num);

		req.setAttribute("dto", dto);
		
		req.getRequestDispatcher("/reserve/res_edit.jsp").forward(req, resp);
	} 

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 한글처리
		req.setCharacterEncoding("UTF-8");
	
		// 수정처리를 위한 파라미터
		String res_num = req.getParameter("res_num");
		String nowPage = req.getParameter("nowPage");

		// 수정처리후 상세보기로 이동하므로 idx저장해야함
		req.setAttribute("res_num", res_num);
		req.setAttribute("nowPage", nowPage);

		String res_id = req.getParameter("res_id");
		String res_hname = req.getParameter("res_hname");
		String res_sub = req.getParameter("res_sub");
		String res_date = req.getParameter("res_date");		
		String res_time = req.getParameter("res_time");
		String res_note = req.getParameter("res_note");
		//System.out.println(req.getParameter("res_note")+ req.getParameter("res_time")+req.getParameter("res_sub"));

		reserveDTO dto = new reserveDTO();

		dto.setRes_id(res_id);
		dto.setRes_hname(res_hname);
		dto.setRes_sub(res_sub);
		dto.setRes_date(res_date);
		dto.setRes_time(res_time);
		dto.setRes_note(res_note);

		// 게시물 수정을 위한 idx 세팅
		dto.setRes_num(res_num);

		reserveDAO dao = new reserveDAO();

		int sucOrFail = dao.update(dto);
		
		System.out.println("업데이트"+sucOrFail);

		// 리퀘스트영역에 메세지 출력을 위한 저장
		if (sucOrFail == 1) {
			System.out.println("업데이트 성공");
			req.getRequestDispatcher("/reserve/resView").forward(req, resp);
		} 
		else {
			System.out.println("업데이트 실패 ");
		}
	}

}
