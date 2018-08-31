package reserve;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class checksendSMS extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		reserveDAO dao = new reserveDAO();
		reserveDTO dto = new reserveDTO();

		String sms = req.getParameter("check");

		req.setAttribute("sms", sms);

		RequestDispatcher dis = req.getRequestDispatcher("/sendSMS/index.jsp");
		dis.forward(req, resp);
	}
}
