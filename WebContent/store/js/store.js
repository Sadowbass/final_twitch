/**
 * store.js
 * silver
 */


let store = {}

store.func = function () {


    //My Page 눌렀을때 mypage 페이지로 이동	
    $('#myPage').click(function () {

        $.post("mypage.jsp", function (data, state) {
            $('#sh_main').html(data)
        });


    })

    //My wishlist 눌렀을때 wishlist 페이지로 이동	
    $('#myWishlist').click(function () {

        $.post("wishlist.jsp", function (data, state) {
            $('#sh_main').html(data)
        });


    })

    //checkout 눌렀을때  checkout 페이지로 이동	
    $('#checkout').click(function () {

        $.post("checkout.jsp", function (data, state) {
            $('#sh_main').html(data)
        });


    })

    //qna눌렀을때  QnA 페이지로 이동	
    $('#qna').click(function () {

    	 $.post('faq.str', function (data, state) {
    	        $('#sh_main').html(data)
    	    });


    })
    
    //add to cart 눌렀을때
    $('#addcart').click(function(){
    	let param1 = $('#cart_product').val();
    	let param2 = $("#sizeOption option:selected").val();
    	
    	console.log(param1);
    	console.log(param2);
    	
    	
        $.ajax({
            url: 'addToCart.str',
            data: {'product_id': param1,
            	   'product_size' :param2
                   },
            type: 'post',
            error: (error) => {
                console.log(error)
            },
            success: (data) => {
              
                $('#sh_main').html(data);
            }
        })
    })
}

store.addcart = function(){
	
	let param1 = $('#cart_product').val();
	let param2 = $("#sizeOption option:selected").val();
	let param3 = $("#product-quantity").val();
	

	
    $.ajax({
        url: 'addToCart.str',
        data: {'product_id': param1,
        	   'product_size' :param2,
        	   'product_q' :param3
        	  
               },
        type: 'post',
        error: (error) => {
            console.log(error)
        },
        success: (data) => {
          
            $('#sh_main').html(data);
        }
    })
}

store.inquiry = function () {

    $.post('inquiry.jsp', function (data, state) {
        $('#sh_main').html(data)
    });
    
    alert(document.domain)

}

store.qna = function () {

	$.post('faq.str', function (data, state) {
        $('#sh_main').html(data)
    });

}

store.addressInsert = function () {

    $.post("addressForm.jsp", function (data, state) {
        $('#sh_main').html(data)
    });

}

store.myPage = function () {


    $.post("mypage.jsp", function (data, state) {
        $('#sh_main').html(data)
    });

}

store.wishList = function () {

    $.post("wishlist.jsp", function (data, state) {
        $('#sh_main').html(data)
    });


}


store.viewItem = function () {
    let param = $('#pidField').val();
    $.ajax({
        url: 'productDetail.str',
        data: {'pid': param},
        type: 'post',
        error: (error) => {
            console.log(error)
        },
        success: (data) => {
            document.getElementsByClassName("fancybox-close")[0].click();
            $('#sh_main').html(data);
        }
    })


}

store.viewCart = function () {

    $.post("viewCart.jsp", function (data, state) {
        $('#sh_main').html(data)
    });


}

store.checkout = function () {

    $.post("checkout.jsp", function (data, state) {
        $('#sh_main').html(data)
    });

}

store.pl = function (cate) {
    cate = cate.toLowerCase();
    cate = {'cate':cate};

    /*    $.post("productList.sc", cate, function (data, state) {
            $('#sh_main').html(data)
        });*/

    $.ajax({
        url:"productList.sc",
        data:cate,
        error:(error)=>{
            console.log(error)
        },
        success:(data)=>{
            $('#sh_main').html(data)
        }
    })

}

//review 입력(insert)
store.rInsert = function () {

    let fd = new FormData($('#frm_store')[0]);

    $.ajax({
        url: 'reviewInsert.str',
        type: 'post',
        data: fd,
        contentType: false,
        processData: false,
        error: function (xhr, status, error) {
            swal("실패", "리뷰 등록에 실패했습니다!", "error");
        },

        success: function (data, xhr, status) {
            swal("Success!", "리뷰가 등록되었습니다", "success");
            $("#sh_main").html(data);
        }
    })


}

