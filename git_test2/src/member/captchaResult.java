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

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class captchaResult extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String clientId = "42zBWTFtjL22rQYfvhob";
        String clientSecret = "svMjUgPpxT";
        HttpSession session = req.getSession();
        StringBuffer response = new StringBuffer();
        String apiResult = null;
        try {
            String code = "1"; 
            String key = session.getAttribute("vkey").toString(); 
            String value = req.getParameter("inputText"); 
            String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code +"&key="+ key + "&value="+ value;

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
            //response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());
        } catch (Exception e) {
            System.out.println(e);
        }
        
        apiResult = response.toString();
        System.out.println(apiResult);
        
		JSONParser parser = new JSONParser();
		Object obj = null;
		try {
			obj = parser.parse(apiResult);
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		JSONObject jsonobj = (JSONObject) obj;

		Boolean result = (Boolean) jsonobj.get("result");
        if(result == true) {
        	//한글처리
			resp.setContentType("text/html;charset=UTF-8");
			//서블릿에서 out객체를 얻어온다.
			/*
			PrintWriter out = resp.getWriter();
			String str = ""
					+ "<script>"
					+ "  alert('"
					+ "성공"
					+ "');"
					+ "</script>"; 
			out.println(str);
			*/
			resp.sendRedirect("./member/join_agree.jsp");
        }else {
        	//한글처리
			resp.setContentType("text/html;charset=UTF-8");
			//서블릿에서 out객체를 얻어온다.
			PrintWriter out = resp.getWriter();
			String str = ""
					+ "<script>"
					+ "  alert('"
					+ "정확한 문자 입력 실패"
					+ "');"
					+ "  history.back();"
					+ "</script>"; 
			out.println(str);
        }
		
	}
	
}
