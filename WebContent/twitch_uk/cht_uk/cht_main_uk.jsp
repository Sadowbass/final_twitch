<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<body>
<h1>채팅화면</h1>
<div class="container">




	<!-- chat main -->
	<div class="col-md-3">

		<!-- [접기] [생방송채팅] [유저] 화면 -->
		<div class="row"></div>

		<!-- 도네 현황 화면 -->
		<div class="row"></div>

		<!-- 채팅 화면 -->
		<div class="row"></div>

		<!-- 메세지 보내기 화면 -->
		<div class="row">
			<div class="col-md-3" style="background-color:gray; width: 200px; height: 50px;">
				<div class="row">
					<div class="col-md-3" id='dd' contenteditable="true" >
						<!-- <textarea name="" id="" cols="30" rows="10"></textarea> -->
					</div>
					<div class="col-md-3" style="float: right;" onclick="send()">보내기</div>
				</div>
			</div>
		</div>

		<!-- 환경 설정 등 기타 화면 -->
		<div class="row"></div>

	</div>





</div>

<script>
	let send=function(){
	 	var contenteditable = document.querySelector('[contenteditable]')
	    text = contenteditable.textContent;
			console.log(text);

	}

</script>
</body>
</html>