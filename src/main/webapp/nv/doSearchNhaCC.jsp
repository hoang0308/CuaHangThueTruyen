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
		String nameNhaCC = (String)request.getParameter("nameNhaCC");
		ArrayList<NhaCC> listNhaCC = (ArrayList<NhaCC>)session.getAttribute("listNhaCC");
		if(nameNhaCC == null){
			session.setAttribute("listNhaCCSearch", listNhaCC);
		}
		else{
			ArrayList<NhaCC> listNhaCCSearch = NhaCC.getListNhaCCTheoTen(nameNhaCC.toUpperCase(), listNhaCC);
			session.setAttribute("listNhaCCSearch", listNhaCCSearch);
			session.setAttribute("booleanSearchNhaCC", true);
		}
		response.sendRedirect("gdDSNhaCC.jsp");
	}
%>