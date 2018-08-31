package hptintro;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;



public class introDAO {
	Connection con; //오라클 서버와 연결할때 사용
	PreparedStatement psmt;//오라클 서버와 쿼리전송 역활
	ResultSet rs;//쿼리의 결과를 받을때 사용
	
	public introDAO() {
		String driver = "oracle.jdbc.OracleDriver";
		String url 
			= "jdbc:oracle:thin:@localhost:1522:orcl";
		try {
			Class.forName(driver);
			String id = "kosmo";
			String pw = "1234";
			con = 
				DriverManager.getConnection(url, id, pw);
			System.out.println("DB Success^^*");
		}
		catch(Exception e) {
			System.out.println("DB Fail;");
		}		
	}
	
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
	
	// 회원 가입
   public int memberRegist(introDTO dto) {   
      // 적용된 행의 갯수확인을 위한 변수
      int affected = 0;
       
      try {
         String query = "INSERT INTO hospital_member ( "
               + " mem_idx, mem_name, mem_gender, mem_bir, mem_id, mem_pass, mem_dis, "
               + " tel, mobile, zipcode, addr1, addr2, email ) " 
               + " VALUES ( "
               + " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? , ? )";
         psmt = con.prepareStatement(query);
         psmt.setInt(1, dto.getMem_idx());
         psmt.setString(2, dto.getMem_name());
         psmt.setString(3, dto.getMem_gender());
         //psmt.setString(4, dto.getMem_age());
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
	   //로그인
	   public Map<String, String> memberLogin(String id, String pwd) {  

	      Map<String, String> maps = new HashMap<String, String>();

	      String query = " SELECT mem_id , mem_pass , mem_name , mem_idx  FROM hospital_member WHERE mem_id = ? and mem_pass = ? ";
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
	          
	            maps.put("idx", rs.getString(4)); 
	         } else {
	            System.out.println("결과셋이 없습니다.");
	         }
	      } catch (Exception e) {
	         System.out.println("getMemberDTO오류");
	         e.printStackTrace();
	      }

	      return maps;
	   }
	
	public introDTO selectView(String idx) {
		
		introDTO dto = new introDTO();
		
		String query = " select * from hospital_member where mem_idx=? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setMem_idx(rs.getInt("mem_idx"));
				dto.setMem_name(rs.getString("mem_name"));
				dto.setMem_id(rs.getString("mem_id"));
				dto.setMem_dis(rs.getString("mem_dis"));
				dto.setTel(rs.getString("tel"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));
				dto.setMem_img(rs.getString("mem_img"));
			}
		}
		catch(Exception e) {
			System.out.println("병원정보 표시시 예외발생");
			e.printStackTrace();
		}	
		
		return dto;
	}
	
	//병원정보 수정하기
	public int updateEdit(introDTO dto) {
		
		int affected = 0;
		try {
			String query = "UPDATE hospital_member SET"
					+ " mem_name=?, addr1=?, addr2=?, tel=?, mem_dis=?, zipcode=? "
					+ " WHERE mem_idx=?";
			System.out.println("query="+query);
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getMem_name());
			psmt.setString(2, dto.getAddr1());
			psmt.setString(3, dto.getAddr2());
			psmt.setString(4, dto.getTel());
			psmt.setString(5, dto.getMem_dis());
			psmt.setString(6, dto.getZipcode());
			psmt.setInt(7, dto.getMem_idx());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("병원정보 업데이트중 예외발생");
			e.printStackTrace();
		}
		
		return affected;		
	}
	
	//의사 리스트 가져오기	
	public List<docDTO> docList(String idx){
		
		//1.결과 레코드셋을 담기위한 리스트계열 컬렉션생성 
		List<docDTO> bbs = new Vector<docDTO>();
		
		//2.해당 병원 의사 전체를 가져오기 위한 쿼리작성
		String query = " select * from doctor where mem_idx=? ";
				
		System.out.println("쿼리문:"+ query);			
			
		try {
			//3.prepare객체생성 및 실행
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, idx);
			
			//4.쿼리실행후 결과셋 돌려받음
			rs = psmt.executeQuery();
			
			//5.결과셋의 갯수만큼 반복
			while(rs.next()) {
				
				//6.결과셋을 하나씩 DTO객체에 저장
				docDTO dto = new docDTO();
				
				dto.setDoc_idx(rs.getInt(1));
				dto.setDoc_name(rs.getString(2));
				dto.setDoc_major(rs.getString(3));
				dto.setDoc_gender(rs.getString(4));
				dto.setDoc_age(rs.getString(5));
				dto.setDoc_career(rs.getString(6));
				dto.setDoc_sc(rs.getString(7));
				dto.setMem_idx(rs.getInt(8));
				
				//7.DTO객체를 컬렉션에 추가
				bbs.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	//기존의 의사정보 삭제하기(무한에러남)
	public int delDoc(String idx) {
		
		int affected = 0;	
		try {
			String query = " delete from doctor where mem_idx=?  ";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("의사데이터삭제시 예외발생");
			e.printStackTrace();
		}	
		
		return affected;
	}
	
	
	//새로운 의사정보로 입력하기
	public int insertDoc(docDTO dto, String idx) {
		
		int affected = 0;
		
		try {
			String query = "INSERT INTO doctor ( "
				+ " doc_idx, doc_name ,doc_major ,doc_gender ,doc_age ,doc_career ,doc_sc , mem_idx) "
				+ " VALUES ( "
				+ " seq_intro.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getDoc_name());
			psmt.setString(2, dto.getDoc_major());
			psmt.setString(3, dto.getDoc_gender());
			psmt.setString(4, dto.getDoc_age());
			psmt.setString(5, dto.getDoc_career());
			psmt.setString(6, dto.getDoc_sc());
			psmt.setString(7, idx);
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		
		return affected;	
	}
	
	//병원 이미지 수정하기
	public int imgUpdate(String idx, String img) {
		
		int affected = 0;
		
		try {
			String query = "update hospital_member set "
				+ " mem_img=? "
				+ " where mem_idx=?";

			psmt = con.prepareStatement(query);
			psmt.setString(1, img);
			psmt.setString(2, idx);
			
			affected = psmt.executeUpdate();
			System.out.println("이미지 수정완료!!!");
		}
		catch(Exception e) {
			System.out.println("병원이미지 업로드중 예외발생");
			e.printStackTrace();
		}
		
		return affected;	
	}
}
