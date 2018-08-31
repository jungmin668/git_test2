package hptintro;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class introShow extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        //로그인 후 진입가능
        if(session.getAttribute("USER_ID")==null)
        {
           String backUrl = req.getRequestURI()+"?"+req.getQueryString();
           PrintWriter out = resp.getWriter();
              String str = ""
                    + "<script>"
                    + "  alert('"
                    + "PLEASE LOGIN !"
                    + "');"
                    + "history.back();"
                    + "</script>"; 
              URLEncoder.encode(str, "UTF-8");
              out.println(str);
           /* 위의 JS함수가 ;동작후 return이 없으면 아래  
           JSP코드가 실행될수 있기때문에 반드시 return으로
           실행을 멈춰줘야 한다.*/
              
           return;
          
          
        }
        RequestDispatcher dis = req.getRequestDispatcher("/hptintro/hptintro.jsp");
        dis.forward(req, resp);
	}

}
