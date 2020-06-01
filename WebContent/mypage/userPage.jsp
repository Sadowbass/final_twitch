<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.nav-item {
	font-size: 15px; 
}

.jumbotron {
	background-color: rgb(232, 86, 133);
	text-shadow: black 0.2em 0.2em 0.2em;
	color: white;
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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="../js/myPageTak.js"></script>
<link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<script
	src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
  
</head>
<body>
	<div class='container-fluid' id='userPage' style='margin-top: 5%'>
		<div class="jumbotron">
			<h1 class="text-center" style='color: white'>Twitch</h1>
			<p class="text-center">자신만의 방송채널을 가져보세요!</p>
			<p class="text-center">
				<a class="btn btn-primary btn-lg" href="#" role="button" style='border: 1px solid white !important'>방송 하러가기</a>
			</p>
		</div>
		<input type='hidden' id='userId' value='<%=session.getAttribute("session_id")%>'>


		<div class='row'>
			<ul class="nav nav-tabs" style='border: 0 !important'>
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#progfill">프로필</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#donationList">보낸 후원 목록</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#donationList2">받은 후원 목록</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#coinList">결제 목록</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#followList">팔로우 목록</a></li>
			</ul>
		</div>
		<div class='tab-content'>
			<div id='progfill' class='container tab-pane active'>
				<jsp:include page="./userPageMenu1.jsp" />
			</div>
			<div id='donationList' class='container tab-pane'>
				<jsp:include page="./userPageMenu2.jsp" />
			</div>
			<div id='donationList2' class='container tab-pane'>
				<jsp:include page="./userPageMenu3.jsp" />
			</div>

			<div id='coinList' class='container tab-pane'>
				<jsp:include page="./userPageMenu4.jsp" />
			</div>

			<div id='followList' class='tab-pane'>
				<jsp:include page="./follower.jsp" />
			</div>
		</div>
	</div>

	<%@include file="../footer.jsp"%>
	<script>
	userInit();
	paymentInit();
	donationInit();
	donation2Init();
	followers();
	</script>
</body>
</html>