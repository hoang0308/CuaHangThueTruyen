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
		if((String)request.getParameter("namXuatBan") == ""){
			response.sendRedirect("gdThemDauTruyen.jsp?err=missValue");
		}
		else{
			// Get thong tin dau truyen trong form
			String tenTruyen = (String)request.getParameter("tenTruyen");
			String tacGia = (String)request.getParameter("tacGia");
			String nhaXuatBan = (String)request.getParameter("nhaXuatBan");
			int namXuatBan = Integer.parseInt(request.getParameter("namXuatBan"));
			String moTa = (String)request.getParameter("moTa");
			
			if(tenTruyen == "" || tacGia == "" || nhaXuatBan == ""){
				response.sendRedirect("gdThemDauTruyen.jsp?err=missValue");
			}
			else{
				// Get list dau truyen
				ArrayList<DauTruyen> listDauTruyen = (ArrayList<DauTruyen>)session.getAttribute("listDauTruyen");
				// Get ma dau truyen tiep theo
				String maNextDauTruyen = DauTruyen.getNextMaDauTruyen(listDauTruyen);
				// Khai bao dau truyen
				DauTruyen dauTruyen = new DauTruyen(maNextDauTruyen, tenTruyen,
						tacGia, nhaXuatBan, namXuatBan, moTa);
				DauTruyenDAO dauTruyenDAO = new DauTruyenDAO();
				// Luu nha cung cap
				if(dauTruyenDAO.luuDauTruyen(dauTruyen)){
					response.sendRedirect("gdHoaDonNhap.jsp?maDauTruyen");
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
	}
	
%>