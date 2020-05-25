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
                                    data-toggle="tab">공지사항</a></li>

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
                                                <label class="shop_notice_hit">조회수</label>
                                                <input type="text" class="form-control" placeholder="Text input" />
                                            </div>
                                            <div class="post-content">

                                                <div class=" review_detail_content">
                                                    <textarea class="form-control shop_notice_" rows="5"></textarea>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer review_footer">

                                    </div>
                                </div>
                                <div class="js-sweetalert help_detail_btn">
                                    <p>
                                        <button class="btn btn-defalt waves-effect" data-type="cancel2">삭제</button>
                                        <button type="button" class="btn btn-defalt waves-effect m-r-20"
                                            id="notice_modify_btn">수정</button>

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