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
	
	public int getTotalRecordCount(Map map, int idx) {
		int totalCount = 0;
		try {
			String sql = "SELECT COUNT(*) FROM point ";
			if(map.get("Word")!=null) {
				sql += " WHERE "+map.get("Column")+" "
					+ " LIKE '%"+map.get("Word") + "%' ";
			}
			sql += " WHERE (flag='hospital') AND (mem_idx = '"+idx+"')";
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
				+ "	SELECT P.*, M.mem_name "
				+ "	FROM point P INNER JOIN hospital_member M	 "
				+ "	ON P.mem_idx = M.mem_idx	 "
				+ " WHERE (flag='hospital') AND (P.mem_idx = '"+idx+"') ";
		
		if(map.get("Word")!=null) {
			sql += " AND "+map.get("Column")+ " "
				+ " LIKE '%"+map.get("Word")+"%' ";
		}
		
		sql += " ORDER BY bgroup DESC, bstep ASC "
		//sql += " ORDER BY p_num DESC "
		+ "	) Tb "
		+ " ) "
		+ " WHERE (rNum BETWEEN ? AND ?) ";
		
		System.out.println("쿼리문:"+sql);
		
		try {
			
			psmt = con.prepareStatement(sql);
			
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				PointDTO dto = new PointDTO();
				
				//답변글처리를 위한 로직추가
				int indentNum = rs.getInt(14);
				String spacer = "";
				
				dto.setBgroup(rs.getInt(12));
				dto.setBstep(rs.getInt(13));
				dto.setBindent(indentNum);
				if(indentNum>0){
					for(int i=1 ; i<=indentNum ; i++){
						spacer += "&nbsp;&nbsp;";
					}
					spacer += spacer+"<img src='../images/re2.gif'>";
				}
								
				dto.setP_num(rs.getInt(1));
				dto.setP_clean(rs.getInt(2));
				dto.setP_cvn(rs.getInt(3));
				dto.setP_wtime(rs.getInt(4));
				dto.setP_visitdate(rs.getDate(5));
				dto.setP_total(rs.getInt(8));
				dto.setHname(rs.getString(9));
				dto.setDname(rs.getString(10));
				dto.setMem_idx(rs.getInt(11));
				dto.setTitle(spacer+rs.getString(15));
				dto.setP_content(rs.getString(16));
				dto.setFlag(rs.getString(17));
				
				bbs.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bbs;
	}
	
	public List<PointDTO> selectPagingPoint(Map map, int idx){
		
		List<PointDTO> bbs = new Vector<PointDTO>();
		
		String sql = "" 
				+ " SELECT * FROM ( "
				+ "	SELECT Tb.*, rownum rNum FROM ( "
				+ "	SELECT P.*, M.mem_name "
				+ "	FROM point P INNER JOIN hospital_member M	 "
				+ "	ON P.mem_idx = M.mem_idx	 "
				+ " WHERE (flag='hospital') AND (P.mem_idx = '"+idx+"') ";
		
		if(map.get("Word")!=null) {
			sql += " AND "+map.get("Column")+ " "
				+ " LIKE '%"+map.get("Word")+"%' ";
		}
		
		sql += " ORDER BY bgroup DESC, bstep ASC "
		//sql += " ORDER BY p_num DESC "
		+ "	) Tb "
		+ " ) ";
		
		System.out.println("쿼리문:"+sql);
		
		try {
			
			psmt = con.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				PointDTO dto = new PointDTO();
				
				dto.setP_total(rs.getInt(8));
				
				bbs.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bbs;
	}
	
	public List<PointDTO> selectList(int idx){
		
		List<PointDTO> bbs = new Vector<PointDTO>();
		
		String sql = "" 
				+ " SELECT * FROM ( "
				+ "	SELECT Tb.*, rownum rNum FROM ( "
				+ "	SELECT P.* "
				+ "	FROM point P INNER JOIN hospital_member M	 "
				+ "	ON P.mem_idx = M.mem_idx	 ";
				
		sql += " ORDER BY p_num DESC "
		+ "	) Tb "
		+ " ) "
		+ " WHERE (flag='doctor') AND (mem_idx = '"+idx+"') ";
		
		System.out.println("쿼리문:"+sql);
		
		try {
			
			psmt = con.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				PointDTO dto = new PointDTO();
				
				dto.setP_num(rs.getInt(1));
				dto.setP_visitdate(rs.getDate(5));
				dto.setP_kind(rs.getInt(6));
				dto.setP_sat(rs.getInt(7));
				dto.setP_total(rs.getInt(8));
				dto.setHname(rs.getString(9));
				dto.setDname(rs.getString(10));
				dto.setMem_idx(rs.getInt(11));
				dto.setTitle(rs.getString(15));
				dto.setP_content(rs.getString(16));
				dto.setFlag(rs.getString(17));
				
				bbs.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bbs;
	}	

	public PointDTO selectView_d(int p_num) {
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
				dto.setMem_idx(rs.getInt(11));
				dto.setBgroup(rs.getInt(12));
				dto.setBstep(rs.getInt(13));
				dto.setBindent(rs.getInt(14));
				dto.setTitle(rs.getString(15));
				dto.setP_content(rs.getString(16));
				dto.setFlag(rs.getString(17));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
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
				dto.setMem_idx(rs.getInt(11));
				dto.setBgroup(rs.getInt(12));
				dto.setBstep(rs.getInt(13));
				dto.setBindent(rs.getInt(14));
				dto.setTitle(rs.getString(15));
				dto.setP_content(rs.getString(16));
				dto.setFlag(rs.getString(17));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	//게시물에 답변글 쓰기
	public int reply(PointDTO dto) {
		
		/*답변글을 쓰기 전에 bstep을 +1 증가시킴
		답변글을 중간에 끼워넣어야 하는 경우가 
		발생될때 해당 답변글보다 bstep이 큰 게시물이 있다면
		일괄적으로 +1 처리한다.*/
		replyStepUpdate(dto.getBgroup(), dto.getBstep());
		
		int affected = 0;
		
		try {
			/*답변형게시판에서 원글의 경우 idx와 bgroup은 항상 동일한 번호임.
			답변글인 경우 원글의 idx값을 bgroup으로 가지게 됨*/
			String sql = "INSERT INTO point (p_num, title, p_content, mem_idx, flag, bgroup, bstep, bindent) "
					+ " VALUES (seq_point.NEXTVAL, ?, ?, ?, 'hospital', ?, ?, ?)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getP_content());
			psmt.setInt(3, dto.getMem_idx());
			psmt.setInt(4, dto.getBgroup());
			psmt.setInt(5, dto.getBstep()+1);
			psmt.setInt(6, dto.getBindent()+1);
			
			affected = psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return affected;
	}
	
	public void replyStepUpdate(int groupNum, int stepNum) {
		try {
			String sql = "UPDATE point SET bstep=bstep+1 "
					+ " WHERE bgroup=? AND bstep>?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, groupNum);
			psmt.setInt(2, stepNum);
			psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
