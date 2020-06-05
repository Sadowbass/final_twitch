let uk = {}

let ws;
let streamerId;
let loginId;
let loginUserCnt = 0;

/* 스트림 */
uk.stream = function() {

	$.ajax({
		type : 'get',
		url : '/sidebar.sc',
		success : function(data) {
			let left = $('#sidebarplace').html(data).find("#sidebar-navmain")
					.width();
			/* 메인 왼쪽 */
			$(".video_main_uk").css('padding-left', left + 'px');
		}
	});

	/* 오른쪽 */
	uk.rightValue();
	/*탑*/
	uk.topValue();
	/* 브라우저 크기 발뀔시 */
	$(window).resize(function() {
		/* 왼쪽 */
		uk.leftValue();
		/* 오른쪽 */
		uk.rightValue();
		/* 비디오랑 채팅만 */
		uk.twoView();
		/*탑*/
		uk.topValue();
	});
	/* 스크롤시 */
	/*
	 * $(window).scroll(function(){ uk.minimization(); });
	 */

}

/* 유저목록이랑 채팅창 변경 */
uk.usersOrcht = function() {
	if ($('div#chtArea').css('display') == 'block') {
		$('#statusBoard').html('유저 목록(' + loginUserCnt + ')');
		$('div#chtArea').css('display', 'none');
		$('div#userList').css('display', 'block');
	} else {
		$('#statusBoard').html('도네이션 현황');
		$('div#chtArea').css('display', 'block');
		$('div#userList').css('display', 'none');
	}
}

/* strea.uk fold */
uk.fold = function() {
	$("#cht_div").css("display", "none");
	$('#unfold').css('display', 'block');
	$("#video_div").removeClass("col-md-10");
	$("#video_div").addClass("col-md-12");
	$("#unfold").addClass("d-none d-md-block");
	uk.rightValue();
}
/* strea.uk unfold */
uk.unfold = function() {
	$('#unfold').css('display', 'none');
	$("#cht_div").css("display", "block");
	$("#video_div").removeClass("col-md-12");
	$("#video_div").addClass("col-md-10");
	$("#unfold").removeClass("d-none d-md-block");
	uk.rightValue();
}

/*탑*/
uk.topValue=function(){
	let top=$("nav").height();

	/*chtArea 높이*/
	let height=window.innerHeight-(top+$("#cht_top").height()+$("#statusBoardSurround").height()+$(".cht_send_uk").height()+$(".cht_bottom_uk").height()+20)

	/*1000이하 되면*/
	if ($(window).width() < 1000) {
		top=0;
		height=window.innerHeight-($(".video_main_uk").height()+$(".cht_send_uk").height()+$(".cht_bottom_uk").height()+20) /*채팅창 높이 조정*/
	}
	console.log('top',top);
	$(".video_main_uk").css('padding-top', top + 'px');
	$("#cht_div").css('padding-top',+top + 'px');

	$(".chtArea").height(height);
}

/* 왼쪽 */
uk.leftValue = function() {
	let left = $('#sidebar-navmain').width();
	$(".video_main_uk").css('padding-left', left + 'px');
	/*1000이하 되면 0주기*/
	if ($(window).width() < 1000) {
		$(".video_main_uk").css('padding-left', 0 + 'px');
	}
}

/* 오른쪽 */
uk.rightValue = function() {

	let right = 0;

	if ($("#cht_div").css("display") == "block") {
		right = $("#cht_div").width();
	} else {
		right = $("#unfold").width();
	}
	$(".video_main_uk").css('padding-right', right + 'px');
	/*1000이하 되면 0주기*/
	if ($(window).width() < 1000) {
		$(".video_main_uk").css('padding-right', 0 + 'px');
	}
}

