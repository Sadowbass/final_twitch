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
							<form id="frm_orderSelect_mh" name="frm_orderSelect_mh" method="post" action="orderSelect.mh">
								<div class="row" style="margin-top: 10px; text-align: right;">
									<div class="col-sm-12">

										<div class="form-inline">
											<input type="text" class="form-control" id="order_search_mh" name="order_search_mh" value="${p.findStr }"/>
											<input type="button" class="form-control" value="검색" id="btn_orderSearch_mh" name="btn_orderSearch_mh"/>
											<input type="hidden" id="orderSelect_orderSerial" name="orderSelect_orderSerial" value="" />
											<input type="hidden" id="orderSelect_nowPage" name="orderSelect_nowPage" value="${p.nowPage }"/>
											<input type="hidden" id="orderSelect_mem_id" name="orderSelect_mem_id" value=""/>
											
										</div>

									</div>
								</div>

							</form>
						</div>
					</div>
					<div class="body">
						<div class="row">
							<div class="col-xs-12" style="text-align: center;">
								<div style="display: inline-block; width: 19%;">
									<span>주문번호</span>
								</div>
								<div style="display: inline-block; width: 19%;">
									<span>주문자</span>
								</div>
								<div style="display: inline-block; width: 19%;">
									<span>주소</span>
								</div>
								<div style="display: inline-block; width: 19%;">
									<span>총가격</span>
								</div>
								<div style="display: inline-block; width: 19%;">
									<span>주문일</span>
								</div>
							</div>
						</div>

						<c:forEach var="i" items="${list }">
							<div class="row list_c" onclick="cmh.orderView(${i.order_serial },'${i.mem_id }');">
								<div class="col-xs-12" style="text-align: center;">
									<div style="display: inline-block; width: 19%">
										<span>${i.order_serial }</span>
									</div>
									<div style="display: inline-block; width: 19%">
										<span>${i.mem_id }</span>
									</div>
									<div style="display: inline-block; width: 19%">
										<span>(${i.zip_code}) ${i.address1 } ${i.address2 }</span>
									</div>
									<div style="display: inline-block; width: 19%">
										<span>${i.amount}</span>
									</div>
									<div style="display: inline-block; width: 19%">
										<span>${i.order_date }</span>
									</div>
									
								</div>
							</div>
						</c:forEach>
						<div class="row">
							<div class="col-xs-12" style="text-align : center;">
								<div id='paging'>
											<c:if test="${p.startPage>p.blockSize }">
												<input type='button' value=' 이전 ' class="btn"
													onclick='cmh.go(${p.startPage-1})' />
											</c:if>

											<c:forEach var='i' begin='${p.startPage }'
												end='${p.endPage }'>
												<input type='button' value=' ${i } '
													class="btn ${(i==p.nowPage)? 'here' : '' }"
													onclick='cmh.go(${i})' />
											</c:forEach>
											<c:if test="${p.endPage < p.totPage }">
												<input type='button' value=' 다음 ' class="btn"
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
<script>
	cmh.func();
</script>
</body>

</html>
