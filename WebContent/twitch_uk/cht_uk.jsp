<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- top -->
<div class="d-flex justify-content-between" style="width: 100%">
	<div>
		<i class="fas fa-sign-in-alt fa-2x" onclick='fold()'></i>
	</div>
	<div class="text-center">생방송 채팅</div>
	<div>
		<i class="fas fa-user-circle fa-2x" onclick='usersOrcht()'></i>
	</div>
</div>
<!-- satus -->
<div style="width: 100%">
	<h1 id='statusBoard' class="text-center">도네이션 현황</h1>
</div>
<!-- 채팅창 -->
<div class="chtArea" id="chtArea"></div>
<div class="chtArea" id="userList" style="display: none;"></div>

<!-- 메세지보내기창 -->
<div class="cht_send_uk" contenteditable="true"></div>

<!-- 설정 등 기타 -->
<div class="cht_bottom_uk d-flex">
	<div class="mr-auto py-2 px-3">
		<i class="fas fa-cog"></i>
	</div>
	<div class="p-2">
		<i class="far fa-smile"></i>
	</div>
	<div class="py-2 px-4" onclick="WSsend()">
		<a href='#'> <i class="far fa-paper-plane"></i>	</a>
	</div>
</div>
<input type="hidden" id="streamer_id" value="${vo.mem_Id }">
<!-- 스트리머 아이디 -->
<input type="hidden" id="session_id" value="${session_id }">
<!-- 채팅방 입장할 로그인한 유저 아이디 -->
<script>
	$(document).ready(
			function() {
				uk.connectWS($('input#streamer_id').val(),
						$('input#session_id').val());
			});
</script>




















