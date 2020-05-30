<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/admin/css/cmh.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>

<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/i18n/defaults-*.min.js"></script>
<script src="<%=request.getContextPath()%>/admin/js/admin_c.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
 #productName, #productPrice, #productCount, #explain {
 	color : black;
 }
</style>
</head>
<body class="theme-red">
	<div class="container-fluid">
		<div class="block-header">
			<h2>상품 추가 </h2>
		</div>
		<!-- Color Pickers -->
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="card">
					<div class="header">
						<div class="row">
							<div class="col-xs-2">
								<h2>등록</h2>
							</div>
							<div class="col-xs-8"></div>
							<div class="col-xs-2" style="text-align: right;">

								<input type="button" id="productInsert_c" class="btn btn-info"
									value="등록" style="color: white" /> <input type="button"
									class="btn btn-info" value="초기화" id="btn_reset" name="btn_reset" style="color: white" />
							</div>
						</div>
					</div>
					<div class="body">
						<form id="productInsertForm_c" method="post"
							name="productInsertForm_c" enctype='multipart/form-data'>
							<div class="row">
								<div class="col-xs-3">
									<div class="row">
										<div class="col-xs-4">
											<span>카테고리</span>
										</div>
										<div class="col-xs-8">
											<select class="selectpicker form-control" id="first" name="first">
												<option value="HOODIES">HOODIES</option>
												<option value="TEES">TEES</option>
												<option value="BOTTOMS">BOTTOMS</option>
												<option value="BAGS & ACCESSORIES">BAGS & ACCESSORIES</option>
												<option value="DOG">DOG</option>
												<option value="STEALS">STEALS</option>
											</select>
										</div>
									</div>

									<div class="row" style="display: none;" id="a">
										<div class="col-xs-4">
											<span>세부 카테고리</span>
										</div>
										<div class="col-xs-8">
											<select class="selectpicker form-control" id="sel1"> 
												<option value="Long Pants">Long Pants</option>
												<option value="Short Pants">Short Pants</option>
											</select>
										</div>
									</div>
									<div class="row" style="display: none;" id="b">
										<div class="col-xs-4">
											<span>세부 카테고리</span>
										</div>
										<div class="col-xs-8">
											<select class="selectpicker form-control" id="sel2">
												<option value="Bags">Bags</option>
												<option value="Hats">Hats</option>
												<option value="Socks">Socks</option>
												<option value="ETC">ETC</option>
											</select>
										</div>
									</div>
									<div class="row" style="display: none;" id="c">
										<div class="col-xs-4">
											<span>세부 카테고리</span>
										</div>
										<div class="col-xs-8">
											<select class="selectpicker form-control" id="sel3">
												<option value="Clothes">Clothes</option>
												<option value="The others">The others</option>
											</select>
										</div>
									</div>
									<input type="hidden" id="category" name="category" />

									<div class="row">
										<div class="col-xs-4">
											<span>상품명</span>
										</div>
										<div class="col-xs-8">
											<input type="text" id="productName" name="productName"
												class="form-control" />
										</div>
									</div>
									<div class="row">
										<div class="col-xs-4">
											<span>상품가격</span>
										</div>
										<div class="col-xs-8">
											<input type="text" class="form-control" id="productPrice"
												name="productPrice" />
										</div>
									</div>
									<div class="row">
										<div class="col-xs-4">
											<span>사이즈</span>
										</div>
										<div class="col-xs-8">
											<select name="productSize" id="productSize"
												class="selectpicker form-control">
												<option value="1" selected="selected">-- 사이즈 --</option>
												<option value="2">X-Large</option>
												<option value="3">Large</option>
												<option value="4">Medium</option>
												<option value="5">Small</option>
												<option value="6">Free</option>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-4">
											<span>상품수량</span>
										</div>
										<div class="col-xs-8">
											<input type="text" id="productCount" name="productCount"
												class="form-control" />
										</div>
									</div>
								</div>
								<div class="col-xs-9">
									<div class="row">
										<div class="col-xs-12">
											<span>상품 설명</span>
										</div>
										<div class="col-xs-12">
											<textarea name="explain" id="explain"
												style="width: 100%; height: 200px"></textarea>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<span>제품 사진</span>
								</div>
								<div class="col-xs-3">
									<input type="file" id="file1" name="file1" onchange="LoadImg(this,1)"
										style="display: none;" />

									<div>
										<div
											style="width: 250px; height: 250px; background-image: url('https://via.placeholder.com/250'); background-size: 250px"
											id="target1"
											onclick="document.getElementById('file1').click()"></div>
										<i class="material-icons" id="close1">close</i>
									</div>
								</div>
								<div class="col-xs-3">
									<input type="file" id="file2" name="file2"onchange="LoadImg(this,2)"
										style="display: none;" />

									<div>
										<div
											style="width: 250px; height: 250px; background-image: url('https://via.placeholder.com/250'); background-size: 250px"
											id="target2"
											onclick="document.getElementById('file2').click()"></div>
										<i class="material-icons" id="close2">close</i>
									</div>
								</div>
								<div class="col-xs-3">
									<input type="file" id="file3" name="file3" onchange="LoadImg(this,3)"
										style="display: none;" />

									<div>
										<div
											style="width: 250px; height: 250px; background-image: url('https://via.placeholder.com/250'); background-size: 250px"
											id="target3"
											onclick="document.getElementById('file3').click()"></div>
										<i class="material-icons" id="close3">close</i>
									</div>
								</div>
								<div class="col-xs-3">
									<input type="file" id="file4" name="file4" onchange="LoadImg(this,4)"
										style="display: none;" />

									<div>
										<div
											style="width: 250px; height: 250px; background-image: url('https://via.placeholder.com/250'); background-size: 250px"
											id="target4"
											onclick="document.getElementById('file4').click()"></div>
										<i class="material-icons" id="close4">close</i>
									</div>
								</div>

							</div>
						</form>


						
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		cmh.func();
		$('#first').change(function() {
			var state = $('#first option:selected').val();
			if (state == 'BOTTOMS') {
				$('#a').css('display', '');
				$('#b').css('display', 'none');
				$('#c').css('display', 'none');
			} else if (state == 'BAGS & ACCESSORIES') {
				$('#a').css('display', 'none');
				$('#b').css('display', '');
				$('#c').css('display', 'none');
			} else if (state == 'STEALS') {
				$('#a').css('display', 'none');
				$('#b').css('display', 'none');
				$('#c').css('display', '');
			} else {
				$('#a').css('display', 'none');
				$('#b').css('display', 'none');
				$('#c').css('display', 'none');
			}
		})
	</script>
</body>

</html>
