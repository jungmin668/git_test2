package event;
import java.sql.Date;

 
public class EventDTO {
	private String e_num; // idx 
	private String e_content; //내용  
	private String e_title; // 타이틀 
	private java.sql.Date e_postdate; //날짜  
	private int e_hits; //조회수 
	private String e_id; // 아이디 
	private int h_idx; // 병원 일련번호 
	
	public EventDTO() {}
	
	public EventDTO(String e_num, String e_title, String e_content, Date e_postdate, String e_id, int e_hits,int h_idx) {
		this.e_num = e_num;
		this.e_title = e_title;
		this.e_content = e_content;
		this.e_postdate = e_postdate;
		this.e_id = e_id;
		this.e_hits = e_hits;
		this.h_idx = h_idx;
	}

	public String getE_num() {
		return e_num;
	}

	public void setE_num(String e_num) {
		this.e_num = e_num;
	}

	public String getE_title() {
		return e_title;
	}

	public void setE_title(String e_title) {
		this.e_title = e_title;
	}

	public String getE_content() {
		return e_content;
	}

	public void setE_content(String e_content) {
		this.e_content = e_content;
	}

	public java.sql.Date getE_postdate() {
		return e_postdate;
	}

	public void setE_postdate(java.sql.Date e_postdate) {
		this.e_postdate = e_postdate;
	}

	public String getE_id() {
		return e_id;
	}

	public void setE_id(String e_id) {
		this.e_id = e_id;
	}

	public int getE_hits() {
		return e_hits;
	}

	public void setE_hits(int e_hits) {
		this.e_hits = e_hits;
	}

	public int getH_idx() {
		return h_idx;
	}

	public void setH_idx(int h_idx) {
		this.h_idx = h_idx;
	}
 	
}