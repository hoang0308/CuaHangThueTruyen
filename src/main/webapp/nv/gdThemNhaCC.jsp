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
    <title>THÊM MỚI NHÀ CUNG CẤP</title>
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
        <h1 class="d-flex justify-content-center mt-5">THÊM MỚI NHÀ CUNG CẤP</h1>
        <div class="justify-content-center mt-5">
            <div class="justify-content-center container w-75 border rounded-3 px-5 py-4">
	            <form name="luuNhaCC" action="doLuuNhaCC.jsp" method="post">
	                <div class="mb-3 row mt-3">
	                    <div class="mb-3 row justify-content-center">
	                        <label for="exampleFormControlInput1" class="form-label col-sm-3">Tên</label>
	                        <div class="col-sm-6">
	                            <input 
	                                type="text" 
	                                name="nameNhaCC"
	                                class="form-control-plaintext border px-3 rounded-3"  
	                                placeholder="Nhập tên của nhà cung cấp"
	                            >
	                        </div>
	                    </div>
	                    <div class="mb-3 row justify-content-center">
	                        <label for="exampleFormControlInput1" class="form-label col-sm-3">Địa chỉ</label>
	                        <div class="col-sm-6">
		                       	<div class="form-row">
		                       		<div class="d-flex row mb-3">
								    	<div class="form-group col">
										    <label for="">Số nhà</label>
										    <input 
										    	type="text"
										    	name="diaChi_soNha"
										    	class="form-control"
										    	placeholder="Nhập số nhà"
										    >
							    		</div>
							    		<div class="col-md-1"></div>
									    <div class="form-group col">
											<label for="">Toà nhà</label>
										   	<input 
										   		type="text"
										   		name="diaChi_toaNha"
										   		class="form-control"
									   			placeholder="Nhập tên tòa nhà"
										   	>
									    </div>
		                       		</div>
		                       		<div class="d-flex row mb-3">
									    <div class="form-group col">
										    <label for="">Xóm/Phố</label>
										    <input
										    	type="text"
										    	name="diaChi_xomPho"
										    	class="form-control" 
										    	placeholder="Nhập tên xóm/phố"
										    >
									    </div>
									    <div class="col-md-1"></div>
									    <div class="form-group col">
										    <label for="">Phường/Xã</label>
										    <input 
										    	type="text"
										    	name="diaChi_phuongXa"
										    	class="form-control"
										    	placeholder="Nhập tên phường/xã"
										    >
									    </div>
								    </div>
									<div class="d-flex row mb-3">
									    <div class="form-group col">
										    <label for="">Quận/Huyện</label>
										    <input 
											    type=""
											    name="diaChi_quanHuyen"
											    class="form-control" 
											    placeholder="Nhập tên quận/huyện"
										    >
									    </div>
									    <div class="col-md-1"></div>
									    <div class="form-group col">
										    <label for="inputZip">Tỉnh/Thành phố</label>
										    <input 
											    type="text"
											    name="diaChi_tinhThanh"
											    class="form-control" 
											    placeholder="Nhập tên tỉnh/thành"
										    >
									    </div>
									</div>
							 	</div>
	                        </div>
	                    </div>
	                    <div class="mb-3 row justify-content-center">
	                        <label for="exampleFormControlTextarea1" class="form-label col-sm-3">Email</label>
	                        <div class="col-sm-6">
	                            <input 
	                                type="text" 
	                                name="emailNhaCC" 
	                                class="form-control-plaintext border px-3 rounded-3" 
	                                placeholder="Nhập email của nhà cung cấp"
	                           	>
	                        </div>
	                    </div>
	                    <div class="mb-3 row justify-content-center">
	                        <label for="exampleFormControlTextarea1" class="form-label col-sm-3">SĐT</label>
	                        <div class="col-sm-6">
	                            <input 
	                                type="text" 
	                                name="sdtNhaCC" 
	                                class="form-control-plaintext border px-3 rounded-3" 
	                                placeholder="Nhập số điện thoại của nhà cung cấp">
	                        </div>
	                    </div>
	                    <div class="row justify-content-center">
	                        <label for="exampleFormControlTextarea1" class="form-label col-sm-3">Mô tả</label>
	                        <div class="col-sm-6">
	                            <input 
	                                type="text" 
	                                name="moTaNhaCC" 
	                                class="form-control-plaintext border px-3 rounded-3" 
	                                placeholder="Nhập mô tả nhà cung cấp">
	                        </div>
	                    </div>
	                </div>
			        <div class="d-flex justify-content-center mt-5">
			            <div class="col-2">
			                <input 
							type="submit" 
							class="btn border w-100"
							value="Tiếp tục" 
						/>
			            </div>
			            <div class="col-4"></div>
			            <div class="col-2">
			            	<a
			            		class="btn border w-100"
			            		href="gdDSNhaCC.jsp"
			            	>
			            		Trở lại
			            	</a>
			            </div>
			        </div>
	            </form>
            </div>
        </div>
    </div>
</body>
</html>