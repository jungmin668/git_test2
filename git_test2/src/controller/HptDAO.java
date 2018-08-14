package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class HptDAO {
	
	Connection con; //오라클 서버와 연결할때 사용
	PreparedStatement psmt;//오라클 서버와 쿼리전송 역활
	ResultSet rs;//쿼리의 결과를 받을때 사용
	
	public HptDAO() {
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
   //자원반납하기
   public void close() {
      try {
         if(rs!=null) rs.close();
         if(psmt!=null) psmt.close();
         if(con!=null) con.close();
      }
      catch(Exception e) {
         System.out.println("자원반납시 예외발생");
         e.printStackTrace();
      }
   }
   

   public void insertJSON(HashMap<String, String> hptdata, int i) {
      	  
		  String hpt_name = hptdata.get("title"+i);     
	      String hpt_tel = hptdata.get("telephone"+i);
	      String hpt_link = hptdata.get("link"+i);
	      String hpt_sort = hptdata.get("category"+i);
	      String hpt_sub = hptdata.get("description"+i);
	      String hpt_addr = hptdata.get("roadAddress"+i);
	      String hpt_x = hptdata.get("mapx"+i);
	      String hpt_y = hptdata.get("mapy"+i); 
	        
    
      try{
         
         String sql = "INSERT INTO hospital "        
            + " VALUES ( "
            + " ?, ?, ?, ?, ?, ?, ?, ? )";
         psmt = con.prepareStatement(sql);
         psmt.setString(1, hpt_name);
         psmt.setString(2, hpt_tel);
         psmt.setString(3, hpt_link);
         psmt.setString(4, hpt_sort);
         psmt.setString(5, hpt_sub);
         psmt.setString(6, hpt_addr);
         psmt.setString(7, hpt_x);
         psmt.setString(8, hpt_y);
      
         psmt.executeUpdate();
      }
      catch(Exception e){
         e.printStackTrace();
      }      
   }
   
   public HptDTO selectIntro(String num)
   {
	   HptDTO dto = new HptDTO();
		
		String query = " SELECT * from hospital_t WHERE idx=? ";		
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setHp_sido(rs.getString(2));				
				dto.setHp_gugun(rs.getString(3));
				dto.setHp_name(rs.getString("hp_name"));
				//dto.setHp_explain(rs.getString("hp_explain").replace("\r\n", "<br/>"));
				dto.setHp_explain(rs.getString("hp_explain"));
				dto.setHp_genre_name(rs.getString("hp_genre_name"));
				dto.setHp_addr(rs.getString("hp_addr"));
				dto.setHp_tel(rs.getString("hp_tel"));
				dto.setHp_url(rs.getString("hp_url"));
				/*dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
				
				//첨부파일
				dto.setChumfile(rs.getString(7));
				
				//member테이블과 join된 결과추가
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));*/
			}
		}
		catch(Exception e) {
			System.out.println("상세보기시 예외발생");
			e.printStackTrace();
		}				
		//System.out.println("DB에서 데이터 가져오기 성공");		
		return dto;
   }
}