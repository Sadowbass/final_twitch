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

<body>
<div class="container-fluid">

	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="header">
					<div class="row">
						<div style="float: left; margin-left: 20px;">
							<h2>상품 조회</h2>
						</div>
						<div style="float: right; margin-right: 20px;">
							<span>총 </span> <span> 0</span>&nbsp; <span>정상 </span> <span>
								0</span>&nbsp; <span>품절 </span> <span> 0</span>&nbsp; <span>숨김 </span>
							<span> 0</span>
						</div>
					</div>
					<br>
					<form action="">
						<div class="row" style="margin-top: 10px; text-align: right;">
							<div class="col-sm-12">

								<div class="form-inline">
									<select class="selectpicker form-control">
										<option selected>상품명</option>
										<option>제조사</option>
									</select> <input type="text" class="form-control" />
									<input type="button" class="form-control" value="검색" />
								</div>

							</div>
						</div>

					</form>

					<div class="body" style="text-align: center">
						<div class="row" id="board1_c" style="text-align: left">
							<div class="no_c" style="display: inline-block; width : 5%; text-align: center;">
								<span>번호</span>
							</div>
							<div style="display: inline-block; width : 20%; text-align: center;">
								<span class="save_c">상품 사진</span>
							</div>
							
							<div style="display: inline-block; width : 20%; text-align: center;">
								<span class="name_c">상품명</span>
							</div>
							<div style="display: inline-block; width : 15%; text-align: center">
								<span class="price_c">판매가</span>
							</div>
							
							<div style="display: inline-block; width : 5%; text-align: center">
								<span class="status_c">상태</span>
							</div>
							<div style="display: inline-block; width : 5%; text-align: center">
								<span class="hit_c">조회</span>
							</div>
							<div style="display: inline-block; width : 5%; text-align: center">
								<span class="order_c">주문</span>
							</div>
							<div style="display: inline-block; width : 5%; text-align: center">
								<span class="sell_c">판매</span>
							</div>
							<div style="display: inline-block; width : 5%; text-align: center">
								<span class="interest_c">관심</span>
							</div>
							<div style="display: inline-block; width : 5%; text-align: center">
								<span class="put_c">담기</span>
							</div>
							<div style="display: inline-block; width : 5%; text-align: center">
								<span class="stock_c">재고</span>
							</div>

						</div>
						<div>
							<c:forEach var="i" begin="1" end="10">
								<div class="row" style="text-align: left; margin-top: 10px;">
									<div class="no_c" style="display: inline-block; width : 5%; text-align: center;">
										<span >${i} </span>
									</div>
									
									<div style="display: inline-block; width : 20%; text-align: center;">
										<img src="https://via.placeholder.com/150 " alt="" />
									</div>
									<div style="display: inline-block; width : 20%; text-align: center;" onclick="cmh.productView(${i});">
										<span>상품명${i}</span>
									
										<%-- <input type="text" class="form-control" value="상품명${i}"
											style="width: 100px; float: left"></input><input
											type="button" class="btn" value="수정"
											style="margin-left: 30px;" /> --%>
									</div>
									<div style="display: inline-block; width : 15%; text-align: center;">
										<span>10000</span>
										<!-- <input type="text" class="form-control" value="10000"
											style="width: 80px"> -->
									</div>
									<!-- <div class="col-xs-1">
										<input type="text" class="form-control" value="200"
											style="width: 80px">
									</div> -->
									<div style="display: inline-block; width : 5%; text-align: center;">
										<span>정상</span>
										<!-- <select class="selectpicker form-control">
											<option selected>정상</option>
											<option>품절</option>
											<option>숨김</option>
										</select> -->
										<%-- <span class="status_c">상태${i}</span> --%>
									</div>
									<div style="display: inline-block; width : 5%; text-align: center;">
										<span class="hit_c">${i}</span>
									</div>
									<div style="display: inline-block; width : 5%; text-align: center;">
										<span class="order_c">${i}</span>
									</div>
									<div style="display: inline-block; width : 5%; text-align: center;">
										<span class="sell_c">${i}</span>
									</div>
									<div style="display: inline-block; width : 5%; text-align: center;">
										<span class="interest_c">${i}</span>
									</div>
									<div style="display: inline-block; width : 5%; text-align: center;">
										<span class="put_c">${i}</span>
									</div>
									<div style="display: inline-block; width : 5%; text-align: center;">
										<span class="stock_c">${i}</span>
									</div>
								</div>
							</c:forEach>
						</div>

						<div>
							<div class="row">
								<div class="col-xs-12">

									<br> <input type="button" class="btn" value="이전"
										onclick="">
									<c:forEach var="i" begin="1" end="5">
										<input type="button" class="btn" value="${i }">
									</c:forEach>
									<input type="button" class="btn" value="다음" onclick="">
								</div>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>




</body>

</html>
