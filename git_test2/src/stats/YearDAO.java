package stats;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class YearDAO {
	
	
	Connection con; //오라클 서버와 연결할때 사용
	PreparedStatement psmt;//오라클 서버와 쿼리전송 역할 기본
	ResultSet rs;//쿼리의 결과를 받을때 사용
	
	public YearDAO() {
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1522:orcl";	
		try {
			Class.forName(driver);
			String id = "kosmo";
			String pw = "1234";
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("YearDAO - DB연결성공^^*");
		}
		catch(Exception e) {
			System.out.println("YearDAO - DB연결실패ㅜㅜ;");
		}
	}
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (con != null)
				con.close();
		} catch (Exception e) {
			System.out.println("자원반납시 예외발생");
			e.printStackTrace();
		}
	}
	
	//로그인 되어있는 병원관리자의 병원Info 출력
	public StatsDTO LoginView_H(String h_idx) {
		StatsDTO dto = null;
		
		String sql = "SELECT * "
				+ "FROM month_stats_test "
				+ "WHERE h_idx=? ";
		
		try {
			//조건 sql1
			psmt = con.prepareStatement(sql);
			psmt.setString(1, h_idx);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto = new StatsDTO();
				
				dto.setH_idx(rs.getString(1));
				dto.setH_name(rs.getString(2));
				//병원방문회원 mem_idx(3)
				//병원방문회원 mem_gender(4)
				//병원방문회원 mem_age(5)
				rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("총명"+dto.getVisit_total());
		System.out.println("로그인 되어있는 병원명"+dto.getH_name());
		
		return dto;
	}
	
	
	
	//date type 변환
	// TO_DATE('"+map.get("search_sday")+ "', 'yy/mm/dd')
	
	//<!--	DAO 	 -->
	//한해 총 방문자
	public StatsDTO stats_year(String search_h_idx, int search_year){
		StatsDTO dto = null;
		System.out.println("search_year : "+search_year);
		System.out.println("search_h_idx : "+search_h_idx);
		
		String s_year = search_year+"%";
		//System.out.println("s_year : "+s_year);
		
		//String sql = " SELECT DISTINCT search_date||mem_idx, h_idx, h_name, mem_idx, mem_gender, search_date "
		
		String sql = " SELECT count(DISTINCT search_date||mem_idx)"
				+ " FROM month_stats_test WHERE h_idx=? AND search_date like ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, search_h_idx);
			psmt.setString(2, s_year);
			
			rs = psmt.executeQuery();
			/*
				1 : 버리는 컬럼,
				2 : h_idx,
				3 : h_name,
				4 : mem_idx,
				5 : mem_gender,
				6 : search_dat
				
				if (rs.next()) {
					dto = new StatsDTO();
				}
			 */
			if (rs.next()) {
				dto = new StatsDTO();
				dto.setYear(rs.getInt(1));
				//받아온 병원 idx를 dto.h_idx에 저장
				//dto.setH_idx(search_h_idx);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//한해 총 남자 방문자
	public StatsDTO stats_month_m(String search_h_idx, int search_year){
		StatsDTO dto = null;
		//System.out.println("stats_month_m(search_year) : "+search_year);
		
		String search_y = Integer.toString(search_year)+"/%";
					
			//쿼리문
			String sql = " SELECT count(DISTINCT search_date||mem_idx)"
					+ " FROM month_stats_test WHERE h_idx=? AND mem_gender='남' AND search_date like ?";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, search_h_idx);
				psmt.setString(2, search_y);
				rs = psmt.executeQuery();
				if (rs.next()) {
					dto = new StatsDTO();
					dto.setVisit_count_m(rs.getInt(1));
				}
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("한해 남자 카운트");
			}
			return dto;
	}
	
	//한해 총 여자 방문자
	public StatsDTO stats_month_w(String search_h_idx, int search_year){
		StatsDTO dto = null;
		//System.out.println("stats_month_w(search_year) : "+search_year);
		
		String search_y = Integer.toString(search_year)+"/%";
		
		//쿼리문
		String sql = " SELECT count(DISTINCT search_date||mem_idx)"
				+ " FROM month_stats_test WHERE h_idx=? AND mem_gender='여' AND search_date like ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, search_h_idx);
			psmt.setString(2, search_y);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto = new StatsDTO();
				dto.setVisit_count_w(rs.getInt(1));
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("한해 여자 카운트");
		}
		return dto;
	}

	/*
	//한해 월별 방문자
	public StatsDTO stats_month(String search_h_idx, int search_year){
		System.out.println("stats_month(search_year) : "+search_year);

		StatsDTO dto = new StatsDTO();
		
		String search_yymm = null;
		
		int mm01 = 0;
		int mm02 = 0;
		int mm03 = 0;
		int mm04 = 0;
		int mm05 = 0;
		int mm06 = 0;
		int mm07 = 0;
		int mm08 = 0;
		int mm09 = 0;
		int mm10 = 0;
		int mm11 = 0;
		int mm12 = 0;
		
		try {
			
			//쿼리문
			String sql = " SELECT count(DISTINCT search_date||mem_idx)"
					+ " FROM month_stats_test WHERE h_idx=? AND search_date like ?";

			for(int i=1; i<=12; i++) {
				
				search_yymm = search_year+"-0"+ Integer.toString(i)+"%";
				System.out.println("search_yymm = "+search_yymm);
				
				
				try {
					psmt = con.prepareStatement(sql);
					psmt.setString(1, search_h_idx);
					psmt.setString(2, search_yymm);
					rs = psmt.executeQuery();
					
					if(i<=9) {
							
							if (rs.next()) {
							
								if(i==1) {
									mm01 += rs.getInt(1);
									System.out.println("mm01 = "+mm01);
								}
								else if(i==2) {
									mm02 += rs.getInt(1);
									System.out.println("mm02 = "+mm02);
								}
								else if(i==3) {
									mm03 += rs.getInt(1);
									System.out.println("mm03 = "+mm03);
								}
								else if(i==4) {
									mm04 += rs.getInt(1);
									System.out.println("mm04 = "+mm04);
								}
								else if(i==5) {
									mm05 += rs.getInt(1);
									System.out.println("mm05 = "+mm05);
								}
								else if(i==6) {
									mm06 += rs.getInt(1);
									System.out.println("mm06 = "+mm06);
								}
								else if(i==7) {
									mm07 += rs.getInt(1);
									System.out.println("mm07 = "+mm07);
								}
								else if(i==8) {
									mm08 += rs.getInt(1);
									System.out.println("mm08 = "+mm08);
								}
								else {
									mm09 += rs.getInt(1);
									System.out.println("mm09 = "+mm09);
								}
								dto.setMonth_01(mm01);
								dto.setMonth_02(mm02);
								dto.setMonth_03(mm03);
								dto.setMonth_04(mm04);
								dto.setMonth_05(mm05);
								dto.setMonth_06(mm06);
								dto.setMonth_07(mm07);
								dto.setMonth_08(mm08);
								dto.setMonth_09(mm09);
							}//if (rs.next())
					}//if(i<=9) {
					else {
						search_yymm = search_year+"/"+Integer.toString(i)+"/%";
						System.out.println("search_yymm = "+search_yymm);
						
						//쿼리문
						String sql = " SELECT count(DISTINCT search_date||mem_idx)"
								+ " FROM month_stats_test WHERE h_idx=? AND search_date like ?";
						
						try {
							psmt = con.prepareStatement(sql);
							psmt.setString(1, search_h_idx);
							psmt.setString(2, search_yymm);
							rs = psmt.executeQuery();
							
							
							
							if (rs.next()) {
								dto = new StatsDTO();
								if(i==10) {
									mm10 += rs.getInt(1);
								}
								else if(i==11) {
									mm11 += rs.getInt(1);
								}
								else {
									mm12 += rs.getInt(1);
								}
							}
							dto.setMonth_07(mm07);
							dto.setMonth_08(mm08);
							dto.setMonth_09(mm09);
						}
						catch (Exception e) {
							e.printStackTrace();
							System.out.println("else문에서 오류발생");
						}
					}
				}//try
				catch (Exception e) {
					e.printStackTrace();
					System.out.println("i<=9 때 오류발생");
				}
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	
	//
	//search_yymm = search_year+"-0"+ Integer.toString(i)+"%";
	String yyyy_mm = null;
		
	for(int i=1;i<=12;i++){
    	
    	if(i<10) {
    		yyyy_mm = search_year+"-0"+"i";
    	}
    	else {
    		yyyy_mm = search_year+"-"+"i";
    	}
    }
	*/


	/*
	//쌤이 주신거
	public StatsDTO stats_month(String search_h_idx, int search_year){
		
		
		System.out.println("선택년도 : "+search_year);
		
		StatsDTO dto = new StatsDTO();
		
		Map<String, Integer> monthMap= new HashMap<String, Integer>();
		for(int i=1;i<=12;i++){
	    	if(i<10) {
	    		monthMap.put(search_year+"-0"+"i", 0);
	    	}
	    	else {
	    		monthMap.put(search_year+"-"+"i", 0);
	    	}
	    }
		//System.out.println("yyyy_mm = "+search_yymm);
		
		//쿼리문
		String sql = " select count(*)  , to_char(search_date, 'yyyy-mm') AS ym" + 
				"FROM month_stats_test" + 
				"WHERE to_char(search_date, 'yyyy')=?" + 
				"GROUP BY to_char(search_date, 'yyyy-mm')" + 
				"ORDER BY ym asc;";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, search_h_idx);
			rs = psmt.executeQuery();
			
			//mm01 += rs.getInt(1);
			//dto.setMonth_01(mm01);
			
			if (rs.next()) {
				
			}
		}
		
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("i<=9 때 오류발생");
		}
		return dto;
	}
	
	*/
	
	

}
