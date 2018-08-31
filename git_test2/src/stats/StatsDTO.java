package stats;

import java.sql.Date;

public class StatsDTO {

	public String h_idx;
	public String h_name;
    public int mem_idx;
    public String mem_gender;
    public String mem_age;
    public String search_date;
    
    //월별로 나눠서 방문자수 카운트 하기
    public int year;
    
    public int month_01=0;
    public int month_02=0;
    public int month_03=0;
    public int month_04=0;
    public int month_05=0;
    public int month_06=0;
    public int month_07=0;
    public int month_08=0;
    public int month_09=0;
    public int month_10=0;
    public int month_11=0;
    public int month_12=0;
    //날짜별 통계 페이지에 뿌려주기 위한 count 변수 생성
    public int visit_count_w=0;
    public int visit_count_m=0;
    public int visit_total=0;
    //기본 생성자
    public StatsDTO() {}
    //인자 생성자
	public StatsDTO(String h_idx, String h_name, int mem_idx, String mem_gender, String mem_age, String search_date,
			int year, int month_01, int month_02, int month_03, int month_04, int month_05, int month_06, int month_07,
			int month_08, int month_09, int month_10, int month_11, int month_12, int visit_count_w, int visit_count_m,
			int visit_total) {
		this.h_idx = h_idx;
		this.h_name = h_name;
		this.mem_idx = mem_idx;
		this.mem_gender = mem_gender;
		this.mem_age = mem_age;
		this.search_date = search_date;
		this.year = year;
		this.month_01 = month_01;
		this.month_02 = month_02;
		this.month_03 = month_03;
		this.month_04 = month_04;
		this.month_05 = month_05;
		this.month_06 = month_06;
		this.month_07 = month_07;
		this.month_08 = month_08;
		this.month_09 = month_09;
		this.month_10 = month_10;
		this.month_11 = month_11;
		this.month_12 = month_12;
		this.visit_count_w = visit_count_w;
		this.visit_count_m = visit_count_m;
		this.visit_total = visit_total;
	}
	//Getter
	public String getH_idx() {
		return h_idx;
	}
	public String getH_name() {
		return h_name;
	}
	public int getMem_idx() {
		return mem_idx;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public String getMem_age() {
		return mem_age;
	}
	public String getSearch_date() {
		return search_date;
	}
	public int getYear() {
		return year;
	}
	public int getMonth_01() {
		return month_01;
	}
	public int getMonth_02() {
		return month_02;
	}
	public int getMonth_03() {
		return month_03;
	}
	public int getMonth_04() {
		return month_04;
	}
	public int getMonth_05() {
		return month_05;
	}
	public int getMonth_06() {
		return month_06;
	}
	public int getMonth_07() {
		return month_07;
	}
	public int getMonth_08() {
		return month_08;
	}
	public int getMonth_09() {
		return month_09;
	}
	public int getMonth_10() {
		return month_10;
	}
	public int getMonth_11() {
		return month_11;
	}
	public int getMonth_12() {
		return month_12;
	}
	public int getVisit_count_w() {
		return visit_count_w;
	}
	public int getVisit_count_m() {
		return visit_count_m;
	}
	public int getVisit_total() {
		return visit_total;
	}
	
	//Setter
	public void setH_idx(String h_idx) {
		this.h_idx = h_idx;
	}
	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public void setMem_age(String mem_age) {
		this.mem_age = mem_age;
	}
	public void setSearch_date(String search_date) {
		this.search_date = search_date;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public void setMonth_01(int month_01) {
		this.month_01 = month_01;
	}
	public void setMonth_02(int month_02) {
		this.month_02 = month_02;
	}
	public void setMonth_03(int month_03) {
		this.month_03 = month_03;
	}
	public void setMonth_04(int month_04) {
		this.month_04 = month_04;
	}
	public void setMonth_05(int month_05) {
		this.month_05 = month_05;
	}
	public void setMonth_06(int month_06) {
		this.month_06 = month_06;
	}
	public void setMonth_07(int month_07) {
		this.month_07 = month_07;
	}
	public void setMonth_08(int month_08) {
		this.month_08 = month_08;
	}
	public void setMonth_09(int month_09) {
		this.month_09 = month_09;
	}
	public void setMonth_10(int month_10) {
		this.month_10 = month_10;
	}
	public void setMonth_11(int month_11) {
		this.month_11 = month_11;
	}
	public void setMonth_12(int month_12) {
		this.month_12 = month_12;
	}
	public void setVisit_count_w(int visit_count_w) {
		this.visit_count_w = visit_count_w;
	}
	public void setVisit_count_m(int visit_count_m) {
		this.visit_count_m = visit_count_m;
	}
	public void setVisit_total(int visit_total) {
		this.visit_total = visit_total;
	}
}
