var streamer_view = function(){
	location.href = "index.jsp?inc=admin_pages/twitch_main/streamer_detail.jsp"
	
}
var help_view = function(){
	location.href = "index.jsp?inc=admin_pages/twitch_main/help_detail.jsp"
	
}
$("#help_modify_btn").click (function(){
	location.href = "index.jsp?inc=admin_pages/twitch_main/help_modify.jsp"
})

/*var cate_modify = function(serial){
	$('#he_serial').val(serial);
	let param = $('#he_form').serialize();
	$.post("category_view.he",param,function(data,state){
		//$('#cate_name').val('${cate.cat_gname}');
		
		alert('${cate.cat_gname}');
	})
}*/