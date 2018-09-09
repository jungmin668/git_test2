package point;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.JavascriptUtil;
import util.PagingUtil;

public class ListCtrl extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//리스트 처리를 위한 비즈니스로직
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("USER_ID")==null)
		{
			String backUrl = req.getRequestURI()+"?"+req.getQueryString();
			
			PrintWriter out = resp.getWriter();
		  String str = ""
	               + "<script>"
	               + "  alert('"
	               + "Please login"
	               + "'); "
	               + " history.go(-1); "
	               + "</script>"; 
	         out.println(str);
			/* 위의 JS함수가 동작후 return이 없으면 아래  
			JSP코드가 실행될수 있기때문에 반드시 return으로
			실행을 멈춰줘야 한다.*/
			return;
		}
		
		//DB연결을 위한 DAO 호출
		PointDAO dao = new PointDAO();
		Map param = new HashMap();
		
		String addQueryString = "";
		
		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");
		if(searchColumn!= null)
		{
			addQueryString = String.format("searchColumn=%s"+"&searchWord=%s&", searchColumn, searchWord);
			
			param.put("Column", searchColumn);
			param.put("Word", searchWord);
		}
		
		int idx = 0;
		
		if(session.getAttribute("IDX") != null) {
			idx = Integer.parseInt(session.getAttribute("IDX").toString());			
		}
				
		int totalRecordCount = dao.getTotalRecordCount(param, idx);
		
		int pageSize = Integer.parseInt(this.getInitParameter("PAGE_SIZE"));
		
		int blockPage = Integer.parseInt(this.getInitParameter("BLOCK_PAGE"));
	
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		
		System.out.println("전체레코드수:"+totalRecordCount);
		System.out.println("전체페이지수:"+totalPage);
				
		int nowPage = (req.getParameter("nowPage") == null || req.getParameter("nowPage").equals("")) 
				? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		int start = (nowPage-1) * pageSize + 1;
		int end = nowPage * pageSize;
		
		param.put("start", start);
		param.put("end", end);
		
		param.put("totalPage", totalPage);//전체페이지수
		param.put("nowPage", nowPage);//현재페이지수
		param.put("totalCount", totalRecordCount);//전체 레코드 수
		param.put("pageSize", pageSize);//한 페이지에 출력되는 레코드 수
		
		String pagingImg = PagingUtil.pagingImgServlet(totalRecordCount, pageSize, blockPage, nowPage, 
				"HpointList?"+addQueryString);
		
		List<PointDTO> lists = dao.selectPaging(param, idx);
		
		int score = 0, i = 0;
		for(PointDTO dto : lists){
			score += dto.getP_total();
			i++;
		}
		score = score/i;
		System.out.println("score:"+score);
		System.out.println("i:"+i);
		req.setAttribute("score", score);
		
		req.setAttribute("lists", lists);
		
		dao.close();
				
		req.setAttribute("pagingImg", pagingImg);
		req.setAttribute("map", param);
		
		//뷰 호출
		RequestDispatcher dis = req.getRequestDispatcher("/point/hpoint.jsp");
		dis.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//POST로 들어온 요청도 doGet()메소드에서 처리할 수 있도록 호출해준다.
		doGet(req, resp);
	}
	
}
