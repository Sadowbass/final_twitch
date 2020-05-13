<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<title>Jquery DataTable | Bootstrap Based Admin Template -
	Material Design</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>

<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/i18n/defaults-*.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/admin/css/cmh.css" />
<script src="<%=request.getContextPath()%>/admin/js/admin_c.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="block-header">
			<h2>주문 조회</h2>
		</div>
		<!-- Basic Examples -->
		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="card">
					<div class="header" style="padding-bottom: 60px">
						<div class="col-xs-2">
							<h2>주문 조회</h2>

						</div>
						<div class="col-xs-10">
							<form action="">
								<div class="row" style="margin-top: 10px; text-align: right;">
									<div class="col-sm-12">

										<div class="form-inline">
											<select class="selectpicker form-control">
												<option selected>주문자</option>
												<option>주문번호</option>
											</select> <input type="text" class="form-control" />
											<input type="button" class="form-control" value="검색" />
										</div>

									</div>
								</div>

							</form>
						</div>
					</div>




					<div class="body">
						<div class="row">
							<div class="col-xs-12" style="text-align: center;">
								<div style="display: inline-block; width: 10%">
									<span>번호</span>
								</div>
								<div style="display: inline-block; width: 15%">
									<span>주문 번호</span>
								</div>
								<div style="display: inline-block; width: 20%">
									<span>주문 상품</span>
								</div>
								<div style="display: inline-block; width: 20%">
									<span>주문 일시</span>
								</div>
								<div style="display: inline-block; width: 10%">
									<span>주문자</span>
								</div>
								<div style="display: inline-block; width: 10%">
									<span>주문 상태</span>
								</div>
							</div>
						</div>

						<c:forEach var="i" begin="1" end="10">
							<div class="row list_c" onclick="cmh.orderView();">
								<div class="col-xs-12" style="text-align: center;">
									<div style="display: inline-block; width: 10%">
										<span>${i }</span>
									</div>
									<div style="display: inline-block; width: 15%">
										<span>주문 번호${i }</span>
									</div>
									<div style="display: inline-block; width: 20%">
										<span>주문 상품${i}</span>
									</div>
									<div style="display: inline-block; width: 20%">
										<span>주문 일시${i}</span>
									</div>
									<div style="display: inline-block; width: 10%">
										<span>주문자${i }</span>
									</div>
									<div style="display: inline-block; width: 10%">
										<span>주문상태${i }</span>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>
				</div>
			</div>
		</div>
		<!-- #END# Basic Examples -->
		<!-- Exportable Table -->
		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="card">
					<div class="header">
						<h2>EXPORTABLE TABLE</h2>
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
						<div class="table-responsive"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- #END# Exportable Table -->
	</div>

</body>

</html>
