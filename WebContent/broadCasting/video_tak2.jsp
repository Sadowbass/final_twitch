<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<script src="../vendor/jwplayer7/jwplayer.js"></script>
	<script>
		jwplayer.key = 'iiL9xxalkP7di2nLZ3tPLw0NLBCHdHBe8i3QDQ==';
	</script>

	<input type='hidden' value='${msg }' id='msgBroadCasting'/>
	<div id="main" style="width: 100%;">
		<div id="mediaplayer"></div>
	</div>
	 
	<script>
		jwplayer('mediaplayer').setup({

			width : "100%",

			primary : "flash",

			autostart : "true",

			//repeat: 'always',

			androidhls : false,

			abouttext : "얍얍",
			
			image: "../img/loding.png",

			aboutlink : "http://www.jhta.co.kr",

			sources : [ {
				file : "rtmp://192.168.0.77/hls/",
			}, {
				file : "http://192.168.0.77:8845/hls/.m3u8"
			} ]
		});
		
		jwplayer().onSetupError(function() { 
	        document.getElementById('mediaplayer').innerHTML = '<img src="../img/loding.png" width="100%"/>';
	   });
		
		if($('#msgBroadCasting').val() == '입력성공'){
			Swal.fire({
				  position: 'center',
				  icon: 'success',
				  title: '<font color="white">방송 송출이 시작되었습니다.</font>',
				  background: '#18181b',
				  showConfirmButton: false,
				  timer: 1500
				})
			$('#updateBroadCasting').show();
			$('#streamKey').prop('readonly',true); // 스트림키 값 못바꾸게
			
		}else if($('#msgBroadCasting').val() == '입력실패'){
			Swal.fire({
				  position: 'center',
				  icon: 'error',
				  title: '<font color="white">방송 송출에 실패하셨습니다.</font>',
				  background: '#18181b',
				  showConfirmButton: false,
				  timer: 1500
				})
			if($('#pk_switch').hasClass('on') === true){ 
					
				$('#pk_switch').toggleClass('on');
					
			}
		}else if($('#msgBroadCasting').val()=='삭제성공'){
			Swal.fire({
				  position: 'center',
				  icon: 'success',
				  title: '<font color="white">방송 송출이 중지되었습니다.</font>',
				  background: '#18181b',
				  showConfirmButton: false,
				  timer: 1500
				})
				
			$('#updateBroadCasting').hide(); // 스트림키 값 수정할 수 있게
			$('#streamKey').prop('readonly',false);
		}else if($('#msgBroadCasting').val()=='삭제실패'){
			Swal.fire({
				  position: 'center',
				  icon: 'error',
				  title: '<font color="white">방송 중지에 실패하였습니다.</font>',
				  background: '#18181b',
				  showConfirmButton: false,
				  timer: 1500
				})
				
				if($('#pk_switch').hasClass('on') === false){ 
					
					$('#pk_switch').toggleClass('on');
						
				}
				
		}		
		
		
		
		
	</script>