<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="">Store</a></li>
            <li class="active">Checkout</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <h1>Checkout</h1>
            <!-- BEGIN CHECKOUT PAGE -->
            <div class="panel-group checkout-page accordion scrollable" id="checkout-page">

              <!-- BEGIN CHECKOUT 
              <div id="checkout" class="panel panel-default">
                <div class="panel-heading">
                  <h2 class="panel-title">
                    <a data-toggle="collapse" data-parent="#checkout-page" href="#checkout-content" class="accordion-toggle">
                      Step 1: Checkout Options
                    </a>
                  </h2>
                </div>
                <div id="checkout-content" class="panel-collapse collapse in">
                  <div class="panel-body row">
                    <div class="col-md-6 col-sm-6">
                      <h3>New Customer</h3>
                      <p>Checkout Options:</p>
                      <div class="radio-list">
                        <label>
                          <input type="radio" name="account"  value="register"> Register Account
                        </label>
                        <label>
                          <input type="radio" name="account"  value="guest"> Guest Checkout
                        </label> 
                      </div>
                      <p>By creating an account you will be able to shop faster, be up to date on an order's status, and keep track of the orders you have previously made.</p>
                      <button class="btn btn-primary" type="submit" data-toggle="collapse" data-parent="#checkout-page" data-target="#payment-address-content">Continue</button>
                    </div>
                    <div class="col-md-6 col-sm-6">
                      <h3>Returning Customer</h3>
                      <p>I am a returning customer.</p>
                      <form role="form" action="#">
                        <div class="form-group">
                          <label for="email-login">E-Mail</label>
                          <input type="text" id="email-login" class="form-control">
                        </div>
                        <div class="form-group">
                          <label for="password-login">Password</label>
                          <input type="password" id="password-login" class="form-control">
                        </div>
                        <a href="javascript:;">Forgotten Password?</a>
                        <div class="padding-top-20">                  
                          <button class="btn btn-primary" type="submit">Login</button>
                        </div>
                        <hr>
                        <div class="login-socio">
                          <p class="text-muted">or login using:</p>
                          <ul class="social-icons">
                            <li><a href="javascript:;" data-original-title="facebook" class="facebook" title="facebook"></a></li>
                            <li><a href="javascript:;" data-original-title="Twitter" class="twitter" title="Twitter"></a></li>
                            <li><a href="javascript:;" data-original-title="Google Plus" class="googleplus" title="Google Plus"></a></li>
                            <li><a href="javascript:;" data-original-title="Linkedin" class="linkedin" title="LinkedIn"></a></li>
                          </ul>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
              <!-- END CHECKOUT -->

             <form id="frm_check" method="post">
             
               <input type ="hidden" id="amount" value="${map.sum}" name = "amount" />
              
                 
              
              <!-- BEGIN SHIPPING ADDRESS -->
              <div id="shipping-address" class="panel panel-default">
                <div class="panel-heading">
                  <h2 class="panel-title">
                    <a data-toggle="collapse" data-parent="#checkout-page" href="#shipping-address-content" class="accordion-toggle">
                      Step 1: Delivery Details
                    </a>
                  </h2>
                </div>
                <div id="shipping-address-content" class="panel-collapse collapse">
                
                <c:forEach var="vo" items="${map.list2 }">
                
                   <input type ="hidden" value="${vo.mem_id }" name = "mem_id" />
                   
                  <div class="panel-body row">
                  
                
                    <div class="col-md-6 col-sm-6">
                    
                     
                     
                      <div class="form-group">
                        <label for="firstname-dd">Name <span class="require">*</span></label>
                        <input type="text" id="firstname-dd" name="get_name" value="${vo.mem_name }" class="form-control">
                        
                      </div>
                      
                      <div class="form-group">
                        <label for="email-dd">E-Mail <span class="require">*</span></label>
                        <input type="text" id="email-dd" name="mem_email" value="${vo.mem_email}" class="form-control">
                      </div>
                      <div class="form-group">
                        <label for="telephone-dd">Telephone <span class="require">*</span></label>
                        <input type="text" id="telephone-dd" name="get_phone" class="form-control">
                      </div>
                   
                    </div>
                    <div class="col-md-6 col-sm-6">
                       
		                       <div class="form-group">
		                
		                  <label for="address1-dd">우편번호 <span class="require">*</span></label>
		                   <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" >
		                  
		                    <input type="text" id="sample4_postcode" name="zip_code" placeholder="우편번호" class="form-control">
		          
		                 </div>
		                 
		                 <div class="form-group">  
		                  <label for="first-name">도로명 주소<span class="require">*</span></label>
		               
		                    <input type="text" id="sample4_roadAddress" name="address1" placeholder="도로명주소" class="form-control">
		                
		                 </div>
		                 
		                 <div class="form-group"> 
		                  <label for="first-name">지번 주소<span class="require">*</span></label>
		                 
		                    <input type="text" id="sample4_jibunAddress"  placeholder="지번주소" class="form-control">
		                
		               </div>
		               
		               <div class="form-group"> 
		                  <label  for="first-name">상세주소<span class="require">*</span></label>
		                 
		                    <input type="text" id="address3" name="address2" placeholder="상세주소" class="form-control">
		                
		               </div>
           
                      
                    </div>
               
                   
                  </div>
                  </c:forEach>
                </div>
              </div>
              <!-- END SHIPPING ADDRESS -->

              <!-- BEGIN SHIPPING METHOD 
              <div id="shipping-method" class="panel panel-default">
                <div class="panel-heading">
                  <h2 class="panel-title">
                    <a data-toggle="collapse" data-parent="#checkout-page" href="#shipping-method-content" class="accordion-toggle">
                      Step 2: Delivery Method
                    </a>
                  </h2>
                </div>
                <div id="shipping-method-content" class="panel-collapse collapse">
                  <div class="panel-body row">
                    <div class="col-md-12">
                      <p>Please select the preferred shipping method to use on this order.</p>
                      <h4>Flat Rate</h4>
                      <div class="radio-list">
                        <label>
                          <input type="radio" name="FlatShippingRate" value="FlatShippingRate"> Flat Shipping Rate
                        </label>
                      </div>
                      <div class="form-group">
                        <label for="delivery-comments">Add Comments About Your Order</label>
                        <textarea id="delivery-comments" rows="8" class="form-control"></textarea>
                      </div>
                      <button class="btn btn-primary  pull-right" type="submit" id="button-shipping-method" data-toggle="collapse" data-parent="#checkout-page" data-target="#confirm-content">Continue</button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- END SHIPPING METHOD -->

             
              <!-- BEGIN CONFIRM -->
              <div id="confirm" class="panel panel-default">
                <div class="panel-heading">
                  <h2 class="panel-title">
                    <a data-toggle="collapse" data-parent="#checkout-page" href="#confirm-content" class="accordion-toggle">
                      Step 2: Confirm Order
                    </a>
                  </h2>
                </div>
                <div id="confirm-content" class="panel-collapse collapse">
                  <div class="panel-body row">
                    <div class="col-md-12 clearfix">
                      <div class="table-wrapper-responsive">
                      <table>
                        <tr>
                    <th class="goods-page-image">Image</th>
                    <th class="goods-page-description">Description</th>
             
                    <th class="goods-page-quantity">Quantity</th>
                    <th class="goods-page-price">Unit price</th>
                    <th class="goods-page-total" colspan="2">Total</th>
                  </tr>
                  
                  <c:forEach var="i" items="${map.list }">
                  
                  <input type ="hidden" value="${i.cart_id }" name = "cart_id" />
                 <input type ="hidden" value="${i.product_id }" name = "product_id" />
                 <input type ="hidden" value="${i.product_size }" name = "order_size" />
                  
                  <tr>
                    <td class="goods-page-image">
                      <a href="javascript:;"><img src="../../admin/admin_pages/product_photo/${i.sysfile}" alt="Berry Lace Dress"></a>
                    </td>
                    <td class="goods-page-description">
                      <h3>${i.product_name}</h3>
                      <p><strong>Item </strong> - Size: ${i.product_size}</p>
                   
                    </td>
                   
                    <td class="goods-page-quantity">
                      <div class="product-quantity">
                          <input id="product-quantity" name="cart_count" type="text" value="${i.cart_count }" readonly class="form-control input-sm">
                      </div>
                    </td>
                    <td class="goods-page-price">
                      <strong><span>$</span>${i.product_price}</strong>
                    </td>
                    <td class="goods-page-total">
                      <strong><span>$</span>${i.totPrice}</strong>
                    </td>
                   
                  </tr>
                  
                </c:forEach>  
                  
                </table>
               
                     
                      </div>
                      <div class="checkout-total-block">
                        <ul>
                          <li>
                            <em>Sub total</em>
                            <strong class="price"><span>$</span>${map.sumMoney }</strong>
                          </li>
                          <li>
                            <em>Shipping cost</em>
                            <strong class="price"><span>$</span>${map.fee}</strong>
                          </li>
                          <li class="checkout-total-price">
                            <em>Total</em>
                            <strong class="price"><span>$</span>${map.sum}</strong>
                                
                          </li>
                        </ul>
                      </div>
                      <div class="clearfix"></div>
                      <button class="btn btn-primary pull-right" type="button" onclick="store.order()" id="button-confirm">Confirm Order</button>
                      <button type="button" class="btn btn-default pull-right margin-right-20">Cancel</button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- END CONFIRM -->
              
              
              </form>
              
            </div>
            <!-- END CHECKOUT PAGE -->
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>
    
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
 
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
 
                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
 
                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
</body>
</html>