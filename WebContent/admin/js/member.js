/**
 * http://usejsdoc.org/
 */
var member_view = function(serial){
	$('#he_serial').val(serial);
	/*let param = $('#he_form').serialize();
	$.post("member_view.he",param,function(data,state){
		$('#main_body').html(data);
	})*/
	$('#he_form').attr('action','member_view.he').submit();	
}

var member_modify2 =  function(){
	$('#he_form').attr('action','member_modify.he').submit();	
}

member_insert2 =  function(){
	let fd = new FormData($('#he_form')[0])//object형태로 데이터 생성 
	
	$.ajax({
		url:'member_result.he',
		type:'post',
		data:fd,
		contentType:false,
		processData:false,
		error: function(xhr,status,error){
			showError(error)
		},
		success:function(data,xhr,status){
			showSuccessinsertMessage()
		}
	})
	//$('#he_form').attr('action','member_result.he').submit();	
	
}

function showSuccessinsertMessage() {
	swal({
        title: "입력 완료",
        text: "회원정보가 성공적으로 입력되었습니다",
        type: "success",
        closeOnConfirm: true
    }, function () {
        location.href = "member_select.he"
    });
}

function showError(error){
	swal("에러발생",error, "error");
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

let backSelect= function(){
	$('#he_form').attr('action','member_view.he').submit();	
}

let order_detail= function(serial,mid){
	$('#s_serial').val(serial);
	$('#he_form').attr('action','orderView2.mh').submit();	
}
