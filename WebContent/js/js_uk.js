let uk = {}

let ws;
let streamerId;
let loginId

uk.stream = function() {
	$("#fold").click(function() {
		$("#cht_div").css("display", "none");
		$("<div class='col-md-2' id='unfold' style='position:fixed; right:-240px; margin-top:5px;'><i class='fas fa-sign-out-alt fa-2x fa-rotate-180' onclick='unfold()'></i></div>").appendTo("#add_unfold");
	});

	$("#user_div").click(function() {
		if ($("#divUsers").length) {
			$("#cht_div").children().eq(1).remove();
			$("#cht_div").children().eq(1).css("display","block");
			$("#cht_div").children().eq(2).css("display","block");
			$("#cht_div").children().eq(3).css("display","block");
			$("#cht_div").children().eq(4).css("visibility","visible");
		} else {
			$("#cht_div").children().eq(1).css("display","none");
			$("#cht_div").children().eq(2).css("display","none");
			$("#cht_div").children().eq(3).css("display","none");
			$("#cht_div").children().eq(4).css("visibility","hidden");
			$("<div class='row'><div class='col-md-12' id='divUsers'><h1>유저 목록</h1></div></div>").insertAfter($("#cht_div").children().first());

			let param={streamer: streamerId}

			$.getJSON('users.uk', param, function(data){

				let buffer="";

				data.forEach(function(item){
					buffer+="<span>"+item+"</span><br/>";
				});

				$('#divUsers').html(buffer);

			});
		}
	});
}



uk.connectWS=function(streamer, login){

	streamerId=streamer;
	/*loginId=login;*/
	loginId='임시';


	ws = new WebSocket("ws://localhost/cht?"+streamerId);

	ws.onopen = function (event) {console.log("채팅 서버 접속 완료");}
	ws.onclose = function (event) {console.log("채팅 서버 접속 종료");}
	ws.onerror = function (event) { console.log("에러 발생 !!! "); };

	ws.onmessage = function (event) {
		let jsonTxt=JSON.parse(event.data);
		console.log(jsonTxt);

		if(jsonTxt.cht_mid&&jsonTxt.cht_txt){
			$('<div></div>').html(jsonTxt.cht_oid+': '+jsonTxt.cht_txt).appendTo('#chtArea');
			$('#chtArea').scrollTop($('#chtArea').prop('scrollHeight'));
		}
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
	  let msg ={
		cht_mid:streamerId,
		cht_oid:loginId,
		cht_txt:$('div[contenteditable]').html()
	  }


	  if(ws.readyState===1 && loginId){
		  ws.send(JSON.stringify(msg));
		  $('div[contenteditable]').empty();
	  }
}

let WSclose=function(){
	ws.close();
}
