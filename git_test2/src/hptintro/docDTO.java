package hptintro;

public class docDTO {

	private int doc_idx;
    private String doc_name;
    private String doc_major;
    private String doc_gender;
    private String doc_age;
    private String doc_career;
    private String doc_sc;
    private int mem_idx;
    
	public docDTO() {}

	public docDTO(int doc_idx, String doc_name, String doc_major, String doc_gender, String doc_age, String doc_career,
			String doc_sc, int mem_idx) {
		
		this.doc_idx = doc_idx;
		this.doc_name = doc_name;
		this.doc_major = doc_major;
		this.doc_gender = doc_gender;
		this.doc_age = doc_age;
		this.doc_career = doc_career;
		this.doc_sc = doc_sc;
		this.mem_idx = mem_idx;
	}

	public int getDoc_idx() {
		return doc_idx;
	}

	public void setDoc_idx(int doc_idx) {
		this.doc_idx = doc_idx;
	}

	public String getDoc_name() {
		return doc_name;
	}

	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}

	public String getDoc_major() {
		return doc_major;
	}

	public void setDoc_major(String doc_major) {
		this.doc_major = doc_major;
	}

	public String getDoc_gender() {
		return doc_gender;
	}

	public void setDoc_gender(String doc_gender) {
		this.doc_gender = doc_gender;
	}

	public String getDoc_age() {
		return doc_age;
	}

	public void setDoc_age(String doc_age) {
		this.doc_age = doc_age;
	}

	public String getDoc_career() {
		return doc_career;
	}

	public void setDoc_career(String doc_career) {
		this.doc_career = doc_career;
	}

	public String getDoc_sc() {
		return doc_sc;
	}

	public void setDoc_sc(String doc_sc) {
		this.doc_sc = doc_sc;
	}

	public int getMem_idx() {
		return mem_idx;
	}

	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}    
}
