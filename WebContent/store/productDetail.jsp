<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style type="text/css">
  .imgs_wrap{
    width: 800px;
   
  }
  .imgs_wrap img {
    max-width: 200px;
    margin: 3px;
  }
  
</style>
</head>
<body>
<div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="localhost/store/index.jsp">Home</a></li>
            <li><a href="">Store</a></li>
            <li class="active">Category</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-5">
            <ul class="list-group margin-bottom-25 sidebar-menu">
              <li class="list-group-item clearfix">
              
              <li class="list-group-item clearfix">
                <a href="javascript:void(0);" ><i class="fa fa-angle-right"></i> HOODIES</a>
                
              </li>
              <li class="list-group-item clearfix">
                <a href="javascript:void(0);" ><i class="fa fa-angle-right"></i> TEES</a>
                
              </li>
              
              <li class="list-group-item clearfix dropdown">
                <a href="javascript:void(0);" ><i class="fa fa-angle-right"></i> BOTTOMS</a>
                <ul class="dropdown-menu" >
                
                  <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Long Pants</a></li>
                  <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Short Pants</a></li>
           
                </ul>
              </li>
              
              <li class="list-group-item clearfix dropdown">
                <a href="javascript:void(0);" ><i class="fa fa-angle-right"></i> BAGS & ACCESSORIES</a>
                <ul class="dropdown-menu" >
                
                 <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Bags</a></li>
                 <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Hats</a></li>
                 <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Socks</a></li>
                 <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> ETC</a></li>
           
                </ul>
              </li>
              
              <li class="list-group-item clearfix">
                <a href="javascript:void(0);" ><i class="fa fa-angle-right"></i> DOGS</a>
                
              </li>
              
              <li class="list-group-item clearfix dropdown">
                <a href="javascript:void(0);" ><i class="fa fa-angle-right"></i> STEALS</a>
                <ul class="dropdown-menu" >
                
                  <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Clothes</a></li>
                  <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> The others</a></li>
           
                </ul>
              </li>
              
            </ul>

            <div class="sidebar-filter margin-bottom-25">
              

              <h3>Price</h3>
              <p>
                <label for="amount">Range:</label>
                <input type="text" id="amount" style="border:0; color:#f6931f; font-weight:bold;">
              </p>
              <div id="slider-range"></div>
            </div>

            <div class="sidebar-products clearfix">
              <h2>Bestsellers</h2>
              <div class="item">
                <a href="shop-item.html"><img src="assets/pages/img/products/k1.jpg" alt="Some Shoes in Animal with Cut Out"></a>
                <h3><a href="shop-item.html">Some Shoes in Animal with Cut Out</a></h3>
                <div class="price">$31.00</div>
              </div>
              <div class="item">
                <a href="shop-item.html"><img src="assets/pages/img/products/k4.jpg" alt="Some Shoes in Animal with Cut Out"></a>
                <h3><a href="shop-item.html">Some Shoes in Animal with Cut Out</a></h3>
                <div class="price">$23.00</div>
              </div>
              <div class="item">
                <a href="shop-item.html"><img src="assets/pages/img/products/k3.jpg" alt="Some Shoes in Animal with Cut Out"></a>
                <h3><a href="shop-item.html">Some Shoes in Animal with Cut Out</a></h3>
                <div class="price">$86.00</div>
              </div>
            </div>
          </div>
          <!-- END SIDEBAR -->

          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-7">
            <div class="product-page">
              <div class="row">
                <div class="col-md-6 col-sm-6">
                  <div class="product-main-image">
                    <img src="assets/pages/img/products/model7.jpg" alt="Cool green dress with red bell" class="img-responsive" data-BigImgsrc="assets/pages/img/products/model7.jpg">
                  </div>
                  <div class="product-other-images">
                    <a href="assets/pages/img/products/model3.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="assets/pages/img/products/model3.jpg"></a>
                    <a href="assets/pages/img/products/model4.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="assets/pages/img/products/model4.jpg"></a>
                    <a href="assets/pages/img/products/model5.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="assets/pages/img/products/model5.jpg"></a>
                  </div>
                </div>
                <div class="col-md-6 col-sm-6">
                  <h1>Cool green dress with red bell</h1>
                  <div class="price-availability-block clearfix">
                    <div class="price">
                      <strong><span>$</span>47.00</strong>
                      <em>$<span>62.00</span></em>
                    </div>
        
                  </div>
                  <div class="description">
                    <p>Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat 
