package stats;

import java.io.IOException;
import java.util.Date;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class YearCtrl extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//system상 자동으로 오늘날짜 설정
		//String curTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	/*
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String today_year = new SimpleDateFormat("yyyy").format(new Date());
		String today_month = new SimpleDateFormat("MM").format(new Date());
		String today_date = new SimpleDateFormat("dd").format(new Date());
		//데이트 포멧 test
		//String sday_MM = new SimpleDateFormat("MM").format(req.getParameter("search_sday"));
	*/
		
		//요청이 들어온 jsp로부터 값 받기
		String search_h_idx = req.getParameter("search_h_idx");
		int search_year = Integer.parseInt(req.getParameter("search_year"));
		
		
		//값넘김 확인
		//System.out.println("시스템 yyyy-MM-dd : "+today);
		//System.out.println("시스템 yy : "+ search_year);
		//System.out.println("받아온 h_idx : "+search_h_idx);
		
		//계산할 DAO함수 호출
		YearDAO dao = new YearDAO();
		StatsDTO stats_year = dao.stats_year(search_h_idx, search_year);
		//StatsDTO stats_month = dao.stats_month(search_h_idx, search_year);
		StatsDTO stats_month_m = dao.stats_month_m(search_h_idx, search_year);
		StatsDTO stats_month_w = dao.stats_month_w(search_h_idx, search_year);
		StatsDTO LoginView = dao.LoginView_H(search_h_idx);
		//StatsDTO datetoatl = dao.search_DateTotal(today, search_h_idx);
		//StatsDTO week = dao.search_week(today, search_h_idx);
		
		
		dao.close();
		
		//리퀘스트 영역에 저장
		req.setAttribute("stats_year", stats_year);
		//req.setAttribute("stats_month", stats_month);
		req.setAttribute("stats_month_m", stats_month_m);
		req.setAttribute("stats_month_w", stats_month_w);
		req.setAttribute("LoginView", LoginView);
		
		//상세보기 페이지로 포워드
		RequestDispatcher dis = req.getRequestDispatcher("../stats/statistic_main1_year_gender.jsp");
		dis.forward(req, resp);
	}

}
