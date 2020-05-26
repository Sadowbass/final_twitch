<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!-- top -->
<div class="d-flex justify-content-between" style="width: 100%" id="cht_top">
   <div>
      <button class="btn" type="button"><i id="iconRotation" class="fas fa-sign-in-alt fa-2x" onclick='uk.fold()'></i></button>
   </div>
   <div class="text-center">생방송 채팅</div>
   <div>
      <button class="btn" type="button"><i class="fas fa-user-circle fa-2x" onclick='uk.usersOrcht()'></i></button>
   </div>
</div>
<!-- satus -->
<div style="width: 100%" id="statusBoardSurround">
   <h1 id='statusBoard' class="text-center">도네이션 현황</h1>
</div>
<!-- 채팅창 -->
<div class="chtArea p-2 mostly-customized-scrollbar px-2" id="chtArea"></div>
<div class="chtArea p-2 mostly-customized-scrollbar px-2" id="userList" style="display: none;"></div>
<!-- 메세지보내기창 -->
<div class="cht_send_uk rounded invisible-scrollbar p-1" contenteditable="true"></div>
<!-- 설정 등 기타 -->
<div class="cht_bottom_uk d-flex">
   <div class="mr-auto py-2 px-3 dropup">
      <button class="btn dropdown" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-cog" ></i></button>
      <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
   </div>
   <div class="p-2">
      <button class="btn" type="button"><i class="far fa-smile"></i></button>
   </div>
   <div class="py-2 px-4" onclick="uk.WSsend()">
      <a href='#'> <button class="btn" type="button"><i class="far fa-paper-plane"></i></button> </a>
   </div>
</div>



<!-- 스트리머 아이디 -->
<input type="hidden" id="streamer_id" value="${vo.mem_id }">
<!-- 채팅방 입장할 로그인한 유저 아이디 -->
<input type="hidden" id="session_id" value="${session_id }">
<script>
	$(document).ready(function() {
		uk.connectWS($('input#streamer_id').val(), $('input#session_id').val());
	});
	console.log('streamer::'+$('input#streamer_id').val(), 'user::'+$('input#session_id').val());
</script>



