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
	
}
