let uk = {}

uk.stream = function() {
	$("#fold").click(function() {
		$("#cht_div").css("display", "none");

						$("#video_div").removeClass("col-md-10");
						$("#video_div").addClass("col-md-12");

						$(
								"<div class='col-md-2' id='unfold' style='position:fixed; right:-265px; margin-top:5px;'><i class='fas fa-sign-out-alt fa-2x fa-rotate-180' onclick='unfold()'></i></div>")
								.appendTo("#add_unfold");
					});

	$("#user_div").click(function() {
		if ($("#divUsers").length) {
			$("#cht_div").children().eq(1).remove();
			$("#cht_div").children().eq(1).css("display",
					"block");
			$("#cht_div").children().eq(2).css("display",
					"block");
			$("#cht_div").children().eq(3).css("display",
					"block");
			$("#cht_div").children().eq(4).css("visibility",
					"visible");
		} else {
			$("#cht_div").children().eq(1).css("display",
					"none");
			$("#cht_div").children().eq(2).css("display",
					"none");
			$("#cht_div").children().eq(3).css("display",
					"none");
			$("#cht_div").children().eq(4).css("visibility",
					"hidden");
			$(
					"<div class='row'><div class='col-md-12' id='divUsers'><h1>유저 목록</h1></div></div>")
					.insertAfter(
							$("#cht_div").children().first());
		}

	});

}

let send = function() {
	$('<div></div>').html($('div[contenteditable]').html())
			.appendTo('#chtArea');
	$('#chtArea').scrollTop($('#chtArea').prop('scrollHeight'));
	$('div[contenteditable]').empty();
}

uk.cht = function() {
	$('div[contenteditable]').keydown(function(e) {
		if (e.keyCode === 13) {
			if (!e.shiftKey) {
				send();
				return false;
			}
		}
	});
}

let go=function(){
	$.get("stream.st",function(data){
		$('#content-wrapper').html(data);
	});
	/*var ws = new WebSocket("ws://localhost:8888/final_twitch/ws?bno=1234");*/

}
