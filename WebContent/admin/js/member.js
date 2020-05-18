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

var member_modify =  function(){
	$('#modify_btn').click=function(){
		let param = $('#he_form').serialize();
		$.post("member_modify.he",param,function(data,state){
			$('#main_body').html(data);
		})
	}
}

/*let member_insert = function(){
	$('#he_save_btn').click=(function(){
		alert('test');
		$('#he_form').attr('action','member_result.he').submit();
	})
}*/
member_insert2 =  function(){
	let fd = new FormData($('#he_form')[0])//object형태로 데이터 생성 
	
	$.ajax({
		url:'member_result.he',
		type:'post',
		data:fd,
		contentType:false,
		processData:false,
		error: function(xhr,status,error){
			console.log(error)
		},
		success:function(data,xhr,status){
			$('#main_body').html(data)
		}
})
	
}
let btn = document.getElementById('profile_img')
if(btn != null){
	btn.onchange = function (event) {
		let ele = event.srcElement;
		let url = ele.files[0];
		let reader = new FileReader();
		reader.readAsDataURL(url);
		reader.onload = function (ev) {
			let img = new Image();
			img.src = ev.target.result;
			document.getElementById('member_img').src = img.src;
		}
	}
}