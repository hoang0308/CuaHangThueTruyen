<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="dao.*, model.*"
	import="java.util.ArrayList"
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>THÔNG TIN TRUYỆN NHẬP</title>
    <link 
    	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
    	rel="stylesheet" 
    	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
    	crossorigin="anonymous"
    >
    <script 
    	type="text/javascript" 
    	src="${pageContext.request.contextPath}/javascript/gdTruyenNhap.js"
    ></script>
</head>
<body>
	<%
		//Check login
		ThanhVien nhanVien = (ThanhVien)session.getAttribute("nhanVien");
		if(nhanVien == null){
			response.sendRedirect("../gdDangNhap.jsp?err=timeout");
		}
		else{
			String status = request.getParameter("status");
			String maDauTruyen = request.getParameter("maDauTruyen");
			if(maDauTruyen != null && status != null){
				if(status.equals("saveSuccess")){	
	%> 
		<div class="alert alert-success text-center" role="alert">
			Tạo mới đầu truyện thành công
		</div>
	<%
				}
			}
			HoaDonNhap hoaDonNhap = (HoaDonNhap)session.getAttribute("hoaDonNhap");
			DauTruyenHDNhapDAO dauTruyenHDNhap = new DauTruyenHDNhapDAO();
			DauTruyen dauTruyen = new DauTruyen();
			if(maDauTruyen != null){
				ArrayList<DauTruyen> listDauTruyen = 
						(ArrayList<DauTruyen>)session.getAttribute("listDauTruyen");
				dauTruyen = DauTruyen.getDauTruyenTheoMa(maDauTruyen, listDauTruyen);
				if(hoaDonNhap == null){
					response.sendRedirect("gdDSNhaCC.jsp");
				}
				else{
					session.setAttribute("dauTruyen", dauTruyen);
				}
			}
			else{
				response.sendRedirect("gdDSDauTruyen.jsp");
			}
	%>
	    <div class="w-100 ">
	        <h1 class="d-flex justify-content-center mt-5">THÔNG TIN TRUYỆN NHẬP</h1>
            <div class="justify-content-center container w-75 border rounded-3 px-5 py-4 mt-5">
            	<form name="taoTruyenNhap" action="doTaoTruyenNhap.jsp" method="post">
	                <div class="mb-3 row mt-3">
	                    <div class="mb-3 row justify-content-center">
	                        <label 
	                        	for="exampleFormControlInput1" 
	                        	class="form-label col-sm-3"
	                        >
                        		Tên đầu truyện
                        	</label>
	                        <div class="col-sm-6">
	                            <input 
	                                type="text" 
	                                readonly 
	                                class="form-control-plaintext border px-3 rounded-3" 
	                                value="<%= dauTruyen.getTenTruyen() %>"
	                            >
	                        </div>
	                    </div>
	                    <div class="mb-3 row justify-content-center">
	                        <label for="exampleFormControlInput1" 
	                        	class="form-label col-sm-3"
	                        >
	                        	Số lượng
                        	</label>
	                        <div class="col-sm-6">
	                            <input 
	                                type="number" 
	                                name="soLuong"
	                                min="1"
	                               	required
	                                class="form-control-plaintext border px-3 rounded-3 js-soLuong" 
	                                placeholder="Nhập số lượng của đầu truyện"
	                                value="0"
	                            >
	                        </div>
	                    </div>
	                    <div class="mb-3 row justify-content-center">
	                        <label 
	                        	for="exampleFormControlTextarea1" 
	                        	class="form-label col-sm-3"
	                        >
	                        	Đơn giá
	                        </label>
	                        <div class="col-sm-6">
	                            <input 
	                                type="number" 
	                                name="donGia"
	                                min="0.01"
	                                step="0.01"
	                                required
	                                class="form-control-plaintext border px-3 rounded-3 js-donGia" 
	                                placeholder="Nhập đơn giá của đầu truyện"
	                                value="0.00"  
	                           	>
	                        </div>
	                    </div>
	                    <div class="mb-3 row justify-content-center">
	                        <label 
	                        	for="exampleFormControlTextarea1" 
	                        	class="form-label col-sm-3"
	                        >
	                        	Thành tiền
	                        </label>
	                        <div class="col-sm-6">
	                            <input 
	                                type="number" 
	                                readonly 
	                                class="form-control-plaintext border px-3 rounded-3 js-thanhTien" 
	                                value="0.00"
	                            >
	                        </div>
	                    </div>
	                </div>
			        <div class="d-flex justify-content-center mt-5">
			            <div class="col-2">
		                	<input 
								type="submit" 
								class="btn border w-100"
								value="Xác nhận" 
							/>
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
	        	</form>
            </div>
	    </div>
    <%	
		}
    %>
</body>
</html>