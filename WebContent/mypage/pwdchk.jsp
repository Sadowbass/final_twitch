<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="../js/login_m.js"></script>
</head>
<body>
<body id="page-top2">
<form name="pwdm" id="pwdm" class="pwdchk" role="form"  method="post">
		<div>
			<div>
				<h1 class='text-center'> 개인 정보 확인</h1>
				<div class='text-center'>
					<input type='text' value="${p.Mem_Id}"/>
					<input type='text' id="pwdcm" class="singUppwd" value="${p.Mem_pwd}"/>
				</div>
				<div>
					<div class='text-center'>
						<label style='font-weight : bold; font-size : 20px;'>비밀번호를 입력하세요</label>
						<div>
							<input type="text" class="singUppwd" id="pwdcmck" />
							 <div id='pwdcmcktext' class='pwdcmcktext'></div>
						</div>
					</div>
					<div class=" text-center">

					<a href = "../member/memberSearch.jsp"><p>비밀번호를 잊어버리셨나요?</p></a>
					</div>
					<div class='text-center'>
						<button id="btnPwdm" name="btnPwdm" class="btnPwdm">
							<a  href="#" id="mypage/profile" onclick="pagemove(this)"> &nbsp; 계속</a>
						</button>
		
					</div>
				</div>
			</div>
		</div>
		</form>
</body>

<script>
//lm.func();
	$(document).ready(function() {
		$('#btnPwdm').hide();
	})
	 $(function(){
	    	$('#pwdcmck').on('keyup',function(){
	    	
	    		
				if($('#pwdcm').val() != $('#pwdcmck').val()){
					$('#pwdcmcktext').text("비밀번호가 일치하지 않습니다.");
					$('#pwdcmcktext').css('color', '#ff0055');
					$(this).css('border', '1px solid #ff0055');
					$("#btnPwdm").hide();
				}else{
					$('#pwdcmcktext').text("");
					$('#pwdcmcktext').css('color', '#ff0055');
					$(this).css('border', '1px solid #000000');
	      			$("#btnPwdm").show();
				}
	      		})		
	      		})
	 

</script>
</html>











