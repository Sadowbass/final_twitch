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

        $.post("qna.jsp", function (data, state) {
            $('#sh_main').html(data)
        });


    })
}

store.inquiry = function () {

    $.post("inquiry.jsp", function (data, state) {
        $('#sh_main').html(data)
    });

}

store.qna = function () {

    $.post("qna.jsp", function (data, state) {
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

store.rSelect = function () {
    //console.log("dsdsdsdsdhfgjksdhjfhsdkjfh")
    //let param = $('#frm_review').serialize();
    $.post('reviewSelect.str', function (data, state) {
        $('#Reviews').html("")
        console.log(data);
        $('#test1').attr("class", "");
        $('#test2').attr("class", "active");
        for (temp of data) {
            let divReviewItem = document.createElement('div');
            divReviewItem.className = "review-item clearfix";
            let divSubmit = document.createElement('div')
            divSubmit.className = "review-item-submitted";
            let strong = document.createElement('strong');
            strong.innerText = temp.mem_id;
            let em = document.createElement('em');
            em.innerText = temp.review_date;
            let divRateit = document.createElement('div')
            divRateit.className = "rateit";
            divRateit.setAttribute("data-rateit-value", temp.review_like)
            divRateit.setAttribute("data-rateit-ispreset", "true");
            divRateit.setAttribute("data-rateit-readonly", "true");
            let divContent = document.createElement('div');
            divContent.className = "review-item-content";
            let p = document.createElement('p');
            p.innerText = temp.rContent

            divContent.appendChild(p);
            divSubmit.appendChild(strong);
            divSubmit.appendChild(em);
            divSubmit.appendChild(divRateit);

            divReviewItem.appendChild(divSubmit);
            divReviewItem.appendChild(divContent);
            $('#Reviews').append(divReviewItem)
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
                    <img src="/admin/admin_pages/product_photo/${arr[0]}" alt="Cool green dress with red bell" class="img-responsive">
                  </div>
                  <div class="product-other-images">` +
        tt`<a href="javascript:;" ><img alt="Berry Lace Dress" src="/admin/admin_pages/product_photo/${arr[1]}"></a>` +
        tt`<a href="javascript:;" ><img alt="Berry Lace Dress" src="/admin/admin_pages/product_photo/${arr[2]}"></a>` +
        tt`<a href="javascript:;" ><img alt="Berry Lace Dress" src="/admin/admin_pages/product_photo/${arr[3]}"></a>` +
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
}

function reload_js(src) {
    $('script[src="' + src + '"]').remove();
    $('<script>').attr('src', src).appendTo('head');
}

