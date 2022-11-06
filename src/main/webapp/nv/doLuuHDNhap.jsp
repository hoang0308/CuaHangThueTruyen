<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="dao.*, model.*"
	import="java.util.ArrayList"
	import="java.sql.Timestamp"
%>
<%
	//Check login
	ThanhVien nhanVien = (ThanhVien)session.getAttribute("nhanVien");
	if(nhanVien == null){
		response.sendRedirect("../gdDangNhap.jsp?err=timeout");
	}
	else{
		// Get hoaDonNhap
		HoaDonNhap hoaDonNhap = (HoaDonNhap)session.getAttribute("hoaDonNhap");
		if(hoaDonNhap == null){
			response.sendRedirect("gdDSNhaCC.jsp");
		}
		else{
			// Get tong tien trong form
			float tongTien = Float.parseFloat(request.getParameter("tongTien"));
			// Get ma hoa don nhap tiep theo
			HoaDonNhapDAO  hoaDonNhapDAO = new HoaDonNhapDAO();
			ArrayList<HoaDonNhap> listHoaDonNhap = hoaDonNhapDAO.getListHDNhap();
			String maHoaDonNhap = HoaDonNhap.getNextMaHoaDonNhap(listHoaDonNhap);
			// Set hoa don
			hoaDonNhap.setMa(maHoaDonNhap);
			hoaDonNhap.setNgayThanhToan(new Timestamp(System.currentTimeMillis()));
			hoaDonNhap.setTongTien(tongTien);
			hoaDonNhap.setNhanVien(nhanVien);
			if(hoaDonNhapDAO.luuHoaDonNhap(hoaDonNhap)){
				session.removeAttribute("hoaDonNhap");
				response.sendRedirect("gdChinhNV.jsp?status=saveSuccess");
			}
			else{		
				%>
					<script type="text/javascript">
						alert("Lỗi đăng kí!");
						history.back();
					</script>
				<%
			}
		}
	}
	
%>