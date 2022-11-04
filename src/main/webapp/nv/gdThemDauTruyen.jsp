<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="dao.*, model.*"
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>THÊM MỚI ĐẦU TRUYỆN</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<%
		//Check login
		ThanhVien nhanVien = (ThanhVien)session.getAttribute("nhanVien");
		if(nhanVien == null){
			response.sendRedirect("../gdDangNhap.jsp?err=timeout");
		}
	%>
    <div class="w-100 ">
        <h1 class="d-flex justify-content-center mt-5">THÊM MỚI ĐẦU TRUYỆN</h1>
        <div class="justify-content-center mt-5">
            <div class="justify-content-center container w-75 border rounded-3 px-5 py-4">
           	 	<form name="luuDauTruyen" action="doLuuDauTruyen.jsp" method="post">
	                <div class="mb-3 row mt-3">
	                    <div class="mb-3 row justify-content-center">
	                        <label for="exampleFormControlInput1" class="form-label col-sm-3">Tên</label>
	                        <div class="col-sm-6">
	                            <input 
	                                type="text" 
	                                readonly class="form-control-plaintext border px-3 rounded-3" 
	                                value="" 
	                                placeholder="Nhập tên của đầu truyện"
	                            >
	                        </div>
	                    </div>
	                    <div class="mb-3 row justify-content-center">
	                        <label for="exampleFormControlTextarea1" class="form-label col-sm-3">Tác giả</label>
	                        <div class="col-sm-6">
	                            <input 
	                                type="text" 
	                                readonly 
	                                class="form-control-plaintext border px-3 rounded-3" 
	                                value="" 
	                                placeholder="Nhập tác giả của đầu truyện">
	                        </div>
	                    </div>
	                    <div class="mb-3 row justify-content-center">
	                        <label for="exampleFormControlTextarea1" class="form-label col-sm-3">Nhà xuất bản</label>
	                        <div class="col-sm-6">
	                            <input 
	                                type="text" 
	                                readonly 
	                                class="form-control-plaintext border px-3 rounded-3" 
	                                value="" 
	                                placeholder="Nhập nhà xuất bản của đầu truyện">
	                        </div>
	                    </div>
	                    <div class="mb-3 row justify-content-center">
	                        <label for="exampleFormControlTextarea1" class="form-label col-sm-3">Năm xuất bản</label>
	                        <div class="col-sm-6">
	                            <input 
	                                type="text" 
	                                readonly 
	                                class="form-control-plaintext border px-3 rounded-3" 
	                                value="" 
	                                placeholder="Nhập năm xuất của bản đầu truyện">
	                        </div>
	                    </div>
	                </div>
	        	</form>
            </div>
        </div>
        <div class="d-flex justify-content-center mt-5">
            <div class="col-2">
                <button class="btn border w-100">Tiếp tục</button>
            </div>
            <div class="col-4"></div>
            <div class="col-2">
                <a
            		class="btn border w-100"
            		href="gdDSDauTruyen.jsp"
            	>
            		Trở lại
            	</a>
            </div>
        </div>
    </div>
</body>
</html>