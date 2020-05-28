/**
 * 
 */

function userInit() {
	
	let userId = $('#userId').val();
	
	
	$.ajax({
		url : 'userInit.bc',
		type : 'post',
		async: false,
		data : {"mId": userId},
		error : function(xhr, status, error){
			  console.log(xhr);
		},
		success : function(data, xhr, status ){	
			
				$('#progfill').html(data);	
		}
			
	})
	
	
}

function pwdBlur() {
	
	let pwd = $('#pwdCheck').val();
	let mId = $('#userId').val();
	$.ajax({
		url : 'pwdCheck.bc',
		type : 'post',
		dataType : 'text',
		async: false,
		data : {"pwd": pwd,"mId":mId},
		error : function(xhr, status, error){
			  console.log(xhr);
		},
		success : function(data, xhr, status ){	
			if(data == "성공"){
				
				toastr.options = {
						"closeButton" : false,
						"debug" : false,
						"newestOnTop" : false,
						"progressBar" : false,
						"positionClass" : "toast-center-center",
						"preventDuplicates" : false,
						"onclick" : null,
						"showDuration" : "300",
						"hideDuration" : "1000",
						"timeOut" : "2000",
						"extendedTimeOut" : "1000",
						"showEasing" : "swing",
						"hideEasing" : "linear",
						"showMethod" : "fadeIn",
						"hideMethod" : "fadeOut",
						"bdColor" : "#444"
					}
				toastr.success('기존 비밀번호가 일치합니다.');
				
			}else if(data == "실패"){
				toastr.options = {
						"closeButton" : false,
						"debug" : false,
						"newestOnTop" : false,
						"progressBar" : false,
						"positionClass" : "toast-center-center",
						"preventDuplicates" : false,
						"onclick" : null,
						"showDuration" : "300",
						"hideDuration" : "1000",
						"timeOut" : "2000",
						"extendedTimeOut" : "1000",
						"showEasing" : "swing",
						"hideEasing" : "linear",
						"showMethod" : "fadeIn",
						"hideMethod" : "fadeOut",
						"bdColor" : "#444"
					}
				toastr.error('기존 비밀번호가 일치하지 않습니다.');
			}
				
		}
			
	})
}

function pwdCheckBlur(){
	if($('#userPwd').val() != $('#userPwdCheck').val()){
		let html = "<br/><div class='warning' style='width: 60%'>" +
  		"<b>비밀번호가 일치하지 않습니다.</b>" +
  		"</div>";
		$('#checkDiv').html(html);
		$('#checkDiv').show();
	}else{
		let html = "<br/><div class='success' style='width: 60%'>" +
  		"<b>비밀번호가 일치합니다.</b>" +
  		"</div>";
		$('#checkDiv').html(html);
		$('#checkDiv').show();
	}
}


function updatePwd() {
	
	Swal.fire({
		  title: '<img src="../img/Twitch_logo.png" width="100px">',
		  width: 600,
		  padding: '3em',
		  showCancelButton: true,
		  confirmButtonText: '변경',
		  confirmButtonColor: 'rgb(232, 86, 133)',
		  cancelButtonText: '닫기',
		  html: "<font color='black' style='font-weight: bold'>비밀번호 재설정</font>" +
		  		"<br/><br/><div class='warning'>" +
		  		"<b>경고:</b>" +
		  		"비밀번호를 변경하면 <b>스팀 키에 대한 인증이 무효화</b>되며 서드 파티 서비스 제공업체에 발급된 기존 계정 인증" +
		  		"이 철회됩니다. 기존 서드 파티 서비스 제공업체에 대한 인증을 다시 받으려면 각 서비스 제공업체의 웹사이트를 직접 방문하여 계정 연" +
		  		"결 절차를 따라야 할 수 있습니다." +
		  		"</div>" +
		  		"<br/><p style='color: rgb(232, 86, 133);font-weight: bold'>기존 비밀번호</p><input type='text' id='pwdCheck' onblur='pwdBlur()' style='background-color: rgb(233,236,239)' ><br/>" +
		  		"<p style='color: rgb(232, 86, 133);font-weight: bold'>새 비밀번호</p><input type='text' id='pwdCheck2' style='background-color: rgb(233,236,239)'><br/>" +
		  		"<p style='color: rgb(232, 86, 133);font-weight: bold'>비밀번호 확인</p><input type='text' id='pwdCheck3' style='background-color: rgb(233,236,239)'><br/>",
		  backdrop: `
		    rgba(232, 86, 133,0.4)
		    left top
		    no-repeat
		  `
	}).then((result) => {
		  if (result.value) {
			  
			  if($('#pwdCheck').val() != $('#userPwd').val()){
				  toastr.error('기존 비밀번호가 일치하지 않습니다.');
				  return;
			   }
			  
			   if($('#pwdCheck').val() == '' ||  $('#pwdCheck2').val() == '' || $('#pwdCheck3').val() == ''){
				   toastr.error('입력 값에 공백이 있습니다.');
				   return;

			   }
			    
			   if($('#pwdCheck2').val() !== $('#pwdCheck3').val()){
				   toastr.error('새 비밀번호가 일치하지 않습니다.');
				   return;
			   }else if($('#pwdCheck2').val() === $('#pwdCheck3').val()){
				   
				   let pwd = $('#pwdCheck2').val();
				   let mId = $('#userId').val();
					
				   $.ajax({
						url : 'updatePwd.bc',
						type : 'post',
						dataType : 'text',
						async: false,
						data : {"pwd": pwd,"mId":mId},
						error : function(xhr, status, error){
							  console.log(xhr);
						},
						success : function(data, xhr, status ){	
							if(data == "성공"){
								
								toastr.options = {
										"closeButton" : false,
										"debug" : false,
										"newestOnTop" : false,
										"progressBar" : false,
										"positionClass" : "toast-center-center",
										"preventDuplicates" : false,
										"onclick" : null,
										"showDuration" : "300",
										"hideDuration" : "1000",
										"timeOut" : "2000",
										"extendedTimeOut" : "1000",
										"showEasing" : "swing",
										"hideEasing" : "linear",
										"showMethod" : "fadeIn",
										"hideMethod" : "fadeOut",
										"bdColor" : "#444"
									}
								toastr.success('비밀번호가 변경되었습니다.');
								$('#userPwd').val(pwd);
								
							}else if(data == "실패"){
								toastr.options = {
										"closeButton" : false,
										"debug" : false,
										"newestOnTop" : false,
										"progressBar" : false,
										"positionClass" : "toast-center-center",
										"preventDuplicates" : false,
										"onclick" : null,
										"showDuration" : "300",
										"hideDuration" : "1000",
										"timeOut" : "2000",
										"extendedTimeOut" : "1000",
										"showEasing" : "swing",
										"hideEasing" : "linear",
										"showMethod" : "fadeIn",
										"hideMethod" : "fadeOut",
										"bdColor" : "#444"
									}
								toastr.error('변경 중 오류가 발생하였습니다.');
							}
								
						}
							
					})
				   
			   }

			  
			  // if 끝
			  }
			})
	
	
	
}

