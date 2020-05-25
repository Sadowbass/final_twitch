let uk_main = {}

uk_main.stream = function() {
	$("#fold").click(function() {
		$("#cht_div").css("display", "none");
		$("#video_div").removeClass("col-md-10");
		$("#video_div").addClass("col-md-12");
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
		}
	});
}


/*
 * 보류
uk.connectWS=function(mid){
	console.log("mid::"+mid);

	ws = new WebSocket("ws://192.168.0.77:8845/final_twitch/cht?"+mid);

	ws.onopen = function (event) {console.log("open:::",event);}
	ws.onclose = function (event) {console.log("close:::",event);}
	ws.onerror = function (event) { console.log("error:::",event); };

	ws.onmessage = function (event) {
		$('<div></div>').html(event.data).appendTo('#chtArea');
		console.log("top",$('#chtArea').scrollTop());
		console.log("height",$('#chtArea').prop('scrollHeight'))
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
*/


