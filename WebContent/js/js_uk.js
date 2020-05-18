let uk = {}

let ws;
let streamerId;

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
				console.log(data);
				let buffer="";
				data.forEach(function(item){
					console.log(item);
					buffer+="<span>"+item+"</span><br/>";
				});
				$('#divUsers').html(buffer);

			});
		}
	});
}



uk.connectWS=function(streamer, loginId){

	streamerId=streamer;

	console.log("streamerID"+streamerId)
	console.log("loginID"+loginId)

	ws = new WebSocket("ws://192.168.0.57:8888/final_twitch/cht?"+streamerId);

	ws.onopen = function (event) {

		console.log("open:::",event);

		let param={
				streamer: streamerId,
				mid : "rain",
				status: 1
		}
		$.get("enter.uk", param, function(data){
			console.log(data);
		});
	}


	ws.onclose = function (event) {
		console.log("close:::",event);

		let param={
				streamer: streamerId,
				mid : "rain",
				status: 0
		}
		$.get("exit.uk", param, function(data){
			console.log(data);
		});

	}

	ws.onerror = function (event) { console.log("error:::",event); };

	ws.onmessage = function (event) {
		$('<div></div>').html(event.data).appendTo('#chtArea');
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
	  let msg ={"m":$('div[contenteditable]').html()}
	//여기 체크해보기
	console.log($('#session_id').val());
	console.log(msg.length!=0);
	  if(ws.readyState===1 && $('#session_id').val() && msg.length!=0){
		  ws.send(JSON.stringify(msg));
		  $('div[contenteditable]').empty();
	  }
}

let WSclose=function(){
	console.log('click');
	ws.close();
}

/*ajax json*/
var obj = {"name": "kim", "age": 30};

function jsontest() {
    $.ajax({
        url: "enter.uk",
        type: "post",
        data: JSON.stringify(obj),
        dataType: "json",
        contentType: "application/json",
        success: function(data) {
            alert("성공");
        },
        error: function(errorThrown) {
            alert(errorThrown.statusText);
        }
    });
}