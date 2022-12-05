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
    <title>DANH SÁCH ĐẦU TRUYỆN</title>
    <link 
    	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
    	rel="stylesheet" 
    	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
    	crossorigin="anonymous"
    >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/index.css">
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/gdDSDauTruyen.js"></script>
</head>
<body>
	<%
		//Check login
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
			// Get list dau truyen
			ArrayList<DauTruyen> listDauTruyenShow;
			ArrayList<DauTruyen> listDauTruyen;
			boolean booleanSearchDauTruyen;
			try{			
				booleanSearchDauTruyen = (boolean)session.getAttribute("booleanSearchDauTruyen");
			}
			catch(Exception e){
				booleanSearchDauTruyen = false;
			}
			//Nếu search thì sẽ lấy listNhaCC từ session, nếu không phải search thì sẽ lấy listNhaCC từ DB
			if(booleanSearchDauTruyen){
				//Nếu là search thì show listNhaCCSearch
				listDauTruyen = (ArrayList<DauTruyen>)session.getAttribute("listDauTruyen");
				listDauTruyenShow = (ArrayList<DauTruyen>)session.getAttribute("listDauTruyenSearch");
			}
			else{
				//Nếu không là search thì show listNhaCC lấy từ DB
				DauTruyenDAO dauTruyenDAO = new DauTruyenDAO();
				listDauTruyen = dauTruyenDAO.getListDauTruyen();
				listDauTruyenShow = listDauTruyen;
			}
			session.setAttribute("listDauTruyen", listDauTruyen);
			session.removeAttribute("booleanSearchDauTruyen");
			session.setAttribute("boolAddTruyenNhap", true);
	%>
	    <div class="w-100 ">
	        <h1 class="d-flex justify-content-center mt-5">DANH SÁCH ĐẦU TRUYỆN</h1>
	        <form name="searchDauTruyen" action="doSearchDauTruyen.jsp" method="post">
				<div class="d-flex justify-content-center mt-5">
					<div class="col-6">
						<input 
							type="text" 
							class="form-control" 
							name="nameDauTruyen" 
							placeholder="Tên đầu truyện"
						>
					</div>
					<div class="col-1"></div>
					<div class="col-2">
						<input 
							type="submit" 
							class="btn btn-light border w-100"
							value="Tìm" 
						/>
					</div>
				</div>
			</form>
	        <div class="d-flex justify-content-center mt-5">
	            <table class="table w-75 table-bordered">
	                <thead class="">
	                  <tr class=""> 
	                    <th scope="col">Mã</th>
	                    <th scope="col">Tên</th>
	                    <th scope="col">Tác giả</th>
	                    <th scope="col">Số lượng</th>
	                    <th scope="col">Nhà xuất bản</th>
	                    <th scope="col">Năm xuất bản</th>
	                    <th scope="col">Mô tả</th>
	                    <th scope="col">Chọn</th>
	                  </tr>
	                </thead>
	                <tbody>
	               	<%
	               		if(listDauTruyen != null){
	               			int listLength =  listDauTruyen.size();
	               			for(DauTruyen dauTruyen : listDauTruyenShow) {
	               	%>
		               	<tr data-row-ma="<%= dauTruyen.getMa() %>">
			                <th>
			                	<%= dauTruyen.getMa() %>
			                </th>
			                <td>
			                	<%= dauTruyen.getTenTruyen() %>
			                </td>
			                <td>
			                	<%= dauTruyen.getTacGia() %>
			                </td>
			                <td>
			                	<%= dauTruyen.getSoLuong() %>
			                </td>
			                <td>
			                	<%= dauTruyen.getNhaXuatBan() %>
			                </td>
			                <td>
			                	<%= dauTruyen.getNamXuatBan() %>
			                </td>
			                <td>
			                	<%= dauTruyen.getMoTa() %>
			                </td>
			                <td>
								<button
									class="btn border w-100 js-button-select"
								>
									Chọn
								</button>
							</td>
		                </tr>
	            	<%
	            			}
						}
	            	%>
	                </tbody>
	            </table>
	        </div>
	        <div class="d-flex justify-content-center mt-5">
	            <div class="col-2">
	            	<button 
	            		class="btn border w-100 js-tiep-tuc"
	            	>
	            		Tiếp tục
	            	</button>
	            </div>
	            <div class="col-1"></div>
	            <div class="col-2">
	            	<a 
	            		class="btn border w-100"
	            		href="gdThemDauTruyen.jsp"
	            	>
	            		Thêm mới đầu truyện
	            	</a>
	            </div>
	            <div class="col-1"></div>
	            <div class="col-2">
	            	<a 
	            		class="btn border w-100"
	            		href="gdHoaDonNhap.jsp"
	            	>
	            		Trở lại
	            	</a>
	            </div>
	        </div>
	    </div>
    <%
		}
    %>
</body>
</html>