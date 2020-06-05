<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %> <% request.setCharacterEncoding("utf-8"); %> <%@taglib
		prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta
			name="viewport"
			content="width=device-width, initial-scale=1, shrink-to-fit=no"
	/>
	<meta name="description" content="Askbootstrap" />
	<meta name="author" content="Askbootstrap" />
	<title>JHTA-Twitch</title>
	<!-- Favicon Icon -->
	<link rel="icon" type="image/png" href="/img/favicon.png" />
	<!-- Bootstrap core CSS-->
	<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<!-- Custom fonts for this template-->
	<link
			href="/vendor/fontawesome-free/css/all.min.css"
			rel="stylesheet"
			type="text/css"
	/>
	<!-- Custom styles for this template-->
	<link href="/css/osahan.css" rel="stylesheet" />
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="/vendor/owl-carousel/owl.carousel.css" />
	<link rel="stylesheet" href="/vendor/owl-carousel/owl.theme.css" />
	<link rel="stylesheet" href="/css/sc_custom.css" />
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
	<script src="/js/myPageTak.js"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/dataTables.semanticui.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.js"></Script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<link rel='stylesheet'
		  href='https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
	<link rel='stylesheet'
		  href='https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
	<script
			src='https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<style>
		.imgTak {
			background: #fff none repeat scroll 0 0;
			border-radius: 50px;
			box-shadow: 0 0 2px #ccc;
			margin: 1px 0 8px;
			object-fit: scale-down;
			transform: scale(1);
		}
		.nav-item {
			font-size: 15px;
		}

		.jumbotron {
			text-shadow: black 0.2em 0.2em 0.2em;
			color: white;
			background-color: rgb(232, 86, 133);
		}

		.toast-center-center {
			position: absolute;
			top: 30%;
			left: 50%;
			-ms-transform: translateX(-50%) translateY(-50%);
			-webkit-transform: translate(-50%,-50%);
			transform: translate(-50%,-50%);
		}
		.toast-success {
			background-color: rgb(232, 86, 133) !important;
		}
		.warning {
			background: #ffe6e6;
			color: #c86e6e;
			padding: 10px;
			margin: 0 0 20px;
			border: 1px solid #f5c8c8;
		}
		.success {
			background: #A9F5E1;
			color: #04B486;
			padding: 10px;
			margin: 0 0 20px;
			border: 1px solid #04B486;
		}
		.nav-item a{
			color:rgb(232, 86, 133);
		}

		.nav-item a:hover{
			color: black;
		}
		#donationTable th{
			background-color: rgb(232, 86, 133);
			color: white;
		}
		#donationTable2 th{
			background-color: rgb(232, 86, 133);
			color: white;
		}
		#paymentTable th{
			background-color: rgb(232, 86, 133);
			color: white;
		}
		.ui.pagination.menu .item{
			color:rgb(232, 86, 133);
		}
	</style>
</head>
<body id="page-top">
<div id="topplace">
	<jsp:include page="/userinfo.sc" flush="false"></jsp:include>
</div>
<div id="wrapper">
	<div id="sidebarplace" style="margin-top: 52px;">
		<jsp:include page="/sidebar.sc" flush="false"></jsp:include>
	</div>
	<div id="content-wrapper">
		<div class='container-fluid' id='userPage'style='margin-top: 4%'>
			<div class="jumbotron">
				<h1 class="text-center" style='color: white'>Twitch</h1>
				<p class="text-center">자신만의 방송채널을 가져보세요!</p>
				<p class="text-center">
					<a class="btn btn-primary btn-lg" href="/broadCasting/index.jsp" role="button" style='border: 1px solid white !important'>방송 하러가기</a>
				</p>
			</div>
			<input type='hidden' id='userId' value='<%=session.getAttribute("session_id")%>'>
			<input type='hidden' id='scrollFlag' value=''/>

			<div class='row'>
				<ul class="nav nav-tabs" style='border: 0 !important'>
					<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#progfill" style='font-weight: bold'>프로필</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
											href="#donationList" style='font-weight: bold'>보낸 후원 목록</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
											href="#donationList2" style='font-weight: bold'>받은 후원 목록</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
											href="#coinList" style='font-weight: bold'>결제 목록</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
											href="#followList"style='font-weight: bold' onclick="$('#scrollFlag').val('1')">팔로우 목록</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
											href="#friendList"style='font-weight: bold' onclick="$('#scrollFlag').val('2')">친구 목록</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
											href="#ignoreList"style='font-weight: bold' onclick="$('#scrollFlag').val('3')">개인 차단 목록</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
											href="#ignoreList2"style='font-weight: bold' onclick="$('#scrollFlag').val('4')">생방송 차단 목록</a></li>
				</ul>
			</div>
			<div class='tab-content'>
				<div id='progfill' class='container tab-pane active'>
					<jsp:include page="./userPageMenu1.jsp" flush="false"/>
				</div>
				<div id='donationList' class='container tab-pane'>
					<jsp:include page="./userPageMenu2.jsp" flush="false"/>
				</div>
				<div id='donationList2' class='container tab-pane'>
					<jsp:include page="./userPageMenu3.jsp" flush="false" />
				</div>
				<div id='coinList' class='container tab-pane'>
					<jsp:include page="./userPageMenu4.jsp" flush="false" />
				</div>

				<div id='followList' class='tab-pane'>
					<jsp:include page="./follower.jsp" flush="false"/>
				</div>
				<div id='friendList' class='tab-pane'>
					<jsp:include page="./userPageMenu5.jsp" flush="false"/>
				</div>
				<div id='ignoreList' class='tab-pane'>
					<jsp:include page="./userPageMenu6.jsp" flush="false"/>
				</div>
				<div id='ignoreList2' class='tab-pane'>
					<jsp:include page="./userPageMenu7.jsp" flush="false"/>
				</div>
			</div>
		</div>
		<jsp:include page="/logout-modal.jsp"></jsp:include>
		<%@include file="/footer.jsp"%>
		<script>
			userInit();
			paymentInit();
			donationInit();
			donation2Init();
			followers();
			friends();
			Ignores();
			Ignores2();
		</script>
	</div>
	<!-- /.content-wrapper -->
</div>
<!-- /#wrapper -->
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
	<i class="fas fa-angle-up"></i>
</a>
<!-- Logout Modal-->
<%@include file="/logout-modal.jsp" %>
</body>
</html>





