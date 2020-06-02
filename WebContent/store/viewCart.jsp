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
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <h1>Shopping cart</h1>
            <div class="goods-page">
              <div class="goods-data clearfix">
               <c:choose>
			    <c:when test="${map.count == 0 }">
			    <!-- when은 ~~일때 라는 뜻 그러니까 map의 count가 0일때... -->
			    <!-- xml파일에서 hashmap에 list를 넣어놓았기 때문에 현재 map에 자료가 들어있다.  -->
			    <!-- map에 자료가 아무것도 없다면 -->
			        장바구니가 비었습니다.
			    </c:when>
			    
			    <c:otherwise>
			    <!-- map.count가 0이 아닐때, 즉 자료가 있을때 -->
			    <!-- form을 실행한다.  -->
			    <!-- form의 id를 form1로 하고, method 방식을 post로 한다. 그리고 update.do페이지로 이동시킨다. -->
			    <form id="form1" name="form1" method="post"
			       >
                <div class="table-wrapper-responsive">
                   <input  class="btn btn-primary" type="button" id="btnCartDelete" value="비우기" onclick="store.cartdeleteAll()">
                   <input  class="btn btn-primary" type="button" id="btnCartModify" value="수정" onclick="store.cartmodify()">
                   <br/><br/>
                <table summary="Shopping cart">
                
                  <tr>
                    <th class="goods-page-image">Image</th>
                    <th class="goods-page-description">Description</th>
                    <th class="goods-page-ref-no">Ref No</th>
                    <th class="goods-page-quantity">Quantity</th>
                    <th class="goods-page-price">Unit price</th>
                    <th class="goods-page-total" colspan="2">Total</th>
                  </tr>
                  <c:forEach var="i" items="${map.list }">
                  <tr>
                    <td class="goods-page-image">
                      <a href="javascript:;"><img src="../../admin/admin_pages/product_photo/${i.sysfile}" alt="Berry Lace Dress"></a>
                    </td>
                    <td class="goods-page-description">
                      <h3>${i.product_name}</h3>
                      <p><strong>Item </strong> - Size: ${i.product_size}</p>
                   
                    </td>
                    <td class="goods-page-ref-no" >
                      <input type ="hidden" value="${i.cart_id }" name = "cart_id" />
                      <input type ="hidden" value="${i.product_id }" name = "product_id" />
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
                    <td class="del-goods-col">
                      <a class="del-goods" href="#" onclick="store.cartdelete(${i.cart_id})">&nbsp;</a>
                    </td>
                  </tr>
                  </c:forEach>
                  
                </table>
               
                </div>
                 
             
                <div class="shopping-total">
                  <ul>
                    <li>
                      <em>Sub total</em>
                      <strong class="price"><span>$</span>${map.sumMoney }</strong>
                    </li>
                    <li>
                      <em>Shipping cost</em>
                      <strong class="price"><span>$</span>${map.fee }</strong>
                    </li>
                    <li class="shopping-total-price">
                      <em>Total</em>
                      <strong class="price"><span>$</span>${map.sum }</strong>
                    </li>
                  </ul>
                </div>

                </form>
    </c:otherwise>
</c:choose>
              </div>
              <button onclick= "store.pl()" class="btn btn-default" type="button">Continue shopping <i class="fa fa-shopping-cart"></i></button>
            
              <button onclick="store.checkout()" class="btn btn-primary" type="button">Checkout <i class="fa fa-check"></i></button>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->

        
      </div>
    </div>
    <script type="text/javascript">
    $(".product-quantity .form-control").TouchSpin({
        buttondown_class: "btn quantity-down",
        buttonup_class: "btn quantity-up"
    });
    $(".quantity-down").html("<i class='fa fa-angle-down'></i>");
    $(".quantity-up").html("<i class='fa fa-angle-up'></i>");
    </script>
</body>
</html>