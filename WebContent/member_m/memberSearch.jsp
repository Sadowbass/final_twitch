<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="/js/login_m.js"></script>
</head>
<body>
<body id="page-top2">
<%@include file="top2.jsp" %>
<form id="signupform" class="form-horizontal" role="form" commandName = "userDto" method="post">
		<div>
			<div>
				<h1 class='text-center'> 계정으로 들아가기</h1>
				<div>
					<p class='text-center'>계정 정보에 관한 정보를 알려주세요</p>
				</div>
				<div>
					<div class='text-center'>
						<label style='font-weight : bold; font-size : 20px;'>이메일을 입력하세요</label>
						<div>
							<input type="text" class="serEmail" id="serEmailm" name="mem_email" aria-label="이메일 "/>
						</div>
					</div>
					<div class='text-center'>
						<button disabled="true" id="btnNextm">계속</button>
               			<a href = "/">홈으로</a>
					</div>
				</div>
			</div>
		</div>
		</form>
</body>

<script>
	lm.func();
	$(function(){
		$(".serEmail").on('input', function(){
			if($('#serEmailm').val().indexOf('@') && $('#serEmailm').val().indexOf('.com') > -1){
				$('#btnNextm').attr("disabled", false);
			}else if($('#serEmailm').val().indexOf('@') && $('#serEmailm').val().indexOf('.net') > -1) {
				$('#btnNextm').attr("disabled", false);	
			}else{
				$('#btnNextm').attr("disabled", true);				
			}
			
		})
	})
</script>
</html>