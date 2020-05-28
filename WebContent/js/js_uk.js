let uk = {}

/*채팅방 입장시*/
let ws;
let streamerId;
let loginId;

/*그냥 로그인시*/
let allWs;

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
			/*귓속말 영역*/
			if($(".whisper").length){

				$(".whisper").css("width",left+'px'); /*귓속말 전체*/
				$(".whisperTarget").css("width",left-$(".whisper_min").width()+$(".whisper_close").width()); /*귓속말 탑 왼쪽 마진*/
				$(".whisper_mid").height($(".whisper").height()-$(".whisper_top").height()-$(".whisper_bottom").height());/*귓속말 미드*/
				console.log(1,$(".whisper_bottom").width());
				console.log(2,$(".whisper_sendArea").siblings().width());
				console.log(3,$(".whisper_bottom").width()-$(".whisper_sendArea").siblings().width())
				$(".whisper_sendArea").width($(".whisper_bottom").width()-$(".whisper_btn").width());
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



/* 소켓 연결시 */
uk.connectWS = function (streamer, login) {
	streamerId = streamer;
	loginId=login;

	ws = new WebSocket("ws://192.168.0.57/cht?" + streamerId);

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
		let jsObj = JSON.parse(event.data);

		/*내가 입장시! 유저 목록jsonLIst*/
		if(jsObj.userLIst){
			$(JSON.parse(jsObj.userLIst)).each(function (index, item) {
				$('<div class=' + item + '></div>').html(item).appendTo('#userList');
			});
		}
		/*총 시청자수 totalUsers*/
		if(jsObj.totalUsers){
			$("#totalUsers").html(jsObj.totalUsers);
		}
		/*누적 시청자수 accUser*/
		if(jsObj.accUser){
			$('#accUser').html(jsObj.accUser);
		}
		/*다른 유저 입장*/
		if (jsObj.addUser) {
			$('<div class=' + jsObj.addUser + '></div>').html(jsObj.addUser).appendTo('#userList');
		}
		/*다른 유저 퇴장*/
		if (jsObj.delUser) {
			$('div[class=' + jsObj.delUser + ']').remove();
		}
		/* 채팅! chtArea에 붙이기 */
		if (jsObj.txt && $('#chtArea').length) {
			let txt=JSON.parse(jsObj.txt)
			console.log(txt[0],txt[1]);
			/*$('<div></div>').html('<a href=#>'+txt[0]+'</a>: '+txt[1]).appendTo('#chtArea');*/

			$('<div class="dropdown">'+
			  '<a class="dropdown" href="#" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'+
			    txt[0]+'&nbsp&nbsp'+
			  '</a>'+
			    txt[1]+

			  '<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">'+
			    '<a class="dropdown-item" href="#">친구 추가</a>'+
			    '<a class="dropdown-item" href="#">귓속말</a>'+
			    '<a class="dropdown-item" href="#">채팅 금지</a>'+
			  '</div>'+
			'</div>').appendTo('#chtArea');

			$('#chtArea').scrollTop($('#chtArea').prop('scrollHeight'));
		}
	}

	/* 엔터키 누르면 전송 내꺼 */
	$('div[contenteditable]').keydown(function (e) {
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

	let str={txt:$('div[contenteditable]').html()}
	jsonStr=JSON.stringify(str);

	/* 내꺼 전송 */
	if (ws.readyState === 1 && loginId && $('div[contenteditable]').html()) {
		ws.send(jsonStr);
		$('div[contenteditable]').empty();
	}
}
/* socket 전송 메소드 (1)영탁:단순 채팅 -> txt*/
uk.takTxt = function () {

	let str={txt:$('input#sendArea').val()}
	jsonStr=JSON.stringify(str);

	/* 영탁 전송 */
	if (ws.readyState === 1 && $('input#sendArea').val()) {
		ws.send(jsonStr);
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
	if($(".whisper").length){
		$(".whisper").css("width",left+'px');
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

uk.clickName=function(){
	console.log('click');
}

uk.connectAllWS=function(){

	allWs = new WebSocket("ws://192.168.0.57/cht?justLogin");

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

		/*방송시작 알람 onAir*/
		if(jsObj.onAir)
		alert(jsObj.onAir+'님이 방송을 시작합니다.');
		/*친구 추가 알림 plus*/
		if(jsObj.plus)
		alert(jsObj.plus+'님이 친구추가를 신청하였습니다.');
		/*귓속말 whisper*/
		if(jsObj.whisper){
			let whisper=JSON.parse(jsObj.whisper);
			$(".whisperTarget").html(whisper[0]);
			$(".whisper_mid").htrml(whisper[1]);
		}
	}
}

/* socket 전송 메소드 (2)친구 추가 -> plus*/
uk.plus=function(){

	let str={plus:'cha'}
	jsonStr=JSON.stringify(str);

	if (allWs.readyState === 1) {
		allWs.send(jsonStr);
	}
}

/*귓속말 대화메세지 화면*/
uk.whisper=function(whisperTarget){
	if($("div[whisperTarget:"+whisperTarget+"]").length){

	}else{
		$('<div class="whispepr" whisperTarget='+whisperTarget+'>'+
			  '<div class="whisper_top">'+
			    	'<div class="whisperTarget">'+whisperTarget+'</div>'+
			    	'<div class="whisper_min"><a href="#"><i class="fas fa-window-minimize"></i></a></div>'+
			    	'<div class="whisper_close"><a href="#"><i class="fas fa-times"></i></a></div>'+
			  '</div>'+
			  '<div class="whisper_mid">textArea</div>'+
			  '<div class="whisper_bottom">'+
			  '<div class="whisper_sendArea">sendArea</div>'+
			  '<div class="whisper_btn"><a href="#"><i class="far fa-paper-plane"></i></a></div>'+
			  '</div>'+
			'</div>').appendTo(".whisperArea")
	}

}

/* socket 전송 메소드 (3)귓속말 -> whisper*/
uk.whisperSend=function(whisperTarget, whisperTxt){

	/*socket에 id전달*/
	let str={whisper:[whisperTarget, whisperTxt]}
	jsonStr=JSON.stringify(str);

	if (allWs.readyState === 1 ) {
		allWs.send(jsonStr);
	}


}
/* socket close 메소드 */
uk.WSclose = function () {
	allWs.close();
}


