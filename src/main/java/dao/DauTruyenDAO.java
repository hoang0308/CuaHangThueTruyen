package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.DauTruyen;

public class DauTruyenDAO extends DAO {
	private ArrayList<DauTruyen> listDauTruyen;

	public DauTruyenDAO() {
	}
	
	public ArrayList<DauTruyen> getListDauTruyen(){
		listDauTruyen = new ArrayList<DauTruyen>();
		String sql = "SELECT * FROM cuahangthuetruyen.tbldautruyen";
		PreparedStatement ps;
	    try {
	       ps = con.prepareStatement(sql);
	       ResultSet rs= ps.executeQuery(sql);
	       while (rs.next()){
	    	   DauTruyen dauTruyen = new DauTruyen();
		       dauTruyen.setMa(rs.getString("ma"));
		       dauTruyen.setTenTruyen(rs.getString("tentruyen"));
		       dauTruyen.setTacGia(rs.getString("tacgia"));
		       dauTruyen.setSoLuong(rs.getInt("soluong"));
		       dauTruyen.setNhaXuatBan(rs.getString("nhaxuatban"));
		       dauTruyen.setNamXuatBan(rs.getInt("namxuatban"));
		       dauTruyen.setMoTa(rs.getString("mota"));
		       
	    	   listDauTruyen.add(dauTruyen);
	       }
	    } catch (SQLException ex) {
	    	listDauTruyen = null;      
		} 
		return listDauTruyen;
	}
	
	public boolean luuDauTruyen(DauTruyen dauTruyen) {
		String sqlThemNhaCC = "INSERT INTO cuahangthuetruyen.tbldautruyen (`ma`,"
				+ " `tenTruyen`, `tacGia`, `soLuong`, `nhaXuatBan`, `namXuatBan`, `moTa`)"
				+ " VALUES (?, ?, ?, ?, ?, ?, ?);";
		try {
			PreparedStatement ps = con.prepareStatement(sqlThemNhaCC);
			ps.setString(1, dauTruyen.getMa());
			ps.setString(2, dauTruyen.getTenTruyen());
			ps.setString(3, dauTruyen.getTacGia());
			ps.setInt(4, 0);
			ps.setString(5, dauTruyen.getNhaXuatBan());
			ps.setInt(6, dauTruyen.getNamXuatBan());
			ps.setString(7, dauTruyen.getMoTa());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
}
