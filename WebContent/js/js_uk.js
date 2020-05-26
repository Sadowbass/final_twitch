let uk = {}

let ws;
let streamerId;
let loginId;

let accUser=0;

/* 스트림 */
uk.stream = function () {

	$.ajax({
		type: 'get',
		url: '/sidebar.sc',
		success: function (data) {
			let sidebar=$('#sidebarplace').html(data).find("#sidebar-navmain");
			sidebar.addClass("sidebar_uk");
			let left = sidebar.width();
			if($('#sidebarplace').css('display') == 'none')left=0;

			/* 메인 왼쪽 */
			if ($('#sidebarplace').length) {
				$(".video_main_uk").css('padding-left', left + 'px');
			}
		}
	});

	/*반응형*/
	uk.responsive();

	/*크기가 변경되면*/
	$(window).resize(function () {
		uk.responsive(); /*div block or none*/
		uk.unfoldRightOrBottom(); /*unfold right or bottom*/
	});

	/* 스크롤시 */
	$(window).scroll(function(){ uk.minimization(); });

}

/* 유저목록이랑 채팅창 변경 */
uk.usersOrcht = function () {
	if ($('div#chtArea').css('display') == 'block') {
		$('div#chtArea').css('display', 'none');
		$('div#userList').css('display', 'block');
	} else {
		$('#statusBoard').html('도네이션 현황');
		$('div#chtArea').css('display', 'block');
		$('div#userList').css('display', 'none');
	}
}

uk.fold = function () {
	$("#cht_div").css("display", "none");
	if ($(window).width() >= 1000) {
		$('#unfold').css('display', 'block');
	} else {
		$('#unfoldBottom').css('display', 'block');
	}
	uk.rightValue();
}
uk.unfold = function () {
	$("#cht_div").css("display", "block");
	$("#unfold").css("display", "none");
	uk.rightValue();
}
uk.unfoldBottom = function () {
	$("#cht_div").css("display", "block");
	$("#unfoldBottom").css("display", "none");
	uk.rightValue();
}
uk.unfoldRightOrBottom = function () {
	if ($(window).width() >= 1000) {
		if ($('#unfoldBottom').css('display') == 'block' && $("#cht_div").css("display") == "none") {
			$('#unfold').css('display', 'block');
			$('#unfoldBottom').css('display', 'none');
		}
		if ($("#iconRotation").length) {
			$("#iconRotation").removeClass("fa-rotate-90");
		}
	} else {
		if ($('#unfold').css('display') == 'block' && $("#cht_div").css("display") == "none") {
			$('#unfold').css('display', 'none');
			$('#unfoldBottom').css('display', 'block');
		} if ($("#iconRotation").length) {
			$("#iconRotation").addClass("fa-rotate-90");
		}
	}


}



