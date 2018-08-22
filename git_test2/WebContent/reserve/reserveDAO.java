package reserve;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import community.CommunityDTO;

public class reserveDAO {
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;

	public reserveDAO() {
		try {
			Context ctx = new InitialContext();
			DataSource source = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");

			con = source.getConnection();
			System.out.println("DBCP연결성공");
		} catch (Exception e) {
			System.out.println("DBCP연결실패");
			e.printStackTrace();
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

			if (map.get("Word") != null) {
				sql += " WHERE " 
						+ map.get("Column") 
						+ " " 
						+ " LIKE '%" 
						+ map.get("Word") 
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
				dto.setRes_time(rs.getString(4));
				dto.setRes_note(rs.getString(5));
				dto.setRes_id(rs.getString(6));

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
	public List<reserveDTO> selectPaging(Map map) {

		List<reserveDTO> bbs = new Vector<reserveDTO>();

		String sql = "" + "SELECT * FROM (" 
				+ "    SELECT Tb.* FROM (" 
				+ "        SELECT * FROM reserve ";

		if (map.get("Word") != null) {
			sql += " WHERE " + map.get("Column") 
				+ " " + " LIKE '%" 
				+ map.get("Word") + "%' ";
		}

		sql += " ORDER BY res_num DESC" + "    ) Tb" 
				+ ")" 
				+ " WHERE res_num BETWEEN ? and ?";

		System.out.println("쿼리문:" + sql);

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
				dto.setRes_time(rs.getString(4));
				dto.setRes_note(rs.getString(5));
				dto.setRes_id(rs.getString(6));

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

		String sql = "SELECT * FROM reserve " + " WHERE res_num=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, res_num);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto = new reserveDTO();

				dto.setRes_num(rs.getString(1));
				dto.setRes_hname(rs.getString(2));
				dto.setRes_sub(rs.getString(3));
				dto.setRes_time(rs.getString(4));
				dto.setRes_note(rs.getString(5));
				dto.setRes_id(rs.getString(6));
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
			String query = "UPDATE reserve SET" 
					+ " res_hname=?, res_sub=?, res_time=? " 
					+ " , res_note=? "
					+ " WHERE res_num=? ";

			psmt = con.prepareStatement(query);
			
			//System.out.println(dto.getRes_hname()+dto.getRes_sub()+dto.getRes_time()+dto.getRes_note());
			psmt.setString(1, dto.getRes_hname());
			psmt.setString(2, dto.getRes_sub());
			psmt.setString(3, dto.getRes_time());
			psmt.setString(4, dto.getRes_note());

			// 게시물수정을 위한 추가부분
			psmt.setString(5, dto.getRes_num());
			 
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
