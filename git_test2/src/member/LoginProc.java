package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import model.HospitalDAO;

public class LoginProc extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//폼값받기
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		String backUrl = req.getParameter("backUrl");
		
		//DAO호출
		HospitalDAO dao = new HospitalDAO();
		
		//함수호출
		Map<String, String> memberInfo = 
				dao.memberLogin(id, pass);
		//로그인 성공여부 체크
		if(memberInfo.get("name")!=null) {
			//로그인에 성공
			
			//서블릿에서 세션객체를 얻어온다.
			HttpSession session = req.getSession();
			session.setAttribute("USER_ID", memberInfo.get("id"));
			session.setAttribute("USER_NAME", memberInfo.get("name"));
			session.setAttribute("USER_EMAIL", memberInfo.get("email"));
			//다시 로그인 페이지로 이동(서블릿에서 페이지
			//이동시 포워드, 리다이렉트 모두 가능함)
			if(backUrl == null || backUrl.equals("")){
				resp.sendRedirect("../getUrl/getUrlHospital.jsp");	
			}else{
				resp.sendRedirect(backUrl);
			}			
		}
		else {
			//로그인에 실패
			
			//한글처리
			resp.setContentType("text/html;charset=UTF-8");
			//서블릿에서 out객체를 얻어온다.
			PrintWriter out = resp.getWriter();
			String str = ""
					+ "<script>"
					+ "  alert('로그인 실패 ㅜㅜ');"
					+ "  history.back();"
					+ "</script>"; 
			out.println(str);
		}
	}
}











