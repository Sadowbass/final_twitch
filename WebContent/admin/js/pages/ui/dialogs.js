$(function () {
    $('.js-sweetalert button').on('click', function () {
        var type = $(this).data('type');
        if (type === 'basic') {
            showBasicMessage();
        }
        else if (type === 'with-title') {
            showWithTitleMessage();
        }
        else if (type === 'success') {
            showSuccessMessage();
        }
        else if (type === 'confirm') {
            showConfirmMessage();
        }
        else if (type === 'cancel') {
            showCancelMessage();
        }
        else if (type === 'with-custom-icon') {
            showWithCustomIconMessage();
        }
        else if (type === 'html-message') {
            showHtmlMessage();
        }
        else if (type === 'autoclose-timer') {
            showAutoCloseTimerMessage();
        }
        else if (type === 'prompt') {
            showPromptMessage();
        }
        else if (type === 'ajax-loader') {
            showAjaxLoaderMessage();
        }
        else if (type === 'modify') {
            showModifyMessage();
        }
        else if (type === 'modify2') {
            showCateModify();
        }
      
    });
});

//These codes takes from http://t4t5.github.io/sweetalert/
function showBasicMessage() {
    swal("Here's a message!");
}

function showWithTitleMessage() {
    swal("Here's a message!", "It's pretty, isn't it?");
}

function showSuccessMessage() {
	swal({
        title: "수정 완료",
        text: "회원정보가 성공적으로 수정되었습니다",
        type: "success",
        closeOnConfirm: true
    }, function () {
        location.href = "member_select.he"
    });
}

function showCateSuccessMessage() {
	swal({
        title: "수정 완료",
        text: "카테고리 정보가 성공적으로 수정되었습니다",
        type: "success",
        closeOnConfirm: true
    }, function () {
        location.href = "category_select.he"
    });
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

function showConfirmMessage() {
    swal({
        title: "정말 정지하시겠습니까?",
        text: "다시 복구할 수 없습니다!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#e14eca",
        confirmButtonText: "정지",
        cancelButtonText: "취소",
        closeOnConfirm: false
    }, function () {
        swal("정지 완료 됨", "해당 계정이 정지되었습니다", "success");
    });
}

function showModifyMessage() {
    swal({
        title: "정말 수정하시겠습니까?",
        text: "다시 복구할 수 없습니다!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#e14eca",
        confirmButtonText: "수정",
        cancelButtonText: "취소",
        closeOnConfirm: false
    },function(){
		let fd = new FormData($('#he_form')[0])//object형태로 데이터 생성 
		
		$.ajax({
			url:'modify_result.he',
			type:'post',
			data:fd,
			contentType:false,
			processData:false,
			error: function(xhr,status,error){
				showError(error)
			},
			success:function(data,xhr,status){
				showSuccessMessage()
			}
	   })
    });
   
}

function showCateModify() {
    swal({
        title: "정말 수정하시겠습니까?",
        text: "다시 복구할 수 없습니다!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#e14eca",
        confirmButtonText: "수정",
        cancelButtonText: "취소",
        closeOnConfirm: false
    },function(){
		let fd = new FormData($('#modal_form')[0])//object형태로 데이터 생성 
		
		$.ajax({
			url:'category_modifyR.he',
			type:'post',
			data:fd,
			contentType:false,
			processData:false,
			error: function(xhr,status,error){
				showError(error)
			},
			success:function(data,xhr,status){
				showCateSuccessMessage()
			}
	   })
    });
   
}

function showError(error){
	swal("에러발생",error, "error");
}


function showCancelMessage() {
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
        	let param = $('#he_form').serialize();
        	$.post("delete_result.he",param,function(data,state){
        		showdelconfirm();
        	})
        } else {
            swal("취소됨", "계정 삭제가 취소되었습니다", "error");
        }
    });
}

function showdelconfirm(){
	swal({
        title: "삭제 완료",
        text: "해당 계정이  삭제되었습니다",
        type: "success",
        closeOnConfirm: true
    }, function () {
        location.href = "member_select.he"
    });
}




function showWithCustomIconMessage() {
    swal({
        title: "Sweet!",
        text: "Here's a custom image.",
        imageUrl: "../../images/thumbs-up.png"
    });
}

function showHtmlMessage() {
    swal({
        title: "HTML <small>Title</small>!",
        text: "A custom <span style=\"color: #CC0000\">html<span> message.",
        html: true
    });
}

function showAutoCloseTimerMessage() {
    swal({
        title: "Auto close alert!",
        text: "I will close in 2 seconds.",
        timer: 2000,
        showConfirmButton: false
    });
}

function showPromptMessage() {
    swal({
        title: "An input!",
        text: "Write something interesting:",
        type: "input",
        showCancelButton: true,
        closeOnConfirm: false,
        animation: "slide-from-top",
        inputPlaceholder: "Write something"
    }, function (inputValue) {
        if (inputValue === false) return false;
        if (inputValue === "") {
            swal.showInputError("You need to write something!"); return false
        }
        swal("Nice!", "You wrote: " + inputValue, "success");
    });
}

function showAjaxLoaderMessage() {
    swal({
        title: "Ajax request example",
        text: "Submit to run ajax request",
        type: "info",
        showCancelButton: true,
        closeOnConfirm: false,
        showLoaderOnConfirm: true,
    }, function () {
        setTimeout(function () {
            swal("Ajax request finished!");
        }, 2000);
    });
}