package model;

public class DiaChi {
	private int id;
	private String soNha, toaNha, xomPho, phuongXa,quanHuyen,tinhThanh, moTa;
	
	public DiaChi() {
	}
	
	public DiaChi(String soNha, String toaNha, String xomPho, String phuongXa, String quanHuyen,
			String tinhThanh) {
		this.soNha = soNha;
		this.toaNha = toaNha;
		this.xomPho = xomPho;
		this.phuongXa = phuongXa;
		this.quanHuyen = quanHuyen;
		this.tinhThanh = tinhThanh;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSoNha() {
		if(this.soNha == null) {
			return "";
		}
		return soNha;
	}
	public void setSoNha(String soNha) {
		this.soNha = soNha;
	}
	public String getToaNha() {
		if(this.toaNha == null) {
			return "";
		}
		return toaNha;
	}
	public void setToaNha(String toaNha) {
		this.toaNha = toaNha;
	}
	public String getXomPho() {
		if(this.xomPho == null) {
			return "";
		}
		return xomPho;
	}
	public void setXomPho(String xomPho) {
		this.xomPho = xomPho;
	}
	public String getPhuongXa() {
		return phuongXa;
	}
	public void setPhuongXa(String phuongXa) {
		this.phuongXa = phuongXa;
	}
	public String getQuanHuyen() {
		return quanHuyen;
	}
	public void setQuanHuyen(String quanHuyen) {
		this.quanHuyen = quanHuyen;
	}
	public String getTinhThanh() {
		return tinhThanh;
	}
	public void setTinhThanh(String tinhThanh) {
		this.tinhThanh = tinhThanh;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	
	@Override
	public String toString() {
		String result = "";
		if(!this.getSoNha().equals("")) {
			result += this.getSoNha() + "-";
		}
		if(!this.getToaNha().equals("")) {
			result += this.getToaNha() + "-";
		}
		if(!this.getXomPho().equals("")) {
			result += this.getXomPho()+ "-";
		}
		result += this.getPhuongXa() + "-"
				+ this.getQuanHuyen() + "-"
				+ this.getTinhThanh();
		return result;
	}
}
