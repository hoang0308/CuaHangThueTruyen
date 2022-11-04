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
    <title>DANH SÁCH NHÀ CUNG CẤP</title>
    <link 
    	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
    	rel="stylesheet" 
    	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
    	crossorigin="anonymous"
    >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/index.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/gdDSNhaCC.js"></script>
</head>
<body>
	<%
		//Check login
		ThanhVien nhanVien = (ThanhVien)session.getAttribute("nhanVien");
		if(nhanVien == null){
			response.sendRedirect("../gdDangNhap.jsp?err=timeout");
		}
		// Get list dau truyen
		ArrayList<NhaCC> listNhaCCShow;
		ArrayList<NhaCC> listNhaCC;
		boolean booleanSearchNhaCC;
		try{			
			booleanSearchNhaCC = (boolean)session.getAttribute("booleanSearchNhaCC");
		}
		catch(Exception e){
			booleanSearchNhaCC = false;
		}
		//Nếu search thì sẽ lấy listNhaCC từ session, nếu không phải search thì sẽ lấy listNhaCC từ DB
		if(booleanSearchNhaCC){
			//Nếu là search thì show listNhaCCSearch
			listNhaCC = (ArrayList<NhaCC>)session.getAttribute("listNhaCC");
			listNhaCCShow = (ArrayList<NhaCC>)session.getAttribute("listNhaCCSearch");
			session.removeAttribute("listNhaCCSearch");	
		}
		else{
			//Nếu không là search thì show listNhaCC lấy từ DB
			NhaCCDAO nhaCCDAO = new NhaCCDAO();
			listNhaCC = nhaCCDAO.getListNhaCC();
			listNhaCCShow = listNhaCC;
		}
		session.setAttribute("listNhaCC", listNhaCC);
		session.removeAttribute("booleanSearchNhaCC");
	%>
    <div class="w-100 ">
        <h1 class="d-flex justify-content-center mt-5">DANH SÁCH NHÀ CUNG CẤP</h1>
	    	<form name="searchNhaCC" action="doSearchNhaCC.jsp" method="post">
	        	<div class="d-flex justify-content-center mt-5">
	            	<div class="col-6">
	                	<input 
		                	type="text" 
		                	class="form-control" 
		                	name="nameNhaCC" 
		                	placeholder="Tên nhà cung cấp"
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
            <table class="table w-75 table-bordered text-center">
                <thead class="">
                  <tr class=""> 
                    <th scope="col">Mã</th>
                    <th scope="col">Tên</th>
                    <th scope="col">Email</th>
                    <th scope="col">SĐT</th>
                    <th scope="col">Địa chỉ</th>
                    <th scope="col">Mô tả</th>
                    <th scope="col">Chọn</th>
                  </tr>
                </thead>
                <tbody>
                	<%
                		if( listNhaCCShow != null){
                			int listLength = listNhaCCShow.size(); 
                			for(NhaCC nhaCC : listNhaCCShow){
       				%>
       					<tr data-row-ma="<%= nhaCC.getMa() %>">
       						<th>
       							<%= nhaCC.getMa() %>
       						</th>
       						<td>
       							<%= nhaCC.getTen() %>
       						</td>
       						<td>
       							<%= nhaCC.getEmail() %>
       						</td>
       						<td>
       							<%= nhaCC.getSdt() %>
       						</td>
       						<td>
       							<%= nhaCC.getDiaChi().toString() %>
       						</td>
       						<td>
       							<%= nhaCC.getMoTa() %>
       						</td>
       						<td>
       							<button
       								class="btn btn-primary border w-100 js-button-select"
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
            		href="gdThemNhaCC.jsp"
            	>
            		Thêm mới nhà cung cấp
            	</a>
            </div>
            <div class="col-1"></div>
            <div class="col-2">
              	<a
            		class="btn border w-100"
            		href="gdChinhNV.jsp"
            	>
            		Trở lại
            	</a>
            </div>
        </div>
    </div>
</body>
</html>