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
		// Get hoa don nhap
		HoaDonNhap hoaDonNhap = (HoaDonNhap)session.getAttribute("hoaDonNhap");
		// Get thong tin truyen nhap trong form
		String inputSoLuong = (String)request.getParameter("soLuong");
		String inputDonGia = (String)request.getParameter("donGia");
		// check null value
		if(inputSoLuong == null || inputDonGia == null){
			response.sendRedirect("gdTruyenNhap.jsp?err=missValue");
		}
		else{
			// Get dau truyen
			DauTruyen dauTruyen;
			try{				
				dauTruyen = (DauTruyen)session.getAttribute("dauTruyen");
			}
			catch (Exception e){
				dauTruyen = null;
			}
			if(dauTruyen != null){
				// Khai bao truyen muon
				int soLuong = Integer.parseInt(request.getParameter("soLuong"));
				float donGia = Float.parseFloat(request.getParameter("donGia"));
				DauTruyenHDNhap truyenNhap = new DauTruyenHDNhap(soLuong, donGia, dauTruyen, hoaDonNhap);
				hoaDonNhap.addTruyenNhapToList(truyenNhap);
				session.setAttribute("hoaDonNhap", hoaDonNhap);
				response.sendRedirect("gdHoaDonNhap.jsp");
			}
			else{
				response.sendRedirect("gdDSDauTruyen.jsp");
			}
		}
	}
	
%>