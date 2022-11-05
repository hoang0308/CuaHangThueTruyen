document.addEventListener("DOMContentLoaded", () => {
	const elementDonGia = document.querySelector(".js-donGia")
	const elementSoLuong = document.querySelector(".js-soLuong")
	const elementThanhTien = document.querySelector(".js-thanhTien")
	const setThanhTien = (elementInput) => {
		elementInput.addEventListener("input",() => {
			let soLuong = elementSoLuong.value;
			let donGia = elementDonGia.value;
			elementThanhTien.value = soLuong * donGia;
		})
	}
	setThanhTien(elementDonGia);
	setThanhTien(elementSoLuong);
})