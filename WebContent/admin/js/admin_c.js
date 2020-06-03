
function LoadImg(value,i){
	if(i!=null){
	if(value.files && value.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			/* alert(e.target.result); */
			/* $('#target'+i).attr('src',e.target.result); */
			$('#target'+i).css({"background-image":"url("+e.target.result+")"});
		}
		/* alert(value.files[0]) */
		reader.readAsDataURL(value.files[0])
	}
	}else if(i == null){
		if (value.files && value.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				 alert(e.target.result); 
				 $('#target'+i).attr('src',e.target.result); 
				$('#adminImgTarget').attr('src', e.target.result);
			}
			 alert(value.files[0]) 
			reader.readAsDataURL(value.files[0])
		}
	}
}

function noticeView(serial) {
	
	$('#noticeSerial').val(serial);
	$('#frm_notice').submit();
}

function goProfile1(){
	$('#goProfile').submit();
}

var cmh = {}


// 상품 조회
cmh.init = function(){	
	location.href="product_select.mh";	
}

cmh.reviewSelect = function(){
	location.href="reviewSelect.mh";
}

cmh.review_view = function(serial){
	
	$('#review_serial').val(serial);
	$('#frm_reviewDetail_mh').submit();
}

cmh.func = function(){
	
	/*$('#NewPasswordConfirm').blur(function(){
		if($('#NewPassword').val() != $('#NewPasswordConfirm').val()){
			$('#adminPwdModify').attr('disabled',true);
		}else{
			$('#adminPwdModify').attr('disabled',false);
		}
	})*/
	
	$('#adminPwdModify').click(function(){
		
		if($('#NewPassword').val() != $('#NewPasswordConfirm').val()){
			/*$('#adminPwdModify').attr('disabled',true);*/
			swal("비밀번호가 일치하지 않습니다.");
			
		}else{
			/*$('#adminPwdModify').attr('disabled',false);*/
		
			let param = $('#frm_profile').serialize();
			
			swal({
				title:"수정",
				text:"수정하시겠습니까?",
				icon:"warning",
				buttons:true,
				dangerMode:true
			}).then((v1)=>{
				if(v1){
					
					$.ajax({
						url : "adminPwdModify.mh",
						type : "post",
						data : param,
						success : function(data, xhr, state){
							swal(data,{
								icon: "success",
							})												
						}
					})	
				}
			});
		}
		
	})
	
	
	// 관리자 프로필 -> 기본 정보 변경 수정 버튼
	$('#adminModifyBtn').click(function(){
		/*let y= $('#year').val();
		let m= $('#month').val();
		let d= $('#day').val();
		let birth =y+'-'+m+'-'+d;
		
		$('#birth').val(birth);*/
		
		let param = $('#frm_profile').serialize();
		
		swal({
			title:"수정",
			text:"수정하시겠습니까?",
			icon:"warning",
			buttons:true,
			dangerMode:true,
		}).then((v)=>{
			if(v){
				$.ajax({
					url : "adminModify.mh",
					type : "post",
					data : param,
					success : function(data, xhr, state){
						swal(data,{
							icon: "success",
						})												
					}
				})	
			}
		});
		
	})
	
	
	
	// notice_modify.jsp
	
	$('#btn_modifyNotice').click(function(){
					
		let param = $('#frm_noticeModify').serialize();
		
		$.ajax({
			url : "noticeModify.mh",
			type : "post",
			data : param,
			success : function(data, xhr, state){
				swal(data).then((v)=>{
					location.href='notice.mh';
				})
			}
		})
		
	});
	
	$('#btn_deleteNotice').click(function(){
		$.ajax({
			url : "noticeDelete.mh",
			type : "post",
			data : {"serial" : $('#noticeNO').val()},
			success : function(data, xhr, state){
				swal(data).then((v)=>{
					location.href='notice.mh';
				})
			}
		})
	})
	
	// end notice_modify.jsp
	
	// noticeInsert.jsp
	$('#btn_noticeInsert').click(function(){
		
		let param = $('#frm_noticeInsert').serialize();
		
		$.ajax({
			url:"noticeInsertR.mh",
			type : "POST",
			data : param,
			dataType : "text",
			success : function(data, xhr, state){

				swal(data).then((v)=>{
					location.href='notice.mh'
				})
			}
			
		})
	})
	// end noticeInsert.jsp
	
	// order_view.jsp
	$('#btn_orderDelete').click(function(){
		swal({
			title:"정말 삭제하시겠습니까?",
			buttons:true,
		}).then((v)=>{
			if(v){
				
				$.ajax({
					url : "orderViewDelete.mh",
					type : "post",
					data : {"order_serial" : $('#order_serial_mh').val()},
					success : function(data, xhr, state){
						swal("삭제되었습니다.").then((v)=>{
							location.href='orderSelect.mh'
						})
					}
					
				})
			}
		})
		
	})
	
	// end order_view.jsp
	
	// order_select.jsp
	// 검색버튼 누르면
	$('#btn_orderSearch_mh').click(function(){
		$('#orderSelect_nowPage').val(1);
		$('#frm_orderSelect_mh').submit();
	})
	
	// end order_select.jsp
	
	
	
	// review.jsp
	
	$('#btn_reviewSearch_mh').click(function(){
		$('#frm_reviewDetail_mh').attr('action','reviewSelect.mh')
		$('#frm_reviewDetail_mh').submit();
	})
	
	// end review.jsp
	
	//////////////////////
	
	/*review_detail.jsp*/
	$('#btn_reviewDelete_mh').click(function(){
		swal({
			title:"정말 삭제하시겠습니까?",
			icon : "warning",
			buttons:true,
			dangerMode : true,
		}).then((v)=>{
			if(v) {				
				$.ajax({
					url : "reviewDelete.mh",
					type : "post",
					data : { "review_id": $('#review_id').val()},
					success : function(data, xhr, state){
						swal("삭제 되었습니다.",{
							icon: "success",
						}).then((v)=>{
							cmh.reviewSelect();
						})
						
						
					}
				})			
			}
		})
	})
	/*end review_detail.jsp*/
	
	/* product_insert.jsp */
	$('#close1').click(function(){
		$('#target1').css({'background-image':'url(https://via.placeholder.com/250)'})
		$('#file1').val('');
	})
	$('#close2').click(function(){
		$('#target2').css({'background-image':'url(https://via.placeholder.com/250)'})
		$('#file2').val('');
	})
	$('#close3').click(function(){
		$('#target3').css({'background-image':'url(https://via.placeholder.com/250)'})
		$('#file3').val('');
	})
	$('#close4').click(function(){
		$('#target4').css({'background-image':'url(https://via.placeholder.com/250)'})
		$('#file4').val('');
	})
	
	// 등록버튼
	$('#productInsert_c').click(function(){
		
		var fileCheck = document.getElementById('file1').value;
		if(fileCheck==''){
			swal("사진을 넣어주세요","","warning");
		}else{
			
			var f = $('#first option:selected').val();
			
			switch(f){
			case "HOODIES":
				$('#category').val("HOODIES");
				break;
			case "TEES":
				$('#category').val("TEES");
				break; 
			case "DOG":
				$('#category').val("DOG");
				break; 
			case "BOTTOMS":
				$('#category').val($('#sel1 option:selected').val());
				break; 	
			case "BAGS & ACCESSORIES":
				$('#category').val($('#sel2 option:selected').val());
				break; 	
			case "STEALS":
				$('#category').val($('#sel3 option:selected').val());
				break; 	
			}
		
			let fd = new FormData($('#productInsertForm_c')[0]);
			
			$.ajax({
				url : 'productInsert.mh',
				type:'post',
				data:fd,
				contentType : false,
				processData : false,
				error : function(xhr, status, error){
					alert("안된다")
				},
				success : function(data, xhr, status){
					swal({
						title:"등록 완료",
						text:data,
						icon:"success",
						buttons:true,
						dangerMode:false,
					}).then((willDelete)=>{
						if(willDelete){
							location.reload();
						}
					});
						
				}
			})
		}
	})
	
	/* 초기화 버튼 누루면 */
	$('#btn_reset').click(function(){
		location.reload();
	})
		
	/* end product_insert.jsp */
	
	$('#adminPhotoModify').click(function(){
		
		$('#frm_profile').attr('enctype','multipart/form-data');
		
		let fd = new FormData($('#frm_profile')[0]);
		
		swal({
			title:"수정",
			text:"수정하시겠습니까?",
			icon:"warning",
			buttons:true,
			dangerMode:true,
		}).then((v)=>{
			if(v){
				$.ajax({
					url : "adminPhotoModify.mh",
					type : "post",
					data : fd,
					contentType : false,
					processData : false,
					success : function(data, xhr, state){
						swal(data,{
							icon: "success",
						})												
					}
				})	
			}
		});
	});
	
	
	/* profile.jsp */
	$('#terms_condition_check').change(function(){
		if(this.checked){
			$('#adminModifyBtn').attr('disabled',false);
		}else{
			$('#adminModifyBtn').attr('disabled',true);
		}
	})
	
	
	/* end profile.jsp */
	
	/* product_select.jsp*/
	
	$('#btn_refleshList_c').click(function(){
		cmh.init();
	})
	
	// 검색버튼 클릭하면
	$('#btn_search_mh').click(function(){
		frm_product_select.nowPage.value = 1;
		$('#frm_product_select').submit();
	})
	
	/* end product_select.jsp*/
	
	/* product_view.jsp */
	
	// 삭제버튼
	$('#btn_delete_c').click(function(){
		swal({
			title:"정말 삭제하시겠습니까?",
			icon : "warning",
			buttons:true,
			dangerMode : true,
		}).then((v)=>{
			if(v) {			
				$.ajax({
					url : "productDelete.mh",
					type : "post",
					data : { "product_id": $('#product_id').val()},
					success : function(data, xhr, state){
						swal("삭제 되었습니다.",{
							icon: "success",
						}).then((v)=>{
							cmh.init();
						})
						
						
					}
				})			
			}
		})
	})
	
	$('#btn_goList_c').click(function(){
		cmh.init();
	})
	
	// 상품 수정 버튼
	$('#btn_productModify_c').click(function(){
		
		var fileCheck = document.getElementById('file1').value;
		
		// 사진은 수정하지 않고 내용만 수정할 경우
		if(fileCheck==''){
			/*swal("사진을 넣어주세요","","warning");*/
			$('#frm_productModify_c').attr("enctype","");
			
			var f = $('#first option:selected').val();
			
			switch(f){
			case "HOODIES":
				$('#category').val("HOODIES");
				break;
			case "TEES":
				$('#category').val("TEES");
				break; 
			case "DOG":
				$('#category').val("DOG");
				break; 
			case "BOTTOMS":
				$('#category').val($('#sel1 option:selected').val());
				break; 	
			case "BAGS & ACCESSORIES":
				$('#category').val($('#sel2 option:selected').val());
				break; 	
			case "STEALS":
				$('#category').val($('#sel3 option:selected').val());
				break; 	
			}
			/*let fd = new FormData($('#frm_productModify_c')[0]);*/
			
			let param = $('#frm_productModify_c').serialize();
			
			
			$.ajax({
				url : 'pModify.mh',
				type:'post',
				data: param,
				error : function(xhr, status, error){
					alert("안된다")
				},
				success : function(data, xhr, status){
					swal({
						title:"수정 완료",
						text:data,
						icon:"success",
						buttons:true,
						dangerMode:false,
					}).then((willDelete)=>{
						if(willDelete){
							cmh.init();
						}
					});
						
				}
			})
			
		}else{
			
			var f = $('#first option:selected').val();
			
			switch(f){
			case "HOODIES":
				$('#category').val("HOODIES");
				break;
			case "TEES":
				$('#category').val("TEES");
				break; 
			case "DOG":
				$('#category').val("DOG");
				break; 
			case "BOTTOMS":
				$('#category').val($('#sel1 option:selected').val());
				break; 	
			case "BAGS & ACCESSORIES":
				$('#category').val($('#sel2 option:selected').val());
				break; 	
			case "STEALS":
				$('#category').val($('#sel3 option:selected').val());
				break; 	
			}
		
			let fd = new FormData($('#frm_productModify_c')[0]);
			
			$.ajax({
				url : 'productModify.mh',
				type:'post',
				data:fd,
				contentType : false,
				processData : false,
				error : function(xhr, status, error){
					alert("안된다")
				},
				success : function(data, xhr, status){
					swal({
						title:"수정 완료",
						text:data,
						icon:"success",
						buttons:true,
						dangerMode:false,
					}).then((willDelete)=>{
						if(willDelete){
							cmh.init();
						}
					});
						
				}
			})
		}
	})
	
	
	/* end product_view.jsp */
	
}
/*end chm_func()*/

cmh.productView = function(product_id){
	/*location.href = "index.jsp?inc=admin_pages/shop/product_view.jsp";*/
	$('#productSerial').val(product_id);
	
	$('#frm_product_select').attr('action','product_view.mh');
	
	$('#frm_product_select').submit();
	
/*	$.post("product_view.mh",param, function(data,state){
		$('#mainContent').html(data);
		
	});*/
}

cmh.orderView = function(serial, mem_id){
	$('#orderSelect_orderSerial').val(serial);
	$('#orderSelect_mem_id').val(mem_id);
	$('#frm_orderSelect_mh').attr('action','orderView.mh');
	$('#frm_orderSelect_mh').submit();
}



cmh.go = function(nowPage){
	frm_product_select.nowPage.value = nowPage;
	$('#frm_product_select').submit();
/*	let param = $('#frm_product_select').serialize();
	$.post("product_select.mh", param, function(data, state){
		$('#mainContent').html(data)
	});*/
}
cmh.go1 = function(nowPage){
	console.log(nowPage);
	$('#nowPage').val(nowPage);
	$('#frm_reviewDetail_mh').attr('action','reviewSelect.mh');
	$('#frm_reviewDetail_mh').submit();
}
