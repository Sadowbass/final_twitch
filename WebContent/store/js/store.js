/**
 * store.js
 * silver
 */


let store = {}

store.func = function(){
		
			
	

  //My Page 눌렀을때 mypage 페이지로 이동	
  $('#myPage').click(function(){
		
       // let fd = new FormData($('#frm_brd')[0]);
	let fd = 0;
		
		$.ajax({
			
			 url : 'mypage.jsp',
		     type : 'post',
		     data : fd,
		     contentType : false,
		     processData : false,
		     error : function(xhr, status, error){},
		    
				success : function(data, xhr, status){
					$("#sh_main").html(data);
				}
			})
		
	
		
	})
	
	//My wishlist 눌렀을때 wishlist 페이지로 이동	
	$('#myWishlist').click(function(){
		
       // let fd = new FormData($('#frm_brd')[0]);
	let fd = 0;
		
		$.ajax({
			
			 url : 'wishlist.jsp',
		     type : 'post',
		     data : fd,
		     contentType : false,
		     processData : false,
		     error : function(xhr, status, error){},
		     
				success : function(data, xhr, status){
					$("#sh_main").html(data);
				}
			})
		
	
		
	})
	
	//checkout 눌렀을때  checkout 페이지로 이동	
	$('#checkout').click(function(){
		
       // let fd = new FormData($('#frm_brd')[0]);
	let fd = 0;
		
		$.ajax({
			
			 url : 'checkout.jsp',
		     type : 'post',
		     data : fd,
		     contentType : false,
		     processData : false,
		     error : function(xhr, status, error){},
		    
				success : function(data, xhr, status){
					$("#sh_main").html(data);
				}
			})
		
	
		
	})
	
	//qna눌렀을때  QnA 페이지로 이동	
	$('#qna').click(function(){
		
       // let fd = new FormData($('#frm_brd')[0]);
	let fd = 0;
		
		$.ajax({
			
			 url : 'qna.jsp',
		     type : 'post',
		     data : fd,
		     contentType : false,
		     processData : false,
		     error : function(xhr, status, error){},
		    
				success : function(data, xhr, status){
					$("#sh_main").html(data);
				}
			})
		
	
		
	})
}

store.inquiry = function(){
	// let fd = new FormData($('#frm_brd')[0]);
	let fd = 0;
		
		$.ajax({
			
			 url : 'inquiry.jsp',
		     type : 'post',
		     data : fd,
		     contentType : false,
		     processData : false,
		     error : function(xhr, status, error){},
		     
				success : function(data, xhr, status){
					$("#sh_main").html(data);
				}
			})
}

store.qna = function(){
	// let fd = new FormData($('#frm_brd')[0]);
	let fd = 0;
		
		$.ajax({
			
			 url : 'qna.jsp',
		     type : 'post',
		     data : fd,
		     contentType : false,
		     processData : false,
		     error : function(xhr, status, error){},
		    
				success : function(data, xhr, status){
					$("#sh_main").html(data);
				}
			})
}

store.addressInsert = function(){
	 // let fd = new FormData($('#frm_brd')[0]);
	let fd = 0;
		
		$.ajax({
			
			 url : 'addressForm.jsp',
		     type : 'post',
		     data : fd,
		     contentType : false,
		     processData : false,
		     error : function(xhr, status, error){},
		    
				success : function(data, xhr, status){
					$("#sh_main").html(data);
				}
			})
}

store.myPage = function(){
	 // let fd = new FormData($('#frm_brd')[0]);
	let fd = 0;
		
		$.ajax({
			
			 url : 'mypage.jsp',
		     type : 'post',
		     data : fd,
		     contentType : false,
		     processData : false,
		     error : function(xhr, status, error){},
		     
				success : function(data, xhr, status){
					$("#sh_main").html(data);
				}
			})
}

store.wishList = function(){
	
	 // let fd = new FormData($('#frm_brd')[0]);
	let fd = 0;
		
		$.ajax({
			
			 url : 'wishlist.jsp',
		     type : 'post',
		     data : fd,
		     contentType : false,
		     processData : false,
		     error : function(xhr, status, error){},
		     
				success : function(data, xhr, status){
					$("#sh_main").html(data);
				}
			})
		
	
}





store.viewItem = function(){
	
	let param = null;
		//$('#frm_mm').serialize();
	$.post('productDetail.str', param, function(data, state){
		$('#sh_main').html(data);
	
		
	});
		

	/*
	// let fd = new FormData($('#frm_brd')[0]);
	let fd = 0;
	//console.log('제발1');
		$.ajax({
			
			 url : 'productDetail.str',
		     type : 'POST',
		     data : fd,
		     contentType : false,
		     processData : false,
		     error : function(xhr, status, error){
		    	 console.log(error);
		     },
			success : function(data, xhr, status){
				$("#sh_main").html(data);
				console.log(data)
			}
			})
	*/
	
}

store.viewCart = function(){
	
	// let fd = new FormData($('#frm_brd')[0]);
	let fd = 0;
		
		$.ajax({
			
			 url : 'viewCart.jsp',
		     type : 'post',
		     data : fd,
		     contentType : false,
		     processData : false,
		     error : function(xhr, status, error){},
		   
				success : function(data, xhr, status){
					$("#sh_main").html(data);
				}
			})
	
	
}

store.checkout = function(){
	
	  // let fd = new FormData($('#frm_brd')[0]);
	let fd = 0;
		
		$.ajax({
			
			 url : 'checkout.jsp',
		     type : 'post',
		     data : fd,
		     contentType : false,
		     processData : false,
		     error : function(xhr, status, error){},
		    
				success : function(data, xhr, status){
					$("#sh_main").html(data);
					
				}
			})
	
}

store.pl = function(){
	
	//
	
		
       // let fd = new FormData($('#frm_brd')[0]);
	let fd = 0;
	
	console.log('chk.................')
	//$('#sh_main').load('productList.str')
	
	$.ajax({
		
		 url : 'productList.str',
	     type : 'POST',
	     data : null,
	     contentType : false,
	     processData : false,
	     error : function(xhr, status, error){
	    	 console.log(error)
	     },
	    
			success : function(data, xhr, status){
				console.log(data + status)
				$("#sh_main").html(data);
				
			}
		})
		
	
		
	
}

//review 입력(insert)
store.rInsert = function(){

       let fd = new FormData($('#frm_store')[0]);
  
		$.ajax({
			
			 url : 'reviewInsert.str',
		     type : 'post',
		     data : fd,
		     contentType : false,
		     processData : false,
		     error : function(xhr, status, error){
		    	 swal("실패", "리뷰 등록에 실패했습니다!", "error");
		     },
		         
				success : function(data, xhr, status){
					 swal("Success!", "리뷰가 등록되었습니다", "success");
					$("#sh_main").html(data);
				}
			})
			
			
	
}


store.rSelect = function(){
	
	//console.log("dsdsdsdsdhfgjksdhjfhsdkjfh")
	let param = $('#frm_review').serialize();
	$.post("reviewSelect.str", param, function(data, state){
		$('#sh_main').html(data)
	});
	
	
}




