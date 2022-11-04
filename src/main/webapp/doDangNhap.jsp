<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="dao.*, model.*"
%>
<% 
	String username = (String)request.getParameter("username");
	String password = (String)request.getParameter("password");
	ThanhVien thanhVien = new ThanhVien();
	thanhVien.setUsername(username);
	thanhVien.setPassword(password);
	ThanhVienDAO thanhVienDAO = new ThanhVienDAO();
	boolean result = thanhVienDAO.kiemTraDangNhap(thanhVien);
	if(result){
		session.setAttribute("nhanVien", thanhVien);
		response.sendRedirect("nv/gdChinhNV.jsp");
	}else{
		response.sendRedirect("gdDangNhap.jsp?err=fail");
	}
%>