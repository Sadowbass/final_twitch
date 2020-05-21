
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

var cmh = {}

cmh.init = function(){
	/*location.href="test.mh";*/
	/*location.href="index.jsp?inc=admin_pages/shop/product_select.jsp";*/
	location.href="product_select.mh";
	/*$.ajax({
		url : "product_select.mh",
		type : "get",
		error : function(xhr,status,error){
			alert(error)
		},
		success : function(data, xhr, status){
			$('#mainContent').html(data);
		}		
	})	*/
}

cmh.reviewSelect = function(){
	location.href="reviewSelect.mh";
}

cmh.review_view = function(){
	location.href="reviewView.mh";
}

cmh.func = function(){
	
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
	
	$('.swalUpdate').click(function(){
		swal({
			title:"수정",
			text:"수정하시겠습니까?",
			icon:"warning",
			buttons:true,
			dangerMode:true,
		}).then((willDelete)=>{
			if(willDelete){
				swal("수정되었습니다.",{
					icon:"success",
				});
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
	
	$('#btn_search_mh').click(function(){
		frm_product_select.nowPage.value = 1;
		let param = $('#frm_product_select').serialize();
		$.post("product_select.mh", param, function(data, state){
			$('#mainContent').html(data)
		});
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
	
	$('#btn_productModify_c').click(function(){
		
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
	let param = $('#frm_product_select').serialize();
	
	$.post("product_view.mh",param, function(data,state){
		$('#mainContent').html(data);
	});
}

cmh.orderView = function(serial){
	location.href = "index.jsp?inc=admin_pages/shop/order_view.jsp";
}



cmh.go = function(nowPage){
	frm_product_select.nowPage.value = nowPage;
	let param = $('#frm_product_select').serialize();
	$.post("product_select.mh", param, function(data, state){
		$('#mainContent').html(data)
	});
}
