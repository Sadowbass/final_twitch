/**
 * http://usejsdoc.org/
 */
var member_view = function(serial){
	$('#he_serial').val(serial);
	let param = $('#he_form').serialize();
	$.post("member_view.he",param,function(data,state){
		$('#main_body').html(data);
	})
}