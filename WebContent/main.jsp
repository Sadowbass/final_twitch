<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"

         pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<style>
ol,
ul {
    list-style: none
}

blockquote,
q {
    quotes: none
}

blockquote:before,
blockquote:after,
q:before,
q:after {
    content: '';
    content: none
}

table {
    border-collapse: collapse;
    border-spacing: 0
}


* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -o-box-sizing: border-box;
    -ms-box-sizing: border-box;
    box-sizing: border-box
}

p {
    line-height: 2.0em
}

h1 {
    font-size: 3.0em;
    line-height: 40px
}

a {
    text-decoration: none;
    color: rgba(74, 92, 110, 0.92)
}

a:hover {
    color: #fff
}

img {
    max-width: 100%
}

.pull-right {
    float: right
}

.pull-left {
    float: left
}

header {
    padding: 30px 20px;
    background: rgba(64, 82, 100, 0.92);
    color: #ffffff;
    margin-bottom: 20px
}

.btn-download {
    background: rgba(24, 42, 60, 0.92);
    color: rgba(124, 142, 160, 0.92);
    padding: 20px 50px;
    display: inline-block;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -o-border-radius: 5px;
    -ms-border-radius: 5px;
    border-radius: 5px
}

.btn-download:hover {
    background: rgba(94, 112, 130, 0.92)
}

.wrapper {
    max-width: 1000px;
    margin: 0 auto
}

.wrapper:before,
.wrapper:after {
    content: '';
    display: table;
    clear: both
}

footer {
    margin-top: 30px;
    background: rgba(24, 42, 60, 0.92);
    color: rgba(124, 142, 160, 0.92);
    padding: 20px 0;
    text-align: left;
    font-size: 0.9em
}

@keyframes anima {
    from {
        margin-top: -50px;
        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
        filter: alpha(opacity=0);
        -moz-opacity: 0;
        -khtml-opacity: 0;
        opacity: 0
    }
    to {
        margin: auto;
        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
        filter: alpha(opacity=100);
        -moz-opacity: 1;
        -khtml-opacity: 1;
        opacity: 1
    }
}

@-webkit-keyframes anima {
    from {
        margin-left: -20px;
        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
        filter: alpha(opacity=0);
        -moz-opacity: 0;
        -khtml-opacity: 0;
        opacity: 0
    }
    to {
        margin-left: 10px;
        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
        filter: alpha(opacity=100);
        -moz-opacity: 1;
        -khtml-opacity: 1;
        opacity: 1
    }
}



.pic {
    max-width: 300px;
    max-height: 200px;
    position: relative;
    overflow: hidden;
    margin: 10px;
    display: inline-block;
    -webkit-animation: anima 2s;
    -moz-animation: anima 2s;
    -o-animation: anima 2s;
    -ms-animation: anima 2s;
    animation: anima 2s;
    -webkit-backface-visibility: hidden;
    -moz-backface-visibility: hidden;
    -o-backface-visibility: hidden;
    -ms-backface-visibility: hidden;
    backface-visibility: hidden;
    

}

.pic-3d {
    -webkit-perspective: 500;
    -moz-perspective: 500;
    -o-perspective: 500;
    -ms-perspective: 500;
    perspective: 500;
    -webkit-transform-style: preserve-3d;
    -moz-transform-style: preserve-3d;
    -o-transform-style: preserve-3d;
    -ms-transform-style: preserve-3d;
    transform-style: preserve-3d
}

.pic-caption {
    cursor: default;
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(232, 86, 133,0.8);
    padding: 10px;
    text-align: center;
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
    filter: alpha(opacity=0);
    -moz-opacity: 0;
    -khtml-opacity: 0;
    opacity: 0
}

.pic-image {
    -webkit-transform: scale(1.1);
    -moz-transform: scale(1.1);
    -o-transform: scale(1.1);
    -ms-transform: scale(1.1);
    transform: scale(1.1)
}

.pic:hover .pic-image {
    -webkit-transform: scale(1);
    -moz-transform: scale(1);
    -o-transform: scale(1);
    -ms-transform: scale(1);
    transform: scale(1)
}

.pic-title {
    font-size: 1.8em
}

a,
a:hover,
.pic .pic-image,
.pic-caption,
.pic:hover .pic-caption,
.pic:hover img {
    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -o-transition: all 0.5s ease;
    -ms-transition: all 0.5s ease;
    transition: all 0.5s ease
}

