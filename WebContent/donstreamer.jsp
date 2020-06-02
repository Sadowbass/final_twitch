<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script src='/js/Winwheel.js'></script>
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/earlyaccess/jejugothic.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>
<meta charset="UTF-8" />
<title>donation</title>
<style>
html {
	width: 100%;
}

body {
	width: 100%;
}

.added-text{
    color:rgb(24,201,255);
}

#text-view {
	/* color:#ffffff; */
	display: none;
	width: 100%;
    text-align: center;
}

#video-view {
	/* color:#ffffff; */
	display: none;
	width: 100%;
}

#ytplayer{
	display:none;
}
#donationRoulette{
	display: none;
}

span {
	color: rgb(255, 255, 255);
	font-family: "Jeju Gothic";
	font-size: 36px;
	line-height: 140%;
	margin: auto;
	text-align: center;
	text-shadow: 0 0 0.8px #000, 0 0 0.8px #000, 0 0 0.8px #000, 0 0 0.8px
		#000, 0 0 0.8px #000, 0 0 0.8px #000, 0 0 0.8px #000, 0 0 0.8px #000,
		0 0 0.8px #000, 0 0 0.8px #000;
}
td.the_wheel
{
    background-image: url(/img/wheel_back.png);
    background-position: center;
    background-repeat: none;
}

div.power_controls
{
    margin-right:70px;
}


</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<script
	src="https://code.responsivevoice.org/responsivevoice.js?key=WpsYh9WB"></script>
