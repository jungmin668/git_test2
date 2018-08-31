package reserve;

import java.sql.Date;

public class reserveDTO {

	//멤버변수
	//reserve테이블
	private String res_num; // idx 
	private String res_hname; // 병원명 
	private String res_sub; // 진료과목 
	private String res_date; //예약날짜
	private String res_time; // 예약 시간 
	private String res_note; // 예약 내용 
	private String res_id; // 아이디 
	private int h_idx; //병원 idx
	
	//hospital_member테이블
	private int mem_idx; //회원번호
	private String mem_flag; //회원타입
	private String mem_name; //회원명
	private String mem_gender; //회원성별
	private String mem_bir;	//환자생년월일
	private String mem_id ;	//환자아이디
	private String mem_pass;	//환자비번
	private String mem_dis;	//환자질병
	private String tel;	//환자전번
	private String mobile;	//환자폰번호
	private String zipcode;	//회원우편번호
	private String addr1;	//회원주소1
	private String addr2;	//회원주소2
	private String email;	//회원이메일
	private String res_flag;
	//기본생성자
	public reserveDTO() {}
	
 
	//인자생성자
	public reserveDTO(String res_num, String res_hname, String res_sub, String res_date, String res_time,
			String res_note, String res_id, int h_idx, int mem_idx, String mem_flag, String mem_name, String mem_gender,
			String mem_bir, String mem_id, String mem_pass, String mem_dis, String tel, String mobile, String zipcode,
			String addr1, String addr2, String email) {
		this.res_num = res_num;
		this.res_hname = res_hname;
		this.res_sub = res_sub;
		this.res_date = res_date;
		this.res_time = res_time;
		this.res_note = res_note;
		this.res_id = res_id;
		this.h_idx = h_idx;
		this.mem_idx = mem_idx;
		this.mem_flag = mem_flag;
		this.mem_name = mem_name;
		this.mem_gender = mem_gender;
		this.mem_bir = mem_bir;
		this.mem_id = mem_id;
		this.mem_pass = mem_pass;
		this.mem_dis = mem_dis;
		this.tel = tel;
		this.mobile = mobile;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.email = email;
	}

	//플래그가 있는 인자생성 
	public reserveDTO(String res_num, String res_hname, String res_sub, String res_date, String res_time,
			String res_note, String res_id, int h_idx, int mem_idx, String mem_flag, String mem_name, String mem_gender,
			String mem_bir, String mem_id, String mem_pass, String mem_dis, String tel, String mobile, String zipcode,
			String addr1, String addr2, String email, String res_flag) {
		 
		this.res_num = res_num;
		this.res_hname = res_hname;
		this.res_sub = res_sub;
		this.res_date = res_date;
		this.res_time = res_time;
		this.res_note = res_note;
		this.res_id = res_id;
		this.h_idx = h_idx;
		this.mem_idx = mem_idx;
		this.mem_flag = mem_flag;
		this.mem_name = mem_name;
		this.mem_gender = mem_gender;
		this.mem_bir = mem_bir;
		this.mem_id = mem_id;
		this.mem_pass = mem_pass;
		this.mem_dis = mem_dis;
		this.tel = tel;
		this.mobile = mobile;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.email = email;
		this.res_flag = res_flag;
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

	public int getMem_idx() {
		return mem_idx;
	}

	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}

	public String getMem_flag() {
		return mem_flag;
	}

	public void setMem_flag(String mem_flag) {
		this.mem_flag = mem_flag;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_gender() {
		return mem_gender;
	}

	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}

	public String getMem_bir() {
		return mem_bir;
	}

	public void setMem_bir(String mem_bir) {
		this.mem_bir = mem_bir;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pass() {
		return mem_pass;
	}

	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}

	public String getMem_dis() {
		return mem_dis;
	}

	public void setMem_dis(String mem_dis) {
		this.mem_dis = mem_dis;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
