<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Askbootstrap">
<meta name="author" content="Askbootstrap">
<title>JHTA-Twitch</title>
<!-- Favicon Icon -->
<link rel="icon" type="image/png" href="/img/favicon.png">
<!-- Bootstrap core CSS-->
<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- Custom styles for this template-->
<link href="/css/osahan.css" rel="stylesheet">
<!-- Owl Carousel -->
<link rel="stylesheet" href="/vendor/owl-carousel/owl.carousel.css">
<link rel="stylesheet" href="/vendor/owl-carousel/owl.theme.css">
<link rel="stylesheet" href="/css/sc_custom.css">
<link rel="stylesheet" href="/css/css_uk.css">
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Owl Carousel -->
<script src="/vendor/owl-carousel/owl.carousel.js"></script>
<!-- Custom scripts for all pages-->
<script src="/js/custom.js"></script>
<script src="/js/sc_custom.js"></script>
<script src="/js/js_uk.js"></script>
</head>
<body id="page-top">
	<script>
		$(document).ready(function() {
			$.ajax({
				type : 'get',
				url : '/sidebar.sc',
				success : function(data) {
					$('#sidebarplace').html(data);
				}
			})
		})
	</script>

		<div id="topplace"><%@include file="/top.jsp"%></div>
		<div id="sidebarplace"></div>

					<!-- main-view -->
				<div id="main-view" style="width: 800px;" >
					<div class="row mx-0">
						<div class="col-12 p-0">
							<div class="row mx-0">
								<div class="col-3">
									<div class="row mx-0 pt-1">
										<div class="col-9 text-left pl-2">
											<c:choose>
												<c:when test="${vo.ph_sysfile == null}">
													<img src="/img/user-photo/guest-icon.png"
														class="rounded-circle" style="height: 35px; width: 35px;" />
												</c:when>
												<c:otherwise>
													<img src="/img/user-photo/${vo.ph_sysfile}"
														class="rounded-circle" style="height: 35px; width: 35px;" />
												</c:otherwise>
											</c:choose>
											<a href="#"> ${vo.mem_Id} <span title=""
												data-placement="top" data-toggle="tooltip"
												data-original-title="Verified"> <i
													class="fas fa-check-circle"></i>
											</span>
											</a>
										</div>
										<div class="col-3 text-left p-0">
											<div class="onAir">생방송</div>
										</div>
									</div>
								</div>
								<div class="col-6 text-center pt-2">
									<div class="row mx-0">
										<div class="col-4 p-0"></div>
										<div class="col-1 p-0">
											<a href="/${vo.mem_Id}">홈</a>
										</div>
										<div class="col-1 p-0">
											<a href="/${vo.mem_Id}/video">동영상</a>
										</div>
										<div class="col-1 p-0">
											<a href="#">클립</a>
										</div>
										<div class="col-1 p-0">
											<a href="/${vo.mem_Id}/followers">팔로워</a>
											<div class="col-4  p-0"></div>
										</div>
									</div>
								</div>
								<div class="col-3">
									<div class="row mx-0">
										<div class="col-8 text-right p-0" id="follow">
											<div class="channels-card-image-btn">
												<button type="button"
													class="btn btn-outline-secondary btn-sm">
													<strong> <i class="far fa-heart"></i>
													</strong> 팔로우
												</button>
											</div>
										</div>
										<div class="col-4 text-right p-0">
											<div class="channels-card-image-btn">
												<button type="button"
													class="btn btn-outline-secondary btn-sm">
													<strong> <i class="far fa-star"></i>
													</strong> 구독
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- video -->
					<jsp:include page="./video_uk.jsp" />

					<!-- video_info -->
					<div class="row mx-0">
						<div class="col-2">방송 제목</div>
						<div class="col-6">${vo.air_subject}</div>
						<div class="col-4 text-right">
							<i class="far fa-user mr-1"></i> <span id='totalUserCnt'></span>
							<i class="fas fa-eye mr-1 ml-2"></i> <span id='accArea'></span> <i
								class="fas fa-share-alt mx-2"></i> <i
								class="fas fa-ellipsis-v mx-2"></i>
						</div>
					</div>
					<div class="row mx-0">
						<div class="col-2">이미지</div>
						<div class="col-10">
							<div class="row mx-0">
								<div class="col-12">카테고리: just Chatting</div>
							</div>
							<div class="row mx-0">
								<div class="col-12">#리얼라이프</div>
							</div>
						</div>
					</div>
					<div class='unfold mr-1' id='unfold' onclick='unfold()'>
						<i class='fas fa-sign-out-alt fa-2x fa-rotate-180 pl-1'></i>
					</div>
				</div>
		<!-- 채팅화면 -->
		<div class="cht_main_uk px-0" id="cht_div">
			<jsp:include page="./cht_uk.jsp" />
		</div>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	<!-- Logout Modal-->
	<%@include file="../logout-modal.jsp"%>
</body>
</html>