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
	<script 
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" 
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" 
		crossorigin="anonymous"
	>
	</script>
	<script 
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" 
		crossorigin="anonymous"
	>
	</script>
</head>
<body>
	<%
		ThanhVien nhanVien = (ThanhVien)session.getAttribute("nhanVien");
		if(nhanVien == null){
			response.sendRedirect("../gdDangNhap.jsp?err=timeout");
		}
		else{
	%>
		<jsp:include page='../layout/header.jsp'>
		    <jsp:param name="nameNhanVien" value="<%= nhanVien.getHoTen() %>"/>
		</jsp:include>
	<%
			String status = request.getParameter("status");
			if(status != null){
				if(status.equals("saveSuccess")){	
	%> 
		<div class="alert alert-success text-center" role="alert">
			Tạo mới hóa đơn thành công
		</div>
	<%
				}
			}
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