store.reviewDelete = function(rreview_id){
	alert(rreview_id)
	frm_review.review_id.value = rreview_id;
	//alert('ss');
   let param = $('#frm_review').serialize();
	//console.log(param);
	$.post('reviewDelete.str',param , function(data, state){
		
		$('#sh_main').html(data);
		
	});
	
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
            
            
            var review_id = document.createElement('INPUT');
            review_id.setAttribute('type', 'hidden');
            review_id.setAttribute('id', 'rd');
            review_id.setAttribute('name', 'rreview_id');
            review_id.setAttribute('value', temp.review_id);
            
            var btnReviewD = document.createElement('input');
                btnReviewD.type = "button"
                btnReviewD.className = "btn btn-outline-dark"
                btnReviewD.value = "삭제"	
            	btnReviewD.addEventListener('click', function(){
                store.reviewDelete(temp.review_id);
            });
            
           
                let photo = document.createElement('div')
            	photo.className ="imgs_wrap";
            
            for(p of temp.rpList){
            	
            	let image = document.createElement('img');
            	image.src = "./reviewimages/"+p.image1;
            	
            	 photo.appendChild(image);
            	
            }
           
            panelBody.appendChild(photo);
            
            panelBody.appendChild(review_id);
            panelBody.appendChild(btnReviewD);
            
            
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

/*상품 view클릭시 팝업 메소드*/
let detailView = function (pid, subject, retailprice, saleprice, content, img) {
    let fix1 = img.replace("[", "");
    let fix2 = fix1.replace("]", "");
    let arr = fix2.split(",");
    let price = Number(retailprice).toLocaleString();

    function tt(strings, tArr) {
        var ttr;
        var str1 = strings[0];
        var str2 = strings[1];

        if (tArr === undefined) {
            ttr = "";
            return ttr;
        } else {
            return str1 + tArr.trim() + str2;
        }
    }

    let result = `<div class="product-page product-pop-up">
              <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-3">
                  <div class="product-main-image">
                    <img src="/admin/admin_pages/product_photo/${arr[0]}" alt="Cool green dress with red bell" class="img-responsive" id="mainImg">
                  </div>
                  <div class="product-other-images">` +
        tt`<a href="javascript:;" ><img alt="Berry Lace Dress" src="/admin/admin_pages/product_photo/${arr[1]}" onclick="zoomImgChange(this)"></a>` +
        tt`<a href="javascript:;" ><img alt="Berry Lace Dress" src="/admin/admin_pages/product_photo/${arr[2]}" onclick="zoomImgChange(this)"></a>` +
        tt`<a href="javascript:;" ><img alt="Berry Lace Dress" src="/admin/admin_pages/product_photo/${arr[3]}" onclick="zoomImgChange(this)"></a>` +
        `</div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-9">
                  <h2>${subject}</h2>
                  <div class="price-availability-block clearfix">
                    <div class="price">
                      <strong>${price}<span>원</span></strong>
                      <em><span>${price}</span>원</em>
                    </div>
                    <div class="availability">
                      Availability: <strong>In Stock</strong>
                    </div>
                  </div>
                  <div class="description">
                    <p>${content}</p>
                  </div>
                  <div class="product-page-options">
                    <div class="pull-left">
                      <label class="control-label">Size:</label>
                      <select class="form-control input-sm">
                        <option>FREE</option>
                      </select>
                    </div>
                  </div>
                  <div class="product-page-cart">
                    <div class="product-quantity">
                        <input id="product-quantity" type="text" value="1" readonly name="product-quantity" class="form-control input-sm">
                    </div>
                    <button class="btn btn-primary" type="submit">Add to cart</button>
                    <button onclick="store.viewItem()" class="btn btn-default">More details</button>
                  </div>
                </div>
                <input type="hidden" name="pid" id="pidField" value="${pid}">
                <div class="sticker sticker-sale"></div>
              </div>
            </div>`

    $('#product-pop-up').html(result);
    reload_js('./assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js');
    Layout.initTouchspin();
    Layout.initImageZoom();
}

function reload_js(src) {
    $('script[src="' + src + '"]').remove();
    $('<script>').attr('src', src).appendTo('head');
}

function zoomImgChange(val) {
    let mainTag = document.getElementById("mainImg");
    let mainSrc = mainTag.src;
    let chgImg = val.src;
    let zoomTag = document.getElementsByClassName("zoomImg")[0];
    val.src = mainSrc;
    mainTag.src = chgImg;
    zoomTag.src = chgImg;
    Layout.initImageZoom();
}


