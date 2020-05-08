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
		<i class="fas fa-user-circle fa-2x"></i>
	</div>
</div>
<!-- 도네현황 -->
<!-- 도네현황 -->
<!-- 도네현황 -->
<div class="row mx-0">
	<div class="col-md-12 text-center">
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
	<div class="col-md-12 p-0 chtBox" contenteditable="true" onkeydown="keyuk()" ></div>
</div>
<!-- 설정 등 기타 -->
<!-- 설정 등 기타 -->
<!-- 설정 등 기타 -->
<div class="row mx-0 cht_bottom_uk">
	<div class="col-md-3 p-0 text-center">
		<i class="fas fa-cog"></i>
	</div>
	<div class="col-md-3 p-0 text-center"></div>
	<div class="col-md-3 p-0 text-center">
		<i class="far fa-smile"></i>
	</div>
	<div class="col-md-3 p-0 text-center" onclick="send()">
		<a href='#'>
			<i class="far fa-paper-plane"></i>
		</a>
	</div>
</div>
<script>
	let send = function() {
		$('<div></div>').html($('div[contenteditable]').html()).appendTo(
				'#chtArea');
		$('#chtArea').scrollTop($('#chtArea').prop('scrollHeight'));
		$('div[contenteditable]').empty();
	}

	$('div[contenteditable]').keydown(function(e) {
		if (e.keyCode === 13) {
			if (!e.shiftKey) {
				send();
				return false;
			}
		}
	});
</script>
