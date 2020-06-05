let chtstreamer = {}

chtstreamer.connectWS=function(mid){
	ws = new WebSocket("ws://192.168.0.77/cht?"+mid);

	ws.onopen = function (event) {console.log("채팅 접속");}
	ws.onclose = function (event) {console.log("접속 종료");}
	ws.onerror = function (event) { console.log("에러 발생"); };

	ws.onmessage = function (event) {
		/* 채팅! chtArea에 붙이기 */
		let jsObj = JSON.parse(event.data);
		if (jsObj.txt && $('#chtArea').length) {
			let txt=JSON.parse(jsObj.txt)

			$('<div class="item"></div>').html( txt[0]+': '+txt[1]).appendTo('#chtArea');
			$('#chtArea').scrollTop($('#chtArea').prop('scrollHeight'));

			/*
			  $('<div class="dropdown">'+
			  '<a class="dropdown" href="#" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'+
			    txt[0]+'&nbsp&nbsp'+
			  '</a>'+
			    txt[1]+
			  '<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">'+
			    '<a class="dropdown-item" href="#" onclick=uk.plus("'+txt[0]+'")>친구 추가</a>'+
			    '<a class="dropdown-item" href="#" onclick=uk.whisper("'+txt[0]+'")>귓속말</a>'+
			    '<a class="dropdown-item" href="#">채팅 금지</a>'+
			  '</div>'+
			'</div>').appendTo('#chtArea');

			$('#chtArea').scrollTop($('#chtArea').prop('scrollHeight'));*/
		}
	}
}