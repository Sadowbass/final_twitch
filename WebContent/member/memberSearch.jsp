<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body id="page-top2">
<%@include file="top2.jsp" %>
		<div>
			<div>
				<p class='text-center'> 계정으로 돌아가기</p>
				<div>
					<p class='text-center'>계정 정보에 관한 정보를 알려주세요</p>
				</div>
				<div>
					<div class='text-center'>
						<label >이메일이나 전화번호를 입력하세요</label>
						<div>
							<input type="text" class="serEmail" id="serEmailm" aria-label="이메일 또는 전화번호"/>
						</div>
					</div>
					<div class=" text-center">
					<a href = "idQna.jsp">
					<p>이메일이나 전화에 문제가 있나요?</p>
					</a>
					</div>
					<div class='text-center'>
						<button disabled="true" id="btnNextm">계속</button>
					</div>
				</div>
			</div>
		</div>
		
</body>

<script>
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