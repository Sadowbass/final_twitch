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
									0</span>&nbsp; <span>품절 </span> <span> 0</span>&nbsp; <span>숨김
								</span> <span> 0</span>
							</div>
						</div>
						<br>
						<form action="" method="post" name="frm_product_select"
							id="frm_product_select">
							<div class="row" style="margin-top: 10px; text-align: right;">
								<div class="col-sm-12">

									<div class="form-inline">
										<select class="selectpicker form-control">
											<option selected>상품명</option>
											<option>제조사</option>
										</select> <input type="text" class="form-control" id="product_search"
											name="product_search" value="${p.findStr }" /> <input
											type="hidden" name="nowPage" value="${p.nowPage }" /> <input
											type="button" class="form-control" value="검색"
											id="btn_search_mh" name="btn_search_mh" />
									</div>

								</div>
							</div>

						</form>

						<div class="body" style="text-align: center">
							<div class="row" id="board1_c" style="text-align: left">
								<div class="no_c"
									style="display: inline-block; width: 5%; text-align: center;">
									<span>상품번호</span>
								</div>
								<div
									style="display: inline-block; width: 20%; text-align: center;">
									<span class="save_c">상품 사진</span>
								</div>

								<div
									style="display: inline-block; width: 20%; text-align: center;">
									<span class="name_c">상품명</span>
								</div>
								<div
									style="display: inline-block; width: 15%; text-align: center">
									<span class="price_c">판매가</span>
								</div>

								<div
									style="display: inline-block; width: 5%; text-align: center">
									<span class="status_c">상태</span>
								</div>
								<div
									style="display: inline-block; width: 5%; text-align: center">
									<span class="hit_c">조회</span>
								</div>
								<div
									style="display: inline-block; width: 5%; text-align: center">
									<span class="order_c">주문</span>
								</div>
								<div
									style="display: inline-block; width: 5%; text-align: center">
									<span class="sell_c">판매</span>
								</div>
								<div
									style="display: inline-block; width: 5%; text-align: center">
									<span class="interest_c">관심</span>
								</div>
								<div
									style="display: inline-block; width: 5%; text-align: center">
									<span class="put_c">담기</span>
								</div>
								<div
									style="display: inline-block; width: 5%; text-align: center">
									<span class="stock_c">재고</span>
								</div>

							</div>
							<div>
								<c:forEach var="i" items="${list }">
									<div class="row" style="text-align: left; margin-top: 10px;">
										<div class="no_c"
											style="display: inline-block; width: 5%; text-align: center;">
											<span>${i.product_id} </span>
										</div>

										<div
											style="display: inline-block; width: 20%; text-align: center;">
											<img
												src="<%=request.getContextPath() %>/admin/admin_pages/product_photo/${i.photos[0].sysfile}"
												alt="" style="width : 50px; height: 50px;"/>
										</div>
										<div
											style="display: inline-block; width: 20%; text-align: center;"
											onclick="cmh.productView(${i.product_id});">
											<span>${i.product_name}</span>											
										</div>
										<div
											style="display: inline-block; width: 15%; text-align: center;">
											<span>${i.product_price }</span>
											<!-- <input type="text" class="form-control" value="10000"
											style="width: 80px"> -->
										</div>
										<!-- <div class="col-xs-1">
										<input type="text" class="form-control" value="200"
											style="width: 80px">
									</div> -->
										<div
											style="display: inline-block; width: 5%; text-align: center;">
											<span>${i.product_state }</span>
											<!-- <select class="selectpicker form-control">
											<option selected>정상</option>
											<option>품절</option>
											<option>숨김</option>
										</select> -->
											<%-- <span class="status_c">상태${i}</span> --%>
										</div>
										<div
											style="display: inline-block; width: 5%; text-align: center;">
											<span class="hit_c">0</span>
										</div>
										<div
											style="display: inline-block; width: 5%; text-align: center;">
											<span class="order_c">0</span>
										</div>
										<div
											style="display: inline-block; width: 5%; text-align: center;">
											<span class="sell_c">0</span>
										</div>
										<div
											style="display: inline-block; width: 5%; text-align: center;">
											<span class="interest_c">0</span>
										</div>
										<div
											style="display: inline-block; width: 5%; text-align: center;">
											<span class="put_c">0</span>
										</div>
										<div
											style="display: inline-block; width: 5%; text-align: center;">
											<span class="stock_c">${i.product_count}</span>
										</div>
									</div>
								</c:forEach>
							</div>

							<div>
								<div class="row">
									<div class="col-xs-12">

										<br>
										<div id='paging'>
											<c:if test="${p.startPage>p.blockSize }">
												<input type='button' value=' 이전 '
													onclick='cmh.go(${p.startPage-1})' />
											</c:if>

											<c:forEach var='i' begin='${p.startPage }'
												end='${p.endPage }'>
												<input type='button' value=' ${i } '
													class="${(i==p.nowPage)? 'here' : '' }"
													onclick='cmh.go(${i})' />
											</c:forEach>
											<c:if test="${p.endPage < p.totPage }">
												<input type='button' value=' 다음 '
													onclick='cmh.go(${p.endPage+1})' />
											</c:if>

										</div>
									</div>

								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<script>
	cmh.func();
</script>


</body>

</html>
