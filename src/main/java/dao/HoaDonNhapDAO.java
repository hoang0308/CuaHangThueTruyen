package dao;

import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import model.DauTruyenHDNhap;
import model.DiaChi;
import model.HoaDonNhap;
import model.NhaCC;

public class HoaDonNhapDAO extends DAO {
	public ArrayList<HoaDonNhap> getListHDNhap(){
		ArrayList<HoaDonNhap> listHDNhap = new ArrayList<>();
		String sql = "SELECT * FROM cuahangthuetruyen.tblhoadonnhap\n"
				+ "ORDER BY createAt";
		System.out.println(sql);
		PreparedStatement ps;
	    try {
	       ps = con.prepareStatement(sql);
	       ResultSet rs= ps.executeQuery(sql);
	       while (rs.next()){
	    	   HoaDonNhap hoaDonNhap = new HoaDonNhap();
	    	   hoaDonNhap.setMa(rs.getString("ma"));
		       
	    	   listHDNhap.add(hoaDonNhap);
	       }
	    } catch (SQLException ex) {
	    	listHDNhap = null;      
		} 
		return listHDNhap;
	}
	
	public boolean luuHoaDonNhap(HoaDonNhap hoaDonNhap) {
		//luu hoa don nhap
		String sqlThemNhaCC = "INSERT INTO cuahangthuetruyen.tblhoadonnhap (`ma`, `ngayThanhToan`,"
				+ " `tongTien`, `nhanVienNhapHDid`, `nhaCCma`, `moTa`, `createAt`, `updateAt`)"
				+ " VALUES ( ?, ?, ?, ?, ?, ?, ?, ?);";
		try {
			PreparedStatement ps = con.prepareStatement(sqlThemNhaCC);
			ps.setString(1, hoaDonNhap.getMa());
			ps.setTimestamp(2, hoaDonNhap.getNgayThanhToan());
			ps.setFloat(3, hoaDonNhap.getTongTien());
			ps.setInt(4, hoaDonNhap.getNhanVien().getId());
			ps.setString(5, hoaDonNhap.getNhaCC().getMa());
			ps.setString(6, hoaDonNhap.getMoTa());
			Timestamp timeCreate = new Timestamp(System.currentTimeMillis());
			ps.setTimestamp(7, timeCreate);
			ps.setTimestamp(8, timeCreate);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		ArrayList<DauTruyenHDNhap> listTruyenNhap = hoaDonNhap.getListTruyenNhap();
		
		return true;
	}
}
