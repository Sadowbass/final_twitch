
function LoadImg(value,i){
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
}

function LoadImg(value) {
	if (value.files && value.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			/* alert(e.target.result); */
			/* $('#target'+i).attr('src',e.target.result); */
			$('#adminImgTarget').attr('src', e.target.result);
		}
		/* alert(value.files[0]) */
		reader.readAsDataURL(value.files[0])
	}
}

var cmh = {}

cmh.func = function(){
	
	/*product_insert.jsp*/

	$('#close1').click(function(){
		$('#target1').css({'background-image':'url(https://via.placeholder.com/300)'})
	})
	$('#close2').click(function(){
		$('#target2').css({'background-image':'url(https://via.placeholder.com/300)'})
	})
	$('#close3').click(function(){
		$('#target3').css({'background-image':'url(https://via.placeholder.com/300)'})
	})
	
	$('#productInsert_c').click(function(){
		
		
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
					alert(data);
			}
		})
	})
	
	/* end product_insert.jsp*/
	
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
	
}	

cmh.productView = function(serial){
	location.href = "index.jsp?inc=admin_pages/shop/product_view.jsp";
}

cmh.orderView = function(serial){
	location.href = "index.jsp?inc=admin_pages/shop/order_view.jsp";
}