/* 소켓 연결시 */
uk.connectWS = function (streamer, login) {
	console.log('herehere');
	streamerId = streamer;
	loginId=login;

	console.log("streamerId::"+streamerId,"loginId:::",loginId);

	ws = new WebSocket("ws://localhost/cht?" + streamerId);

	ws.onopen = function (event) {
		console.log("채팅 접속");
	}
	ws.onclose = function (event) {
		console.log("접속 종료");
	}
	ws.onerror = function (event) {
		console.log("에러 발생");
	};

	ws.onmessage = function (event) {
		console.log("evnet.data::",event.data);
		let jsObj = JSON.parse(event.data);

		/*내가 입장시! 유저 목록jsonLIst*/
		if(jsObj.userLIst){
			console.log("userLIst",JSON.parse(jsObj.userLIst));
			$(JSON.parse(jsObj.userLIst)).each(function (index, item) {
				$('<div class=' + item + '></div>').html(item).appendTo('#userList');
			});
		}
		/*내가 입장시! 총 시청자수 totalUsers*/
		if(jsObj.totalUsers){
			console.log("totalUsers", jsObj.totalUsers);
			$("#totalUsers").html(jsObj.totalUsers);
		}
		/*총 시청자수+1 addTotal*/
		if(jsObj.addTotal){
			console.log("addTotal", jsObj.addTotal);
			$("#totalUsers").html($("#totalUsers").html()+1);
		}
		/*총 시청자수-1 subTotal*/
		if(jsObj.subTotal){
			console.log("subTotal", jsObj.subTotal);
			$("#totalUsers").html($("#totalUsers").html()-1);
		}
		/*내가 입장시! 누적 시청자수 accUser*/
		if(jsObj.accUser){
			console.log("accUser",jsObj.accUser);
			accUser=jsObj.accUser
			$('#accUser').html(accUser);
		}
		/*누적 시청자수+1 addAcc*/
		if(jsObj.addAcc){
			console.log("addAcc", jsObj.addAcc);
			$("#accUser").html($("#accUser").html()+1);
		}
		/*다른 유저 입장*/
		if (jsObj.addUser) {
			$('<div class=' + jsObj.addUser + '></div>').html(jsObj.addUser).appendTo('#userList');
		}
		/*다른 유저 퇴장*/
		if (jsObj.delUser) {
			$('div[class=' + jsObj.delUser + ']').remove();
		}
		/* 채팅! 발신자랑 채팅내용 chtArea에 붙이기 */
		if (jsObj.mid && jsObj.txt && $('#chtArea').length) {
			$('<div></div>').html(jsObj.mid + ': ' + jsObj.txt).appendTo('#chtArea');
			$('#chtArea').scrollTop($('#chtArea').prop('scrollHeight'));
		}
	}

	/* 엔터키 누르면 전송 내꺼 */
	$('div[contenteditable]').keydown(function (e) {
		if (e.keyCode === 13) {
			if (!e.shiftKey) {
				uk.WSsend();
				return false;
			}
		}
	});
	/* 엔터키 누르면 전송 영탁형꺼 */
	$('input#sendArea').keydown(function (e) {
		if (e.keyCode === 13) {
			if (!e.shiftKey) {
				uk.WSsend();
				return false;
			}
		}
	});
}
/* socket 전송 메소드 */
uk.WSsend = function () {

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
uk.WSclose = function () {
	ws.close();
}
/* 왼쪽 */
uk.leftValue = function () {
	let left = 0;

	/*1000이하 되면 0주기*/
	if ($(window).width() >= 1000) {
		left = $('#sidebar-navmain').width();
	}
	$(".video_main_uk").css('padding-left', left + 'px');
}

/* 오른쪽 */
uk.rightValue = function () {
	let right = 0;
	/*1000이상 되면 값 넣어 주기*/
	if ($(window).width() >= 1000) {
		if ($("#cht_div").css("display") == "block") {
			right = $("#cht_div").width();
		} else {
			right = $("#unfold").width();
		}
	}
	$(".video_main_uk").css('padding-right', right + 'px');
}

/*채팅 과 비디오*/
uk.chtAndVideo = function () {
	/*네비 길이*/
	let top = $("nav").height();
	/* 채팅창 길이 */
	let height = window.innerHeight - (top + $("#cht_top").height()
		+ $("#statusBoardSurround").height()
		+ $(".cht_send_uk").height() + $(".cht_bottom_uk").height() + 20);

	/*1000이하 되면 네비0 채팅방 길이 조정*/
	if ($(window).width() < 1000) {
		/*네비 길이 0*/
		top = 0
		/* 채팅창 길이 조정 */
		height = window.innerHeight - ($(".video_main_uk").height()
			+ $("#cht_top").height()
			+ $(".cht_send_uk").height()
			+ $(".cht_bottom_uk").height() + 20);

		/*채팅 메인 <1000*/

		$("#cht_div").css({
			"position": "relative",
			"width": "100%",
			"padding-top": top + "px"
		});
	} else {
		/*채팅 메인 >10000*/
		$("#cht_div").css({
			"position": "fixed",
			"padding-top": top + "px",
			"width": "300px",
			"right": "0",
			"bottom": "0"
		});
	}

	/* 비디오 상 패딩 */
	$(".video_main_uk").css('padding-top', top + 'px');
	/* 채팅창 길이 */
	$(".chtArea").height(height);
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
			position : 'relative',
			width : '100%',
			height : '100%',
			bottom : '',
			left : ''
		});
	}
}

uk.responsive = function () {
	uk.chtAndVideo();
	uk.rightValue();
	uk.leftValue();
	if ($(window).width() < 1000) {
		/* 1000보다 작아질때 비디오랑 채팅 말고 안보이게 설정*/
		$("#videoTop, #videoEtc, #videoEtc2").attr("style", "display : none !important");
		$("#topplace, #sidebarplace, #statusBoardSurround").css("display", "none");
	} else {
		/*1000보다 커질때 보이게 설정*/
		$("#videoTop, #videoEtc, #videoEtc2 ").attr("style", "display : flex !important");
		$("#topplace, #sidebarplace, #statusBoardSurround").css("display", "block");
	}
	uk.chtAndVideo();
	uk.rightValue();
	uk.leftValue();
}

uk.clickName=function(){
	console.log('click');
}
