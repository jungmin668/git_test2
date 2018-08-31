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
import javax.servlet.http.HttpSession;

import util.PagingUtil;

public class CheckDelete extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		reserveDAO dao = new reserveDAO();
		reserveDTO dto = new reserveDTO();
		
		String [] rflag = req.getParameterValues("check");
		
		 
		
		for(int i=0;i<rflag.length;i++) {
			if(rflag[i]!=null) {
				
				int a = dao.checkUpdate(Integer.parseInt(rflag[i]));
				System.out.println(rflag);
				if(a==1) {
					dao.deletecheck();
				}
			}
		}
 
		Map param = new HashMap();
		
		//문자열 검색을 위한 변수
		String addQueryString = ""; 
		
		//검색
		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");
		
		//기간검색
		String sday = req.getParameter("sday");
		String eday = req.getParameter("eday");
		
		
		if(searchColumn!=null)
		{
			addQueryString = String.format(
					"searchColumn=%s"
					+"&searchWord=%s&"
					+"sday=%s" 
					+"&eday=%s&"
					,searchColumn, searchWord, sday, eday);
		
			param.put("searchColumn", searchColumn);
			param.put("searchWord", searchWord);
			param.put("sday", sday);
			param.put("eday", eday);
		}
		
		//전체 레코드수를 카운트
		int totalRecordCount = dao.getTotalRecordCount(param);
		
		int pageSize = Integer.parseInt(this.getInitParameter("PAGE_SIZE"));	//3
		int blockPage = Integer.parseInt(this.getInitParameter("BLOCK_PAGE"));  //2

		
		//3.전체 페이지수 계산하기
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize); //10/3

		/*
		4.페이지번호를 파라미터로 받는다. 단, 최초 접속시에는
		페이지번호가 없으므로 무조건 1페이지로 설정한다.
		*/
		int nowPage = (
				req.getParameter("nowPage")==null || req.getParameter("nowPage").equals("")) ? 1  :  Integer.parseInt(req.getParameter("nowPage"));
		
		//System.out.println("nowPage"+nowPage+"pageSize"+pageSize);	//1
	
		/*
		5.가져올 레코드의 구간을 결정하기 위한 연산
		*/
		int start = (nowPage-1) * pageSize + 1;
		int end = nowPage * pageSize;

		System.out.println("nowPage"+nowPage+"pageSize"+pageSize);	//nowPage=1,pageSize=3
		System.out.println("start"+start+"end"+end);
		
		
		param.put("start", start);	//1
		param.put("end", end);		//3
		
		
		//가상번호 계산을 위한 추가
		param.put("totalPage", totalPage);//전체페이지수
		param.put("nowPage", nowPage);//현재페이지
		param.put("totalCount", totalRecordCount);//전체레코드갯수
		param.put("pageSize", pageSize);//한페이지에 출력할 게시물갯수
		
		System.out.println("nowPage"+nowPage+"pageSize"+pageSize);
		System.out.println("전체레코드갯수"+totalRecordCount+"한페이지에 출력할 게시물갯수"+pageSize);
		
		//System.out.println("param="+param);
		//DAO호출하여 레코드 가져오기
		//List<reserveDTO> lists = dao.selectList();
		HttpSession session = req.getSession();
	      int idx = Integer.parseInt(session.getAttribute("IDX").toString());
		List<reserveDTO> lists = dao.selectPaging(param, idx);

		//페이지 처리를 위한 문자열 생성
		String pagingImg = PagingUtil.pagingImgServlet(
			totalRecordCount,pageSize,
			blockPage, nowPage, 
			"../reserve/resList?"+addQueryString);
		
		
		//커넥션풀에 자원반납
		
		
		//리퀘스트 영역에 저장하기
		 
		req.setAttribute("lists", lists);//결과 레코드셋
		
		//페이지번호 출력 문자열 저장
		req.setAttribute("pagingImg", pagingImg);
		req.setAttribute("map", param);//파라미터
		
		
		RequestDispatcher forw = req.getRequestDispatcher("/reserve/res_list.jsp");
		forw.forward(req, resp);
		}
	}
		

 
