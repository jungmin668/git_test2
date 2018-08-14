package controller;

public class HptDTO {
	
	private String idx;
	private String hp_sido;
	private String hp_gugun;
	private String hp_genre;
	private String hp_genre_name;
	private String hp_name;
	private String hp_url;
	private String hp_explain;
	private String hp_tel;
	private String hp_addr;
	private String hp_naver_x;
	private String hp_naver_y;
	private String hp_latitude;
	private String hp_longitude;
	
	public HptDTO() {}

	public HptDTO(String idx, String hp_sido, String hp_gugun, String hp_genre, String hp_genre_name, String hp_name,
			String hp_url, String hp_explain, String hp_tel, String hp_addr, String hp_naver_x, String hp_naver_y,
			String hp_latitude, String hp_longitude) {
	
		this.idx = idx;
		this.hp_sido = hp_sido;
		this.hp_gugun = hp_gugun;
		this.hp_genre = hp_genre;
		this.hp_genre_name = hp_genre_name;
		this.hp_name = hp_name;
		this.hp_url = hp_url;
		this.hp_explain = hp_explain;
		this.hp_tel = hp_tel;
		this.hp_addr = hp_addr;
		this.hp_naver_x = hp_naver_x;
		this.hp_naver_y = hp_naver_y;
		this.hp_latitude = hp_latitude;
		this.hp_longitude = hp_longitude;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getHp_sido() {
		return hp_sido;
	}

	public void setHp_sido(String hp_sido) {
		this.hp_sido = hp_sido;
	}

	public String getHp_gugun() {
		return hp_gugun;
	}

	public void setHp_gugun(String hp_gugun) {
		this.hp_gugun = hp_gugun;
	}

	public String getHp_genre() {
		return hp_genre;
	}

	public void setHp_genre(String hp_genre) {
		this.hp_genre = hp_genre;
	}

	public String getHp_genre_name() {
		return hp_genre_name;
	}

	public void setHp_genre_name(String hp_genre_name) {
		this.hp_genre_name = hp_genre_name;
	}

	public String getHp_name() {
		return hp_name;
	}

	public void setHp_name(String hp_name) {
		this.hp_name = hp_name;
	}

	public String getHp_url() {
		return hp_url;
	}

	public void setHp_url(String hp_url) {
		this.hp_url = hp_url;
	}

	public String getHp_explain() {
		return hp_explain;
	}

	public void setHp_explain(String hp_explain) {
		this.hp_explain = hp_explain;
	}

	public String getHp_tel() {
		return hp_tel;
	}

	public void setHp_tel(String hp_tel) {
		this.hp_tel = hp_tel;
	}

	public String getHp_addr() {
		return hp_addr;
	}

	public void setHp_addr(String hp_addr) {
		this.hp_addr = hp_addr;
	}

	public String getHp_naver_x() {
		return hp_naver_x;
	}

	public void setHp_naver_x(String hp_naver_x) {
		this.hp_naver_x = hp_naver_x;
	}

	public String getHp_naver_y() {
		return hp_naver_y;
	}

	public void setHp_naver_y(String hp_naver_y) {
		this.hp_naver_y = hp_naver_y;
	}

	public String getHp_latitude() {
		return hp_latitude;
	}

	public void setHp_latitude(String hp_latitude) {
		this.hp_latitude = hp_latitude;
	}

	public String getHp_longitude() {
		return hp_longitude;
	}

	public void setHp_longitude(String hp_longitude) {
		this.hp_longitude = hp_longitude;
	}
}
