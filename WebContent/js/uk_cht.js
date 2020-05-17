let uk = {}

uk.connectWS=function(mid){
	console.log("mid::"+mid);

	ws = new WebSocket("ws://daum123.gonetis.com/final_twitch/cht?"+mid);

	ws.onopen = function (event) {console.log("open:::",event);}
	ws.onclose = function (event) {console.log("close:::",event);}
	ws.onerror = function (event) { console.log("error:::",event); };

	ws.onmessage = function (event) {
		$('<div class="item"></div>').html(event.data).appendTo('#chtArea');
		$('#chtArea').scrollTop($('#chtArea').prop('scrollHeight'));
	};

	$('div[contenteditable]').keydown(function(e) {
		if (e.keyCode === 13) {
			if (!e.shiftKey) {
				WSsend(); 
				return false;
			}
		}
	});
}

let WSsend=function(){
	  let msg = $('div[contenteditable]').html();
	  if(ws.readyState===1&& msg.trim().length!=0){
		  ws.send(msg);
		  $('div[contenteditable]').empty();
	  }
}

let WSclose=function(){
	ws.close();
}