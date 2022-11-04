package model;

public class DauTruyen {
	private String ma, tenTruyen, tacGia, nhaXuatBan, moTa;
	private int soLuong, namXuatBan;
	
	public DauTruyen() {
	}
	
	public String getMa() {
		return ma;
	}
	public void setMa(String ma) {
		this.ma = ma;
	}
	public String getTenTruyen() {
		return tenTruyen;
	}
	public void setTenTruyen(String tenTruyen) {
		this.tenTruyen = tenTruyen;
	}
	public String getTacGia() {
		return tacGia;
	}
	public void setTacGia(String tacGia) {
		this.tacGia = tacGia;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public String getNhaXuatBan() {
		return nhaXuatBan;
	}
	public void setNhaXuatBan(String nhaXuatBan) {
		this.nhaXuatBan = nhaXuatBan;
	}
	public int getNamXuatBan() {
		return namXuatBan;
	}
	public void setNamXuatBan(int namXuatBan) {
		this.namXuatBan = namXuatBan;
	}
	public String getMoTa() {
		if(moTa == null) {
			return "";
		}
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	
}