</head>
<body>
	<form id="user-info">
		<!--<input type="hidden" name="mId" id="mId" value="${mId}">-->
		<input type="hidden" name="mId" id="mId" value=${mId}>
	</form>
	<div align="center" id='donationRoulette'>
            <table cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td width="438" height="582" class="the_wheel" align="center" valign="center">
                        <canvas id="canvas" width="434" height="434">
                           
                        </canvas>
                    </td>
                </tr>
            </table>
    </div>

	<div id="text-view">
		<img
			src="https://toothcdn.xyz:8432/uploaded/c5ebb8db982555470878a53cc8304ab5/alert_donation_1.img?v=1"
			style="width: 40%; top:-10%" id='imgDona'>
        <br />
		<span id="text-id" class="added-text"></span>
        <span id="selectId">님이 </span>
        <span id="text-amount" class="added-text"></span>
        <span id="selectDon">원을 후원하셨습니다.</span>
        <br />
		<span id="text-content"></span>
	</div>

 	<iframe id="ytplayer" type="text/html" width="700" height="430"
	frameborder="0" allowfullscreen></iframe>

	<script>
	

	
		$(document).ready(
						function() {
							$('#donationRoulette').hide();
							/*     	var coin = new Audio("http://assets.mytwip.net/sounds/Coins.mp3");
							 var award = new Audio("http://assets.mytwip.net/sounds/The_award.mp3"); */
							var coin = new Audio();
							coin.src = "http://assets.mytwip.net/sounds/Coins.mp3";
							var award = new Audio();
							award.src = "http://assets.mytwip.net/sounds/The_award.mp3";
							var youtubeUrl = "https://www.youtube.com/embed/"
							var autoPlay = "?autoplay=1&mute=0";
				            //var wheelPower    = 0;
				            //var wheelSpinning = false;
				            
		

							let fd = $('#user-info').serialize(); 
							(function poll() {
								console.log('...................');
								console.log(fd);
								$.ajax({
									url : "/view-donation-list.sc",
									type : 'post',
									data : fd,
									async : false,
									error : function(data) {
										console.log("에러");
										console.log(data);
										setTimeout(function(){
											poll()
										}, 5000);
									},
									success : function(data) {
										console.log("데이터" + data);
										if(data != null){
											if (data.don_price >= 10000) {
												award.play();
											} else {
												coin.play();
											}
											if(data.type == 0){ // 텍스트 도네이션
												
												$('#imgDona').show();
												
												$('#text-id').html(data.don_mId);
												$('#text-amount').html(data.don_price);
												$('#text-content').html(data.don_content);
												$('#text-view').fadeIn(2500, function(){
													responsiveVoice.speak(data.don_content,"Korean Female");
													setTimeout(function () {
														$('#text-view').fadeOut(4000, function () {
															$('#text-id').html("");
															$('#text-amount').html("");
															$('#text-content').html("");
															poll();
														})
													})
												})
											} else if(data.type == 1) { // 영상 도네이션
												
												$('#imgDona').show();
												
												$('#text-id').html(data.don_mId);
												$('#text-amount').html(data.don_price);
												$('#text-content').html("영상 후원");
												$('#text-view').fadeIn(2500, function(){
													setTimeout(function () {
														$('#text-view').fadeOut(2000, function () {
															var url = data.url.split(".be/")[1];
															$('#text-id').html("");
															$('#text-amount').html("");
															$('#text-content').html("");
															$('#ytplayer').attr('style','display:inline-block;');
															$('#ytplayer').attr('src',youtubeUrl+url+autoPlay);
															setTimeout(function () {
																$('#ytplayer').attr('src',"");
																$('#ytplayer').attr('style', 'display:none;');
																poll();
															},18000)
														})
													}, 3000)
												})
											} else if(data.type == 2){ // 룰렛 도네이션
												console.log(data);
												var array = data.rul_data.split(",");
												
												$('#imgDona').hide();
											
												var wheelPower    = 0;
											    var wheelSpinning = false;
											    
											    var theWheel = new Winwheel({
											        'numSegments'  : array.length,    
											        'outerRadius'  : 212,  
											        'textFontSize' : 28,    
											        'segments'     :       
											        [
											           {'fillStyle' : '#eae56f', 'text' : array[0]},
											           {'fillStyle' : '#89f26e', 'text' : array[1]},
											           {'fillStyle' : '#7de6ef', 'text' : array[2]},
											           {'fillStyle' : '#e7706f', 'text' : array[3]},
											           {'fillStyle' : '#eae56f', 'text' : array[4]},
											           {'fillStyle' : '#89f26e', 'text' : array[5]},
											           {'fillStyle' : '#7de6ef', 'text' : array[6]},
											           {'fillStyle' : '#e7706f', 'text' : array[7]}
											           
											        ],
											        'animation' :          
											        {
											            'type'     : 'spinToStop',
											            'duration' : 5,     
											            'spins'    : 8,    
											            'callbackFinished' : alertPrize
											        }
											    });
												
												
												function startSpin()
											    {
											        if (wheelSpinning == false) {
											            
											            theWheel.animation.spins = 3;

											            theWheel.startAnimation();

											            wheelSpinning = true;
											            
											            responsiveVoice.speak("따라라라라라라라라라라라라라라","Korean Female");
											        }
											    }

											    function alertPrize(indicatedSegment)
											    {
											    	responsiveVoice.speak(indicatedSegment.text,"Korean Female");
											    }
											    
											    function resetWheel()
											    {
											        theWheel.stopAnimation(false);  
											        theWheel.rotationAngle = 0;     
											        theWheel.draw();                
											        wheelSpinning = false;      
											    }
											

											   $('#donationRoulette').fadeIn(3500);
											   startSpin();
												/*
												$('#donationRoulette').fadeIn(3500, function(){
													startSpin();
													setTimeout(function () {
														$('#donationRoulette').fadeOut(5000, function () {
															
	
															poll();
														})
													})
												})
												*/
												$('#text-id').html(data.don_mId);
												$('#text-amount').html(data.don_price);
												$('#text-content').html("돌아라 돌아라~");
												$('#text-view').fadeIn(3500, function(){
													setTimeout(function () {
														$('#donationRoulette').fadeOut(5000);
														$('#text-view').fadeOut(5000, function () {
															$('#text-id').html("");
															$('#text-amount').html("");
															$('#text-content').html("");
															resetWheel();
															
															poll();
														})
													})
												})
											} else {
												$('#imgDona').show();
												$('#selectDon').attr('style','display:none');
												$('#selectId').attr('style','display:none');

												$('#text-id').html("");
												$('#text-content').html(data.don_mId+"님이 구독하셨습니다");
												$('#text-view').fadeIn(2500, function(){
													responsiveVoice.speak(data.don_content,"Korean Female");
													setTimeout(function () {
														$('#text-view').fadeOut(4000, function () {
															$('#text-id').html("");
															$('#selectDon').attr('style','display:inline');
															$('#selectId').attr('style','display:inline');
															$('#text-amount').html("");
															$('#text-content').html("");
															poll();
														})
													})
												})
											}// 텍스트, 영상도네,룰렛 도네 구분 완료
										} else {
											setTimeout(function () {
												poll();
											}, 5000)
										}
									},
									dataType : "json"
								});
							})();
						})
	</script>
</body>
</html>


