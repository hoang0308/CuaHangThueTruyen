<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="dao.*, model.*"
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
     <link 
    	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
    	rel="stylesheet" 
    	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
    	crossorigin="anonymous"
    >
</head>
<body>
	<%
		if(request.getParameter("err") !=null &&
			request.getParameter("err").equalsIgnoreCase("timeout")){
	%> 
		<div class="alert alert-warning" role="alert">
			Hết phiên làm việc. Làm ơn đăng nhập lại!
		</div>
	<%
		}else if(request.getParameter("err") !=null &&
			request.getParameter("err").equalsIgnoreCase("fail")){
	%> 
		<div class="alert alert-danger text-center" role="alert">
			Sai tên đăng nhập/mật khẩu!
		</div>
	<%
		}
	%>
	<div class="w-100 ">
		<h1 class="d-flex justify-content-center mt-5">Đăng nhập</h1>
		<div class="justify-content-center container w-75 border rounded-3 px-5 py-4 mt-5">
			<form name="dangnhap" action="doDangNhap.jsp" method="post">
				<div class="mb-3 row mt-3">
					<div class="mb-3 row justify-content-center">
						<label 
							for="exampleFormControlInput1" 
							class="form-label col-sm-3"
						>
							Tên đăng nhập:
						</label>
						<div class="col-sm-6">
							<input 
								type="text" 
								name="username"
								required
								class="form-control-plaintext border px-3 rounded-3"
								placeholder="Nhập username"
							>
						</div>
					</div>
					<div class="mb-3 row justify-content-center">
						<label for="exampleFormControlInput1" 
							class="form-label col-sm-3"
						>
							Mật khẩu:
						</label>
						<div class="col-sm-6">
							<input 
								type="password" 
								name="password"
								required
								class="form-control-plaintext border px-3 rounded-3 js-soLuong" 
								placeholder="Nhập password"
							>
						</div>
					</div>
				</div>
				<div class="d-flex justify-content-center mt-3">
					<div class="col-2"></div>
					<div class="col-4">
						<input 
							type="submit" 
							class="btn border w-100"
							value="Đăng nhập" 
						/>	
					</div>
					<div class="col-2"></div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>