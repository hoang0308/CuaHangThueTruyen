package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import model.DiaChi;

public class DiaChiDAO extends DAO {
	public DiaChiDAO() {
//		super();
	}
	public DiaChi getDiaChiTheoId(int id) {
		DiaChi diaChi = new DiaChi();
        String sql = "SELECT * FROM cuahangthuetruyen.tbldiachi\n" +
                     "WHERE id =" + id + ";";
        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql);
            ResultSet rs= ps.executeQuery(sql);
            while (rs.next()){
            	diaChi.setId(id);
            	diaChi.setSoNha(rs.getString("soNha"));
            	diaChi.setToaNha(rs.getString("toanha"));
            	diaChi.setXomPho(rs.getString("xomPho"));
                diaChi.setPhuongXa(rs.getString("phuongxa"));
                diaChi.setQuanHuyen(rs.getString("quanhuyen"));
                diaChi.setTinhThanh(rs.getString("tinhthanh"));
                diaChi.setMoTa(rs.getString("mota"));  
            }
        } catch (SQLException ex) {
            diaChi = null;      
        } 
        return diaChi;
	}
	public int luuDiaChi(DiaChi diaChi) {
		if (diaChi == null) {
			return -1;
		}
		String sqlThemDiaChi = "INSERT INTO cuahangthuetruyen.tbldiachi (`soNha`,"
				+ " `toaNha`, `xomPho`, `phuongXa`, `quanHuyen`, `tinhThanh`, `createAt`, `updateAt`)"
				+ " VALUES ( ?, ?, ?, ?, ?, ?, ?, ?);";
		try {
			PreparedStatement ps = con.prepareStatement(sqlThemDiaChi,Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, diaChi.getSoNha());
			ps.setString(2, diaChi.getToaNha());
			ps.setString(3, diaChi.getXomPho());
			ps.setString(4, diaChi.getPhuongXa());
			ps.setString(5, diaChi.getQuanHuyen());
			ps.setString(6, diaChi.getTinhThanh());
			Timestamp timeCreate = new Timestamp(System.currentTimeMillis());
			ps.setTimestamp(7, timeCreate);
			ps.setTimestamp(8, timeCreate);
			ps.executeUpdate();
			ResultSet generatedKeysResultSet = ps.getGeneratedKeys();
			if (generatedKeysResultSet.next()) {
				return generatedKeysResultSet.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
		return -1;
	}
	public boolean xoaDiaChiTheoId(int id) {
		String sql = "DELETE FROM cuahangthuetruyen.tbldiachi WHERE id = ?";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
}
