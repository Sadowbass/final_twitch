<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link href="plugins/sweetalert/sweetalert.css" rel="stylesheet" />
</head>


<div class="container-fluid">
    <div class="row clearfix">

        <div class="col-lg-8 col-md-10 col-sm-10 col-xs-12 col-lg-offset-2 col-md-offset-1 col-sm-offset-1">
            <div class="card">
                <div class="body">
                    <div>
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab"
                                    data-toggle="tab">글 상세보기</a></li>

                        </ul>

                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade in active" id="home">
                                <div class="panel panel-default panel-post review_detail_panel">
                                    <div class="panel-heading">
                                        <div class="media">

                                            <div class="media-body">
                                                <h4 class="media-heading">
                                                    글쓴이
                                                </h4>
                                                <input type="text" class="form-control" placeholder="Text input" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-body review_detail_panel_body">
                                        <div class="post">
                                            <div class="post-heading">
                                                <label>제목</label>
                                                <input type="text" class="form-control" placeholder="Text input" />
                                                <label class="star_label">별점</label>
                                                <ul class="review_detail_stars">
                                                    <li class="">

                                                        <i class="material-icons shop_star">star</i>
                                                        <i class="material-icons shop_star">star</i>
                                                        <i class="material-icons shop_star">star</i>
                                                        <i class="material-icons shop_star">star_half</i>
                                                        <i class="material-icons shop_star">star_border</i>


                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="post-content">

                                                <div class=" review_detail_content">
                                                    <textarea class="form-control" rows="5"></textarea>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer review_footer">

                                        <div id="carousel-example-generic" class="carousel slide review_slide"
                                            data-ride="carousel">
                                            <!-- Indicators -->
                                            <ol class="carousel-indicators">
                                                <li data-target="#carousel-example-generic" data-slide-to="0"
                                                    class="active"></li>
                                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                            </ol>

                                            <!-- Wrapper for slides -->
                                            <div class="carousel-inner" role="listbox">
                                                <div class="item active">
                                                    <img src="images/image-gallery/11.jpg" />
                                                </div>
                                                <div class="item">
                                                    <img src="images/image-gallery/12.jpg" />
                                                </div>
                                                <div class="item">
                                                    <img src="images/image-gallery/19.jpg" />
                                                </div>
                                            </div>

                                            <!-- Controls -->
                                            <a class="left carousel-control" href="#carousel-example-generic"
                                                role="button" data-slide="prev">
                                                <span class="glyphicon glyphicon-chevron-left"
                                                    aria-hidden="true"></span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                            <a class="right carousel-control" href="#carousel-example-generic"
                                                role="button" data-slide="next">
                                                <span class="glyphicon glyphicon-chevron-right"
                                                    aria-hidden="true"></span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="js-sweetalert help_detail_btn">
                                    <p>
                                        <button class="btn btn-defalt waves-effect" data-type="cancel2">삭제</button>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Custom Js -->

<script src="js/pages/examples/profile.js"></script>
<script src="plugins/sweetalert/sweetalert.min.js"></script>
<script src="js/pages/ui/dialogs.js"></script>
<script src="js/shop.js"></script>



</html>