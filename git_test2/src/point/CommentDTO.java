package point;

import java.sql.Date;

public class CommentDTO {
	private int com_idx;
	private String com_id;
	private String com_content;
	private java.sql.Date com_postdate;
	private int com_bnum;
	private String mem_name;
	
	public CommentDTO() {}

	public CommentDTO(int com_idx, String com_id, String com_content, Date com_postdate, int com_bnum,
			String mem_name) {
		this.com_idx = com_idx;
		this.com_id = com_id;
		this.com_content = com_content;
		this.com_postdate = com_postdate;
		this.com_bnum = com_bnum;
		this.mem_name = mem_name;
	}

	public int getCom_idx() {
		return com_idx;
	}

	public void setCom_idx(int com_idx) {
		this.com_idx = com_idx;
	}

	public String getCom_id() {
		return com_id;
	}

	public void setCom_id(String com_id) {
		this.com_id = com_id;
	}

	public String getCom_content() {
		return com_content;
	}

	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}

	public java.sql.Date getCom_postdate() {
		return com_postdate;
	}

	public void setCom_postdate(java.sql.Date com_postdate) {
		this.com_postdate = com_postdate;
	}

	public int getCom_bnum() {
		return com_bnum;
	}

	public void setCom_bnum(int com_bnum) {
		this.com_bnum = com_bnum;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	
	
}
