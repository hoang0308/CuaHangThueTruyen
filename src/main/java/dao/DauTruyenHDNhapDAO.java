package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import model.DauTruyenHDNhap;

public class DauTruyenHDNhapDAO extends DAO {
	public boolean luuDauTruyenHDNhap(DauTruyenHDNhap truyenNhap) {
		String sqlThemNhaCC = "INSERT INTO cuahangthuetruyen.tbldautruyenhdnhap (`soLuong`,"
				+ " `donGia`, `tblDauTruyenma`, `tblHoaDonNhapma`, `createAt`, `updateAt`)"
				+ " VALUES (?, ?, ?, ?, ?, ?);";
		try {
			PreparedStatement ps = con.prepareStatement(sqlThemNhaCC);
			ps.setInt(1, truyenNhap.getSoLuong());
			ps.setFloat(2, truyenNhap.getDonGia());
			ps.setString(3, truyenNhap.getDauTruyen().getMa());
			ps.setString(4, truyenNhap.getHoaDonNhap().getMa());
			Timestamp timeCreate = new Timestamp(System.currentTimeMillis());
			ps.setTimestamp(5, timeCreate);
			ps.setTimestamp(6, timeCreate);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	public boolean luuListDauTruyenHDNhap(ArrayList<DauTruyenHDNhap> listTruyenNhap) {
		boolean boolSave;
		for(DauTruyenHDNhap truyenNhap : listTruyenNhap) {
			boolSave = this.luuDauTruyenHDNhap(truyenNhap);
			if(!boolSave) {
				return false;
			}
		}
		return true;
	}
}
