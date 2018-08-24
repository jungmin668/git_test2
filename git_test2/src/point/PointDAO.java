package point;

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

public class PointDAO {
	Connection con;//오라클 서버와 연결
	PreparedStatement psmt;//오라클 서버와 쿼리전송 
	ResultSet rs;//쿼리의 결과를 받을때
	/*
	public PointDAO() {
		
		try {
			Context ctx = new InitialContext();
			
			※ConnectionPool.jsp에서는 두번의 lookup을 통해 커넥션
			객체를 가져왔으나, 합쳐서 한번의 lookup으로 쓸 수 있다.
			톰캣의 루트디렉토리 하위에서 jdbc의 이름을 가져오는것이기 때문이다.
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			DataSource source = (DataSource)ctx.lookup("jdbc/myoracle");
			 
			DataSource source = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			
			con = source.getConnection();
			System.out.println("DBCP연결성공");
		}catch(Exception e) {
			System.out.println("DBCP연결실패");
			e.printStackTrace();
		}
	}
	*/
	public PointDAO() {
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
			if(rs!= null) rs.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
		}catch(Exception e) {
			System.out.println("자원반납시 예외발생");
			e.printStackTrace();
		}
	}
	
	public int getTotalRecordCount(Map map) {
		int totalCount = 0;
		try {
			String sql = "SELECT COUNT(*) FROM point ";
			if(map.get("Word")!=null) {
				sql += " WHERE "+map.get("Column")+" "
					+ " LIKE '%"+map.get("Word") + "%' ";
			}
			sql += " WHERE p_cvn is NOT NULL";
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {}
		return totalCount;
	}
	
	public List<PointDTO> selectPaging(Map map, int idx){
		
		List<PointDTO> bbs = new Vector<PointDTO>();
		
		String sql = "" 
				+ " SELECT * FROM ( "
				+ "	SELECT Tb.*, rownum rNum FROM ( "
				+ "	SELECT P.* "
				+ "	FROM point P INNER JOIN hospital_member M	 "
				+ "	ON P.mem_idx = M.mem_idx	 ";
		
		if(map.get("Word")!=null) {
			sql += " WHERE "+map.get("Column")+ " "
				+ " LIKE '%"+map.get("Word")+"%' ";
		}
		
		sql += " ORDER BY p_num DESC "
		+ "	) Tb "
		+ " ) "
		+ " WHERE (rNum BETWEEN ? AND ?) AND (p_cvn IS NOT NULL) AND (mem_idx = '"+idx+"') ";
		
		System.out.println("쿼리문:"+sql);
		
		try {
			
			psmt = con.prepareStatement(sql);
			
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				PointDTO dto = new PointDTO();
				
				dto.setP_num(rs.getInt(1));
				dto.setP_clean(rs.getInt(2));
				dto.setP_cvn(rs.getInt(3));
				dto.setP_wtime(rs.getInt(4));
				dto.setP_visitdate(rs.getDate(5));
				dto.setP_kind(rs.getInt(6));
				dto.setP_sat(rs.getInt(7));
				dto.setP_total(rs.getInt(8));
				dto.setHname(rs.getString(9));
				dto.setDname(rs.getString(10));
				
				bbs.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bbs;
	}
	
	public PointDTO selectView(int p_num) {
		PointDTO dto = null;
		
		String sql = "SELECT * FROM point "
				+ " WHERE p_num = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, p_num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new PointDTO();
				
				dto.setP_num(rs.getInt(1));
				dto.setP_clean(rs.getInt(2));
				dto.setP_cvn(rs.getInt(3));
				dto.setP_wtime(rs.getInt(4));
				dto.setP_visitdate(rs.getDate(5));
				dto.setP_kind(rs.getInt(6));
				dto.setP_sat(rs.getInt(7));
				dto.setP_total(rs.getInt(8));
				dto.setHname(rs.getString(9));
				dto.setDname(rs.getString(10));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
}
