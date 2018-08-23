package event;

import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
 

public class HospitalDAO {

	Connection con; //오라클 서버와 연결할때 사용
	PreparedStatement psmt;//오라클 서버와 쿼리전송 역활
	ResultSet rs;//쿼리의 결과를 받을때 사용
	
	public HospitalDAO() {
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1522:orcl";	
		try {
			Class.forName(driver);
			String id = "kosmo";
			String pw = "1234";
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB연결성공^^*");
		}
		catch(Exception e) {
			System.out.println("DB연결실패ㅜㅜ;");
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

	// 회원 가입
	public int memberRegist(HospitalMemberDTO dto) {
		// 적용된 행의 갯수확인을 위한 변수
		int affected = 0;
		 
		try {
			String query = "INSERT INTO hospital_member ( "
					+ " mem_flag, mem_name, mem_gender, mem_bir, mem_id, mem_pass, mem_dis, "
					+ " tel, mobile, zipcode, addr1, addr2, email ) " 
					+ " VALUES ( "
					+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? , ? )";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getMem_flag());
			psmt.setString(2, dto.getMem_name());
			psmt.setString(3, dto.getMem_gender());
			psmt.setString(4, dto.getMem_age());
			psmt.setString(5, dto.getMem_id());
			psmt.setString(6, dto.getMem_pass());
			psmt.setString(7, dto.getMem_dis());
			psmt.setString(8, dto.getTel());
			psmt.setString(9, dto.getMobile());
			psmt.setString(10, dto.getZipcode());
			psmt.setString(11, dto.getAddr1());
			psmt.setString(12, dto.getAddr2());
			psmt.setString(13, dto.getEmail());

			affected = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}

		return affected;
	}

	public Map<String, String> memberLogin(String id, String pwd) {

		Map<String, String> maps = new HashMap<String, String>();

		String query = " SELECT mem_id , mem_pass , mem_name , email FROM hospital_member WHERE mem_id = ? and mem_pass = ? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			rs = psmt.executeQuery();

			// 결과셋이 있는 경우에만 레코드를 읽어온다.
			if (rs.next()) {
				// Map에 추가할때는 put()메소드 사용함.
				maps.put("id", rs.getString(1));
				maps.put("pass", rs.getString(2));
				maps.put("name", rs.getString(3));
				maps.put("email", rs.getString(4));
			} else {
				System.out.println("결과셋이 없습니다.");
			}
		} catch (Exception e) {
			System.out.println("getMemberDTO오류");
			e.printStackTrace();
		}

		return maps;
	}

