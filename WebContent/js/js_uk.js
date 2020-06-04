let uk = {}

/*채팅방 입장시*/
let ws;
let streamerId;
let loginId;
let loginAllWS;
let ignoredFromStreamer=true; /*스트리머가 채금 먹이면 false*/
let ignoringList;

/*그냥 로그인시*/
let allWs;

/* 스트림 */
uk.stream = function () {

	$.ajax({
		type: 'get',
		url: '/sidebar.sc',
		success: function (data) {
			let sidebar = $('#sidebarplace').html(data).find("#sidebar-navmain");
			sidebar.addClass("sidebar_uk");
			let left = sidebar.width();
			if ($('#sidebarplace').css('display') == 'none') left = 0;

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
	$(window).scroll(function () { uk.minimization(); });

}

/* 유저목록이랑 채팅창 변경 */
uk.usersOrcht = function () {
	if ($('div#chtArea').css('display') == 'block') {
		$('div#chtArea').css('display', 'none');
		$('div#userList').css('display', 'block');
		$('#statusBoard').html('생방송 유저 목록');
	} else {
		$('div#chtArea').css('display', 'block');
		$('div#userList').css('display', 'none');
		$('#statusBoard').html('생방송 채팅');
	}
}
/*접기*/
uk.fold = function () {
	$("#cht_div").css("display", "none");
	if ($(window).width() >= 1000) {
		$('#unfold').css('display', 'block');
	} else {
		$('#unfoldBottom').css('display', 'block');
	}
	uk.rightValue();
}
/*오른쪽에서 펼치기*/
uk.unfold = function () {
	$("#cht_div").css("display", "block");
	$("#unfold").css("display", "none");
	uk.rightValue();
}
/*밑에서 펼치기*/
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

/* 시청자 소켓 */
uk.connectWS = function (streamer, login) {
	streamerId = streamer;
	loginId = login;
	let global=0;
	if(streamerId==loginId)global=1;

	uk.heCnt(streamerId, loginId); /*하은 부탁*/

	if(streamer==login){
		ws = new WebSocket("ws://192.168.0.77/cht?air"); /*스트리머 소켓*/
	}else{
		ws = new WebSocket("ws://192.168.0.77/cht?" + streamerId); /*시청자 소켓*/
	}

	ws.onopen = function (event) {
		console.log("채팅 접속");

		/*스트리머 아이디 왕관 붙여서 맨위에 붙이기*/
		$('<div style="display:flex;"><i class="fas fa-crown" style="color: #FFA833; padding-top:3px; padding-right:5px;"></i><div class=' + streamerId + '>'+streamerId+'</div></div>').appendTo('#userList');

		/*채팅 금지 알아보기 위한 파라미터*/
		let param={
			mid : loginId,
		}

		/*스트리머가 나를 채금*/
		$.getJSON("/ignoredSel.uk", param, function(data){
			$.each(data, function(index, item){
				if(item.ign_mid==streamerId){
					ignoredFromStreamer=false;
				}
			});
		});

		/*내가 채팅 금지한 사람 목록 조회*/
		uk.ignoringSel();

	}
	ws.onclose = function (event) {
		console.log("접속 종료");
	}
	ws.onerror = function (event) {
		console.log("에러 발생");
	};

	ws.onmessage = function (event) {
		let jsObj = JSON.parse(event.data);

		/*내가 입장시! 유저 목록jsonLIst*/
		if (jsObj.userLIst) {
			$(JSON.parse(jsObj.userLIst)).each(function (index, item) {
				if(item!=streamerId)$('<div class=' + item + '></div>').html(item).appendTo('#userList');


			});
		}
		/*총 시청자수 totalUsers*/
		if (jsObj.totalUsers) {
			$("#totalUsers").html(jsObj.totalUsers);
			/*누적 시청자수*/

		}
		/*누적 시청자수 accUser*/
		if (jsObj.accUser) {
			$("#accUser").html(jsObj.accUser);
		}
		/*다른 유저 입장*/
		if (jsObj.addUser) {
			$('<div class=' + jsObj.addUser + '></div>').html(jsObj.addUser).appendTo('#userList');
		}
		/*다른 유저 퇴장*/
		if (jsObj.delUser) {
			$('div[class=' + jsObj.delUser + ']').remove();
		}
		/*시청자가 채팅 금지한 시청자 목록 받음*/
		if(jsObj.ignoringSel){
			ignoringList=JSON.parse(jsObj.ignoringSel)
		}
		/* 채팅! chtArea에 붙이기 */
		if (jsObj.txt && $('#chtArea').length && ignoredFromStreamer) {
			let txt=JSON.parse(jsObj.txt);
			if(ignoringList.length){
				$.each(ignoringList,function(index,item){
					if(item!=txt[0]){
						$('<div class="dropdown">'+
								'<a class="dropdown" href="#" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'+
								txt[0]+'&nbsp&nbsp'+
								'</a>'+
								txt[1]+
								'<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">'+
								'<a class="dropdown-item" href="#" onclick=uk.plus("'+txt[0]+'")>친구 추가</a>'+
								'<a class="dropdown-item" href="#" onclick=uk.whisper("'+txt[0]+'")>귓속말</a>'+
								'<a class="dropdown-item" href="#" onclick=uk.ignoreIn("'+loginId+'","'+txt[0]+'","'+global+'")>채팅 금지</a>'+
								'</div>'+
						'</div>').appendTo('#chtArea');

						$('#chtArea').scrollTop($('#chtArea').prop('scrollHeight'));
					}
				});
			}else{
				$('<div class="dropdown">'+
						'<a class="dropdown" href="#" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'+
						txt[0]+'&nbsp&nbsp'+
						'</a>'+
						txt[1]+
						'<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">'+
						'<a class="dropdown-item" href="#" onclick=uk.plus("'+txt[0]+'")>친구 추가</a>'+
						'<a class="dropdown-item" href="#" onclick=uk.whisper("'+txt[0]+'")>귓속말</a>'+
						'<a class="dropdown-item" href="#" onclick=uk.ignoreIn("'+loginId+'","'+txt[0]+'","'+global+'")>채팅 금지</a>'+
						'</div>'+
				'</div>').appendTo('#chtArea');

				$('#chtArea').scrollTop($('#chtArea').prop('scrollHeight'));
			}



		}
		/*스트리머 방종 메세지*/
		if (jsObj.offAir) {
			Swal.fire({
				position: 'center',
				icon: 'warning',
				title: '<font color="white">'+jsObj.offAir+'님이 방송을 종료하였습니다.</font>',
				html: ' 메인 화면으로 이동합니다 (time: <b></b>) ',
				background: '#18181b',
				timer: 2000,
				timerProgressBar: true,
				onBeforeOpen: () => {
					Swal.showLoading()
					timerInterval = setInterval(() => {
						const content = Swal.getContent()
						if (content) {
							const b = content.querySelector('b')
							if (b) {
								b.textContent = parSwal.getTimerLeft();
							}
						}
					}, 100)
				},
				onClose: () => {
					clearInterval(timerInterval)
				}
			}).then((result) => {
				/* Read more about handling dismissals below */
				if (result.dismiss === Swal.DismissReason.timer) {
					location.href="/";
				}
			});
		}
		/*채팅방 중복 입장 알림 메세지*/
		if (jsObj.reduplication) {
			Swal.fire({
				position: 'center',
				icon: 'warning',
				title: '<font color="white">'+jsObj.reduplication+'</font>',
				background: '#18181b',
				confirmButtonText: '확인',
				timer:1000
			}).then((result)=>{
				location.href='/';
			});
		}
		/*스트리머가 나를 채팅 금지했다고 신호 받음*/
		if(jsObj.ignored){
			ignoredFromStreamer=false;
			$(".chtArea").empty();
			Swal.fire({
				icon: 'error',
				title: '<font color="white">' + streamerId+ '님이 채팅을 금지하였습니다.</font>',
				background: '#18181b',
				timer: 2000,
				confirmButtonText: "확인",
			});
		}

	}
	/* 엔터키 누르면 전송 내꺼 */
	$('div[contenteditable].cht_send_uk ').keydown(function (e) {
		if (e.keyCode === 13) {
			if (!e.shiftKey) {
				uk.ukTxt();
				return false;
			}
		}
	});
	/* 엔터키 누르면 전송 영탁형꺼 */
	$('input#sendArea').keydown(function (e) {
		if (e.keyCode === 13) {
			if (!e.shiftKey) {
				uk.takTxt();
				return false;
			}
		}
	});
}
/* socket 전송 메소드 (1)관욱:단순 채팅 -> txt*/
uk.ukTxt = function () {

	let str = { txt: $('div[contenteditable].cht_send_uk ').html() }
	let jsonStr = JSON.stringify(str);

	/* 내꺼 전송 */
	if (ws.readyState === 1 && loginId && $('div[contenteditable].cht_send_uk ').html()) {
		if(ignoredFromStreamer){/*스트리머가 채팅 금지 안먹였을때*/
			ws.send(jsonStr);
			$('div[contenteditable].cht_send_uk ').empty();
		}else{/*스트리머가 채팅 금지 먹였을때*/
			Swal.fire({
				icon: 'error',
				title: '<font color="white">' + streamerId+ '님이 채팅을 금지하였습니다.</font>',
				background: '#18181b',
				timer: 2000,
				confirmButtonText: "확인",
			});
			$('div[contenteditable].cht_send_uk ').empty();
		}
	}
}
/* socket 전송 메소드 (1)영탁:단순 채팅 -> txt*/
uk.takTxt = function () {

	let str = { txt: $('input#sendArea').val() }
	let jsonStr = JSON.stringify(str);

	/* 영탁 전송 */
	if (ws.readyState === 1 && $('input#sendArea').val()) {
		ws.send(jsonStr);
		$('input#sendArea').val('');
	}
}

/* socket close 메소드 */
uk.closeWS = function () {
	ws.close();
	/*유저목록 지우기*/
	if ($("#userList").length) {
		$("#userList").html("");
	}
	/*대화내용 지우기*/
	if ($("#chtArea").length) {
		$("#chtArea").html("");
	}
}
/* 왼쪽 */
uk.leftValue = function () {
	let left = 0;

	/*1000이하 되면 0주기*/
	if ($(window).width() >= 1000) {
		left = $('#sidebar-navmain').width();
	}
	/*비디오 왼쪽 패딩*/
	$(".video_main_uk").css('padding-left', left + 'px');
	/*귓속말 크기*/
	if ($(".whisper").length) {
		$(".whisper").css("width", left + 'px');
	}
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
	/*귓속말 css*/
	if(right==0){ /*안보이게*/
		$(".whisper").css('display','none');
	}else{ /*채팅창 넓이에 맞춤*/
		$(".whisper").css('display','block');
		uk.whisperCss(right, $(".chtArea ").height())
	}

}

/*채팅 과 비디오*/
uk.chtAndVideo = function () {
	/*네비 길이*/
	let top = $("nav").height();
	/* 채팅창 길이 */
	let height = window.innerHeight - (top + $("#cht_top").height()
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
uk.minimization = function () {
	let top = $(window).scrollTop();
	let height = $("#mediaplayer").height();

	if (top > height) {
		$("#mediaplayer").css({
			position: 'fixed',
			bottom: '20px',
			left: '300px',
			width: '350px',
			height: '250px'
		});
	} else {
		$("#mediaplayer").css({
			position: 'relative',
			width: '100%',
			height: '100%',
			bottom: '',
			left: ''
		});
	}
}
/*반응형*/
uk.responsive = function () {
	uk.chtAndVideo();
	uk.rightValue();
	uk.leftValue();
	if ($(window).width() < 1000) {
		/* 1000보다 작아질때 비디오랑 채팅 말고 안보이게 설정*/
		$("#videoTop, #videoEtc, #videoEtc2").attr("style", "display : none !important");
		$("#topplace, #sidebarplace").css("display", "none");
	} else {
		/*1000보다 커질때 보이게 설정*/
		$("#videoTop, #videoEtc, #videoEtc2 ").attr("style", "display : flex !important");
		$("#topplace, #sidebarplace").css("display", "block");
	}
	uk.chtAndVideo();
	uk.rightValue();
	uk.leftValue();
}
/*로그인시 인덱스 화면에서 소켓 접속*/
uk.connectAllWS = function (login) {
	loginAllWS=login;

	allWs = new WebSocket("ws://192.168.0.77/cht?justLogin");

	allWs.onopen = function (event) {
		console.log("all ws open");
	}
	allWs.onclose = function (event) {
		console.log("all ws close");
	}
	allWs.onerror = function (event) {
		console.log("all ws error");
	};

	allWs.onmessage = function (event) {
		let jsObj = JSON.parse(event.data);

		/*방송시작 알람 받음 onAir*/
		if (jsObj.onAir)
			Swal.fire({
				icon: 'info',
				title: '<font color="white">' + jsObj.onAir + '님이 방송을 시작하였습니다.</font>',
				background: '#18181b',
				timer: 2000,
				confirmButtonText: "이동",
				showCancelButton: true,
				cancelButtonText: "확인"
			}).then((result) => {
				if (result.value) location.href = '/' + jsObj.onAir;
			});
		/*친구 추가 수락 거절 여부 알림 받음 plus*/
		if (jsObj.plus) {
			Swal.fire({
				icon: 'info',
				title: '<font color="white">' + jsObj.plus + '님이 친구추가를 요청하였습니다.</font>',
				background: '#18181b',
				confirmButtonText: "수락",
				showCancelButton: true,
				cancelButtonText: "거절",
				allowOutsideClick:false
			}).then((result) => {
				if(result.value){
					Swal.fire({
						icon: 'info',
						title: '<font color="white">' + jsObj.plus + '님과 친구가 되었습니다.</font>',
						background: '#18181b',
						timer: 1000,
						confirmButtonText: "확인",
					});
					let str={
						plusOk:jsObj.plus
					}
					let jsonStr = JSON.stringify(str);
					if (allWs.readyState === 1)	allWs.send(jsonStr);

				}else{
					Swal.fire({
						icon: 'info',
						title: '<font color="white">' + jsObj.plus + '님의 친구요청을 거절하였습니다.</font>',
						background: '#18181b',
						timer: 1000,
						confirmButtonText: "확인",
					});
					let str={
						plusNo:jsObj.plus
					}
					let jsonStr = JSON.stringify(str);
					if (allWs.readyState === 1)	allWs.send(jsonStr);

				}
			});
		}
		/*친구 신청 수락했을때*/
		if (jsObj.plusOK) {
			Swal.fire({
				icon: 'info',
				title: '<font color="white">' + jsObj.plusOk + '님이 친구요청을 수락하였습니다.</font>',
				background: '#18181b',
				timer: 2000,
				confirmButtonText: "확인",
			});
		}
		/*친구 거절 수락했을때*/
		if (jsObj.plusNo) {
			Swal.fire({
				icon: 'info',
				title: '<font color="white">' + jsObj.plusNo + '님이 친구요청을 거절하였습니다.</font>',
				background: '#18181b',
				timer: 2000,
				confirmButtonText: "확인",
			});
		}
		/*귓속말 받음 whisper*/
		if (jsObj.whisper) {
			let whisper = JSON.parse(jsObj.whisper);

			/*보낸사람*/
			if(loginAllWS==whisper[0] && $("div[whisperTarget='"+whisper[1]+"']").length!=0){

				if(loginAllWS==whisper[0]){/* 귓속말 보낸이가 보낸 메세지 */
					$("<div style='height: 18px; padding-right: 5px; text-align: right;'>"+ whisper[2] + "</div>").appendTo(".whisper_mid");
				}else{/*귓속말 보낸이가 받는 메세지*/
					$("<div style='height: 18px; padding-left: 5px;'>" + whisper[2] + "</div>").appendTo(".whisper_mid");
				}
				/*스크롤 내리기*/
				$('.whisper_mid').scrollTop($('.whisper_mid').prop('scrollHeight'));

			}

			/*받는사람*/
			if(loginAllWS==whisper[1]){


				if($("div[whisperTarget='"+whisper[0]+"']").length!=0){ /*폼 있으면 메세지만 붙여주고*/
					if(loginAllWS==whisper[0]){/* 귓속말 받는이가 보낸 메세지*/
						$("<div style='height: 18px; padding-right: 5px; text-align: right;'>"+ whisper[2] + "</div>").appendTo(".whisper_mid");
					}else{/*귓속말 받는이가 받는 메세지*/
						$("<div style='height: 18px; padding-left: 5px;'>" + whisper[2] + "</div>").appendTo(".whisper_mid");
					}
					/*스크롤 내리기*/
					$('.whisper_mid').scrollTop($('.whisper_mid').prop('scrollHeight'));
				}else{/*지난 대화 불러오고, 폼 만들고 메세지 붙여주기 */

					/*지난 대화 객체*/
					let param={
						writer : whisper[0],
						reader : whisper[1]
					}

					/*지난 대화 */
					$.getJSON("whisperSel.uk", param, function(data){
						$.each(data, function(index, item){
							if(item[loginAllWS]){
								$("<div style='height: 18px; padding-right: 5px; text-align: right;'>"+ item[loginAllWS] + "</div>").appendTo(".whisper_mid");
								$('.whisper_mid').scrollTop($('.whisper_mid').prop('scrollHeight'));
							}else if(item[whisper[0]]){
								$("<div style='height: 18px; padding-left: 5px;'>" + item[whisper[0]] + "</div>").appendTo(".whisper_mid");
								$('.whisper_mid').scrollTop($('.whisper_mid').prop('scrollHeight'));
							}
						})
					});

					/*귓속말 폼*/
					$('<div class="whisper" whisperTarget="' + whisper[0] + '">' +
						'<div class="whisper_top">' +
						'<div class="whisperOid">' + whisper[0] + '</div>' +
						'<div class="whisper_min"><a href="#"><i class="fas fa-window-minimize"></i></a></div>' +
						'<div class="whisper_close" onclick=uk.whisperClose("'+whisper[0]+'")><a href="#"><i class="fas fa-times"></i></a></div>' +
						'</div>' +
						'<div class="whisper_mid mostly-customized-scrollbar"></div>' +
						'<div class="whisper_bottom">' +
						'<div class="whisper_sendArea invisible-scrollbar" contenteditable="true"></div>' +
						'<div class="whisper_btn" onclick=uk.whisperSend("' + whisper[0] + '")><a href="#"><i class="far fa-paper-plane"></i></a></div>' +
						'</div>' +
						'</div>').appendTo(".whisperArea");
					/*css*/
					uk.whisperCss( $("#cht_div").width(), $(".chtArea ").height());
					/*스크롤 내리기*/
					$('.whisper_mid').scrollTop($('.whisper_mid').prop('scrollHeight'));
					/*받은 메세지*/
					$("<div style='height: 18px; padding-left: 5px;'>" + whisper[2] + "</div>").appendTo(".whisper_mid");

					/* 엔터키 누르면 귓속말 전송 */
					$("div[contenteditable].whisper_sendArea").keydown(function (e) {
						if (e.keyCode === 13) {
							if (!e.shiftKey) {
								uk.whisperSend(whisper[0]);
								return false;
							}
						}
					});
				}

			}


//			/*귓속말 받는 메세지*/
//			if ($("div[whisperTarget='" + whisper[1] + "']").length) {
//				if(whisper[0]==loginAllWS){
//					$("<div style='height: 18px; padding-left: 5px;'>" + whisper[2] + "</div>").appendTo(".whisper_mid");
//				}else{
//					$("<div style='height: 18px; padding-right: 5px; text-align: right;'>"+ whisper[2] + "</div>").appendTo(".whisper_mid");
//				}
//			}


//			/*지난 대화 객체*/
//			let param={
//				writer : whisper[0],
//				reader : whisper[1]
//			}
//
//			/*지난 대화 */
//			$.getJSON("whisperSel.uk", param, function(data){
//				$.each(data, function(index, item){
//					if(item[loginAllWS]){
//						$("<div style='height: 18px; padding-right: 5px; text-align: right;'>"+ item[loginAllWS] + "</div>").appendTo(".whisper_mid");
//						$('.whisper_mid').scrollTop($('.whisper_mid').prop('scrollHeight'));
//					}else if(item[whisper[0]]){
//						$("<div style='height: 18px; padding-left: 5px;'>" + item[whisper[0]] + "</div>").appendTo(".whisper_mid");
//						$('.whisper_mid').scrollTop($('.whisper_mid').prop('scrollHeight'));
//					}
//				})
//			});


			if(whisper[1]==loginAllWS){ /*상대가 로그인해 있으면*/
				if($("div[whisperTarget='"+whisper[0]+"']").length==0){

				}
			}



			if ($("div[whisperTarget='" + whisper[0] + "']").length) {
//				$("<div style='height: 18px; padding-left: 5px;'>" + whisper[2] + "</div>").appendTo(".whisper_mid");

			} else {


				/*방금 받은 귓속말*/
//				$("<div style='height: 18px; padding-left: 5px;'>" + whisper[2] + "</div>").appendTo(".whisper_mid");
			}
		}
	}
}

/* socket 전송 메소드 (2)친구 추가 -> plus*/
uk.plus = function (plusOid) {
	let str = { plus: plusOid }
	let jsonStr = JSON.stringify(str);

	if (allWs.readyState === 1) {
		allWs.send(jsonStr);
	}
}

/*귓속말 대화메세지 화면(귓속말 보냄)*/
uk.whisper = function (whisperTarget) {

	/*지난 대화 객체*/
	let param={
		writer : loginAllWS,
		reader : whisperTarget
	}

	/*지난 대화*/
	$.getJSON("whisperSel.uk", param, function(data){
		$.each(data, function(index, item){
			if(item[loginAllWS]){
				$("<div style='height: 18px; padding-right: 5px; text-align: right;'>"+ item[loginAllWS] + "</div>").appendTo(".whisper_mid");
				$('.whisper_mid').scrollTop($('.whisper_mid').prop('scrollHeight'));
			}else if(item[whisperTarget]){
				$("<div style='height: 18px; padding-left: 5px;'>" + item[whisperTarget] + "</div>").appendTo(".whisper_mid");
				$('.whisper_mid').scrollTop($('.whisper_mid').prop('scrollHeight'));
			}
		})
	});

	/*귓속말 폼*/
	if ($("div[whisperTarget='" + whisperTarget + "']").length==0) {
		$('<div class="whisper" whisperTarget="' + whisperTarget + '">' +
			'<div class="whisper_top">' +
				'<div class="whisperOid">' + whisperTarget + '</div>' +
				'<div class="whisper_min"><a href="#"><i class="fas fa-window-minimize"></i></a></div>' +
				'<div class="whisper_close" onclick=uk.whisperClose("'+whisperTarget+'")><a href="#"><i class="fas fa-times"></i></a></div>' +
			'</div>' +
			'<div class="whisper_mid mostly-customized-scrollbar"></div>' +
			'<div class="whisper_bottom">' +
				'<div class="whisper_sendArea invisible-scrollbar" contenteditable="true"></div>' +
				'<div class="whisper_btn" onclick=uk.whisperSend("' + whisperTarget + '")><a href="#"><i class="far fa-paper-plane"></i></a></div>' +
			'</div>' +
			'</div>').appendTo(".whisperArea");
		uk.whisperCss( $("#cht_div").width(), $(".chtArea ").height());
	}
	/* 엔터키 누르면 귓속말 전송 */
	$("div[contenteditable].whisper_sendArea").keydown(function (e) {
		if (e.keyCode === 13) {
			if (!e.shiftKey) {
				uk.whisperSend($(this).parents("div[class='whisper']").attr('whisperTarget'));
				return false;
			}
		}
	});

}

/* socket 전송 메소드 (3)귓속말 -> whisperSend*/
uk.whisperSend = function (whisperTarget) {
	let whisperTxt = $("div[contenteditable].whisper_sendArea").html();
	$("div[contenteditable].whisper_sendArea").empty();

	/*socket에 id전달*/
	let str = { whisper: [whisperTarget, whisperTxt] }
	let jsonStr = JSON.stringify(str);

	if (allWs.readyState === 1) {
		allWs.send(jsonStr);
	}
}

/*귓속말 닫기 버튼*/
uk.whisperClose=function(whisperTarget){
	$("div[whisperTarget='"+whisperTarget+"']").remove();
}


/*귓속말 css*/
uk.whisperCss = function (right, height) {
	$(".whisper").css({
		right: right+10 + 'px',
		top: height-10+'px'
	});

	$(".whisperOid").css("width", $(".whisper").width() - $(".whisper_min").width() + $(".whisper_close").width()); /*귓속말 상대 이름 크기*/
	$(".whisper_mid").height($(".whisper").height() - $(".whisper_top").height() - $(".whisper_bottom").height());/*귓속말 미드*/
	$(".whisper_sendArea").width($(".whisper_bottom").width() - $(".whisper_btn").width());
}

/* socket close 메소드 */
uk.allWSclose = function () {
	allWs.close();
}

/*스트리머 방송 출력 페이지 소켓 다시 접속*/
uk.reSocket=function(mid){
	let param={mid:mid};
	$.get("reSocket.uk", param, function(data){
		if(data=="reS"){
			uk.connectWS(mid,mid); /* 소켓 재접속 */
		}
	});
}

/*채팅 금지 저장*/
uk.ignoreIn=function(mid, oid, global){
	let param={
			ign_mid : mid,
			ign_tid : oid,
			ign_global : global
	}
	$.get("ignoreIn.uk", param, function(data){
		Swal.fire({
			icon: 'error',
			title: '<font color="white">' + oid+ '님을 채팅을 금지하였습니다.</font>',
			background: '#18181b',
			timer: 2000,
			confirmButtonText: "확인",
		});

		if(mid==streamerId){
			uk.ignoreFromStreamer(oid);
		}
		if(mid==loginId){
			uk.ignoringSel();
		}

	});



}

/*스트리머가 채팅 금지 신호*/
uk.ignoreFromStreamer=function(oid){
	let str={
		ignoreFromStreamer : oid
	}
	let jsonStr=JSON.stringify(str);
	ws.send(jsonStr);
}

/*시청자가 채팅 금지목록 조회*/
uk.ignoringSel=function(){
	let str={
		ignoringSel :loginId
	}
	let jsonStr=JSON.stringify(str);
	ws.send(jsonStr);
}

/*하은 부탁*/
uk.heCnt = function (streamerId, loginId) {
	if (streamerId == loginId) {
		let str = { heCntRun: 1 }
		let jsonStr = JSON.stringify(str);
		setInterval(function () {
			ws.send(jsonStr);
		}, 60000);
	}
}


