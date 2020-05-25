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
						<div class="row">
							<div class="col-xs-1">
								<span>1차 분류</span>
							</div>
							<div class="col-xs-2">
								<select class="selectpicker form-control">
									<option value="">1차 분류</option>
									<option value="">1차 분류</option>
									<option value="">1차 분류</option>
								</select>
							</div>

							<div class="col-xs-offset-9"></div>
						</div>
						<div class="row">
							<div class="col-xs-1">
								<span>2차 분류</span>
							</div>
							<div class="col-xs-2">
								<select class="selectpicker form-control">
									<option value="">2차 분류</option>
									<option value="">2차 분류</option>
									<option value="">2차 분류</option>
								</select>
							</div>
							<div class="col-xs-offset-9"></div>
						</div>
						<div class="row">
							<div class="col-xs-1">
								<span>상품명</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

</body>

</html>
