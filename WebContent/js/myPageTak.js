/**
 * 
 */

var nameCheck;
let my = {}
var passwordCheck = 0;


my.func = function() {
	
	
	
    $("#btn01").on("click",function(){
    	
		if($('#capchaValue').val() == ''){
			Swal.fire({
				  position: 'center',
				  icon: 'error',
				  title: '<font color="black">자동가입문자를 확인해주세요.</font>',
				  showConfirmButton: false,
				  timer: 1500
				})
			return;		
		}
		
        $.ajax({
            url : "./mypage/capcha.jsp",
            dataType:"json",
            success : function(data) {
               console.log(data.key);
               $("#key").val(data.key);
               $("#div01").html("<img src='./captchaImage/"+data.captchaImageName+"'>");
               if($('#capchaFlag').val() == 'false'){
            	   $("#div01").html('');
               }
            }
         });
         
		
		
        let key = $('#key').val();
        let value = $('#capchaValue').val();
             
        $.ajax({
           url : "./mypage/capcha.jsp",
           data : {"key":key,"value":value},
           dataType:"text",
           success : function(data) {
              if(data == 'true'){
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
				toastr.success('확인이 완료되었습니다.');
                 $('#capchaFlag').val('false');
                 $('#div02').hide();
              }else if(data == 'fals'){
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
				toastr.error('잘못 입력하셨습니다.');
              }
              
           }
        });
     });
	
	
	
	
	
	$('#changeProfill').click(function(){
		$('#userPhoto').click();		
	})	
	
	
	$('#updateProfill').click(function(){
		
		if($('#capchaFlag').val() == 'true'){
			
			Swal.fire({
				  position: 'center',
				  icon: 'error',
				  title: '<font color="black">자동가입문자를 확인해주세요.</font>',
				  showConfirmButton: false,
				  timer: 1500
				})
				return;
	
		}
		

			
		if(nameCheck == false){
			Swal.fire({
				  position: 'center',
				  icon: 'error',
				  title: '<font color="black">닉네임 중복입니다.</font>',
				  showConfirmButton: false,
				  timer: 1500
				})
				
				return;
			
		}
		
		
		
		
		if($('#userPwd').val() != $('#userPwdCheck').val()){
			
			Swal.fire({
				  position: 'center',
				  icon: 'error',
				  title: '<font color="black">비밀번호가 일치하지않습니다.</font>',
				  showConfirmButton: false,
				  timer: 1500
				})
				
				
			      $.ajax({
			          url : "./mypage/capcha.jsp",
			          dataType:"json",
			          success : function(data) {
			             console.log(data.key);
			             $("#key").val(data.key);
			             $("#div01").html("<img src='./captchaImage/"+data.captchaImageName+"'>");
			             $("#capchaFlag").val('true');
			             $('#div02').show();
			          }
			       });
				
				return;
		}
		
		let fd =  new FormData($('#frm_myPage')[0]);
		
		$.ajax({
			url : 'updateProfill.bc',
			type : 'post',
			data : fd,
			contentType : false,
			processData : false,
			error : function(xhr, status, error){
				console.log(error);
			},
			success : function(data, xhr, status ){
				if(data === '실패'){
					Swal.fire({
						  position: 'center',
						  icon: 'error',
						  title: '<font color="black">수정에 실패하셨습니다.</font>',
						  showConfirmButton: false,
						  timer: 1500
						})
				}else if(data ==='성공'){
					Swal.fire({
						  position: 'center',
						  icon: 'success',
						  title: '<font color="black">수정에 성공하셨습니다.</font>',
						  showConfirmButton: false,
						  timer: 1500
						})
				}
			}
				
		})
	})
}

function followers() {
	let mId = $('#userId').val();
	$.ajax({
		type:'post',
		async:false,
		url:'/myFollowers.sc',
		data:{"mId":mId},
		success:(data)=>{
			for(i of data){
				let divColXl3 = document.createElement('div');
				divColXl3.className = "col-xl-3 col-sm-6 mb-3"
				let divChannelsCard = document.createElement('div');
				divChannelsCard.className = "channels-card";
				divChannelsCard.setAttribute("rownum", i.rno);
				let channelsCardImage = document.createElement('div');
				channelsCardImage.className = "channels-card-image";
				let a = document.createElement('a');
				a.className = "img-fluid";
				a.href = "/"+i.mfo_oid;
				let img = document.createElement("img");
				if(i.ph_sysfile != null){
					img.src = "/img/user-photo/"+i.ph_sysfile;
				} else {
					img.src = "/img/s1.png";
				}

				let divChannelBody = document.createElement('div');
				divChannelBody.className = "channels-card-body";
				let channelTitle = document.createElement('div');
				channelTitle.className = "channels-title";
				let a2 = document.createElement('a');
				a2.href = "/"+i.mfo_oid;
				a2.innerText = i.mfo_oid;


				channelTitle.appendChild(a2);
				divChannelBody.appendChild(channelTitle);
				a.appendChild(img);
				channelsCardImage.appendChild(a);
				divChannelsCard.appendChild(channelsCardImage);
				divChannelsCard.appendChild(divChannelBody);
				divColXl3.appendChild(divChannelsCard);
				$('.row-item').append(divColXl3);
			}

		}
	})
}

