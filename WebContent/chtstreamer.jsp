<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../js/uk_cht.js"></script>
<link rel="stylesheet" href="../css/css_uk.css">
<style>
	html{
		/* overflow-y: hidden; */
	}
	#chtArea{
	overflow-y:hidden;
	max-height:100% !important;
	}
	.sender {
	color: rgb(255, 255, 255);
	font-family: "Jeju Gothic";
	font-size: 36px;
	line-height: 140%;
	margin: auto;
	text-shadow: 0 0 0.8px #000, 0 0 0.8px #000, 0 0 0.8px #000, 0 0 0.8px
		#000, 0 0 0.8px #000, 0 0 0.8px #000, 0 0 0.8px #000, 0 0 0.8px #000,
		0 0 0.8px #000, 0 0 0.8px #000;
	}
	.messages {
	color: rgb(255, 255, 255);
	font-family: "Jeju Gothic";
	font-size: 36px;
	line-height: 140%;
	margin: auto;
	text-shadow: 0 0 0.8px #000, 0 0 0.8px #000, 0 0 0.8px #000, 0 0 0.8px
		#000, 0 0 0.8px #000, 0 0 0.8px #000, 0 0 0.8px #000, 0 0 0.8px #000,
		0 0 0.8px #000, 0 0 0.8px #000;
	}
</style> 
<!-- mid(메인 채팅창) -->
<div>
	<div class="chtArea" id="chtArea" style="color:#ffffff;"></div>
</div>
<input type="hidden" value="${mId }"/>
<script>
var ws
$(document).ready(function(){
	 uk.connectWS($('input[type="hidden"]').val());
});
</script>
