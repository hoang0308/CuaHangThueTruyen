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
		// Get dau truyen
		DauTruyen dauTruyen;
		try{				
	dauTruyen = (DauTruyen)session.getAttribute("dauTruyen");
		}
		catch (Exception e){
	dauTruyen = null;
		}
		if(dauTruyen != null){
	// Get thong tin truyen nhap trong form
	String inputSoLuong = (String)request.getParameter("soLuong");
	String inputDonGia = (String)request.getParameter("donGia");
	// check null value
	if(inputSoLuong.equals("") || inputDonGia.equals("")){
		response.sendRedirect("gdTruyenNhap.jsp?maDauTruyen=" + dauTruyen.getMa());
	}
	else{				
		// Khai bao truyen nhap
		int soLuong = Integer.parseInt(request.getParameter("soLuong"));
		float donGia = Float.parseFloat(request.getParameter("donGia"));
		DauTruyenHDNhap truyenNhap = new DauTruyenHDNhap(soLuong, donGia, dauTruyen, hoaDonNhap);
		hoaDonNhap.addTruyenNhapToList(truyenNhap);
		session.setAttribute("hoaDonNhap", hoaDonNhap);
		response.sendRedirect("gdHoaDonNhap.jsp");
	}
		}
		else{
	response.sendRedirect("gdDSDauTruyen.jsp");
		}
	}
%>