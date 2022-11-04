package model;

public class HoTen {
	private String ho, tenDem, ten;
	
	public HoTen() {
	}
	public HoTen(String ho, String tenDem, String ten) {
		this.ho = ho;
		this.tenDem = tenDem;
		this.ten = ten;
	}

	public String getHo() {
		if(this.ho == null) {
			return "";
		}
		return ho;
	}

	public void setHo(String ho) {
		this.ho = ho;
	}

	public String getTenDem() {
		if(this.tenDem == null) {
			return "";
		}
		return tenDem;
	}

	public void setTenDem(String tenDem) {
		this.tenDem = tenDem;
	}

	public String getTen() {
		if(this.ten == null) {
			return "";
		}
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	@Override
	public String toString() {
		return this.getHo() + " " + this.getTenDem() + " " + this.getTen();
	}
}
