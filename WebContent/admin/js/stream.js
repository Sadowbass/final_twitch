var streamer_view = function(){
	location.href = "index.jsp?inc=admin_pages/twitch_main/streamer_detail.jsp"
	
}
var help_view = function(){
	location.href = "index.jsp?inc=admin_pages/twitch_main/help_detail.jsp"
	
}
$("#help_modify_btn").click (function(){
	location.href = "index.jsp?inc=admin_pages/twitch_main/help_modify.jsp"
})

function showCancel2Message(serial) {
    swal({
        title: "정말 삭제하시겠습니까?",
        text: "다시 복구할 수 없습니다!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#e14eca",
        confirmButtonText: "삭제",
        cancelButtonText: "취소",
        closeOnConfirm: false,
        closeOnCancel: false
    }, function (isConfirm) {
        if (isConfirm) {
        	$('#cat_serial').val(serial);
        	let param = $('#he_form').serialize();
        	$.post("category_delete.he", param, function (data, state) {
                showCateDelete();
            })
        } else {
            swal("취소됨", "카테고리 삭제가 취소되었습니다", "error");
        }
    });
}

function showCateDelete(){
	swal({
        title: "삭제 완료",
        text: "해당 카테고리가 성공적으로 삭제되었습니다",
        type: "success",
        closeOnConfirm: true
    }, function () {
        location.href = "category_select.he"
    });
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
			document.getElementById('category_img').src = img.src;
		}
	}
}

let cate_save =  function(){
	let fd = new FormData($('#he_form')[0])//object형태로 데이터 생성 
	
	$.ajax({
		url:'category_insertR.he',
		type:'post',
		data:fd,
		contentType:false,
		processData:false,
		error: function(xhr,status,error){
			swal("에러발생",error, "error");
		},
		success:function(data,xhr,status){
			swal({
		        title: "입력 완료",
		        text: "카테고리가 성공적으로 입력되었습니다",
		        type: "success",
		        closeOnConfirm: true
		    }, function () {
		        location.href = "category_insert.he"
		    });
		}
   })
}

$('#findTag').keyup(function(){
	let param = $('#find_form').serialize();
	$.ajax({
		url:'tag_search.he',
		type:'post',
		data:param,
		error: function(xhr,status,error){
			swal("에러발생",error, "error");
		},
		success:function(data,xhr,status){
			let str= "";
			for(let i=0; i <data.length; i++){
				let d = data[i];
				console.log(d.tag_name);
				str+='<span class="label bg-indigo cate_tag">'+d.tag_name+'<i class="material-icons" onclick="showTagdel('+d.tag_serial+')">close</i></span>'
			}
			$('#tag_list').html(str);
		
		}
   })
	
})

let tag_delete = function(serial){
	$('#tag_serial').val(serial);
	let param = $('#tag_form').serialize();
	$.ajax({
		url:'tag_delete.he',
		type:'post',
		data:param,
		error: function(xhr,status,error){
			swal("에러발생",error, "error");
		},
		success:function(data,xhr,status){
			swal({
		        title: "삭제 완료",
		        text: "해당 태그가  삭제되었습니다",
		        type: "success",
		        closeOnConfirm: true
		    }, function () {
		        location.href = "tag_management.he"
		    });
		}
   })
}

function showTagdel(serial) {
    swal({
        title: "정말 삭제하시겠습니까?",
        text: "다시 복구할 수 없습니다!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#e14eca",
        confirmButtonText: "삭제",
        cancelButtonText: "취소",
        closeOnConfirm: false,
        closeOnCancel: false
    }, function (isConfirm) {
        if (isConfirm) {
        	tag_delete(serial);
        } else {
            swal("취소됨", "태그 삭제가 취소되었습니다", "error");
        }
    });
}

let tag_save =  function(){
	let param = $('#insert_form').serialize();
	$.ajax({
		url:'tag_insert.he',
		type:'post',
		data:param,
		error: function(xhr,status,error){
			swal("에러발생",error, "error");
		},
		success:function(data,xhr,status){
			swal({
		        title: "추가 완료",
		        text: "해당 태그가  추가되었습니다",
		        type: "success",
		        closeOnConfirm: true
		    }, function () {
		        location.href = "tag_management.he"
		    });
		}
   })
}