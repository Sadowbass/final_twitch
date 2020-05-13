<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body class="theme-red">
	<div class="container-fluid">
		<div class="block-header">
			<h2>상품 등록</h2>
		</div>
		<!-- Color Pickers -->
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="card">
					<div class="header">
						<h2>
							상품 등록
							<!-- <small>Taken from <a href="https://github.com/mjolnic/bootstrap-colorpicker/" target="_blank">github.com/mjolnic/bootstrap-colorpicker</a></small> -->
						</h2>
						<ul class="header-dropdown m-r--5">
							<li class="dropdown"><a href="javascript:void(0);"
								class="dropdown-toggle" data-toggle="dropdown" role="button"
								aria-haspopup="true" aria-expanded="false"> <i
									class="material-icons">more_vert</i>
							</a>
								<ul class="dropdown-menu pull-right">
									<li><a href="javascript:void(0);">Action</a></li>
									<li><a href="javascript:void(0);">Another action</a></li>
									<li><a href="javascript:void(0);">Something else here</a></li>
								</ul></li>
						</ul>
					</div>
					<div class="body">
						<form>
							<div class="row">
								<div class="col-xs-3">
									<div class="row">
										<div class="col-xs-4">
											<span>카테고리</span>
										</div>
										<div class="col-xs-8">
											<select class="selectpicker form-control">
												<option value="">HOODIES</option>
												<option value="">TEES</option>
												<option value="">BOTTOMS</option>
												<option value="">BAGS & ACCESSORIES</option>
												<option value="">DOG</option>
												<option value="">STEALS</option>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-4">
											<span>상품명</span>
										</div>
										<div class="col-xs-8">
											<input type="text" class="form-control" />
										</div>
									</div>
									<div class="row">
										<div class="col-xs-4">
											<span>상품가격</span>
										</div>
										<div class="col-xs-8">
											<input type="text" class="form-control" />
										</div>
									</div>
									<div class="row">
										<div class="col-xs-4">
											<span>사이즈</span>
										</div>
										<div class="col-xs-8">
											<select name="" id="" class="selectpicker form-control">
												<option value="" selected="selected">-- 사이즈 --</option>
												<option value="">X-Large</option>
												<option value="">Large</option>
												<option value="">Medium</option>
												<option value="">Small</option>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-4">
											<span>상품수량</span>
										</div>
										<div class="col-xs-8">
											<input type="text" class="form-control" />
										</div>
									</div>
								</div>
								<div class="col-xs-9">
									<div class="row">
										<div class="col-xs-12">
											<span>상품 설명</span>
										</div>
										<div class="col-xs-12">
											<textarea name="editordata" id="summernote"
												style="width: 100%; height: 200px"></textarea>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<span>제품 사진</span>
								</div>
								<div class="col-xs-4">
									<input type="file" id="file1" onchange="LoadImg(this,1)" style="display: none;"/>
									<img src="https://via.placeholder.com/300" id="target1" style="width: 300px;height: 300px;" onclick="document.getElementById('file1').click()">
								</div>
								<div class="col-xs-4">
									<input type="file" id="file2" onchange="LoadImg(this,2)" style="display: none;"/>
									<img src="https://via.placeholder.com/300" id="target2" style="width: 300px;height: 300px;" onclick="document.getElementById('file2').click()">
								</div>
								<div class="col-xs-4">
									<input type="file" id="file3" onchange="LoadImg(this,3)" style="display: none;"/>
									<img src="https://via.placeholder.com/300" id="target3" style="width: 300px;height: 300px;" onclick="document.getElementById('file3').click()">
								</div>

							</div>
						</form>



					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>
