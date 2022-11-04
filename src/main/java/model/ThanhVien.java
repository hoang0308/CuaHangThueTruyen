package model;

public class ThanhVien extends Nguoi {
	private String username, password, vaiTro;
	

	public ThanhVien() {
	}
	
	public ThanhVien(int id ,String username, String password, String vaiTro, HoTen hoTen) {
		super.setId(id);
		this.username = username;
		this.password = password;
		this.vaiTro = vaiTro;
		super.setHoTen(hoTen);
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getVaiTro() {
		return vaiTro;
	}
	public void setVaiTro(String vaiTro) {
		this.vaiTro = vaiTro;
	}

}
