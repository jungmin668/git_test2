package point;

import java.sql.Date;

public class PointDTO {
	private int p_num;
	private int p_clean;
	private int p_cvn;
	private int p_wtime;
	private java.sql.Date p_visitdate;
	private int p_kind;
	private int p_sat;
	private int p_total;
	private String hname;
	private String dname;
	private int mem_idx;
	private int bgroup;
	private int bstep;
	private int bindent;
	private String title;
	private String p_content;
	private String flag;
	
	public PointDTO() {}

	public PointDTO(int p_num, int p_clean, int p_cvn, int p_wtime, Date p_visitdate, int p_kind, int p_sat,
			int p_total, String hname, String dname, int mem_idx, int bgroup, int bstep, int bindent, String title,
			String p_content, String flag) {
		this.p_num = p_num;
		this.p_clean = p_clean;
		this.p_cvn = p_cvn;
		this.p_wtime = p_wtime;
		this.p_visitdate = p_visitdate;
		this.p_kind = p_kind;
		this.p_sat = p_sat;
		this.p_total = p_total;
		this.hname = hname;
		this.dname = dname;
		this.mem_idx = mem_idx;
		this.bgroup = bgroup;
		this.bstep = bstep;
		this.bindent = bindent;
		this.title = title;
		this.p_content = p_content;
		this.flag = flag;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public int getP_clean() {
		return p_clean;
	}

	public void setP_clean(int p_clean) {
		this.p_clean = p_clean;
	}

	public int getP_cvn() {
		return p_cvn;
	}

	public void setP_cvn(int p_cvn) {
		this.p_cvn = p_cvn;
	}

	public int getP_wtime() {
		return p_wtime;
	}

	public void setP_wtime(int p_wtime) {
		this.p_wtime = p_wtime;
	}

	public java.sql.Date getP_visitdate() {
		return p_visitdate;
	}

	public void setP_visitdate(java.sql.Date p_visitdate) {
		this.p_visitdate = p_visitdate;
	}

	public int getP_kind() {
		return p_kind;
	}

	public void setP_kind(int p_kind) {
		this.p_kind = p_kind;
	}

	public int getP_sat() {
		return p_sat;
	}

	public void setP_sat(int p_sat) {
		this.p_sat = p_sat;
	}

	public int getP_total() {
		return p_total;
	}

	public void setP_total(int p_total) {
		this.p_total = p_total;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public int getMem_idx() {
		return mem_idx;
	}

	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}

	public int getBgroup() {
		return bgroup;
	}

	public void setBgroup(int bgroup) {
		this.bgroup = bgroup;
	}

	public int getBstep() {
		return bstep;
	}

	public void setBstep(int bstep) {
		this.bstep = bstep;
	}

	public int getBindent() {
		return bindent;
	}

	public void setBindent(int bindent) {
		this.bindent = bindent;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}		
		
}
