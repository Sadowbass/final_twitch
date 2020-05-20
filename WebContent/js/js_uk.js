let uk = {}

let ws;
let streamerId;
let loginId;
let loginUserCnt=0;

uk.connectWS=function(streamer, login){
	let totalUserCnt=0;

	streamerId=streamer;
	/*loginId=login;*/
	loginId='임시';


	ws = new WebSocket("ws://192.168.0.57/cht?"+streamerId);

	ws.onopen = function (event) {console.log("채팅 서버 접속 완료");}
	ws.onclose = function (event) {console.log("채팅 서버 접속 종료");}
	ws.onerror = function (event) { console.log("에러 발생 !!! "); };

	ws.onmessage = function (event) {
		let jsObj=JSON.parse(event.data); /* cht_oid cht_txt users addUser delUser accUser */

		/*로그인+로그아웃 total 시청자 수*/
		if(jsObj.totalSession){
			totalUserCnt=jsObj.totalSession;
			console.log('totalUserCnt1111',totalUserCnt);
			console.log('jsObj.totalSession2222',jsObj.totalSession);
		}
		if(jsObj.addTotalSession){
			totalUserCnt+=jsObj.addTotalSession;
			console.log('totalUserCnt3333',totalUserCnt);
			console.log('jsObj.addTotalSession4444',jsObj.addTotalSession)
			$('#totalUserCnt').html(totalUserCnt);
		}

		/*채팅! 발신자랑 채팅내용 chtArea에 붙이기*/
		if(jsObj.cht_oid && jsObj.cht_txt && $('#chtArea').length){
			$('<div></div>').html(jsObj.cht_oid+': '+jsObj.cht_txt).appendTo('#chtArea');
			$('#chtArea').scrollTop($('#chtArea').prop('scrollHeight'));
		}


		/*유저목록! 로그인한 시청자 목록 userList에 추가하고 나간사람 지우기 */
		if($('#userList').length){
			/*처음 들어왔을때 기존 채팅방 참여 유저 목록 출력*/
			if(jsObj.users){
				$(jsObj.users).each(function(index, item){
					$('<div class='+item+'></div>').html(item).appendTo('#userList');
				});
				/*처음 들어왔을때 로그인 한 기존 채팅방 참여 유저 수*/
				loginUserCnt=jsObj.users.length;
			}
			/*새로운 사람 들어오면 유저리스트에 추가하기*/
			if(jsObj.addUser){
				$('<div class='+jsObj.addUser+'></div>').html(jsObj.addUser).appendTo('#userList');
				loginUserCnt++;
			}
			/*나간 유저 지우기*/
			if(jsObj.delUser){
				$('div[class='+jsObj.delUser+']').remove();
				loginUserCnt--;
			}
		}

		/*누적 시청자수!*/
		if($('#accArea').length && jsObj.accUser){
			$('#accArea').html(jsObj.accUser);
		}

		/*현재 보고있는 로그인한 유저 수*/
		if($('#loginUserCnt').length){
			$('#loginUserCnt').html(loginUserCnt);
		}

	}

	/*엔터키 누르면 전송 내꺼*/
	$('div[contenteditable]').keydown(function(e) {
		if (e.keyCode === 13) {
			if (!e.shiftKey) {
				WSsend();
				return false;
			}
		}
	});
	/*엔터키 누르면 전송 영탁형꺼*/
	$('input#sendArea').keydown(function(e) {
		if (e.keyCode === 13) {
			if (!e.shiftKey) {
				WSsend();
				return false;
			}
		}
	});

}
/*socket 전송 메소드*/
let WSsend=function(){

	  /*내꺼 전송*/
	  if(ws.readyState===1 && loginId && $('div[contenteditable]').html()){
		  ws.send($('div[contenteditable]').html());
		  $('div[contenteditable]').empty();
	  }
	  /*영탁형꺼 전송*/
	  if(ws.readyState===1 && $('input#sendArea').val()){
		  ws.send($('input#sendArea').val());
		  $('input#sendArea').val('');
	  }

}
/*socket close 메소드*/
let WSclose=function(){
	ws.close();
}

/*유저목록이랑 채팅창 변경*/
let usersOrcht=function(){
	if($('div#chtArea').css('display')=='block'){
		$('#statusBoard').html('유저 목록('+loginUserCnt+')');
		$('div#chtArea').css('display','none');
		$('div#userList').css('display','block');
	}else{
		$('#statusBoard').html('도네이션 현황');
		$('div#chtArea').css('display','block');
		$('div#userList').css('display','none');
	}
}

/*strea.uk fold*/
let fold=function(){
	console.log('fold');
	$("#cht_div").css("display", "none");
	$('#unfold').css('display','block');
	$("#video_div").removeClass("col-md-10");
    $("#video_div").addClass("col-md-12");
}
/*strea.uk unfold*/
let unfold=function(){
	console.log('unfold');
	$('#unfold').css('display','none');
	$("#cht_div").css("display", "block");
	$("#video_div").removeClass("col-md-12");
    $("#video_div").addClass("col-md-10");
}


