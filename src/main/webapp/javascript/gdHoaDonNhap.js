document.addEventListener("DOMContentLoaded", () => {
	// Tinh tong tien
	const elThanhTiens = document.querySelectorAll(".js-thanhTien");
	let tongTien = 0;
	elThanhTiens.forEach((el) => {tongTien += Number(el.dataset.thanhtien)});
	document.querySelector(".js-tongTien").value = tongTien.toFixed(2);
	
	// Handle click submit
	document.querySelector(".js-submit").addEventListener("click",() => {
    	if(document.querySelector(".js-dauTruyen")){
			document.querySelector("#form-hoaDonNhap").submit()
		}
		else{
			alert("Vui lòng thêm đầu truyện nhập!!!")
		}
    })
})