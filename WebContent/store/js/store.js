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
		     sucess : function(data, xhr, status){
		    	 console.log(error);
		     },
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
		     sucess : function(data, xhr, status){
		    	 console.log(error);
		     },
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
		     sucess : function(data, xhr, status){
		    	 console.log(error);
		     },
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
		     sucess : function(data, xhr, status){
		    	 console.log(error);
		     },
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
		     sucess : function(data, xhr, status){
		    	 console.log(error);
		     },
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
		     sucess : function(data, xhr, status){
		    	 console.log(error);
		     },
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
		     sucess : function(data, xhr, status){
		    	 console.log(error);
		     },
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
		     sucess : function(data, xhr, status){
		    	 console.log(error);
		     },
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
		     sucess : function(data, xhr, status){
		    	 console.log(error);
		     },
				success : function(data, xhr, status){
					$("#sh_main").html(data);
				}
			})
		
	
}

store.viewItem = function(){
	
	// let fd = new FormData($('#frm_brd')[0]);
	let fd = 0;
	console.log('제발1');
		$.ajax({
			
			 url : 'productView.str',
		     type : 'post',
		     data : fd,
		     contentType : false,
		     processData : false,
		     error : function(xhr, status, error){},
		     sucess : function(data, xhr, status){
		    	 console.log(error);
		     },
				success : function(data, xhr, status){
					$("#sh_main").html(data);
				}
			})
	
	
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
		     sucess : function(data, xhr, status){
		    	 console.log(error);
		     },
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
		     sucess : function(data, xhr, status){
		    	 console.log(error);
		     },
				success : function(data, xhr, status){
					$("#sh_main").html(data);
				}
			})
	
}

store.pl = function(){
	
	//
	
		
       // let fd = new FormData($('#frm_brd')[0]);
	let fd = 0;
		
		$.ajax({
			
			 url : 'productList.jsp',
		     type : 'post',
		     data : fd,
		     contentType : false,
		     processData : false,
		     error : function(xhr, status, error){},
		     sucess : function(data, xhr, status){
		    	 console.log(error);
		     },
				success : function(data, xhr, status){
					$("#sh_main").html(data);
				}
			})
		
	
		
	
}


   


