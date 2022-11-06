package model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Comparator;

public class HoaDonNhap {
	private String ma;
	private Timestamp ngayThanhToan;
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

	public Timestamp getNgayThanhToan() {
		return ngayThanhToan;
	}

	public void setNgayThanhToan(Timestamp ngayThanhToan) {
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
	
	public void addTruyenNhapToList(DauTruyenHDNhap truyenNhapTemp) {
		this.listTruyenNhap.add(truyenNhapTemp);
	}
	
	public static String getNextMaHoaDonNhap(ArrayList<HoaDonNhap> listHoaDonNhap) {
		int length = listHoaDonNhap.size()-1;
		if (length>=0) {	
			//set ma hoa don nhap tiep theo
			String[] maLastHoaDonNhap = listHoaDonNhap.get(length).getMa().split("_");
			String maHoaDonNhap = maLastHoaDonNhap[0]+ "_" + (Integer.parseInt(maLastHoaDonNhap[1])+1);
			return maHoaDonNhap;
		}
		return "HoaDonNhap_1";
	}
	
}