Nostrud duis molestie at dolore.</p>
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
                        <input id="product-quantity" type="text" value="1" readonly class="form-control input-sm">
                    </div>
                    <button class="btn btn-primary" type="submit">Add to cart</button>
                  </div>
                  <div class="review">
                    <input type="range" value="4" step="0.25" id="backing4">
                    <div class="rateit" data-rateit-backingfld="#backing4" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                    </div>
                    <a href="javascript:;">7 reviews</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:;">Write a review</a>
                  </div>
                  <ul class="social-icons">
                    <li><a class="facebook" data-original-title="facebook" href="javascript:;"></a></li>
                    <li><a class="twitter" data-original-title="twitter" href="javascript:;"></a></li>
                    <li><a class="googleplus" data-original-title="googleplus" href="javascript:;"></a></li>
                    <li><a class="evernote" data-original-title="evernote" href="javascript:;"></a></li>
                    <li><a class="tumblr" data-original-title="tumblr" href="javascript:;"></a></li>
                  </ul>
                </div>

                <div class="product-page-content">
                  <ul id="myTab" class="nav nav-tabs">
                    <li id="item1"><a href="#Description"  data-toggle="tab">Description</a></li>
                    <li id="item2"><a href="#Reviews" data-toggle="tab" onclick="store.rSelect()">Reviews (2)</a></li>
                  </ul>
                  <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade" id="Description">
                      <p>Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed sit nonumy nibh sed euismod laoreet dolore magna aliquarm erat sit volutpat Nostrud duis molestie at dolore. Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed sit nonumy nibh sed euismod laoreet dolore magna aliquarm erat sit volutpat Nostrud duis molestie at dolore. Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed sit nonumy nibh sed euismod laoreet dolore magna aliquarm erat sit volutpat Nostrud duis molestie at dolore. </p>
                    </div>
                    
                   
                    <div class="tab-pane fade in active" id="Reviews">
                      <!--<p>There are no reviews for this product.</p>-->
                      <c:forEach var='i' items='${list }'>
                     <div class="panel panel-default">
                      
                      <div class="panel-heading">
                        <div class="accordion-toggle" data-toggle="collapse" data-target="#accordion1_+${i.review_id }" data-parent="" aria-expanded="false">
                     
		                      <div class="review-item clearfix" >
		                         <div class="review-item-submitted">
			                          <strong>${i.rSubject }</strong>
			                          <em>${i.review_date }</em>
			                          <div  class="rateit" data-rateit-value="${i.review_like }" data-rateit-ispreset="true" data-rateit-readonly="true">
			                          
			                          </div>
			                          <input type="button" class="btn_review_delete" value="X" onclick="store.reviewDelete()" >
		                         </div>                                              
			                      <div class="review-item-content">
			                            <p>${i.rContent }</p>
			                      </div>
		                      </div>
                         </div>
                       </div>
                       
                       <div id="" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
	                       
	                        <div class="panel-body"> 
		                        <c:forEach var='p' items='${i.rpList }'>
		                         <div class="imgs_review">
								    <img src="./reviewimages/${p.image1 }">
								 </div>
		                        </c:forEach>
	                        </div>
	                        
                        </div>
                        
                     </div>
                       
                        </c:forEach>
                        
                      </div>
                      
                      <form name="frm_review" id="frm_review" method="post">
					    <input type="hidden" name="product_id" >
					    <input type="hidden" name="review_id" >
					  </form>

                      <!-- BEGIN FORM-->
                      <form id="frm_store" action="#" class="reviews-form" role="form" method="post" enctype="multipart/form-data">
                        <h2>Write a review</h2>
                        <div class="form-group">
                          <label for="mId">Name <span class="require">*</span></label>
                          <input type="text" class="form-control" id="mId" name="mId">
                        </div>
                        <div class="form-group">
                          <label for="rSubject">Subject <span class="require">*</span></label>
                          <input type="text" class="form-control" id="rSubject" name="rSubject">
                        </div>
                        <div class="form-group">
                          <label for="review">Content <span class="require">*</span></label>
                          <textarea class="form-control" rows="8" id="review" name="rContent"></textarea>
                        </div>
                        <div class="form-group">
		                    <label for="input_imgs">File input </label>
		                
		                    <input type="file" name="reviewFile" id ="input_imgs"  multiple>
		                    <p class="help-block">사진은 3장까지 가능합니다.</p>
							<div>
								<div class="imgs_wrap">
								</div>
							</div>
                		</div>
                        <div class="form-group">
                          <label for="backing5">Rating</label>
                          <input type="range" value="4" step="0.25" id="backing5" name="rLike">
                          <div class="rateit" data-rateit-backingfld="#backing5" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                          </div>
                        </div>
                        <div class="padding-top-20">                  
                         <input type="button" id="btnSubmitReview" class="btn btn-primary" value="Send" onclick="store.rInsert()">
                        </div>
                        <input type="hidden" id="pId" name="pId" value=101>
                       
                      </form>
                      <!-- END FORM--> 
                    </div>
                  </div>
                </div>

                <div class="sticker sticker-sale"></div>
              </div>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->

       
      </div>
      
      

    <script src="./assets/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>
    <script>
    
   
    
    $(document).ready(function(){
    	
    	
		$("#input_imgs").on("change", handleImages);
		
		 $(".sidebar .dropdown > a").click(function (event) {
	            if ($(this).next().hasClass('dropdown-menu')) {
	                event.preventDefault();
	                if ($(this).hasClass("collapsed") == false) {
	                    $(this).addClass("collapsed");
	                    $(this).siblings(".dropdown-menu").slideDown(300);
	                } else {
	                    $(this).removeClass("collapsed");
	                    $(this).siblings(".dropdown-menu").slideUp(300);
	                }
	            } 
	        });
		
	});
    
	function handleImages(e){	
		
		var sel_files = [];
		var files = e.target.files;
	    var fileArr = Array.prototype.slice.call(files);
	    
	    fileArr.forEach(function(f){
	    	if(!f.type.match("image.*")){
	        	alert("이미지 확장자만 업로드 가능합니다.");
	            return;
	        }
	       
	        	sel_files.push(f);
	            var reader = new FileReader();
	            reader.onload = function(e){
	            	//alert(e.target.result);
	            	var html = "<img src =\""+ e.target.result + "\" />";
	                $('.imgs_wrap').append(html);
	               
	            }
	            reader.readAsDataURL(f);
	});
	    
	    
	
	}
	

	
	
	
	
	
	
    </script>
      
    
</body>
</html>