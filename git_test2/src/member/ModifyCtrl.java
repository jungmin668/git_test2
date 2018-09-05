package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.HospitalDAO;
import model.HospitalMemberDTO;

public class ModifyCtrl extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		HospitalDAO dao = new HospitalDAO();
		
		HttpSession session = req.getSession();
		
		String user_id = session.getAttribute("USER_ID").toString();
		
		HospitalMemberDTO dto = dao.getMemberInfo(user_id);
		req.setAttribute("dto",dto);
		
		if(dto.getTel() != null) {
			String[] telArr = dto.getTel().split("-");
			req.setAttribute("telArr",telArr);
		}
		if(dto.getMobile() != null) {
			String[] mobileArr = dto.getMobile().split("-");
			req.setAttribute("mobileArr",mobileArr);
		}
		if(dto.getEmail() != null) {
			String[] emailArr = dto.getEmail().split("@");
			req.setAttribute("emailArr",emailArr);
		}				
		req.getRequestDispatcher("./member/modify.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		doPost(req, resp);
	
	}
	
}
