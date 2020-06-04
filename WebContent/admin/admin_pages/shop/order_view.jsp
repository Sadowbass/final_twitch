<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body class="theme-red">
	<div class="container-fluid">
		<div class="block-header">
			<h2>주문 상세 보기</h2>
		</div>
		<!-- Color Pickers -->
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="card">
					<div class="header" style="text-align: left;">
						<div class="row">
							<div class="col-xs-3">
								<h2>주문 상세 정보</h2>
							</div>
							<div class="col-xs-7"></div>
							<div class="col-xs-2" style="text-align: right;">
								
								<input type="button" class="btn" value="삭제" style="color: black" id="btn_orderDelete" /> 
								
							</div>
						</div>


					</div>
					<div class="body">
						<form>
							<input type = "hidden" id="order_serial_mh" value="${list[0].order_serial }"/>
							<div class="row">
								<div class="col-xs-4">
									<span>주문일자</span>&nbsp;&nbsp;
									<span>${list[0].order_date }</span>
								</div>
								<div class="col-xs-4">
									<span >주문번호</span>&nbsp;&nbsp;
									<span style="color: yellow;">${list[0].order_serial }</span>
								</div>
								<div class="col-xs-4">
									<span >주문 상태</span>&nbsp;&nbsp;
									<span style="color: yellow;">
										<c:if test="${list[0].order_state eq '0'}">
											결제완료
										</c:if>
										<c:if test="${list[0].order_state eq '1'}">
											결제완료
										</c:if>
										
									</span>
								</div>
							</div>
							<div class="row" style="border-top: 2px solid white; border-bottom : 1px solid gray; padding-top: 15px;">
								<div class="col-xs-3">
									<span>상품주문번호</span>
								</div>
								<div class="col-xs-3">
									<span>상품명 / 사이즈</span>
								</div>
								<div class="col-xs-3">
									<span>상품금액 / 수량</span>
								</div>
								<div class="col-xs-3">
									<span>최종금액</span>
								</div>
							</div>
							<c:forEach var="i" items="${list }">
								<div class="row" style="padding-top: 15px;">
									<div class="col-xs-3">
										<span>${i.orderDetails_serial}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<span><img src="<%=request.getContextPath() %>/admin/admin_pages/product_photo/${i.sysfile}" alt="" style="width: 130px;"/></span>
									</div>
									<div class="col-xs-3">
										<span>${i.product_name } / </span> 
										<span>
											${i.product_size}
										
											<%-- <c:if test="${i.product_size eq '1'}">Free</c:if>
											<c:if test="${i.product_size eq '2'}">X_LARGE</c:if>
											<c:if test="${i.product_size eq '3'}">LARGE</c:if>
											<c:if test="${i.product_size eq '4'}">Medium</c:if>
											<c:if test="${i.product_size eq '5'}">Small</c:if>
											<c:if test="${i.product_size eq '6'}">Free</c:if> --%>
										</span>
									</div>
									<div class="col-xs-3">
										<span>${i.product_price}원 / </span> <span>${i.cart_count }개</span>
									</div>
									<div class="col-xs-3">
										<span>${i.product_price * i.cart_count  }원</span>
									</div>
								</div>
							</c:forEach>
							<div class="row" style="border-top: 2px solid gray; border-bottom: 1px solid gray;">
								<div class="col-xs-3">
									<h5 style="color:white; margin-bottom: 0;">배송지 정보</h5>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-2">
									<div class="row list_list" style="padding: 15px;">
										<span>수령인</span>
									</div>
									<div class="row list_list">
										<span>연락처</span>
									</div>
									<div class="row list_list">
									<span>배송지</span></div>
									
									
								</div>
								<div class="col-xs-6">
									<div class="row list_list"><span>${list[0].get_name}</span></div>
									<div class="row list_list"><span>${list[0].get_phone}</span></div>
									<div class="row list_list"><span>(${list[0].zip_code}) ${list[0].address1 } ${list[0].address2 }</span></div>
								</div>
								<div class="col-xs-4">
									<div class="row list_list"><span>총 결제금액</span></div>
									<div class="row list_list"><p>${list[0].amount }원</p>
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
	</script>
</body>

</html>
