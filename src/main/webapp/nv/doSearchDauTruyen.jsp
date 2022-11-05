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
		String nameDauTruyen = (String)request.getParameter("nameDauTruyen");
		ArrayList<DauTruyen> listDauTruyen = (ArrayList<DauTruyen>)session.getAttribute("listDauTruyen");
		if(nameDauTruyen == null){
			session.setAttribute("listDauTruyenSearch", listDauTruyen);
		}
		else{
			ArrayList<DauTruyen> listDauTruyenSearch = DauTruyen.getListDauTruyenTheoTen(nameDauTruyen.toUpperCase(), listDauTruyen);
			session.setAttribute("listDauTruyenSearch", listDauTruyenSearch);
			session.setAttribute("booleanSearchDauTruyen", true);
		}
		response.sendRedirect("gdDSDauTruyen.jsp");
	}
%>