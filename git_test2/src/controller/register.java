package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.HospitalDAO;
import model.HospitalMemberDTO;
import sun.nio.cs.HistoricallyNamedCharset;
import util.JavascriptUtil;
import javax.servlet.jsp.JspWriter;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class register extends HttpServlet {
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      // 한글화 처리

      req.setCharacterEncoding("UTF-8");
      String flag = req.getParameter("mem_flag");
      String name = req.getParameter("name");
      String gender = req.getParameter("gender");
      String bir = req.getParameter("bday");
      String id = req.getParameter("id");
      String pass = req.getParameter("pass");
      String dis = req.getParameter("dis");
      String mobile = req.getParameter("numc1") + "-" + req.getParameter("numc2") + "-" + req.getParameter("numc3");
      String tel = req.getParameter("numz1") + "-" + req.getParameter("numz2") + "-" + req.getParameter("numz3");
      String zipcode = req.getParameter("zipcode");
      String addr1 = req.getParameter("addr1");
      String addr2 = req.getParameter("addr2");
      String email = req.getParameter("email1") + "@" + req.getParameter("email2");

      HospitalMemberDTO dto = new HospitalMemberDTO(flag, name, gender, bir, id, pass, dis, mobile, tel, zipcode,
            addr1, addr2, email);
      HospitalDAO dao = new HospitalDAO();
                  
      int af = dao.memberRegist(dto);
      if (af == 1) {
         System.out.println("회원가입 성공");
    	     	  
         RequestDispatcher disp = req.getRequestDispatcher("../member/login.jsp");
         disp.forward(req, resp);
      } else {
         System.out.println("회원가입 실패");
         resp.setContentType("text/html;charset=UTF-8");
         // 서블릿에서 out객체를 얻어온다.
         PrintWriter out = resp.getWriter();
         String str = "" + "<script>" + "  alert('헐 어디서 빠꾸야');" + "  history.back();" + "</script>";
         out.println(str);
      }

   }
}