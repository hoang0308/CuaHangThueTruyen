<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<% String nameNhanVien = request.getParameter("nameNhanVien"); %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand mx-4" href="../nv/gdChinhNV.jsp">Cửa hàng thuê truyện</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav w-100">
      <li class="nav-item dropdown " style="margin-right: 10px; margin-left: auto;">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			<%= nameNhanVien %>   
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="../gdDangNhap.jsp?logout=true">Đăng xuất</a>
        </div>
      </li>
    </ul>
  </div>
</nav>