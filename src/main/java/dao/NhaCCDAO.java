package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.DiaChi;
import model.NhaCC;

public class NhaCCDAO extends DAO {
	private ArrayList<NhaCC> listNhaCC;
	private DiaChiDAO diaChiDAO = new DiaChiDAO();
	public NhaCCDAO() {
	}
	public ArrayList<NhaCC> getListNhaCC() {
		listNhaCC = new ArrayList<NhaCC>();
		String sql = "SELECT * FROM cuahangthuetruyen.tblnhacc";
		PreparedStatement ps;
	    try {
	       ps = con.prepareStatement(sql);
	       ResultSet rs= ps.executeQuery(sql);
	       while (rs.next()){
	    	   NhaCC nhaCC = new NhaCC();
		       nhaCC.setMa(rs.getString("ma"));
		       nhaCC.setTen(rs.getString("ten"));
		       nhaCC.setEmail(rs.getString("email"));
		       nhaCC.setSdt(rs.getString("sdt"));
		       nhaCC.setMoTa(rs.getString("mota"));
		       //dia chi
		       DiaChi diaChi = diaChiDAO.getDiaChiTheoId(rs.getInt("tblDiaChiid"));
		       nhaCC.setDiaChi(diaChi);
		       
		       listNhaCC.add(nhaCC);
	       }
	    } catch (SQLException ex) {
	    	listNhaCC = null;      
		} 
		return listNhaCC;
	}
	
//	public nhaCC getNhaCCByMa(String ma) {
//		NhaCC nhaCC = 
//	}
	
	public boolean luuNhaCC(NhaCC nhaCC) {
		int idDiaChi = diaChiDAO.luuDiaChi(nhaCC.getDiaChi());
		if( idDiaChi < 0) {
			return false;
		}
		else {
			String sqlThemNhaCC = "INSERT INTO cuahangthuetruyen.tblnhacc (`ma`,"
					+ " `ten`, `email`, `sdt`, `tblDiaChiid`, `moTa`)"
					+ " VALUES (?, ?, ?, ?, ?, ?);";
			try {
				PreparedStatement ps = con.prepareStatement(sqlThemNhaCC);
				ps.setString(1, nhaCC.getMa());
				ps.setString(2, nhaCC.getTen());
				ps.setString(3, nhaCC.getEmail());
				ps.setString(4, nhaCC.getSdt());
				ps.setInt(5, idDiaChi);
				ps.setString(6, nhaCC.getMoTa());
				ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}
		
		return true;
	}
}
