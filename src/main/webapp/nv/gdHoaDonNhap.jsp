<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="dao.*, model.*"
	import="java.util.ArrayList"
	import="java.sql.Timestamp"
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HÓA ĐƠN NHẬP TRUYỆN CHI TIẾT</title>
    <link 
    	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
    	rel="stylesheet" 
    	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
    	crossorigin="anonymous"
    >
    <script 
    	type="text/javascript" 
    	src="${pageContext.request.contextPath}/javascript/gdHoaDonNhap.js"
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
			String maNhaCC = request.getParameter("maNhaCC");
			String message = request.getParameter("message");
			
			HoaDonNhap hoaDonNhap;
			if(maNhaCC != null){
				hoaDonNhap = new HoaDonNhap();
				ArrayList<NhaCC> listNhaCC = (ArrayList<NhaCC>)session.getAttribute("listNhaCC");
				NhaCC nhaCC = NhaCC.getNhaCCTheoMa(maNhaCC, listNhaCC);
				hoaDonNhap.setNhaCC(nhaCC);
			}
			else{
				hoaDonNhap = (HoaDonNhap)session.getAttribute("hoaDonNhap");
			}
			if(hoaDonNhap == null){
				response.sendRedirect("gdDSNhaCC.jsp");
			}
			else{
	%>
		<div class="w-100 ">
	        <h1 class="d-flex justify-content-center mt-5">HÓA ĐƠN NHẬP TRUYỆN CHI TIẾT</h1>
			<div class="justify-content-center container w-75 border rounded-3 px-5 py-4 mt-5">
				<form id="form-hoaDonNhap" name="luuHDNhap" action="doLuuHDNhap.jsp" method="post">
					<div class="mb-3 row">
						<label for="staticEmail" class="col-sm-4 col-form-label">Nhà cung cấp :</label>
						<div class="col-sm-6">
							<input 
							type="text" 
							readonly 
							class="form-control-plaintext border px-3 rounded-3" 
							value="<%=hoaDonNhap.getNhaCC().getTen()%>"
							>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="staticEmail" class="col-sm-4 col-form-label">Địa chỉ :</label>
						<div class="col-sm-6">
							<input 
							type="text" 
							readonly 
							class="form-control-plaintext border px-3 rounded-3" 
							value="<%=hoaDonNhap.getNhaCC().getDiaChi().toString()%>"
							>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="staticEmail" class="col-sm-4 col-form-label">Nhân viên thanh toán :</label>
						<div class="col-sm-6">
							<input 
							type="text" 
							readonly 
							class="form-control-plaintext border px-3 rounded-3" 
							value="<%=nhanVien.getHoTen().toString()%>"
							>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="staticEmail" class="col-sm-4 col-form-label">Danh sách đầu truyện nhập : </label>
						<div class="d-flex justify-content-center">
							<table class="table w-75 table-bordered mt-2">
								<thead class="">
									<tr class=""> 
									<th scope="col">Mã</th>
									<th scope="col">Tên</th>
									<th scope="col">Đơn giá</th>
									<th scope="col">Số lượng</th>
									<th scope="col">Thành tiền</th>
									</tr>
								</thead>
								<tbody>
									<%
										ArrayList<DauTruyenHDNhap> listTruyenNhap = hoaDonNhap.getListTruyenNhap();
										if(listTruyenNhap != null){ 
											for(DauTruyenHDNhap truyenNhap : listTruyenNhap){
												float donGia = truyenNhap.getDonGia();
												int soLuong = truyenNhap.getSoLuong();
									%>
										<tr class="js-DauTruyen">
											<th scope="row">
												<%= truyenNhap.getDauTruyen().getMa() %>
											</th>
											<td>
												<%= truyenNhap.getDauTruyen().getTenTruyen() %>
											</td>
											<td>
												<%= donGia %>
											</td>
											<td>
												<%= soLuong %>
											</td>
											<td 
												class="js-thanhTien"
												data-thanhTien = "<%= donGia * soLuong %>"
											>
												<%=  
													String.format("%.2f", donGia * soLuong)
												%>
											</td>
										</tr>
									<% 
											}
										}
									%>
									<tr>
										<th scope="row" colspan="4">Tổng số tiền :</th>
										<td 
											colspan="2"
										>
											<input 
												type="number"
												name="tongTien"
												class="js-tongTien border-0 bg-white form-control"
												readonly="readonly"
												value = "0.00"
											/>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="d-flex justify-content-center mt-5 mb-5">
						<div class="col-2">
							<input
								class="btn border w-100 js-submit"
								type="button"
								value="In hóa đơn"
							/>			
						</div>
						<div class="col-2"></div>
						<div class="col-2">
							<a
								class="btn border w-100"
								href="gdDSDauTruyen.jsp"
							>
								Thêm đầu truyện nhập
							</a>
						</div>
						<div class="col-2"></div>
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
    <%	
			}
			session.setAttribute("hoaDonNhap", hoaDonNhap);
		}
    %>
</body>
</html>