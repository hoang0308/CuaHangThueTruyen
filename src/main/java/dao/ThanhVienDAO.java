package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.HoTen;
import model.ThanhVien;

public class ThanhVienDAO extends DAO {
	public ThanhVienDAO() {
		super();
	}
	public boolean kiemTraDangNhap(ThanhVien thanhVien) {
		boolean result = false;
		if(thanhVien.getUsername().contains("true") ||
				thanhVien.getUsername().contains("=")||
				thanhVien.getPassword().contains("true") ||
				thanhVien.getPassword().contains("=")) return false;

		String sql = "SELECT * FROM cuahangthuetruyen.tblthanhvien\n"
				+ "WHERE username = \"" + thanhVien.getUsername() + "\"\n"
				+ "AND password = \""+ thanhVien.getPassword() + "\"";
		try{
			PreparedStatement ps = con.prepareCall(sql);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
			thanhVien.setId(rs.getInt("id"));
			thanhVien.setVaiTro(rs.getString("vaitro"));
			//hoten
			HoTen hoTen = new HoTen();
			hoTen.setHo(rs.getString("ho"));
			hoTen.setTenDem(rs.getString("tendem"));
			hoTen.setTen(rs.getString("ten"));
			thanhVien.setHoTen(hoTen);
			result = true;
			}
		}catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}
}
