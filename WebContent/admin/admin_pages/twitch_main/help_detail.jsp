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

        <div class="col-xs-12 col-sm-12">
            <div class="card">
                <div class="body">
                    <div>
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab"
                                    data-toggle="tab">글 상세보기</a></li>

                        </ul>

                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade in active" id="home">
                                <div class="panel panel-default panel-post">
                                    <div class="panel-heading">
                                        <div class="media">

                                            <div class="media-body">
                                                <h4 class="media-heading">
                                                    <a href="#">글쓴이</a>
                                                </h4>
                                                시작하기(분류) - 26 Oct 2018(날짜)
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <div class="post">
                                            <div class="post-heading">
                                                <label>제목</label>
                                                <p>관심이 없는 추천 콘텐츠 삭제하기</p>
                                            </div>
                                            <div class="post-content">

                                                <div>
                                                    <iframe width="100%" height="700"
                                                        src=https://developer.snapappointments.com/bootstrap-select/
                                                        frameborder="0" allowfullscreen=""></iframe>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <ul>
                                            <li>
                                                <a href="#">
                                                    <i class="material-icons">thumb_up</i>
                                                    <span>12 Likes</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="material-icons">comment</i>
                                                    <span>5 Comments</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="material-icons">share</i>
                                                    <span>Share</span>
                                                </a>
                                            </li>
                                        </ul>

                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="text" class="form-control" placeholder="Type a comment" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="js-sweetalert help_detail_btn">
                                    <p>
                                        <button class="btn btn-defalt waves-effect" data-type="cancel2">삭제</button>
                                        <button type="button" class="btn btn-defalt waves-effect m-r-20"
                                            id="help_modify_btn">수정</button>
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
<script src="js/stream.js"></script>



</html>