.pic:hover .bottom-to-top,
.pic:hover .top-to-bottom,
.pic:hover .left-to-right,
.pic:hover .right-to-left,
.pic:hover .rotate-in,
.pic:hover .rotate-out,
.pic:hover .open-up,
.pic:hover .open-down,
.pic:hover .open-left,
.pic:hover .open-right,
.pic:hover .come-left,
.pic:hover .come-right {
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
    filter: alpha(opacity=100);
    -moz-opacity: 1;
    -khtml-opacity: 1;
    opacity: 1;
    -webkit-user-select: none;
    -moz-user-select: none;
    -o-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -webkit-touch-callout: none;
    -moz-touch-callout: none;
    -o-touch-callout: none;
    -ms-touch-callout: none;
    touch-callout: none;
    -webkit-tap-highlight-color: transparent;
    -moz-tap-highlight-color: transparent;
    -o-tap-highlight-color: transparent;
    -ms-tap-highlight-color: transparent;
    tap-highlight-color: transparent
}

.bottom-to-top {
    top: 50%;
    left: 0
}

.pic:hover .bottom-to-top {
    top: 0;
    left: 0
}

.top-to-bottom {
    bottom: 50%;
    left: 0
}

.pic:hover .top-to-bottom {
    left: 0;
    bottom: 0
}

.left-to-right {
    top: 0;
    right: 50%
}

.pic:hover .left-to-right {
    right: 0;
    top: 0
}

.right-to-left {
    top: 0;
    left: 50%
}

.pic:hover .right-to-left {
    left: 0;
    top: 0
}

.rotate-in {
    -webkit-transform: rotate(90deg) scale(0.1);
    -moz-transform: rotate(90deg) scale(0.1);
    -o-transform: rotate(90deg) scale(0.1);
    -ms-transform: rotate(90deg) scale(0.1);
    transform: rotate(90deg) scale(0.1);
    top: 0;
    left: 0
}

.pic:hover .rotate-in {
    -webkit-transform: rotate(360deg) scale(1);
    -moz-transform: rotate(360deg) scale(1);
    -o-transform: rotate(360deg) scale(1);
    -ms-transform: rotate(360deg) scale(1);
    transform: rotate(360deg) scale(1)
}

.rotate-out {
    -webkit-transform: rotate(90deg) scale(3);
    -moz-transform: rotate(90deg) scale(3);
    -o-transform: rotate(90deg) scale(3);
    -ms-transform: rotate(90deg) scale(3);
    transform: rotate(90deg) scale(3);
    top: 0;
    left: 0
}

.pic:hover .rotate-out {
    -webkit-transform: rotate(360deg) scale(1);
    -moz-transform: rotate(360deg) scale(1);
    -o-transform: rotate(360deg) scale(1);
    -ms-transform: rotate(360deg) scale(1);
    transform: rotate(360deg) scale(1)
}

.open-down {
    -webkit-transform: rotateX(-180deg);
    -moz-transform: rotateX(-180deg);
    -o-transform: rotateX(-180deg);
    -ms-transform: rotateX(-180deg);
    transform: rotateX(-180deg);
    top: 0;
    left: 0
}

.pic:hover .open-down {
    -webkit-transform: rotateX(0);
    -moz-transform: rotateX(0);
    -o-transform: rotateX(0);
    -ms-transform: rotateX(0);
    transform: rotateX(0)
}

.open-up {
    -webkit-transform: rotateX(180deg);
    -moz-transform: rotateX(180deg);
    -o-transform: rotateX(180deg);
    -ms-transform: rotateX(180deg);
    transform: rotateX(180deg);
    top: 0;
    left: 0
}

.pic:hover .open-up {
    -webkit-transform: rotateX(0);
    -moz-transform: rotateX(0);
    -o-transform: rotateX(0);
    -ms-transform: rotateX(0);
    transform: rotateX(0)
}

.open-left {
    -webkit-transform: rotateY(180deg);
    -moz-transform: rotateY(180deg);
    -o-transform: rotateY(180deg);
    -ms-transform: rotateY(180deg);
    transform: rotateY(180deg);
    left: 0;
    top: 0
}

.pic:hover .open-left {
    -webkit-transform: rotateY(0deg);
    -moz-transform: rotateY(0deg);
    -o-transform: rotateY(0deg);
    -ms-transform: rotateY(0deg);
    transform: rotateY(0deg)
}

.open-right {
    -webkit-transform: rotateY(-180deg);
    -moz-transform: rotateY(-180deg);
    -o-transform: rotateY(-180deg);
    -ms-transform: rotateY(-180deg);
    transform: rotateY(-180deg);
    left: 0;
    top: 0
}

.pic:hover .open-right {
    -webkit-transform: rotateY(0deg);
    -moz-transform: rotateY(0deg);
    -o-transform: rotateY(0deg);
    -ms-transform: rotateY(0deg);
    transform: rotateY(0deg)
}

