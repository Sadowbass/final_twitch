<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <script src="./assets/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        h3 {
            height: 33px;
        }

        h3 > a {
            height: 100%;
            display: block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
    </style>
</head>
<body>
<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.jsp">Home</a></li>
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
                        <a href="javascript:void(0);"><i class="fa fa-angle-right"></i> HOODIES</a>

                    </li>
                    <li class="list-group-item clearfix">
                        <a href="javascript:void(0);"><i class="fa fa-angle-right"></i> TEES</a>

                    </li>

                    <li class="list-group-item clearfix dropdown">
                        <a href="javascript:void(0);"><i class="fa fa-angle-right"></i> BOTTOMS</a>
                        <ul class="dropdown-menu">

                            <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Long Pants</a></li>
                            <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Short Pants</a></li>

                        </ul>
                    </li>

                    <li class="list-group-item clearfix dropdown">
                        <a href="javascript:void(0);"><i class="fa fa-angle-right"></i> BAGS & ACCESSORIES</a>
                        <ul class="dropdown-menu">

                            <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Bags</a></li>
                            <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Hats</a></li>
                            <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Socks</a></li>
                            <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> ETC</a></li>

                        </ul>
                    </li>

                    <li class="list-group-item clearfix">
                        <a href="javascript:void(0);"><i class="fa fa-angle-right"></i> DOGS</a>

                    </li>

                    <li class="list-group-item clearfix dropdown">
                        <a href="javascript:void(0);"><i class="fa fa-angle-right"></i> STEALS</a>
                        <ul class="dropdown-menu">

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
                        <a href="shop-item.html"><img src="assets/pages/img/products/k1.jpg"
                                                      alt="Some Shoes in Animal with Cut Out"></a>
                        <h3><a href="shop-item.html">Some Shoes in Animal with Cut Out</a></h3>
                        <div class="price">$31.00</div>
                    </div>
                    <div class="item">
                        <a href="shop-item.html"><img src="assets/pages/img/products/k4.jpg"
                                                      alt="Some Shoes in Animal with Cut Out"></a>
                        <h3><a href="shop-item.html">Some Shoes in Animal with Cut Out</a></h3>
                        <div class="price">$23.00</div>
                    </div>
                    <div class="item">
                        <a href="shop-item.html"><img src="assets/pages/img/products/k3.jpg"
                                                      alt="Some Shoes in Animal with Cut Out"></a>
                        <h3><a href="shop-item.html">Some Shoes in Animal with Cut Out</a></h3>
                        <div class="price">$86.00</div>
                    </div>
                </div>
            </div>
            <!-- END SIDEBAR -->
            <!-- BEGIN CONTENT -->
            <div class="col-md-9 col-sm-7">
                <div class="row list-view-sorting clearfix">
                    <div class="col-md-2 col-sm-2 list-view">
                        <a href="javascript:;"><i class="fa fa-th-large"></i></a>
                        <a href="javascript:;"><i class="fa fa-th-list"></i></a>
                    </div>
                    <div class="col-md-10 col-sm-10">
                        <div class="pull-right">
                            <label class="control-label">Show:</label>
                            <select class="form-control input-sm">
                                <option value="#?limit=24" selected="selected">24</option>
                                <option value="#?limit=25">25</option>
                                <option value="#?limit=50">50</option>
                                <option value="#?limit=75">75</option>
                                <option value="#?limit=100">100</option>
                            </select>
                        </div>
                        <div class="pull-right">
                            <label class="control-label">Sort&nbsp;By:</label>
                            <select class="form-control input-sm" onchange="sorting(this.value)">
                                <option value="#?sort=p.sort_order&amp;order=ASC" selected="selected">Default</option>
                                <option value="nameAsc">Name (A - Z)</option>
                                <option value="nameDesc">Name (Z - A)</option>
                                <option value="priceAsc">Price (Low &gt; High)</option>
                                <option value="priceDesc">Price (High &gt; Low)</option>
                                <option value="#?sort=rating&amp;order=DESC">Rating (Highest)</option>
                                <option value="#?sort=rating&amp;order=ASC">Rating (Lowest)</option>
                                <option value="#?sort=p.model&amp;order=ASC">Model (A - Z)</option>
                                <option value="#?sort=p.model&amp;order=DESC">Model (Z - A)</option>
                            </select>
                        </div>
                    </div>
                </div>
                <!-- BEGIN PRODUCT LIST -->
                <div class="row product-list">

                    <c:forEach items="${result}" var="i">
                        <!-- PRODUCT ITEM START -->
                        <div class="col-md-4 col-sm-6 col-xs-12 items">
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="/admin/admin_pages/product_photo/${i.sysfile}" class="img-responsive"
                                         alt="${i.product_name}">
                                    <div>
                                        <a href="/admin/admin_pages/product_photo/${i.sysfile}"
                                           class="btn btn-default fancybox-button">Zoom</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view"
                                           onclick='detailView("${i.product_id}","${i.product_name}","${i.product_price}","${i.product_price}","${i.product_explain}","${i.sysfileList}")'>View</a>
                                    </div>
                                </div>
                                <h3><a href="shop-item.html">${i.product_name}</a></h3>
                                <div class="pi-price"><fmt:formatNumber value="${i.product_price}" type="number"/>원</div>
                                <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                            </div>
                        </div>
                        <!-- PRODUCT ITEM END -->
                    </c:forEach>

                </div>
                <!-- END PRODUCT LIST -->
                <!-- BEGIN PAGINATOR -->
                <div class="row">
                    <div class="col-md-4 col-sm-4 items-info">Items 1 to 9 of 10 total</div>
                    <div class="col-md-8 col-sm-8">
                        <ul class="pagination pull-right">
                            <li><a href="javascript:;">&laquo;</a></li>
                            <li><a href="javascript:;">1</a></li>
                            <li><span>2</span></li>
                            <li><a href="javascript:;">3</a></li>
                            <li><a href="javascript:;">4</a></li>
                            <li><a href="javascript:;">5</a></li>
                            <li><a href="javascript:;">&raquo;</a></li>
                        </ul>
                    </div>
                </div>
                <!-- END PAGINATOR -->
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
    </div>
</div>

<!-- BEGIN BRANDS -->
<div class="brands">
    <div class="container">
        <div class="owl-carousel owl-carousel6-brands">
            <a href="shop-product-list.html"><img src="assets/pages/img/brands/canon.jpg" alt="canon" title="canon"></a>
            <a href="shop-product-list.html"><img src="assets/pages/img/brands/esprit.jpg" alt="esprit" title="esprit"></a>
            <a href="shop-product-list.html"><img src="assets/pages/img/brands/gap.jpg" alt="gap" title="gap"></a>
            <a href="shop-product-list.html"><img src="assets/pages/img/brands/next.jpg" alt="next" title="next"></a>
            <a href="shop-product-list.html"><img src="assets/pages/img/brands/puma.jpg" alt="puma" title="puma"></a>
            <a href="shop-product-list.html"><img src="assets/pages/img/brands/zara.jpg" alt="zara" title="zara"></a>
            <a href="shop-product-list.html"><img src="assets/pages/img/brands/canon.jpg" alt="canon" title="canon"></a>
            <a href="shop-product-list.html"><img src="assets/pages/img/brands/esprit.jpg" alt="esprit" title="esprit"></a>
            <a href="shop-product-list.html"><img src="assets/pages/img/brands/gap.jpg" alt="gap" title="gap"></a>
            <a href="shop-product-list.html"><img src="assets/pages/img/brands/next.jpg" alt="next" title="next"></a>
            <a href="shop-product-list.html"><img src="assets/pages/img/brands/puma.jpg" alt="puma" title="puma"></a>
            <a href="shop-product-list.html"><img src="assets/pages/img/brands/zara.jpg" alt="zara" title="zara"></a>
        </div>
    </div>
</div>
<!-- END BRANDS -->
<script type="text/javascript">
    $(".sidebar .dropdown > a").click(function (event) {
        if ($(this).next().hasClass("dropdown-menu")) {
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
</script>
<script src="js/sort.js"></script>

</body>
</html>