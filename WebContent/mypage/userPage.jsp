<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<div id='friendList' class='tab-pane'>
				<jsp:include page="./userPageMenu5.jsp" />
			</div>
			<div id='ignoreList' class='tab-pane'>
				<jsp:include page="./userPageMenu6.jsp" />
			</div>
			<div id='ignoreList2' class='tab-pane'>
				<jsp:include page="./userPageMenu7.jsp" />
			</div>
		</div>
	</div>
	<jsp:include page="/logout-modal.jsp"></jsp:include>

	<%@include file="../footer.jsp"%>
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
</body>
</html>