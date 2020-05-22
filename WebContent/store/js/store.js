/**
 * store.js
 * silver
 */


let store = {}

store.func = function(){
		
			
	

  //My Page 눌렀을때 mypage 페이지로 이동	
  $('#myPage').click(function(){
		
	  $.post("mypage.jsp", function(data, state){
			$('#sh_main').html(data)
		       });
		
	
		
	})
	
	//My wishlist 눌렀을때 wishlist 페이지로 이동	
	$('#myWishlist').click(function(){
		
		$.post("wishlist.jsp", function(data, state){
			$('#sh_main').html(data)
		       });
		
		
	
		
	})
	
	//checkout 눌렀을때  checkout 페이지로 이동	
	$('#checkout').click(function(){
		
		$.post("checkout.jsp", function(data, state){
			$('#sh_main').html(data)
		       });
 
		
	})
	
	//qna눌렀을때  QnA 페이지로 이동	
	$('#qna').click(function(){
		
		$.post("qna.jsp", function(data, state){
			$('#sh_main').html(data)
		       });
		
	
		
	})
}

store.inquiry = function(){
	
	$.post("inquiry.jsp", function(data, state){
		$('#sh_main').html(data)
	       });

}

store.qna = function(){
	
	$.post("qna.jsp", function(data, state){
		$('#sh_main').html(data)
	       });

}

store.addressInsert = function(){
	
	$.post("addressForm.jsp", function(data, state){
		$('#sh_main').html(data)
	       });

}

store.myPage = function(){
	
	
	$.post("mypage.jsp", function(data, state){
		$('#sh_main').html(data)
	       });
	
}

store.wishList = function(){
	
	$.post("wishlist.jsp", function(data, state){
		$('#sh_main').html(data)
	       });
	
		
	
}





store.viewItem = function(){
	
	let param = null;
		//$('#frm_mm').serialize();
	$.post('productDetail.str', param, function(data, state){
		$('#sh_main').html(data);
	
		
	});
		

}

store.viewCart = function(){
	
	$.post("viewCart.jsp", function(data, state){
		$('#sh_main').html(data)
	       });
	
	
}

store.checkout = function(){
	
	$.post("checkout.jsp", function(data, state){
		$('#sh_main').html(data)
	       }); 
	
}

store.pl = function(){
	
	$.post("productList.str", function(data, state){
	$('#sh_main').html(data)
       }); 

	
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
	
	$.post('reviewSelect.str',param , function(data, state){
		
		console.log(data);
		$('#Reviews').html('');
		
		$('#item1').attr("class", "");
		$('#item2').attr("class", "active");
		
		for(temp of data){
			
			let divPanelDef = document.createElement('div');
			divPanelDef.className ="panel panel-default";
			let divPanelHead = document.createElement('div');
			divPanelHead.className ="panel-heading";
			let divAccordTog = document.createElement('div');
			divAccordTog.className ="accordion-toggle";
			
			divAccordTog.setAttribute('data-toggle',"collapse");
			divAccordTog.setAttribute('data-parent',"#accordion1");
			divAccordTog.setAttribute('data-target',"#accordion"+temp.review_id);
			divAccordTog.setAttribute('aria-expanded',false);
			
			let divClearfix = document.createElement('div');
            divClearfix.className="review-item clearfix";
            let divSubmitted = document.createElement('div');
            divSubmitted.className="review-item-submitted";
            let title = document.createElement('strong');
            title.innerText = temp.rSubject;
            let rdate = document.createElement('em');
            rdate.innerText = temp.review_date;
            let rLike = document.createElement('div');
            rLike.className="rateit";
            rLike.setAttribute('data-rateit-value', temp.review_like);
            rLike.setAttribute('data-rateit-ispreset', true);
            rLike.setAttribute('data-rateit-readonly', true);
            let ric = document.createElement('div');
            ric.className="review-item-content";
            let ricp = document.createElement('p');
            ricp.innerText = temp.rContent;
            
            let accord1 =document.createElement('div');
            accord1.setAttribute('id', "accordion"+temp.review_id);
            accord1.className ="panel-collapse collapse";
            accord1.setAttribute('aria-expanded',false);
            accord1.style.height = '0px';
            
            let panelBody = document.createElement('div');
            
            for(p of temp.rpList){
            	let photo = document.createElement('div')
            	photo.className ="imgs_wrap";
            	let image = document.createElement('img');
            	image.src = "./reviewimages/"+p.image1;
            	
            	photo.appendChild(image);
            	panelBody.appendChild(photo);
            	
            }
            
            ric.appendChild(ricp);
            divSubmitted.appendChild(title);
            divSubmitted.appendChild(rdate);
            divSubmitted.appendChild(rLike);
            
            divClearfix.appendChild(divSubmitted);
            divClearfix.appendChild(ric);
            
            divAccordTog.appendChild(divClearfix);
            divPanelHead.appendChild(divAccordTog);
            
            accord1.appendChild(panelBody);
     
            divPanelDef.appendChild(divPanelHead);
            divPanelDef.appendChild(accord1);
            
            $('#Reviews').append(divPanelDef);
            
		}

		
	});

	
	
}






