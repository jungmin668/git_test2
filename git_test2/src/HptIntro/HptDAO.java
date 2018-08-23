package HptIntro;

import java.awt.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;





public class HptDAO {
	
	Connection con; //오라클 서버와 연결할때 사용
	PreparedStatement psmt;//오라클 서버와 쿼리전송 역활
	ResultSet rs;//쿼리의 결과를 받을때 사용
	
	public HptDAO() {
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";	
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
   
   //병원 정보 상세보기
   public HptDTO selectIntro(String hname)
   {
	   HptDTO dto = new HptDTO();
		
		String query = " SELECT * from hospital_t WHERE hp_name=? ";		
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, hname);
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
   
   //의사 정보 가져오기
   public HptDTO selectDoc(String hname)
   {
	   
	    HptDTO dto = new HptDTO();
	    List<HptDTO> doclist = new Vector<HptDTO>();
		
		String query = " SELECT * from doctor WHERE hp_name=? ";		
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, hname);
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto.setDoc_name(rs.getString("doc_name"));
				dto.setDoc_major(rs.getString("doc_major"));				
				dto.setDoc_gender(rs.getString("doc_gender"));
				dto.setDoc_age(rs.getString("doc_age"));
				dto.setDoc_career(rs.getString("doc_career"));
				dto.setDoc_sc(rs.getString("doc_sc"));
				doclist.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("의사 정보 가져오기시 예외발생");
			e.printStackTrace();
		}				
		//System.out.println("DB에서 데이터 가져오기 성공");		
		return dto;
   }
   
   
   
   //병원정보 수정하기
   public int hptIntroEdit(HptDTO dto) 
 	{		
 		int affected = 0;
 		
 		try {
 			String query = "UPDATE hospital_t SET" 					
 					+ " hp_explain=?, hp_addr=?, hp_tel=? "
 					+ " WHERE hp_name=?";
 			
 			psmt = con.prepareStatement(query);
 			
 			psmt.setString(1, dto.getHp_explain());
 			psmt.setString(2, dto.getHp_addr());
 			psmt.setString(3, dto.getHp_tel());
 			psmt.setString(4, dto.getHp_name());
 			
 			affected = psmt.executeUpdate();
 		}
 		catch(Exception e) {
 			System.out.println("병원정보수정 중 예외발생");
 			e.printStackTrace();
 		}
 				
 		return affected;
 	}

   //의사정보 수정하기
   public int docEdit(HptDTO dto) 
 	{		
 		int affected = 0;
 		
 		try {
 			String query = "insert into doctor (doc_name, doc_major, doc_gender, doc_age, doc_career, doc_sc, hp_name) values " 					
 					+ " ( ?, ?, ?, ?, ?, ?, ? ) ";
 				
 			
 			psmt = con.prepareStatement(query);
 			
 			psmt.setString(1, dto.getDoc_name());
 			psmt.setString(2, dto.getDoc_major());
 			psmt.setString(3, dto.getDoc_gender());
 			psmt.setString(4, dto.getDoc_age());
 			psmt.setString(5, dto.getDoc_career());
 			psmt.setString(6, dto.getDoc_sc());
 			psmt.setString(7, dto.getHp_name());
 			//psmt.setString(2, dto.getHp_name());
 			/*psmt.setString(3, dto.getTel());
 			psmt.setString(4, dto.getMobile());
 			psmt.setString(5, dto.getEmail());
 			psmt.setString(6, dto.getZipcode());
 			psmt.setString(7, dto.getAddr1());
 			psmt.setString(8, dto.getAddr2());
 			
 			psmt.setString(9, dto.getHp);*/
 			
 			affected = psmt.executeUpdate();
 		}
 		catch(Exception e) {
 			System.out.println("의사정보입력 중 예외발생");
 			e.printStackTrace();
 		}
 				
 		return affected;
 	}
}