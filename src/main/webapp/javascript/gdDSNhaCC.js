document.addEventListener("DOMContentLoaded", () => {
	const buttons = document.querySelectorAll("tbody>tr>td>button")
	buttons.forEach((button) => {
		button.onclick = () => {
			const buttons = document.querySelectorAll("tbody>tr>td>button")
			buttons.forEach((button) => {
				button.parentElement.parentElement.classList.remove("row-select");
			})
			button.parentElement.parentElement.classList.add("row-select")
		}
	})
	
	
	document.querySelector(".js-tiep-tuc").addEventListener("click",function(){
		const rows = document.querySelectorAll("tbody>tr")
		let rowSelect = null;
		rows.forEach((row) => {
			if(row.getAttribute("class")?.includes("row-select")){
				rowSelect = row
			}
		})
		if(rowSelect == null){
			alert("Vui lòng chọn 1 nhà cung cấp")
		}
		else{
			window.location=
			`http://localhost:8080/CuaHangThueTruyen/nv/gdHoaDonNhap.jsp?maNhaCC=${rowSelect.dataset.rowMa}`
		}
	});
})