	// 게시판 리스트 가져오기(검색처리, 페이지처리)
	public List<EventDTO> selectList(Map<String, Object> map) {

		// 1.결과 레코드셋을 담기위한 리스트계열 컬렉션생성
		List<EventDTO> bbs = new Vector<EventDTO>();

		// 2.게시물 전체를 가져오기 위한 쿼리작성
		String query = " " + " SELECT * FROM ( " + "	 SELECT Tb.*, ROWNUM rNum FROM ( "
				+ "	    SELECT E.* FROM event E ";

		if (map.get("Word") != null) {
			if (map.get("Column").equals("both")) {
				query += " WHERE " + "title LIKE '%" + map.get("Word") + "%' " + " OR " + " content LIKE '%"
						+ map.get("Word") + "%' ";
			} else {
				query += " WHERE " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%' ";
			}
		} else {
			query += "    	ORDER BY num DESC " + "    ) Tb " + " ) " + " WHERE rNum BETWEEN ? AND ?";
		}
		System.out.println("쿼리문:" + query);

		try {
			// 3.prepare객체생성 및 실행
			psmt = con.prepareStatement(query);
			psmt.setString(2, map.get("start").toString());
			psmt.setString(3, map.get("end").toString());
			// 4.쿼리실행후 결과셋 돌려받음
			rs = psmt.executeQuery();

			// 5.결과셋의 갯수만큼 반복
			while (rs.next()) {

				// 6.결과셋을 하나씩 DTO객체에 저장
				EventDTO dto = new EventDTO();

				dto.setE_num(rs.getString(1));
				dto.setE_title(rs.getString("title"));
				dto.setE_content(rs.getString(3));
				dto.setE_postdate(rs.getDate(4));
				dto.setE_id(rs.getString("id"));
				dto.setE_hits(rs.getInt(6));
				dto.setH_idx(rs.getInt(7));
				// 7.DTO객체를 컬렉션에 추가
				bbs.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}

		return bbs;
	}

	// 게시판테이블의 전체 레코드 갯수 얻기 
	public int getTotalRecordCount(Map map) { 
		int totalCount = 0;
		try {
			String sql = "SELECT COUNT(*) FROM event ";

			if (map.get("Word") != null) {
				sql += " WHERE " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%' ";
			}

			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
			} catch (Exception e) {
		}
		return totalCount;
	}

	// 페이징처리를 위한 select 메소드
	public List<EventDTO> selectPaging(Map map) { 
		List<EventDTO> bbs = new Vector<EventDTO>();

		String sql = "" + "SELECT * FROM (" + "    SELECT Tb.*, rownum rNum FROM (" + "        SELECT * FROM event ";

		if (map.get("Word") != null) {
			sql += " WHERE " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%' ";
		}

		sql += "  "
				// sql += " ORDER BY idx DESC"
				+ "    ) Tb" + ")" + " WHERE rNum BETWEEN ? and ?";

		System.out.println("쿼리문:" + sql);

		try {
			// 3.prepare 객체생성 및 실행
			psmt = con.prepareStatement(sql);

			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));

			rs = psmt.executeQuery();
			while (rs.next()) {
				// 4.결과셋을 DTO객체에 담는다.
				EventDTO dto = new EventDTO();

				dto.setE_num(rs.getString(1));
				dto.setE_title(rs.getString(2));
				dto.setE_content(rs.getString(3));
				dto.setE_postdate(rs.getDate(4));
				dto.setE_id(rs.getString(5));
				dto.setE_hits(rs.getInt(6));// 조회수 추가
				dto.setH_idx(rs.getInt(7));// 병원 꼭다리값
				// 5.DTO객체를 컬렉션에 추가한다.
				bbs.add(dto);
				 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return bbs;
	}

	// 게시물 읽기(view)
	public EventDTO selectView(String idx) {  
		EventDTO dto = null;

		String sql = "SELECT * FROM event WHERE e_num = ? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto = new EventDTO();

				dto.setE_num(rs.getString(1));
				dto.setE_title(rs.getString(2));
				dto.setE_id(rs.getString(5));
				dto.setE_postdate(rs.getDate(4));
				dto.setE_content(rs.getString(3));
				dto.setE_hits(rs.getInt(6));// 조회수추가

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	// 게시물 조회수 증가시키기
	public void updateVisitCount(String idx) {
		String sql = "UPDATE event SET e_hits=e_hits+1 WHERE e_num=? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeUpdate();
			} catch (Exception e) {
		}
	}
	//수정하기
	public int update(EventDTO dto) {    
			
			int affected = 0;
			try {
				String query = "UPDATE event SET"
						+ " e_title=?, e_id=?, e_content=? "
						+ " WHERE e_num=?";
			 
				psmt = con.prepareStatement(query);
				psmt.setString(1, dto.getE_title());
				psmt.setString(2, dto.getE_id());				
				psmt.setString(3, dto.getE_content());  
				//게시물수정을 위한 추가부분
				psmt.setString(4, dto.getE_num());
				affected = psmt.executeUpdate();
			}
			catch(Exception e) {
				System.out.println("update중 예외발생");
				e.printStackTrace();
			}
			
			return affected;		
		}
		
		//게시물 삭제하기
		public int delete(String idx) {
			int affected = 0;
			try {
				String query = "DELETE FROM event "
						+ " WHERE e_num=?";
				
				psmt = con.prepareStatement(query);			
				psmt.setString(1, idx);
				 
				affected = psmt.executeUpdate();
			}
			catch(Exception e) {
				System.out.println("delete중 예외발생");
				e.printStackTrace();
			}
			
			return affected;	
		}
}
