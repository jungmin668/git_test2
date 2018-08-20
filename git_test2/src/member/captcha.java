package member;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class captcha extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String clientId = "42zBWTFtjL22rQYfvhob";
	      String clientSecret = "svMjUgPpxT";
	      try {
	          String code = "0"; // 키 발급 받을 때는 0으로 설정
	          String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;
	          URL url = new URL(apiURL);
	          HttpURLConnection con = (HttpURLConnection)url.openConnection();
	          con.setRequestMethod("GET");
	          con.setRequestProperty("X-Naver-Client-Id", clientId);
	          con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	          int responseCode = con.getResponseCode();
	          BufferedReader br;
	          if(responseCode==200) { 
	              br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	          } else {  
	              br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	          }
	          String inputLine;
	          StringBuffer response = new StringBuffer();
	          while ((inputLine = br.readLine()) != null) {
	              response.append(inputLine);
	          }
	          br.close();
	          System.out.println(response.toString());
	          resp.setContentType("text/html;charset=UTF-8");
	          
				
				//서블릿에서 세션객체를 얻어온다.
				HttpSession session = req.getSession();
				
				session.setAttribute("key", response.toString());
	          
	      } catch (Exception e) {
	          System.out.println(e);
	      }
	      resp.sendRedirect("./member/captcha.jsp");
	}
}
