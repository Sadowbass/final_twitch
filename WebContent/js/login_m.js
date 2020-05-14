/**
 * 
 */
 let lm = {}
 
 lm.func= function(){	 
	 	 //회원 가입 유효성 검사
		 //아이디
		 $('#suidm').on('keyup', function(){
			 var msg = $('#suidmck');
			 var eng = $(this).val().search(/[a-zA-Z]/g);
			 var num = $(this).val().search(/[0-9]/g);
			 var kor = $(this).val().search( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g);
			 if($(this).val().length < 2 || $(this).val().length > 16){
					$(msg).text('2자리 ~ 16자리 이내로 입력해주세요.');
					$(msg).css('color', '#ff0055');	
					$(this).css('border', '1px solid #ff0055');
				}else if($(this).val().search(/\s/) != -1){
					$(msg).text('띄어쓰기 없이 입력해 주세요.');
					$(msg).css('color', '#ff0055');
					$(this).css('border', '1px solid #ff0055');
				}else if(kor <= 0){
					$(msg).text('한글은 사용할 수 없습니다.');
					$(msg).css('color', '#ff0055');
					$(this).css('border', '1px solid #ff0055');
				}else{
					$(msg).text("");
					$(this).css('border', '1px solid #000');
				}
		 });
			  
		 //비밀번호
		 $('#supwdm').on('keyup', function(){
				var msg = $('#supwdmck');
				var num = $(this).val().search(/[0-9]/g);
				var eng = $(this).val().search(/[a-zA-Z]/ig);
				var spe = $(this).val().search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);		
				if($(this).val().length < 6 || $(this).val().length > 22){
					$(msg).text('6자리 ~ 22자리 이내로 입력해주세요.');
					$(msg).css('color', '#ff0055');	
					$(this).css('border', '1px solid #ff0055');
				}else if($(this).val().search(/\s/) != -1){
					$(msg).text('띄어쓰기 없이 입력해 주세요.');
					$(msg).css('color', '#ff0055');
					$(this).css('border', '1px solid #ff0055');
				}else if(num < 0 || eng < 0 || spe < 0 ){
					$(msg).text('영문, 숫자, 특수문자를 혼합하여 입력해주세요.');
					$(msg).css('color', '#ff0055');
					$(this).css('border', '1px solid #ff0055');
				}else {
					$(msg).text("");
					$(this).css('border', '1px solid #000');
				}
			});
		 
		//비밀번호 확인
			$('#supwdcm').on('keyup', function(){
				var msg = $('#supwdcmck');
				
				if($(this).val() == ""){
					$(msg).text("비밀번호를 한번 더 입력해 주세요.");
					$(msg).css('color', '#ff0055');
					$(this).css('border', '1px solid #ff0055');
				}else if($('#supwdm').val() != $(this).val()){
					$(msg).text("비밀번호가 일치하지 않습니다.");
					$(msg).css('color', '#ff0055');
					$(this).css('border', '1px solid #ff0055');
				}else{
					$(msg).text("");
					$(this).css('border', '1px solid #000');
				};
			});
		 
			// 이메일
			$('#suemailm').on('keyup', function(){
				var email = $(this).val();
				var msg = $('#suemailmck');
				var emailRule = $(this).val().search(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
					if(email == ""){
						$(this).css('border', '1px solid #ff0055');
						$(msg).css('color', '#ff0055');
						$(msg).text('E-Mail을 입력해주세요.');
					}else if(emailRule < 0){
						$(this).css('border', '1px solid #ff0055');
						$(msg).css('color', '#ff0055');
						$(msg).text('유효하지않은 E-Mail주소입니다.');
					}else{
						$(msg).text("");
						$(this).css('border', '1px solid #000');
					}
			});
			
			
			
			//회원 가입 클릭 
			$('#btnsum').click(function(){
				/*let a = $('#insertm').serialize();
				alert(a);*/
				$('#insertm').attr('action','insert.lm').submit();
			})
			
			
			
			
			
			
			
	 //로그인
	 $('#btnloginm').click(function(){
		let param = $('#frm_loginm').serialize();
		$.post("login.lm", param, function(data, state){
			location.href='login.jsp';
		});
	})	
	//로그아웃
	$('#btnlogoutm').click(function(){
		$.post("logout.lm", null, function(data, state){
			alert(data);
			location.href='index.jsp';
		});
		
	})
	
	
	
	
	
	
}