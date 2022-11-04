<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>THÔNG TIN TRUYỆN NHẬP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
    <div class="w-100 ">
        <h1 class="d-flex justify-content-center mt-5">THÔNG TIN TRUYỆN NHẬP</h1>
        <div class="justify-content-center mt-5">
            <div class="justify-content-center container w-75 border rounded-3 px-5 py-4">
                <div class="mb-3 row mt-3">
                    <div class="mb-3 row justify-content-center">
                        <label for="exampleFormControlInput1" class="form-label col-sm-3">Tên đầu truyện</label>
                        <div class="col-sm-6">
                            <input 
                                type="text" 
                                readonly 
                                class="form-control-plaintext border px-3 rounded-3" 
                                value=""
                            >
                        </div>
                    </div>
                    <div class="mb-3 row justify-content-center">
                        <label for="exampleFormControlInput1" class="form-label col-sm-3">Số lượng</label>
                        <div class="col-sm-6">
                            <input 
                                type="text" 
                                readonly 
                                class="form-control-plaintext border px-3 rounded-3" 
                                value="" 
                                placeholder="Nhập số lượng của đầu truyện"
                            >
                        </div>
                    </div>
                    <div class="mb-3 row justify-content-center">
                        <label for="exampleFormControlTextarea1" class="form-label col-sm-3">Đơn giá</label>
                        <div class="col-sm-6">
                            <input 
                                type="text" 
                                readonly 
                                class="form-control-plaintext border px-3 rounded-3" 
                                value="" 
                                placeholder="Nhập đơn giá của đầu truyện">
                        </div>
                    </div>
                    <div class="mb-3 row justify-content-center">
                        <label for="exampleFormControlTextarea1" class="form-label col-sm-3">Thành tiền</label>
                        <div class="col-sm-6">
                            <input 
                                type="text" 
                                readonly 
                                class="form-control-plaintext border px-3 rounded-3" 
                                value=""
                            >
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="d-flex justify-content-center mt-5">
            <div class="col-2">
                <button class="btn border w-100">Xác nhận</button>
            </div>
            <div class="col-4"></div>
            <div class="col-2">
                <button class="btn border w-100">Trở lại</button>
            </div>
        </div>
    </div>
</body>
</html>