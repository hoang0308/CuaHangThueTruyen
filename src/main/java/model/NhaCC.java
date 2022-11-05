package model;

import java.util.ArrayList;

public class NhaCC {
	private String ma, ten, email, sdt, moTa;
	private DiaChi diaChi;
	
	public NhaCC() {
	}
	

	public NhaCC(String ma, String ten, String email, String sdt, String moTa, DiaChi diaChi) {
		this.ma = ma;
		this.ten = ten;
		this.email = email;
		this.sdt = sdt;
		this.moTa = moTa;
		this.diaChi = diaChi;
	}


	public String getMa() {
		return ma;
	}

	public void setMa(String ma) {
		this.ma = ma;
	}
	
	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public String getMoTa() {
		if(moTa == null) {
			return "";
		}
		return moTa;	
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public DiaChi getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(DiaChi diaChi) {
		this.diaChi = diaChi;
	}
	
	public static ArrayList<NhaCC> getListNhaCCTheoTen(String nameNhaCC, ArrayList<NhaCC> listNhaCC){
		ArrayList<NhaCC> listNhaCCSearch = new ArrayList<>();
		for(NhaCC nhaCC : listNhaCC) {
			if(nhaCC.getTen().toUpperCase().contains(nameNhaCC)) {
				listNhaCCSearch.add(nhaCC);
			}
		}
		return listNhaCCSearch;
	}
	
	public static String getNextMaNhaCC(ArrayList<NhaCC> listNhaCC) {
		int length = listNhaCC.size()-1;
		if (length>=0) {	
			//set ma nhacc tiep theo
			String[] maLastNhaCC = listNhaCC.get(length).getMa().split("_");
			String maNhaCC = maLastNhaCC[0]+ "_" + (Integer.parseInt(maLastNhaCC[1])+1);
			return maNhaCC;
		}
		return "NhaCC_1";
	}
	
	public static NhaCC getNhaCCTheoMa(String maNhaCC, ArrayList<NhaCC> listNhaCC){
		NhaCC nhaCC = new NhaCC();
		for(NhaCC nhaCCTemp : listNhaCC) {
			if(nhaCCTemp.getMa().equals(maNhaCC)) {
				nhaCC = nhaCCTemp;
				break;
			}
		}
		return nhaCC;
	}
	
}
