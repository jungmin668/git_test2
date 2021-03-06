package event;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import event.EventDTO;
import event.HospitalDAO;
import util.JavascriptUtil;
import util.PagingUtil;

public class EventList extends HttpServlet {
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

      
      // DB연결을 위한 DAO 호출
      HospitalDAO dao = new HospitalDAO();
      // 파라미터 저장을 위한 Map타입의 변수생성
      
      
      Map param = new HashMap(); 
      
      // 문자열 검색을 위한 변수선언
      String addQueryString = "";

      // 검색기능구현
      String searchColumn = req.getParameter("searchColumn");
      String searchWord = req.getParameter("searchWord");
      if (searchColumn != null) {
         addQueryString = String.format("searchColumn=%s" + "&searchWord=%s&", searchColumn, searchWord);

         // 맵에 저장
         param.put("searchColumn", searchColumn);
         param.put("searchWord", searchWord);
      }
      
      // System.out.println(param.get("searchWord"));

      int totalRecordCount = dao.getTotalRecordCount(param);
      
      int pageSize = Integer.parseInt(this.getInitParameter("PAGE_SIZE"));
      int blockPage = Integer.parseInt(this.getInitParameter("BLOCK_PAGE"));

      // 3.전체 페이지수 계산하기
      int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);

      System.out.println("전체레코드수:" + totalRecordCount);
      System.out.println("전체페이지수:" + totalPage);

      /*
       * 4.페이지번호를 파라미터로 받는다. 단, 최초 접속시에는 페이지번호가 없으므로 무조건 1페이지로 설정한다.
       */
      int nowPage = (req.getParameter("nowPage") == null || req.getParameter("nowPage").equals("")) ? 1
            : Integer.parseInt(req.getParameter("nowPage"));
      pageSize += 2;//사진게시판은 12개씩 리스팅되야한다.
      
      /*
       * 5.가져올 레코드의 구간을 결정하기 위한 연산
       */
      int start = (nowPage - 1) * pageSize + 1;
      int end = nowPage * pageSize;

      /*
       * 6.map에 구간을 추가
       */
      param.put("start", start);
      param.put("end", end);

      /*
       * 가상번호 계산을 위한 추가
       */
      param.put("totalPage", totalPage);// 전체페이지수
      param.put("nowPage", nowPage);// 현재페이지
      param.put("totalCount", totalRecordCount);// 전체레코드갯수
      param.put("pageSize", pageSize);// 한페이지에 출력할 게시물갯수
      
        
      // 페이지 처리를 위한 문자열 생성
      String pagingImg = PagingUtil.pagingImgServlet(totalRecordCount, pageSize, blockPage, nowPage,
            "../Event/EventList?" + addQueryString);
      
    

      int idx = Integer.parseInt(session.getAttribute("IDX").toString());
      // DAO호출하여 레코드 가져오기(페이지처리O)
      List<EventDTO> lists = dao.selectPaging(param,idx);

      // 리퀘스트 영역에 저장하기
      req.setAttribute("lists", lists);// 결과 레코드셋
      // 페이지번호 출력 문자열 저장
      req.setAttribute("pagingImg", pagingImg);
      req.setAttribute("map", param);// 파라미터
      
   
      RequestDispatcher dis = req.getRequestDispatcher("/event/sub01_t_list.jsp");
      dis.forward(req, resp);
   }

}