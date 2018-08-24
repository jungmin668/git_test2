package point;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

public class CommentDAO {
	Connection con;//오라클 서버와 연결
	PreparedStatement psmt;//오라클 서버와 쿼리전송 
	ResultSet rs;//쿼리의 결과를 받을때
	
	public CommentDAO() {
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
	
	public List<CommentDTO> selectPaging(){
		
		List<CommentDTO> bbs = new Vector<CommentDTO>();
		
		String sql = "" 
				+ " SELECT * FROM ( "
				+ "	SELECT Tb.*, rownum rNum FROM ( "
				+ "		SELECT * FROM comboard ";
		
		sql += " ORDER BY com_idx DESC "
		+ "	) Tb "
		+ " ) ";
		
		System.out.println("쿼리문:"+sql);
		
		try {
			
			psmt = con.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				CommentDTO dto = new CommentDTO();
				
				dto.setCom_idx(rs.getInt(1));
				dto.setCom_id(rs.getString(2));
				dto.setCom_content(rs.getString(3));
				dto.setCom_postdate(rs.getDate(4));
				dto.setCom_bnum(rs.getInt(5));
				
				bbs.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bbs;
	}
	
}
