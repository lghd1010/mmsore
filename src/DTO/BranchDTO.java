package DTO;

public class BranchDTO {

	private int b_idx;

	private String b_name;

	private String b_manager;

	private String b_phone;

	private int b_mensa_no;

	public int getB_idx() {
		return b_idx;
	}

	public int getB_mensa_no() {
		return b_mensa_no;
	}

	public void setB_mensa_no(int b_mensa_no) {
		this.b_mensa_no = b_mensa_no;
	}

	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public String getB_manager() {
		return b_manager;
	}

	public void setB_manager(String b_manager) {
		this.b_manager = b_manager;
	}

	public String getB_phone() {
		return b_phone;
	}

	public void setB_phone(String b_phone) {
		this.b_phone = b_phone;
	}

}
