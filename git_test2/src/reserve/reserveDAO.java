package reserve;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class reserveDAO {
	Connection con; //오라클 서버와 연결할때 사용
	PreparedStatement psmt;//오라클 서버와 쿼리전송 역활
	ResultSet rs;//쿼리의 결과를 받을때 사용
	
	public reserveDAO() {
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

	// 게시판테이블의 전체 레코드 갯수 얻기
	public int getTotalRecordCount(Map map) {
		int totalCount = 0;
		try {
			String sql = "SELECT COUNT(*) FROM reserve ";

			if (map.get("searchWord") != null) {
				sql += " WHERE " 
						+ map.get("searchColumn") 
						+ " " 
						+ " LIKE '%" 
						+ map.get("searchWord") 
						+ "%' ";
			}

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
		String sql = "SELECT * FROM reserve " 
				+ " WHERE 1=1 " 
				+ " ORDER BY res_num DESC";
		try {
			
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
				dto.setRes_note(rs.getString(6));
				dto.setRes_id(rs.getString(7));

				// 5.DTO객체를 컬렉션에 추가한다.
				bbs.add(dto);
			
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		// 6.DTO객체를 담은 List컬렉션을 반환
		return bbs;
		
	}

	// 페이징처리를 위한 select 메소드
	public List<reserveDTO> selectPaging(Map map) {

		List<reserveDTO> bbs = new Vector<reserveDTO>();

		String sql = ""
				+"SELECT * FROM ("
				+"    SELECT Tb.*, rownum rNum FROM ("
				+"        SELECT * FROM reserve ";
				
			if(map.get("Word")!=null){
				sql +=" WHERE "+map.get("Column")+" "
					+ " LIKE '%"+map.get("Word")+"%' ";				
			}
			
			//sql += " ORDER BY bgroup DESC, bstep ASC"
			sql += " ORDER BY res_num DESC"
			+"    ) Tb"
			+")"
			+" WHERE rNum BETWEEN ? and ?";
				
			System.out.println("쿼리문:"+sql);

		try {
			// 3.prepare 객체생성 및 실행
			psmt = con.prepareStatement(sql);

			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				// 4.결과셋을 DTO객체에 담는다.
				reserveDTO dto = new reserveDTO();
				
				dto.setRes_num(rs.getString(1));
				dto.setRes_hname(rs.getString(2));
				dto.setRes_sub(rs.getString(3));
				dto.setRes_date(rs.getString(4));
				dto.setRes_time(rs.getString(5));
				dto.setRes_note(rs.getString(6));
				dto.setRes_id(rs.getString(7));
				dto.setH_idx(rs.getInt(8));
				
				//System.out.println(dto);
	 
				// 5.DTO객체를 컬렉션에 추가한다.
				bbs.add(dto);
				
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return bbs;
	}

	// 게시물 읽기(view)
	public reserveDTO selectView(String res_num) {
		reserveDTO dto = null;

		String sql = "SELECT * FROM reserve " 
				+ " WHERE res_num=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, res_num);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto = new reserveDTO();

				dto.setRes_num(rs.getString(1));
				dto.setRes_hname(rs.getString(2));
				dto.setRes_sub(rs.getString(3));
				dto.setRes_date(rs.getString(4));
				dto.setRes_time(rs.getString(5));
				dto.setRes_note(rs.getString(6));
				dto.setRes_id(rs.getString(7));
				
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("dto"+dto);
		
		return dto;
	}

	// 수정하기
	public int update(reserveDTO dto) {

		int affected = 0;
		try {
			String query = "UPDATE reserve SET" 
					+ " res_hname=?, res_sub=?, res_date=?, res_time=?" 
					+ " , res_note=?, res_id=? "
					+ " WHERE res_num=? ";

			psmt = con.prepareStatement(query);
			
			System.out.println(dto.getRes_hname()+dto.getRes_sub()+dto.getRes_time()+dto.getRes_date());
			psmt.setString(1, dto.getRes_hname());
			psmt.setString(2, dto.getRes_sub());
			psmt.setString(3, dto.getRes_date());
			psmt.setString(4, dto.getRes_time());
			psmt.setString(5, dto.getRes_note());
			psmt.setString(6, dto.getRes_id());

			// 게시물수정을 위한 추가부분
			psmt.setString(7, dto.getRes_num());
			 
			affected = psmt.executeUpdate();
			
			System.out.println(query);     
			
		} catch (Exception e) {
			System.out.println("update중 예외발생");
			e.printStackTrace();
		}

		System.out.println(affected); //  0 
		return affected;
	}

	// 게시물 삭제하기
	public int delete(String res_num) {
		int affected = 0;
		try {
			String query = "DELETE FROM reserve " 
					+ " WHERE res_num=?";

			psmt = con.prepareStatement(query);
			psmt.setString(1, res_num);

			affected = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delete중 예외발생");
			e.printStackTrace();
		}

		return affected;
	}

}
