package model;

import java.sql.Date;
import java.util.ArrayList;

public class HoaDonNhap {
	private String ma;
	private Date ngayThanhToan;
	private float tongTien;
	private ThanhVien nhanVien;
	private NhaCC nhaCC;
	private ArrayList<DauTruyenHDNhap> listTruyenNhap = new ArrayList<>();
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

	public ArrayList<DauTruyenHDNhap> getListTruyenNhap() {
		return listTruyenNhap;
	}

	public void setListTruyenNhap(ArrayList<DauTruyenHDNhap> listTruyenNhap) {
		this.listTruyenNhap = listTruyenNhap;
	}
	
	public void addTruyenNhapToList(DauTruyenHDNhap truyenNhap) {
		this.listTruyenNhap.add(truyenNhap);
	}
	
}
