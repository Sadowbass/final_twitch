<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf-8");
%>

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
    <div class="top-category section-padding mb-4">
        <div class="row">
            <div class="col-md-12">
                <div class="main-title">
                    <h1>Q & A</h1>
                </div>
            </div>
            <div class="col-md-12">
                <div class="owl-carousel owl-carousel-category">

                    

                </div>
            </div>
        </div>
    </div>
    <hr>
    <div class="video-block section-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="main-title">
                    <h6>추천 카테고리</h6>
                </div>
            </div>

            <c:forEach var="i" items="${catList}" begin="1" end="8">
                <div class="col-xl-3 col-sm-6 mb-3 text-center">
                    <div class="video-card text-center" style="width: 78%;">
                        <div class="video-card-image">
                            <a href="/categories/all?findTag=${i.cat_gname}">
                                <img class="img-fluid" src="img/cate/${i.cat_sysfile}" style="margin-top: 12px; width: 130px;">
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