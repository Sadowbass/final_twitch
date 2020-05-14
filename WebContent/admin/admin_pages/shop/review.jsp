<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
</head>


<div class="container-fluid">
    <div class="block-header">
        <h2>게시판관리</h2>
    </div>
    <!-- Basic Table -->
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        리뷰관리
                    </h2>
                    <div class="row clearfix">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-lg-offset-6 col-md-offset-6">
                            <div class="input-group review_search">
                                <span class="input-group-addon" id=""><i class="material-icons"
                                        id="review_search_icon">search</i></span>
                                <input type="text" class="form-control review_search_input" placeholder="제품명 or 아이디 검색"
                                    aria-describedby="basic-addon1">
                            </div>
                        </div>
                    </div>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);">Action</a></li>
                                <li><a href="javascript:void(0);">Another action</a></li>
                                <li><a href="javascript:void(0);">Something else here</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="body table-responsive">
                    <c:forEach begin="1" end="5">
                        <div class="row clearfix">
                            <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">
                                <div class="card review_row" onclick="review_view()">
                                    <div class="header">
                                        <h2>
                                            아이디
                                            <small>2010.23.4-7:40</small>
                                        </h2>
                                        <ul class="header-dropdown m-r--5">
                                            <li class="">

                                                <i class="material-icons shop_star">star</i>
                                                <i class="material-icons shop_star">star</i>
                                                <i class="material-icons shop_star">star</i>
                                                <i class="material-icons shop_star">star_half</i>
                                                <i class="material-icons shop_star">star_border</i>


                                            </li>
                                        </ul>
                                    </div>
                                    <div class="body">
                                        <div class="row clearfix">
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                                <div class="review_1">
                                                    <img src="images/goods.jpg" class="review_img">
                                                </div>
                                            </div>
                                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                                <div class="review_2">
                                                    <ol class="review_content">
                                                        <li class="review_li">
                                                            리뷰작성하는창입니다리뷰작성하는창입니다리뷰작성하는창입니다리뷰작성하는창col-lg-offset-1col-lg-offset-1col-lg-offset-1col-lg-offset-1입니다리뷰작성하는창입니다리뷰작성하는창입니다리뷰작성하는창입니다리뷰작성하는창입니다리뷰작성하는창입니다리뷰작성하는창입니다리뷰작성하는창입니다리뷰작성하는창입니다리뷰작성하는창입니다리뷰작성하는창입니다ㅍ리뷰작성하는창입니다리뷰작성하는창입니다리뷰작성하는창입니다리뷰작성하는창입니다리뷰작성하는창입니다리뷰작성하는창입니다리뷰작성하는창입니다리뷰작성하는창입니다ㅍ리뷰작성하는창입니다리뷰작성하는창입니다리뷰작성하는창입니다리뷰작성하는창입니다리뷰작성하는창입니다
                                                    </ol>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="page_div">
                        <ul class="pagination">
                            <li>
                                <a href="javascript:void(0);" class="waves-effect">
                                    <i class="material-icons">chevron_left</i>
                                </a>
                            </li>
                            <li><a href="javascript:void(0);" class="waves-effect">1</a></li>
                            <li><a href="javascript:void(0);" class="waves-effect">2</a></li>
                            <li><a href="javascript:void(0);" class="waves-effect">3</a></li>
                            <li><a href="javascript:void(0);" class="waves-effect">4</a></li>
                            <li><a href="javascript:void(0);" class="waves-effect">5</a></li>
                            <li>
                                <a href="javascript:void(0);" class="waves-effect">
                                    <i class="material-icons">chevron_right</i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- #END# Basic Table -->

</div>

<script src="js/shop.js"></script>

</html>