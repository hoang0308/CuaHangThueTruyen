package model;

import java.sql.Date;

public class HoaDonNhap {
	private String ma;
	private Date ngayThanhToan;
	private float tongTien;
	private ThanhVien nhanVien;
	private NhaCC nhaCC;
	private DauTruyenHDNhap dauTruyenHDNhap;
	private String moTa;
	
	public HoaDonNhap() {
	}

	public String getMa() {
		return ma;
	}

	public void setMa(String ma) {
		this.ma = ma;
	}

	public Date getNgayThanhToan() {
		return ngayThanhToan;
	}

	public void setNgayThanhToan(Date ngayThanhToan) {
		this.ngayThanhToan = ngayThanhToan;
	}

	public float getTongTien() {
		return tongTien;
	}

	public void setTongTien(float tongTien) {
		this.tongTien = tongTien;
	}

	public ThanhVien getNhanVien() {
		return nhanVien;
	}

	public void setNhanVien(ThanhVien nhanVien) {
		this.nhanVien = nhanVien;
	}

	public NhaCC getNhaCC() {
		return nhaCC;
	}

	public void setNhaCC(NhaCC nhaCC) {
		this.nhaCC = nhaCC;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public DauTruyenHDNhap getDauTruyenHDNhap() {
		return dauTruyenHDNhap;
	}

	public void setDauTruyenHDNhap(DauTruyenHDNhap dauTruyenHDNhap) {
		this.dauTruyenHDNhap = dauTruyenHDNhap;
	}
	
	
}
