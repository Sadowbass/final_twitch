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
								<input type="button" class="btn" value="수정" style="color: black" />
								<input type="button" class="btn" value="삭제" style="color: black" />
							</div>
						</div>


					</div>
					<div class="body">
						<form>

							<div class="row">
								<div class="col-xs-4">
									<span>주문일자</span>&nbsp;&nbsp;
									<span>2020.05.13</span>
								</div>
								<div class="col-xs-8">
									<span >주문번호</span>&nbsp;&nbsp;
									<span style="color: yellow;">202304935934</span>
								</div>
							</div>
							<div class="row" style="border-top: 2px solid white; border-bottom : 1px solid gray; padding-top: 15px;">
								<div class="col-xs-3">
									<span>상품주문번호</span>
								</div>
								<div class="col-xs-3">
									<span>상품정보</span>
								</div>
								<div class="col-xs-3">
									<span>상품금액</span>
								</div>
								<div class="col-xs-3">
									<span>진행상태</span>
								</div>
							</div>
							<div class="row" style="padding-top: 15px;">
								<div class="col-xs-3">
									<span>123470374234789</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span><img src="<%=request.getContextPath() %>/img/v1.png" alt="" style="width: 130px;"/></span>
								</div>
								<div class="col-xs-3">
									<span><a href="http://localhost:8888/final_twitch/img/sc.png">https://www.amazon.com/Twitch-All-Over-Glitch-Sock/dp/B07VXY3SLQ?ref_=ast_sto_dp</a></span>
								</div>
								<div class="col-xs-3">
									<span>1,000원</span>
								</div>
								<div class="col-xs-3">
									<span>배송완료</span>
								</div>
							</div>
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
									<div class="row list_list"><span>홍길동</span></div>
									<div class="row list_list"><span>010-1234-1234</span></div>
									<div class="row list_list"><span>서울 송파구</span></div>
								</div>
								<div class="col-xs-4">
									<div class="row list_list"><span>주문자 정보</span></div>
									<div class="row list_list"><p>홍길동</p>
									<p>010-2423-2323</p>
									<p>abc@naver.com</p></div>
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