$(window).scroll(function () {
	var rno = $('.channels-card:last').attr('rownum');
	let mId = $('#userId').val();
	if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
		console.log("??");
		$.ajax({
			type:'post',
			url:"/myFollowers.sc",
			data : {'rno' : rno, 'mId' : mId},
			error:(error)=>{
			console.log(error)
			},
			success:(data)=>{
				console.log(data);
				for(i of data){
					let divColXl3 = document.createElement('div');
					divColXl3.className = "col-xl-3 col-sm-6 mb-3"
					let divChannelsCard = document.createElement('div');
					divChannelsCard.className = "channels-card";
					divChannelsCard.setAttribute("rownum", i.rno);
					let channelsCardImage = document.createElement('div');
					channelsCardImage.className = "channels-card-image";
					let a = document.createElement('a');
					a.className = "img-fluid";
					a.href = "/"+i.mfo_oid;
					let img = document.createElement("img");
					if(i.ph_sysfile != null){
						img.src = "/img/user-photo/"+i.ph_sysfile;
					} else {
						img.src = "/img/s1.png";
					}

					let divChannelBody = document.createElement('div');
					divChannelBody.className = "channels-card-body";
					let channelTitle = document.createElement('div');
					channelTitle.className = "channels-title";
					let a2 = document.createElement('a');
					a2.href = "/"+i.mfo_oid;
					a2.innerText = i.mfo_oid;

					channelTitle.appendChild(a2);
					divChannelBody.appendChild(channelTitle);
					a.appendChild(img);
					channelsCardImage.appendChild(a);
					divChannelsCard.appendChild(channelsCardImage);
					divChannelsCard.appendChild(divChannelBody);
					divColXl3.appendChild(divChannelsCard);
					$('.row-item').append(divColXl3);
				}
			}
		})
	}
})

function paymentInit(){
	
	let mId = $('#userId').val();
	
	$.ajax({
		url : 'paymentInit.bc',
		type : 'post',
		async: false,
		data : {"mId": mId},
		error : function(xhr, status, error){
			  console.log(xhr);
		},
		success : function(data, xhr, status ){	
			$('#coinList').html(data);
		}
			
	})
	
	
	
	
}


function donationInit(){
	
	let mId = $('#userId').val();
	
	$.ajax({
		url : 'donationInit.bc',
		type : 'post',
		async: false,
		data : {"mId": mId},
		error : function(xhr, status, error){
			  console.log(xhr);
		},
		success : function(data, xhr, status ){	
			$('#donationList').html(data);
		}
			
	})
	
	
	
	
}

function donation2Init(){
	
	let mId = $('#userId').val();
	
	$.ajax({
		url : 'donation2Init.bc',
		type : 'post',
		async: false,
		data : {"mId": mId},
		error : function(xhr, status, error){
			  console.log(xhr);
		},
		success : function(data, xhr, status ){	
			$('#donationList2').html(data);
		}
			
	})
	
	
	
	
}

function readURL(input) {
	if (input.files && input.files[0]) {
	var reader = new FileReader();
	reader.onload = function (e) {
	$('#targetImage').attr('src', e.target.result);
	}
	reader.readAsDataURL(input.files[0]);
	}
}

function nameCheckBlur() {
	let userName = $('#userName').val();
	let userId = $('#userId').val();
	
	$.ajax({
		url : 'nameCheck.bc',
		type : 'post',
		async: false,
		data : {"name": userName, "mId" : userId},
		error : function(xhr, status, error){
			  console.log(xhr);
		},
		success : function(data, xhr, status ){			
			if(data === '실패'){
				let html = "<br/><div class='warning' style='width: 60%'>" +
		  		"<b>중복된 닉네임이 있습니다.</b>" +
		  		"</div>";
				$('#checkDiv2').html(html);
				$('#checkDiv2').show();
				nameCheck = false;
			}else if(data ==='성공'){
				let html = "<br/><div class='success' style='width: 60%'>" +
		  		"<b>사용 가능한 닉네임입니다.</b>" +
		  		"</div>";
				$('#checkDiv2').html(html);
				$('#checkDiv2').show();
				nameCheck = true;
			}
			
		}
			
	})
}

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
		  		"<br/><p style='color: rgb(232, 86, 133);font-weight: bold'>기존 비밀번호</p><input type='text' id='pwdCheck' onblur='pwdBlur()' style='height:30px;background-color: rgb(233,236,239);border: 1px solid rgb(232, 86, 133);' ><br/>" +
		  		"<p style='color: rgb(232, 86, 133);font-weight: bold'>새 비밀번호</p><input type='text' id='pwdCheck2' style='height:30px;background-color: rgb(233,236,239);border: 1px solid rgb(232, 86, 133);'><br/>" +
		  		"<p style='color: rgb(232, 86, 133);font-weight: bold'>비밀번호 확인</p><input type='text' id='pwdCheck3' style='height:30px;background-color: rgb(233,236,239);border: 1px solid rgb(232, 86, 133);'><br/>",
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