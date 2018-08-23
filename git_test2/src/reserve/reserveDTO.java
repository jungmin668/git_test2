package reserve;

import java.sql.Date;

public class reserveDTO {

	//멤버변수
	private String res_num; // idx 
	private String res_hname; // 병원명 
	private String res_sub; // 진료과목 
	private String res_date; //예약날짜
	private String res_time; // 예약 시간 
	private String res_note; // 예약 내용 
	private String res_id; // 아이디 
	private int h_idx; //병원 idx
	
	//기본생성자
	public reserveDTO() {}
	
	//인자생성자
	public reserveDTO(String res_num, String res_hname, String res_sub, String res_date, String res_time, String res_note,
			String res_id, int h_idx) {
	 
		this.res_num = res_num;
		this.res_hname = res_hname;
		this.res_sub = res_sub;
		this.res_date = res_date;
		this.res_time = res_time;
		this.res_note = res_note;
		this.res_id = res_id;
		this.h_idx = h_idx;
	}
	
	//getter/setter
	public String getRes_num() {
		return res_num;
	}

	public void setRes_num(String res_num) {
		this.res_num = res_num;
	}

	public String getRes_hname() {
		return res_hname;
	}

	public void setRes_hname(String res_hname) {
		this.res_hname = res_hname;
	}

	public String getRes_sub() {
		return res_sub;
	}

	public void setRes_sub(String res_sub) {
		this.res_sub = res_sub;
	}

	public String getRes_date() {
		return res_date;
	}

	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}

	public String getRes_time() {
		return res_time;
	}

	public void setRes_time(String res_time) {
		this.res_time = res_time;
	}

	public String getRes_note() {
		return res_note;
	}

	public void setRes_note(String res_note) {
		this.res_note = res_note;
	}

	public String getRes_id() {
		return res_id;
	}

	public void setRes_id(String res_id) {
		this.res_id = res_id;
	}

	public int getH_idx() {
		return h_idx;
	}

	public void setH_idx(int h_idx) {
		this.h_idx = h_idx;
	}
	
}
