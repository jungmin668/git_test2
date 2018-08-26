package point;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReplyCtrl extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//폼값받기
		String p_num = req.getParameter("p_num");
		
		PointDAO dao = new PointDAO();
		PointDTO dto = dao.selectView(Integer.parseInt(p_num));
		
		dto.setTitle("[RE]"+dto.getTitle());

		req.setAttribute("dto", dto);
		
		RequestDispatcher dis = req.getRequestDispatcher("/point/DataReply.jsp");
		dis.forward(req,resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8");
		
		String title = req.getParameter("title");
		String p_content = req.getParameter("p_content");
	
		String mem_idx = req.getParameter("mem_idx");
		String bgroup = req.getParameter("bgroup");
		String bstep = req.getParameter("bstep");
		String bindent = req.getParameter("bindent");
		System.out.println(bgroup+"-"+bstep+"-"+bindent);
		
		PointDTO dto = new PointDTO();
		dto.setP_content(p_content);
		dto.setTitle(title);
		
		dto.setMem_idx(Integer.parseInt(mem_idx));
		dto.setBgroup(Integer.parseInt(bgroup));
		dto.setBstep(Integer.parseInt(bstep));
		dto.setBindent(Integer.parseInt(bindent));
		
		PointDAO dao = new PointDAO();
		int sucOrFail = dao.reply(dto);
		dao.close();
				
		if(sucOrFail == 1) {
			req.getRequestDispatcher("/point/HpointList").forward(req, resp);
		}else {
			req.getRequestDispatcher("/point/DataReply.jsp").forward(req, resp);
		}
		
	}
}