function insertCoin() {
	
	
	Swal.fire({
		  title: '<img src="../img/Twitch_logo.png" width="100px">',
		  html : "<div class='warning'>" +
		  		"<b>결제하실 금액을 입력해주세요.</b>" +
		  		"</div>",
		  input: 'text',
		  inputAttributes: {
		    autocapitalize: 'off'
		  },
		  showCancelButton: true,
		  confirmButtonText: '입력',
		  confirmButtonColor: 'rgb(232, 86, 133)',
		  showLoaderOnConfirm: true,
		  showClass: {
			    popup: 'animate__animated animate__fadeInDown'
			  },
			  hideClass: {
			    popup: 'animate__animated animate__fadeOutUp'
			  },
			  backdrop: `
				    rgba(232, 86, 133,0.4)
				    left top
				    no-repeat
				  `,
		  allowOutsideClick: () => !Swal.isLoading()
		}).then((result) => {
		  if (result.value) {
			  
				if(isNaN(result.value) == true) {
					Swal.fire({
						  position: 'center',
						  icon: 'error',
						  title: '<font color="black">잘못된 값을 기입하셨습니다.</font>',
						  showConfirmButton: false,
						  timer: 1500
						})
					return;
				}else{
					
				    var IMP = window.IMP; // 생략가능
				    IMP.init('imp90488572'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
				    var msg;
				    
				    IMP.request_pay({
				        pg : 'kakaopay',
				        pay_method : 'card',
				        merchant_uid : 'merchant_' + new Date().getTime(),
				        name : 'Twitch',
				        amount : result.value,
				        buyer_email : 'tac456@naver.com',
				        buyer_name : '정영탁',
				        buyer_tel : '01028232516',
				        buyer_addr : '김포시',
				        buyer_postcode : '123-456',
				        //m_redirect_url : 'http://www.naver.com'
				    }, function(rsp) {
				        if ( rsp.success ) {
				            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
				            jQuery.ajax({
				                url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
				                type: 'POST',
				                dataType: 'json',
				                data: {
				                    imp_uid : rsp.imp_uid
				                    //기타 필요한 데이터가 있으면 추가 전달
				                }
				            }).done(function(data) {
				                //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
				                if ( everythings_fine ) {
				                    msg = '결제가 완료되었습니다.';
				                    msg += '\n고유ID : ' + rsp.imp_uid;
				                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
				                    msg += '\결제 금액 : ' + rsp.paid_amount;
				                    msg += '카드 승인번호 : ' + rsp.apply_num;
				                    
				                    alert(msg);
				                } else {
				                    //[3] 아직 제대로 결제가 되지 않았습니다.
				                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
				                }
				            });
				            
				        	let userId = $('#userId').val();
				        	let money = result.value;
				        	let msg = '';
				        	
				        	$.ajax({
				        		url : 'insertCoin.bc',
				        		type : 'post',
				        		async: false,
				        		data : {"mId": userId,"money":money},
				        		dataType : 'text',
				        		error : function(xhr, status, error){
				        			  console.log(xhr);
				        		},
				        		success : function(data, xhr, status ){	
				        			msg = data;
				        			
				        		}
				        			
				        	})
				            
				            if(msg == '성공'){
							Swal.fire({
								  position: 'center',
								  icon: 'success',
								  title: '<font color="black">결제가 완료되었습니다.</font>',
								  showConfirmButton: false,
								  timer: 1500
								})
								
							let oldMoney = $('#userCoin').val();
		        			$('#userCoin').val(Number(oldMoney) + Number(money) + "");
				            }else{
				            	Swal.fire({
									  position: 'center',
									  icon: 'error',
									  title: '<font color="black">결제에 실패하였습니다.</font>',
									  showConfirmButton: false,
									  timer: 1500
									})
				            }
								
				        } else {
							Swal.fire({
								  position: 'center',
								  icon: 'error',
								  title: '<font color="black">결제에 실패하였습니다.</font>',
								  showConfirmButton: false,
								  timer: 1500
								})
				        }
				    });
					
					
				}
			  
				
				
		  }
		})
	
	
	
	
	
}