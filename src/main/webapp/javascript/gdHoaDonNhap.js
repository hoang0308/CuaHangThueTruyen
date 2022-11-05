document.addEventListener("DOMContentLoaded", () => {
	const elThanhTiens = document.querySelectorAll(".js-thanhTien");
	let tongTien = 0;
	elThanhTiens.forEach((el) => {tongTien += Number(el.dataset.thanhtien)});
	document.querySelector(".js-tongTien").innerHTML = tongTien;
})