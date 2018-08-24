package point;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.PagingUtil;

public class ListCtrl extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//리스트 처리를 위한 비즈니스로직
		
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
		
		int totalRecordCount = dao.getTotalRecordCount(param);
		
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
		
		HttpSession session = req.getSession();
		int idx = Integer.parseInt(session.getAttribute("IDX").toString());
				
		List<PointDTO> lists = dao.selectPaging(param, idx);
		
		String pagingImg = PagingUtil.pagingImgServlet(totalRecordCount, pageSize, blockPage, nowPage, 
				"./Point/HpointList?"+addQueryString);
		
		dao.close();
		
		req.setAttribute("lists", lists);
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
