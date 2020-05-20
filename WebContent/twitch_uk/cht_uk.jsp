<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- top -->
<div class="row mx-0">
	<div class="col-md-2 p-0 text-center">
		<i class="fas fa-sign-in-alt fa-2x" onclick='fold()'></i>
	</div>
	<div class="col-md-3 p-0"></div>
	<div class="col-md-2 p-0 text-center">생방송 채팅</div>
	<div class="col-md-3 p-0"></div>
	<div class="col-md-2 p-0 text-center">
		<i class="fas fa-user-circle fa-2x" onclick='usersOrcht()'></i>
	</div>
</div>
<!-- 도네현황 -->
<div class="row mx-0">
	<div class="col-md-12 text-center" onclick='WSclose()'>
		<h1 id='statusBoard'>도네이션 현황</h1>
	</div>
</div>
<!-- mid(메인 채팅창) -->
<div class="row mx-0">
	<div class="col-12 chtArea" id="chtArea"></div>
	<div class="col-12 chtArea" id="userList" style="display: none;"></div>
</div>

<!-- bottom -->
<!-- 메세지보내기창 -->
<div class="row mx-0 cht_send_uk p-2">
	<div class="col-md-12 p-0 chtBox" contenteditable="true"></div>
</div>
<!-- 설정 등 기타 -->
<div class="row mx-0 cht_bottom_uk">
	<div class="col-md-3 p-0 mx=0 text-center">
		<i class="fas fa-cog"></i>
	</div>
	<div class="col-md-3 p-0 text-center"></div>
	<div class="col-md-3 p-0 text-center">
		<i class="far fa-smile"></i>
	</div>
	<div class="col-md-3 p-0 text-center" onclick="WSsend()">
		<a href='#'>
			<i class="far fa-paper-plane"></i>
		</a>
	</div>
</div>
<input type="hidden"  id="streamer_id" value="${vo.mem_Id }"> <!-- 스트리머 아이디 -->
<input type="hidden"  id="session_id" value="${session_id }"> <!-- 채팅방 입장할 로그인한 유저 아이디 -->
<script>
$(document).ready(function(){
	 uk.connectWS($('input#streamer_id').val(), $('input#session_id').val());
});
</script>




















