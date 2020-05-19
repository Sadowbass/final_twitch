<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="org.springframework.ui.Model"%>
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

<script src="<%=request.getContextPath()%>/admin/js/admin_c.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body class="theme-red">


	<div class="container-fluid">
		<div class="block-header">
			<h2>상세 정보</h2>
		</div>
		<!-- Color Pickers -->
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="card">
					<div class="header">
						<div class="row">
							<div class="col-xs-2">
								<h2>수정 및 삭제</h2>
							</div>
							<div class="col-xs-8"></div>
							<div class="col-xs-2" style="text-align: right;">

								<input type="button" id="productInsert_c" class="btn btn-info"
									value="수정" style="color: white" /> <input type="button"
									class="btn btn-info" value="삭제" id="btn_reset" name="btn_reset"
									style="color: white" />
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

											<select class="form-control" id="first" name="first">
												<option value="HOODIES"
													<c:if test="${vo.product_cate eq 'HOODIES' }">selected</c:if>>HOODIES</option>
												<option value="TEES"
													<c:if test="${vo.product_cate eq 'TEES' }">selected</c:if>>TEES</option>
												<option value="BOTTOMS"
													<c:if test="${vo.product_cate eq 'Long Pants' or vo.product_cate eq 'Short Pants'}">selected</c:if>>BOTTOMS</option>
												<option value="BAGS & ACCESSORIES"
													<c:if test="${vo.product_cate eq 'Bags' or vo.product_cate eq 'Hats' or vo.product_cate eq 'Socks' or vo.product_cate eq 'ETC'}">selected</c:if>>BAGS
													& ACCESSORIES</option>
												<option value="DOG"
													<c:if test="${vo.product_cate eq 'DOG' }">selected</c:if>>DOG</option>
												<option value="STEALS"
													<c:if test="${vo.product_cate eq 'Clothes' or vo.product_cate eq 'The others'}">selected</c:if>>STEALS</option>
											</select>
										</div>
									</div>

									<div class="row" style="display: none;" id="a">
										<div class="col-xs-4">
											<span>세부 카테고리</span>
										</div>
										<div class="col-xs-8">
											<select class=" form-control" id="sel1">
												<option value="Long Pants"
													<c:if test="${vo.product_cate eq 'Long Pants' }">selected</c:if>>Long
													Pants</option>
												<option value="Short Pants"
													<c:if test="${vo.product_cate eq 'Short Pants' }">selected</c:if>>Short
													Pants</option>
											</select>
										</div>
									</div>
									<div class="row" style="display: none;" id="b">
										<div class="col-xs-4">
											<span>세부 카테고리</span>
										</div>
										<div class="col-xs-8">
											<select class=" form-control" id="sel2">
												<option value="Bags"
													<c:if test="${vo.product_cate eq 'Bags' }">selected</c:if>>Bags</option>
												<option value="Hats"
													<c:if test="${vo.product_cate eq 'Hats' }">selected</c:if>>Hats</option>
												<option value="Socks"
													<c:if test="${vo.product_cate eq 'Socks' }">selected</c:if>>Socks</option>
												<option value="ETC"
													<c:if test="${vo.product_cate eq 'ETC' }">selected</c:if>>ETC</option>
											</select>
										</div>
									</div>
									<div class="row" style="display: none;" id="c">
										<div class="col-xs-4">
											<span>세부 카테고리</span>
										</div>
										<div class="col-xs-8">
											<select class=" form-control" id="sel3">
												<option value="Clothes"
													<c:if test="${vo.product_cate eq 'Clothes' }">selected</c:if>>Clothes</option>
												<option value="The others"
													<c:if test="${vo.product_cate eq 'The others' }">selected</c:if>>The
													others</option>
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
												class="form-control" value="${vo.product_name }" />
										</div>
									</div>
									<div class="row">
										<div class="col-xs-4">
											<span>상품가격</span>
										</div>
										<div class="col-xs-8">
											<input type="text" class="form-control" id="productPrice"
												name="productPrice" value="${vo.product_price }" />
										</div>
									</div>
									<div class="row">
										<div class="col-xs-4">
											<span>사이즈</span>
										</div>
										<div class="col-xs-8">
											<select name="productSize" id="productSize"
												class="form-control">
												<option value="1" <c:if test="${vo.product_size eq '1' }">selected</c:if>>-- 사이즈 --</option>
												<option value="2" <c:if test="${vo.product_size eq '2' }">selected</c:if>>X-Large</option>
												<option value="3" <c:if test="${vo.product_size eq '3' }">selected</c:if>>Large</option>
												<option value="4" <c:if test="${vo.product_size eq '4' }">selected</c:if>>Medium</option>
												<option value="5" <c:if test="${vo.product_size eq '5' }">selected</c:if>>Small</option>
												<option value="6" <c:if test="${vo.product_size eq '6' }">selected</c:if>>free</option>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-4">
											<span>상품수량</span>
										</div>
										<div class="col-xs-8">
											<input type="text" id="productCount" name="productCount"
												class="form-control" value="${vo.product_count }" />
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
												style="width: 100%; height: 200px">${vo.product_explain }</textarea>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<span>제품 사진</span>
								</div>
								<div class="col-xs-3">
									<input type="file" id="file1" name="file1"
										onchange="LoadImg(this,1)" style="display: none;" />

									<div>
										<div
											style="width: 250px; height: 250px; background-image: url('https://via.placeholder.com/250'); background-size: 250px"
											id="target1"
											onclick="document.getElementById('file1').click()"></div>
										<i class="material-icons" id="close1">close</i>
									</div>
								</div>
								<div class="col-xs-3">
									<input type="file" id="file2" name="file2"
										onchange="LoadImg(this,2)" style="display: none;" />

									<div>
										<div
											style="width: 250px; height: 250px; background-image: url('https://via.placeholder.com/250'); background-size: 250px"
											id="target2"
											onclick="document.getElementById('file2').click()"></div>
										<i class="material-icons" id="close2">close</i>
									</div>
								</div>
								<div class="col-xs-3">
									<input type="file" id="file3" name="file3"
										onchange="LoadImg(this,3)" style="display: none;" />

									<div>
										<div
											style="width: 250px; height: 250px; background-image: url('https://via.placeholder.com/250'); background-size: 250px"
											id="target3"
											onclick="document.getElementById('file3').click()"></div>
										<i class="material-icons" id="close3">close</i>
									</div>
								</div>
								<div class="col-xs-3">
									<input type="file" id="file4" name="file4"
										onchange="LoadImg(this,4)" style="display: none;" />

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
