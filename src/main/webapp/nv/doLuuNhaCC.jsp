<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="dao.*, model.*"
	import="java.util.ArrayList"
%>
<%
	//Check login
	ThanhVien nhanVien = (ThanhVien)session.getAttribute("nhanVien");
	if(nhanVien == null){
		response.sendRedirect("../gdDangNhap.jsp?err=timeout");
	}
	else{
		// Get list nha cung cap
		ArrayList<NhaCC> listNhaCC = (ArrayList<NhaCC>)session.getAttribute("listNhaCC");
		// Get ma dau truyen tiep theo
		String maNextNhaCC = NhaCC.getNextMaNhaCC(listNhaCC);
		// Get thong tin nha cung cap trong form
		String nameNhaCC = (String)request.getParameter("nameNhaCC");
		String emailNhaCC = (String)request.getParameter("emailNhaCC");
		String sdtNhaCC = (String)request.getParameter("sdtNhaCC");
		String moTaNhaCC = (String)request.getParameter("moTaNhaCC");
		String diaChiSoNha = (String)request.getParameter("diaChi_soNha");
		String diaChiToaNha = (String)request.getParameter("diaChi_toaNha");
		String diaChiXomPho = (String)request.getParameter("diaChi_xomPho");
		String diaChiPhuongXa = (String)request.getParameter("diaChi_phuongXa");
		String diaChiQuanHuyen = (String)request.getParameter("diaChi_quanHuyen");
		String diaChiTinhThanh = (String)request.getParameter("diaChi_tinhThanh");
		// check null value
		if(nameNhaCC.equals("") || emailNhaCC.equals("") || sdtNhaCC.equals("")
			|| diaChiXomPho.equals("") || diaChiXomPho.equals("")
			|| diaChiQuanHuyen.equals("") || diaChiTinhThanh.equals("")){
			response.sendRedirect("gdThemNhaCC.jsp");
		}
		else{
			
			// Khai bao dia chi nha cung cap
			DiaChi diaChiNhaCC = new DiaChi(diaChiSoNha, diaChiToaNha, diaChiXomPho,
										diaChiPhuongXa, diaChiQuanHuyen, diaChiTinhThanh);
			// Khai bao nha cung cap
			NhaCC nhaCC = new NhaCC( maNextNhaCC, nameNhaCC,
										emailNhaCC, sdtNhaCC,
										moTaNhaCC, diaChiNhaCC);
			NhaCCDAO nhaCCDAO = new NhaCCDAO();
			// Luu nha cung cap
			if(nhaCCDAO.luuNhaCC(nhaCC)){
				listNhaCC.add(nhaCC);
				session.setAttribute("listNhaCC" , listNhaCC);
				response.sendRedirect("gdHoaDonNhap.jsp?maNhaCC=" + nhaCC.getMa());
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