.come-left {
    -webkit-transform: rotateY(90deg) rotateX(90deg);
    -moz-transform: rotateY(90deg) rotateX(90deg);
    -o-transform: rotateY(90deg) rotateX(90deg);
    -ms-transform: rotateY(90deg) rotateX(90deg);
    transform: rotateY(90deg) rotateX(90deg);
    left: 0;
    top: 0
}

.pic:hover .come-left {
    -webkit-transform: rotateY(0) rotateX(0);
    -moz-transform: rotateY(0) rotateX(0);
    -o-transform: rotateY(0) rotateX(0);
    -ms-transform: rotateY(0) rotateX(0);
    transform: rotateY(0) rotateX(0)
}

.come-right {
    -webkit-transform: rotateY(-90deg) rotateX(-90deg);
    -moz-transform: rotateY(-90deg) rotateX(-90deg);
    -o-transform: rotateY(-90deg) rotateX(-90deg);
    -ms-transform: rotateY(-90deg) rotateX(-90deg);
    transform: rotateY(-90deg) rotateX(-90deg);
    left: 0;
    top: 0
}

.pic:hover .come-right {
    -webkit-transform: rotateY(0) rotateX(0);
    -moz-transform: rotateY(0) rotateX(0);
    -o-transform: rotateY(0) rotateX(0);
    -ms-transform: rotateY(0) rotateX(0);
    transform: rotateY(0) rotateX(0)
}

@media screen and (max-width: 560px) {
    .pic {
        max-width: 400px;
        max-height: 300px;
        display: block;
        -webkit-animation: none;
        -moz-animation: none;
        -o-animation: none;
        -ms-animation: none;
        animation: none;
        margin: 10px auto
    }
}

</style>
<div class="container-fluid pb-0" style="margin-top: 53px;">
    <div class="top-mobile-search">
        <div class="row">
            <div class="col-md-12">
                <form class="mobile-search">
                    <div class="input-group">
                        <input type="text" placeholder="Search for..."
                               class="form-control">
                        <div class="input-group-append">
                            <button type="button" class="btn btn-dark">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    

    <!--Effect: Come Left -->

    
    <div class="top-category section-padding mb-4">
        <div class="row">
            <div class="col-md-12">
                <div class="main-title">
                    <h4 style='font-weight: bold;'>생방송 채널</h6>
                </div>
            </div>
            <div class="col-md-12">
                <div class="owl-carousel owl-carousel-category">

                    <c:forEach items="${recList}" var="i">
                        <div class="item">
                            <div class="category-item">
                                <a href="/${i.air_mid}">
                                    <div class="row">
                                        <div class="col-7">
                                            <c:choose>
                                                <c:when test="${i.ph_sysfile != null}">
                                                    <img class="img-fluid" src="img/user-photo/${i.ph_sysfile}">
                                                </c:when>
                                                <c:otherwise>
                                                    <img class="img-fluid" src="img/user-photo/guest-icon.png">
                                                </c:otherwise>
                                            </c:choose></div>
                                        <div class="col-5">
                                            <h6>${i.air_mid}</h6>
                                            <h6>${i.air_gname}</h6>
                                            <p>${i.cnt}views</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>
    </div>
    <hr>
    <div class="video-block section-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="main-title">
                   <h4 style='font-weight: bold;'>추천 카테고리</h6>
                </div>
            </div>

            <c:forEach var="i" items="${catList}" begin="1" end="8">
                <div class="col-xl-3 col-sm-6 mb-3 text-center">
                    <div class="video-card text-center" style="width: 78%;">
                        <div class="video-card-image">
                            <a href="/categories/all?findTag=${i.cat_gname}">
                                        <div class="pic pic-3d">
               							 <img src="img/cate/${i.cat_sysfile}" class="img-fluid pic-image" alt="Pic" style="margin-top: 12px; width: 130px;">
               							 <span class="pic-caption come-left">
              								  <h1 class="pic-title" style='color:white;font-size: 15px'>${i.cat_gname}</h1>
               									 <p style='color:yellow'>탐색하러 가기!</p>
           								 </span>
          								 </div>
    
                            
                                
                            </a>
                        </div>
                        <div class="video-card-body">
                            <div class="video-title">
                                <a href="/categories/all?findTag=${i.cat_gname}">${i.cat_gname}</a>
                            </div>
                            <div class="video-view" style="color: red; font-size: 13px; font-family: 'Jeju Gothic'">
                                    ${i.cnt} views &nbsp;
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <hr class="mt-0">
</div>
<!-- /.container-fluid -->
<!-- Sticky Footer -->
<%@include file="footer.jsp" %>
<script src="js/carousel.js"></script>
