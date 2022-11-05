package model;

public class DauTruyenHDNhap {
	private int id, soLuong;
	private float donGia;
	private DauTruyen dauTruyen;
	private HoaDonNhap hoaDonNhap;
	
	public DauTruyenHDNhap() {
	}
	
	
	public DauTruyenHDNhap(int soLuong, float donGia, DauTruyen dauTruyen, HoaDonNhap hoaDonNhap) {
		this.soLuong = soLuong;
		this.donGia = donGia;
		this.dauTruyen = dauTruyen;
		this.hoaDonNhap = hoaDonNhap;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public float getDonGia() {
		return donGia;
	}

	public void setDonGia(float donGia) {
		this.donGia = donGia;
	}


	public DauTruyen getDauTruyen() {
		return dauTruyen;
	}


	public void setDauTruyen(DauTruyen dauTruyen) {
		this.dauTruyen = dauTruyen;
	}


	public HoaDonNhap getHoaDonNhap() {
		return hoaDonNhap;
	}


	public void setHoaDonNhap(HoaDonNhap hoaDonNhap) {
		this.hoaDonNhap = hoaDonNhap;
	}
	
	
}
