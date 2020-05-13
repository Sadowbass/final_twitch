<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- top -->
<!-- top -->
<!-- top -->
<div class="row mx-0">
	<div class="col-md-2 p-0 text-center">
		<i id="fold"class="fas fa-sign-in-alt fa-2x"></i>
	</div>
	<div class="col-md-3 p-0"></div>
	<div class="col-md-2 p-0 text-center">생방송 채팅</div>
	<div class="col-md-3 p-0"></div>
	<div class="col-md-2 p-0 text-center">
		<i class="fas fa-user-circle fa-2x" id="user_div"></i>
	</div>
</div>
<!-- 도네현황 -->
<!-- 도네현황 -->
<!-- 도네현황 -->
<div class="row mx-0">
	<div class="col-md-12 text-center" onclick='closeddd()'>
		<h1>도네이션 현황</h1>
	</div>
</div>
<!-- mid(메인 채팅창) -->
<!-- mid(메인 채팅창) -->
<!-- mid(메인 채팅창) -->
<div class="row mx-0">
	<div class="col-12 chtArea" id="chtArea"></div>
</div>
<!-- bottom -->
<!-- bottom -->
<!-- bottom -->
<!-- 메세지보내기창 -->
<!-- 메세지보내기창 -->
<!-- 메세지보내기창 -->
<div class="row mx-0 cht_send_uk p-2">
	<div class="col-md-12 p-0 chtBox" contenteditable="true"></div>
</div>
<!-- 설정 등 기타 -->
<!-- 설정 등 기타 -->
<!-- 설정 등 기타 -->
<div class="row mx-0 cht_bottom_uk">
	<div class="col-md-3 p-0 mx=0 text-center">
		<i class="fas fa-cog"></i>
	</div>
	<div class="col-md-3 p-0 text-center"></div>
	<div class="col-md-3 p-0 text-center">
		<i class="far fa-smile"></i>
	</div>
	<div class="col-md-3 p-0 text-center" onclick="ms()">
		<a href='#'>
			<i class="far fa-paper-plane"></i>
		</a>
	</div>
</div>
<script>

var ws = new WebSocket("ws://192.168.0.57:8888/final_twitch/cht");

ws.onopen = function (event) {console.log("open:::",event);}
ws.onclose = function (event) {console.log("close:::",event);}
ws.onerror = function (event) { console.log("error:::",event); };

ws.onmessage = function (event) {
	console.log(event.data);
    $('<div></div>').html(event.data).appendTo('#chtArea');
};

let ms=function(){
	  let msg = $('div[contenteditable]').html();
	  console.log(ws.readyState)
	  if(ws.readyState===1){
		  ws.send(msg);
		  $('div[contenteditable]').empty();
	  }

}

let closeddd=function(){
	ws.close();
}

$('div[contenteditable]').keydown(function(e) {
	if (e.keyCode === 13) {
		if (!e.shiftKey) {
			ms();
			return false;
		}
	}
});


</script>
