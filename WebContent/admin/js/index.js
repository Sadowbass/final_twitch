/**
 * http://usejsdoc.org/
 */
var member_select = function(){
	/*$('#main_body').load('member_select.he');
	$('#he_form').attr('action','member_modify.he').submit();*/
	location.href = "member_select.he"
}

var member_insert = function(){
	/*$('#main_body').load('member_insert.he');*/
	location.href = "member_insert.he"
}

var live_broadcast = function(){
	/*$('#main_body').load('live_broadcast.he');*/
	location.href = "live_broadcast.he"
}

var streamer = function(){
	/*$('#main_body').load('streamer.he');*/
	location.href = "streamer.he"
}

var category_select = function(){
	/*$('#main_body').load('category_select.he');*/
	location.href = "category_select.he"
}

var category_insert = function(){
	/*$('#main_body').load('category_insert.he');*/
	location.href = "category_insert.he"
}

var tag_management= function(){
	/*$('#main_body').load('tag_management.he');*/
	location.href = "tag_management.he"
}

var profit= function(){
	/*$('#main_body').load('profit.he');*/
	location.href = "profit.he"
}

var help= function(){
	/*$('#main_body').load('help.he');*/
	location.href = "help.he"
}

var product_view = function(pid){
	$('#productSerial').val(pid);
	$('#he_form').attr('action','product_view2.mh').submit();	
}

var broad_view = function(mid){
	location.href ="/"+mid
}
