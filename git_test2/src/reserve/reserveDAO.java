package reserve;

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

public class reserveDAO {
	Connection con; // 오라클 서버와 연결할때 사용
	PreparedStatement psmt;// 오라클 서버와 쿼리전송 역활
	ResultSet rs;// 쿼리의 결과를 받을때 사용

	public reserveDAO() {
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1522:orcl";
		try {
			Class.forName(driver);
			String id = "kosmo";
			String pw = "1234";
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB연결성공");
		} catch (Exception e) {
			System.out.println("DB연결실패");
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

	/////////////////////// 로그인처리/////////////////////////////

	   public Map<String, String> memberLogin(String id, String pwd) {  

		      Map<String, String> maps = new HashMap<String, String>();

		      String query = " SELECT mem_id , mem_pass , mem_name , mem_idx  "
		      		+ "FROM hospital_member WHERE mem_id = ? and mem_pass = ? ";
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
		            maps.put("idx", rs.getString(5)); 
		         } else {
		            System.out.println("결과셋이 없습니다.");
		         }
		      } catch (Exception e) {
		         System.out.println("getMemberDTO오류");
		         e.printStackTrace();
		      }

		      return maps;
		   }
	 

	////////////////////////// 로그인처리 끝/////////////////////////////

	// 게시판테이블의 전체 레코드 갯수 얻기
	public int getTotalRecordCount(Map map) {
		int totalCount = 0;
		try {
			String sql = "SELECT COUNT(*) FROM reserve ";

			if (map.get("Word") != null) {
				sql += " WHERE " + map.get("Column") + " LIKE '%" + map.get("Word") + "%' ";
			}
			System.out.println("토탈카운트쿼리:" + sql);
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {

		}
		return totalCount;
	}

	// 게시물 리스트 출력하기(list)

	public List<reserveDTO> selectList() {
		// 1.결과 레코드셋을 담기위한 컬렉션 생성
		List<reserveDTO> bbs = new Vector<reserveDTO>();

		// 2.게시물을 가져오기 위한 쿼리작성
		String sql = "SELECT res_num, res_hname, res_sub, res_date, res_time, mem_name, tel"
				+ " FROM  reserve Res INNER JOIN hospital_member Mem" + "        ON Res.h_idx=Mem.mem_idx "
				+ " WHERE 1=1 " + " ORDER BY res_num DESC";

		try {

			System.out.println("selectList쿼리 : " + sql);
			// 3.prepare 객체생성 및 실행
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {

				// 4.결과셋을 DTO객체에 담는다.
				reserveDTO dto = new reserveDTO();

				dto.setRes_num(rs.getString(1));
				dto.setRes_hname(rs.getString(2));
				dto.setRes_sub(rs.getString(3));
				dto.setRes_date(rs.getString(4));
				dto.setRes_time(rs.getString(5));
				dto.setMem_name(rs.getString(6));
				dto.setTel(rs.getString(7));

				// 5.DTO객체를 컬렉션에 추가한다.
				bbs.add(dto);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		// 6.DTO객체를 담은 List컬렉션을 반환
		return bbs;

	}

	// 페이징처리를 위한 select 메소드
	public List<reserveDTO> selectPaging(Map map, int idx) {

		List<reserveDTO> bbs = new Vector<reserveDTO>();

		String sql = " SELECT * FROM (" 
				+ "  SELECT * FROM ("
				+ "    SELECT Tb.*, rownum rNum FROM ("
				+ "        SELECT res_num, res_hname, res_sub, res_date, res_time, mem_name, tel, h_idx "
				+ " 			FROM reserve Res INNER JOIN hospital_member Mem "
				+ "				ON Res.res_id = Mem.mem_id ";

		if (map.get("searchWord") != null) {
			sql += " WHERE " 
					+ map.get("searchColumn") 
					+ " LIKE '%" + map.get("searchWord") 
					+ "%' "
					+ " ORDER BY res_num DESC" 
					+ "    ) Tb )" 
					+ " WHERE rNum BETWEEN ? and ?";

			// 기간 검색 포함
			if (map.get("sday") != "" && map.get("eday") != "") {
				sql += " ) WHERE  " + " res_date " + " >= to_char(to_date(?, 'yy/MM/dd')) AND " + " res_date "
						+ " <= to_char(to_date(?, 'yy/MM/dd')) ";
			}
			// 전체 기간 검색
			else {
				sql += " ) WHERE 1=1  ";

			}
		} else {
			sql += " ORDER BY res_num DESC " 
					+ "    ) Tb " 
					+ ") WHERE (rNum BETWEEN ? and ?) and (h_idx = '"+idx+"')  )";
		}

		System.out.println("selectPaging 쿼리문:" + sql);

		try {
			// 3.prepare 객체생성 및 실행
			psmt = con.prepareStatement(sql);

	

			//날짜검색할때
			 if(map.get("searchWord")=="") { 
					 psmt.setInt(1, Integer.parseInt(map.get("start").toString())); 
					 psmt.setInt(2, Integer.parseInt(map.get("end").toString())); 
					 psmt.setString(3, map.get("sday").toString());
					 psmt.setString(4, map.get("eday").toString());
					 System.out.println("2번째");
					 
			 }
			// 그냥 날짜검색만 할때 //지금 리스트뿌릴때
			 
			 else if (map.get("searchWord") != "") {
				psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
				psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
				System.out.println("1번째");
				//psmt.setString(3, map.get("sday").toString());
				//psmt.setString(4, map.get("eday").toString());
				
				
				 
			}
			// 리스트만 뜰때
			else {
				psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
				psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
				System.out.println("3번째");
				//psmt.setString(3, map.get("sday").toString());
				//psmt.setString(4, map.get("eday").toString());
			}

			rs = psmt.executeQuery();

			while (rs.next()) {
				// 4.결과셋을 DTO객체에 담는다.
				reserveDTO dto = new reserveDTO();

				dto.setRes_num(rs.getString(1));
				dto.setRes_hname(rs.getString(2));
				dto.setRes_sub(rs.getString(3));
				dto.setRes_date(rs.getString(4));
				dto.setRes_time(rs.getString(5));
				dto.setMem_name(rs.getString(6));
				dto.setTel(rs.getString(7));
				dto.setMem_id(rs.getString(8));

				// 조인을 위한...
				dto.setH_idx(rs.getInt(9)); // 조인

				// dto.setMem_idx(rs.getInt(9));

				System.out.println("dto" + dto);

				// 5.DTO객체를 컬렉션에 추가한다.
				bbs.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return bbs;
	}

	// 게시물 읽기(view)
	public reserveDTO selectView(String res_num) {
		reserveDTO dto = null;

		String sql = "SELECT  res_num, res_id, res_hname, res_sub, res_date, res_time,"
				+ " mem_name, tel, mem_bir, mem_gender, res_note,  mem_id  "
				+ " FROM  reserve Res INNER JOIN hospital_member Mem " 
				+ "        ON Res.res_id=Mem.mem_id "
				+ " WHERE res_num=? ";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, res_num);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto = new reserveDTO();

				dto.setRes_num(rs.getString(1));
				dto.setRes_id(rs.getString(2));
				dto.setRes_hname(rs.getString(3));
				dto.setRes_sub(rs.getString(4));
				dto.setRes_date(rs.getString(5));
				dto.setRes_time(rs.getString(6));
				dto.setMem_name(rs.getString(7));
				dto.setTel(rs.getString(8));
				dto.setMem_bir(rs.getString(9));
				dto.setMem_gender(rs.getString(10));
				dto.setRes_note(rs.getString(11));
				

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	// 수정하기
	public int update(reserveDTO dto) {

		int affected = 0;
		try {
			String query = "UPDATE reserve SET" + " res_hname=?, res_sub=?, res_date=?, res_time=?, res_note=? "
					+ " WHERE res_num=? ";

			psmt = con.prepareStatement(query);

			psmt.setString(1, dto.getRes_hname());
			psmt.setString(2, dto.getRes_sub());
			psmt.setString(3, dto.getRes_date());
			psmt.setString(4, dto.getRes_time());

			psmt.setString(5, dto.getRes_note());
			// 게시물수정을 위한 추가부분
			psmt.setString(6, dto.getRes_num());

			affected = psmt.executeUpdate();

			System.out.println(query);

		} catch (Exception e) {
			System.out.println("update중 예외발생");
			e.printStackTrace();
		}

		System.out.println(affected); // 0
		return affected;
	}

	// 게시물 삭제하기
	public int delete(String res_num) {

		int affected = 0;

		try {
			String query = " DELETE FROM reserve " + " WHERE res_num=? ";

			psmt = con.prepareStatement(query);
			psmt.setString(1, res_num);

			affected = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("delete중 예외발생");
			e.printStackTrace();
		}

		return affected;
	}

	public int checkUpdate(int ck) {
		int a = 0;
		String sql = " UPDATE reserve set res_flag = '1' WHERE res_num = ? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, ck);
			a = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	public void deletecheck() {
		int a = 0;
		String sql = " delete from reserve where res_flag = 1 ";
		try {
			psmt = con.prepareStatement(sql);
			a = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delete중 예외발생");
			e.printStackTrace();
		}
	}
}
