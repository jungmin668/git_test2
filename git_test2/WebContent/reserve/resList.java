package reserve;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.PagingUtil;

public class resList extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	/*	RequestDispatcher dis = req.getRequestDispatcher("/reserve_manager/res_list.jsp");
		dis.forward(req, resp);
	*/
		
		reserveDAO dao = new reserveDAO();

		Map param = new HashMap();
		
		String addQueryString = ""; 

		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");
		if(searchColumn!=null)
		{
			addQueryString = String.format("searchColumn=%s"
				+"&searchWord=%s&",
				searchColumn, searchWord);
		
			param.put("Column", searchColumn);
			param.put("Word", searchWord);
		}
		
		//전체 레코드수를 카운트
		int totalRecordCount = dao.getTotalRecordCount(param);
		 		
		int pageSize = Integer.parseInt(this.getInitParameter("PAGE_SIZE"));
		int blockPage = Integer.parseInt(this.getInitParameter("BLOCK_PAGE"));
		
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);

		System.out.println("전체레코드수:"+ totalRecordCount);
		System.out.println("전체페이지수:"+ totalPage);
		
	
		//페이지번호를 파라미터로
		int nowPage = (req.getParameter("nowPage")==null
			|| req.getParameter("nowPage").equals("")) ? 1  :  Integer.parseInt(req.getParameter("nowPage"));

	
		//가져올 레코드의 구간을 결정
		int start = (nowPage-1) * pageSize + 1;
		int end = nowPage * pageSize;

		param.put("start", start);
		param.put("end", end);
		
		
		//가상번호 계산을 위한 추가
		param.put("totalPage", totalPage);//전체페이지수
		param.put("nowPage", nowPage);//현재페이지
		param.put("totalCount", totalRecordCount);//전체레코드갯수
		param.put("pageSize", pageSize);//한페이지에 출력할 게시물갯수
		
				
		//DAO호출하여 레코드 가져오기
		List<reserveDTO> lists = dao.selectPaging(param);
		
		
		//페이지 처리를 위한 문자열 생성
		String pagingImg = PagingUtil.pagingImgServlet(
			totalRecordCount,pageSize,
			blockPage, nowPage, 
			"../reserve/resList?"+addQueryString);
		
		
		//커넥션풀에 자원반납
		dao.close();
		
		//리퀘스트 영역에 저장하기
		req.setAttribute("lists", lists);//결과 레코드셋
		//페이지번호 출력 문자열 저장
		req.setAttribute("pagingImg", pagingImg);
		req.setAttribute("map", param);//파라미터
		
		
		RequestDispatcher forw = 
		req.getRequestDispatcher("/reserve_manager/res_list.jsp");
		forw.forward(req, resp);
	}
		
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);

	}
	
}
