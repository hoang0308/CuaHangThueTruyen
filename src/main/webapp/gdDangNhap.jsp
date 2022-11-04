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
    <title>Document</title>
</head>
<body>
    <%
		if(request.getParameter("err") !=null &&
			request.getParameter("err").equalsIgnoreCase("timeout")){
	%> 
		<h4>Hết phiên làm việc. Làm ơn đăng nhập lại!</h4>
	<%
		}else if(request.getParameter("err") !=null &&
			request.getParameter("err").equalsIgnoreCase("fail")){
	%> 
		<h4 color="red">Sai tên đăng nhập/mật khẩu!</h4>
	<%
		}
	%>
	<h2> Đăng nhập </h2>
	<form name="dangnhap" action="doDangNhap.jsp" method="post">
		<table border="0">
			<tr>
				<td>
					Tên đăng nhập:
				</td>
				<td>
					<input 
						type="text" 
						name="username" 
						id="username"
						required
					/>
				</td>
			</tr>
			<tr>
				<td>
					Mật khẩu:
				</td>
				<td>
					<input 
						type="password" 
						name="password" 
						id="password"
						required 
					/>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input 
						type="submit" 
						value="Đăng nhập" 
					/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>