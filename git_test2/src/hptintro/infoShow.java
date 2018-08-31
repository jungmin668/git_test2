package hptintro;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class infoShow extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//한글처리
		req.setCharacterEncoding("UTF-8");
		
		String mem_idx = req.getParameter("mem_idx");
		
		resp.sendRedirect("./infomsg.jsp?mem_idx="+mem_idx);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//System.out.println("잘 넘어와용!!");
		
		//한글처리
		req.setCharacterEncoding("UTF-8");
		
		//폼값받기
		int mem_idx = Integer.parseInt(req.getParameter("mem_idx"));
		String mem_name = req.getParameter("mem_name");
		String zipcode = req.getParameter("zipcode");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		String tel = req.getParameter("tel");
		String mem_dis = req.getParameter("mem_dis");
		
		introDTO dto = new introDTO();
		dto.setMem_idx(mem_idx);
		dto.setMem_name(mem_name);
		dto.setZipcode(zipcode);
		dto.setAddr1(addr1);
		dto.setAddr2(addr2);
		dto.setTel(tel);
		dto.setMem_dis(mem_dis);
		
		introDAO dao = new introDAO();
		
		int affected = dao.updateEdit(dto);
		if(affected==1) {
			resp.sendRedirect("../hptintro/hptintro.jsp?mem_idx="+mem_idx);
		}
		else {
			System.out.println("정보 수정에 실패하였습니다.");
		}
		
		
	}
}