/* 소켓 연결시 */
uk.connectWS = function(streamer, login) {
	let totalUserCnt = 0;

	streamerId = streamer;
	/* loginId=login; */
	loginId = '임시';

	ws = new WebSocket("ws://daum123.gonetis.com/cht?" + streamerId);

	ws.onopen = function(event) {
		console.log("채팅 서버 접속 완료");
	}
	ws.onclose = function(event) {
		console.log("채팅 서버 접속 종료");
	}
	ws.onerror = function(event) {
		console.log("에러 발생 !!! ");
	};

	ws.onmessage = function(event) {
		let jsObj = JSON.parse(event.data); /*
											 * cht_oid cht_txt users addUser
											 * delUser accUser
											 */

		/* 로그인+로그아웃 total 시청자 수 */
		if (jsObj.totalSession) {
			totalUserCnt = jsObj.totalSession;
			console.log('totalUserCnt1111', totalUserCnt);
			console.log('jsObj.totalSession2222', jsObj.totalSession);
		}
		if (jsObj.addTotalSession) {
			totalUserCnt += jsObj.addTotalSession;
			console.log('totalUserCnt3333', totalUserCnt);
			console.log('jsObj.addTotalSession4444', jsObj.addTotalSession)
			$('#totalUserCnt').html(totalUserCnt);
		}

		/* 채팅! 발신자랑 채팅내용 chtArea에 붙이기 */
		if (jsObj.cht_oid && jsObj.cht_txt && $('#chtArea').length) {
			$('<div></div>').html(jsObj.cht_oid + ': ' + jsObj.cht_txt)
					.appendTo('#chtArea');
			$('#chtArea').scrollTop($('#chtArea').prop('scrollHeight'));
		}

		/* 유저목록! 로그인한 시청자 목록 userList에 추가하고 나간사람 지우기 */
		if ($('#userList').length) {
			/* 처음 들어왔을때 기존 채팅방 참여 유저 목록 출력 */
			if (jsObj.users) {
				$(jsObj.users).each(
						function(index, item) {
							$('<div class=' + item + '></div>').html(item)
									.appendTo('#userList');
						});
				/* 처음 들어왔을때 로그인 한 기존 채팅방 참여 유저 수 */
				loginUserCnt = jsObj.users.length;
			}
			/* 새로운 사람 들어오면 유저리스트에 추가하기 */
			if (jsObj.addUser) {
				$('<div class=' + jsObj.addUser + '></div>')
						.html(jsObj.addUser).appendTo('#userList');
				loginUserCnt++;
			}
			/* 나간 유저 지우기 */
			if (jsObj.delUser) {
				$('div[class=' + jsObj.delUser + ']').remove();
				loginUserCnt--;
			}
		}

		/* 누적 시청자수! */
		if ($('#accArea').length && jsObj.accUser) {
			$('#accArea').html(jsObj.accUser);
		}

		/* 현재 보고있는 로그인한 유저 수 */
		if ($('#loginUserCnt').length) {
			$('#loginUserCnt').html(loginUserCnt);
		}

	}

	/* 엔터키 누르면 전송 내꺼 */
	$('div[contenteditable]').keydown(function(e) {
		if (e.keyCode === 13) {
			if (!e.shiftKey) {
				uk.WSsend();
				return false;
			}
		}
	});
	/* 엔터키 누르면 전송 영탁형꺼 */
	$('input#sendArea').keydown(function(e) {
		if (e.keyCode === 13) {
			if (!e.shiftKey) {
				uk.WSsend();
				return false;
			}
		}
	});

}
/* socket 전송 메소드 */
uk.WSsend = function() {

	/* 내꺼 전송 */
	if (ws.readyState === 1 && loginId && $('div[contenteditable]').html()) {
		ws.send($('div[contenteditable]').html());
		$('div[contenteditable]').empty();
	}
	/* 영탁형꺼 전송 */
	if (ws.readyState === 1 && $('input#sendArea').val()) {
		ws.send($('input#sendArea').val());
		$('input#sendArea').val('');
	}

}
/* socket close 메소드 */
uk.WSclose = function() {
	ws.close();
}

/* 최소화 됐을때 */
uk.minimization = function() {
	let top = $(window).scrollTop();
	let height = $("#mediaplayer").height();

	if (top > height) {
		$("#mediaplayer").css({
			position : 'fixed',
			bottom : '20px',
			left : '300px',
			width : '350px',
			height : '250px'
		});
	} else {
		$("#mediaplayer").css({
			position : 'static',
			width : '100%',
			height : ''
		});
	}
}

/*비디오랑 채팅만*/
uk.twoView = function() {
	console.log($(window).width());
	if ($(window).width() < 1000) {
		console.log('here');

		$("#topplace").css("display", "none");
		$("#sidebarplace").css("display", "none");

		$("#videoTop").attr("style" ,"display : none !important");
		$("#videoEtc").attr("style" ,"display : none !important");
		$("#videoEtc2").attr("style" ,"display : none !important");
		$("#cht_top").attr("style" ,"display : none !important");
		$("#statusBoardSurround").attr("style" ,"display : none !important");
		$("#userList").attr("style" ,"display : none !important");
		$("#unfold").attr("style" ,"display : none !important");


		$("#cht_div").attr("style" , "position: relative !important");
		$("#cht_div").css("width" , "100%");
	}else{
		$("#topplace").css("display", "block");
		$("#sidebarplace").css("display", "block");

		$("#videoTop").attr("style" ,"display : flex !important");
		$("#videoEtc").attr("style" ,"display : flex !important");
		$("#videoEtc2").attr("style" ,"display : flex !important");
		$("#cht_top").attr("style" ,"display : flex !important");
		$("#statusBoardSurround").attr("style" ,"display : block !important");

		$("#cht_div").attr("style" , "position: fixed !important");
		$("#cht_div").css({
			"width" : "300px",
			"right": "0",
			"bottom":"0"
		});
	}

}
