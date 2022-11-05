<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="dao.*, model.*"
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TRANG CHỦ NHÂN VIÊN</title>
	<link 
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
		crossorigin="anonymous"
	>
</head>
<body>
	<%
		ThanhVien nhanVien = (ThanhVien)session.getAttribute("nhanVien");
		if(nhanVien == null){
			response.sendRedirect("../gdDangNhap.jsp?err=timeout");
		}
		else{
	%>
		<div class="w-100 ">
	        <h1 class="d-flex justify-content-center mt-5">TRANG CHỦ NHÂN VIÊN</h1>
	        <div class="d-flex justify-content-center mt-5">
	            <ul class="list-unstyled">
	                <li class="mt-4">
	                	<a 
	                		class="btn btn-light border "
	                		href="gdDSNhaCC.jsp"
	                	>
	                		Nhập truyện
	                	</a>
	                </li>
	            </ul>
	        </div>
	    </div>
    <%
		}
    %>
</body>
</html>