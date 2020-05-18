<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Askbootstrap">
    <meta name="author" content="Askbootstrap">
    <title>JHTA-Twitch</title>
    <!-- Favicon Icon -->
    <link rel="icon" type="image/png" href="/img/favicon.png">
    <!-- Bootstrap core CSS-->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
          type="text/css">
    <!-- Custom styles for this template-->
    <link href="/css/osahan.css" rel="stylesheet">
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="/vendor/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="/vendor/owl-carousel/owl.theme.css">
    <link rel="stylesheet" href="/css/sc_custom.css">
    <link rel="stylesheet" href="/css/css_uk.css">
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Owl Carousel -->
    <script src="/vendor/owl-carousel/owl.carousel.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="/js/custom.js"></script>
    <script src="/js/sc_custom.js"></script>
    <script src="/js/js_uk.js"></script>
</head>
<body id="page-top">
<script>
    $(document).ready(function () {
        $.ajax({
            type: 'get',
            url: '/sidebar.sc',
            success: function (data) {
                $('#sidebarplace').html(data);
            }
        })
    })
</script>
<div id="topplace">
    <%@include file="top.jsp" %>
</div>
<div id="wrapper">
    <div id="sidebarplace" style="margin-top: 53px;"></div>
    <div id="content-wrapper" style="margin-top: 53px;">
        <div class="container-fluid pb-0">
            <div class="video-block section-padding">
                <div class="row">
                    <div class="col-md-12">
                        <div class="main-title">
                            <h4>팔로워 12,122</h4>
                        </div>
                    </div>

                    <c:forEach var="i" items="${list}">
                        <div class="col-xl-3 col-sm-6 mb-3">
                            <div class="channels-card">
                                <div class="channels-card-image">
                                    <c:choose>
                                        <c:when test="${i.ph_sysfile == null}">
                                            <a href="#"><img class="img-fluid" src="/img/s1.png" alt=""></a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="#"><img class="img-fluid" src="/${i.ph_sysfile}" alt=""></a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="channels-card-body">
                                    <div class="channels-title">
                                        <a href="#">${i.mem_id}</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>




                    <div class="col-xl-3 col-sm-6 mb-3">
                        <div class="channels-card">
                            <div class="channels-card-image">
                                <a href="#"><img class="img-fluid" src="/img/s2.png" alt=""></a>
                                <div class="channels-card-image-btn">
                                    <button type="button" class="btn btn-outline-danger btn-sm">
                                        Subscribe <strong>1.4M</strong>
                                    </button>
                                </div>
                            </div>
                            <div class="channels-card-body">
                                <div class="channels-title">
                                    <a href="#">Channels Name</a>
                                </div>
                                <div class="channels-view">382,323 subscribers</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <div class="channels-card">
                            <div class="channels-card-image">
                                <a href="#"><img class="img-fluid" src="/img/s3.png" alt=""></a>
                                <div class="channels-card-image-btn">
                                    <button type="button" class="btn btn-outline-secondary btn-sm">
                                        Subscribed <strong>1.4M</strong>
                                    </button>
                                </div>
                            </div>
                            <div class="channels-card-body">
                                <div class="channels-title">
                                    <a href="#">Channels Name <span title=""
                                                                    data-placement="top" data-toggle="tooltip"
                                                                    data-original-title="Verified"><i
                                            class="fas fa-check-circle"></i></span></a>
                                </div>
                                <div class="channels-view">382,323 subscribers</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <div class="channels-card">
                            <div class="channels-card-image">
                                <a href="#"><img class="img-fluid" src="/img/s4.png" alt=""></a>
                                <div class="channels-card-image-btn">
                                    <button type="button" class="btn btn-outline-danger btn-sm">
                                        Subscribe <strong>1.4M</strong>
                                    </button>
                                </div>
                            </div>
                            <div class="channels-card-body">
                                <div class="channels-title">
                                    <a href="#">Channels Name</a>
                                </div>
                                <div class="channels-view">382,323 subscribers</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <div class="channels-card">
                            <div class="channels-card-image">
                                <a href="#"><img class="img-fluid" src="/img/s6.png" alt=""></a>
                                <div class="channels-card-image-btn">
                                    <button type="button" class="btn btn-outline-danger btn-sm">
                                        Subscribe <strong>1.4M</strong>
                                    </button>
                                </div>
                            </div>
                            <div class="channels-card-body">
                                <div class="channels-title">
                                    <a href="#">Channels Name</a>
                                </div>
                                <div class="channels-view">382,323 subscribers</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <div class="channels-card">
                            <div class="channels-card-image">
                                <a href="#"><img class="img-fluid" src="/img/s8.png" alt=""></a>
                                <div class="channels-card-image-btn">
                                    <button type="button" class="btn btn-outline-danger btn-sm">
                                        Subscribe <strong>1.4M</strong>
                                    </button>
                                </div>
                            </div>
                            <div class="channels-card-body">
                                <div class="channels-title">
                                    <a href="#">Channels Name</a>
                                </div>
                                <div class="channels-view">382,323 subscribers</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <div class="channels-card">
                            <div class="channels-card-image">
                                <a href="#"><img class="img-fluid" src="/img/s5.png" alt=""></a>
                                <div class="channels-card-image-btn">
                                    <button type="button" class="btn btn-outline-danger btn-sm">
                                        Subscribe <strong>1.4M</strong>
                                    </button>
                                </div>
                            </div>
                            <div class="channels-card-body">
                                <div class="channels-title">
                                    <a href="#">Channels Name</a>
                                </div>
                                <div class="channels-view">382,323 subscribers</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <div class="channels-card">
                            <div class="channels-card-image">
                                <a href="#"><img class="img-fluid" src="/img/s6.png" alt=""></a>
                                <div class="channels-card-image-btn">
                                    <button type="button" class="btn btn-outline-danger btn-sm">
                                        Subscribe <strong>1.4M</strong>
                                    </button>
                                </div>
                            </div>
                            <div class="channels-card-body">
                                <div class="channels-title">
                                    <a href="#">Channels Name</a>
                                </div>
                                <div class="channels-view">382,323 subscribers</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <div class="channels-card">
                            <div class="channels-card-image">
                                <a href="#"><img class="img-fluid" src="/img/s8.png" alt=""></a>
                                <div class="channels-card-image-btn">
                                    <button type="button" class="btn btn-outline-danger btn-sm">
                                        Subscribe <strong>1.4M</strong>
                                    </button>
                                </div>
                            </div>
                            <div class="channels-card-body">
                                <div class="channels-title">
                                    <a href="#">Channels Name</a>
                                </div>
                                <div class="channels-view">382,323 subscribers</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <div class="channels-card">
                            <div class="channels-card-image">
                                <a href="#"><img class="img-fluid" src="/img/s7.png" alt=""></a>
                                <div class="channels-card-image-btn">
                                    <button type="button" class="btn btn-outline-secondary btn-sm">
                                        Subscribed <strong>1.4M</strong>
                                    </button>
                                </div>
                            </div>
                            <div class="channels-card-body">
                                <div class="channels-title">
                                    <a href="#">Channels Name <span title=""
                                                                    data-placement="top" data-toggle="tooltip"
                                                                    data-original-title="Verified"><i
                                            class="fas fa-check-circle"></i></span></a>
                                </div>
                                <div class="channels-view">382,323 subscribers</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <div class="channels-card">
                            <div class="channels-card-image">
                                <a href="#"><img class="img-fluid" src="/img/s1.png" alt=""></a>
                                <div class="channels-card-image-btn">
                                    <button type="button" class="btn btn-outline-danger btn-sm">
                                        Subscribe <strong>1.4M</strong>
                                    </button>
                                </div>
                            </div>
                            <div class="channels-card-body">
                                <div class="channels-title">
                                    <a href="#">Channels Name</a>
                                </div>
                                <div class="channels-view">382,323 subscribers</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <div class="channels-card">
                            <div class="channels-card-image">
                                <a href="#"><img class="img-fluid" src="/img/s2.png" alt=""></a>
                                <div class="channels-card-image-btn">
                                    <button type="button" class="btn btn-outline-danger btn-sm">
                                        Subscribe <strong>1.4M</strong>
                                    </button>
                                </div>
                            </div>
                            <div class="channels-card-body">
                                <div class="channels-title">
                                    <a href="#">Channels Name</a>
                                </div>
                                <div class="channels-view">382,323 subscribers</div>
                            </div>
                        </div>
                    </div>
                </div>
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center pagination-sm mb-4">
                        <li class="page-item disabled"><a class="page-link" href="#"
                                                          tabindex="-1">Previous</a></li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <hr>
            <div class="video-block section-padding">
                <div class="row">
                    <div class="col-md-12">
                        <div class="main-title">
                            <div class="btn-group float-right right-action">
                                <a href="#" class="right-action-link text-gray"
                                   data-toggle="dropdown" aria-haspopup="true"
                                   aria-expanded="false"> Sort by <i class="fa fa-caret-down"
                                                                     aria-hidden="true"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="#"><i
                                            class="fas fa-fw fa-star"></i> &nbsp; Top Rated</a> <a
                                        class="dropdown-item" href="#"><i
                                        class="fas fa-fw fa-signal"></i> &nbsp; Viewed</a> <a
                                        class="dropdown-item" href="#"><i
                                        class="fas fa-fw fa-times-circle"></i> &nbsp; Close</a>
                                </div>
                            </div>
                            <h6>Featured Videos</h6>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <div class="video-card">
                            <div class="video-card-image">
                                <a class="play-icon" href="#"><i class="fas fa-play-circle"></i></a>
                                <a href="#"><img class="img-fluid" src="/img/v5.png" alt=""></a>
                                <div class="time">3:50</div>
                            </div>
                            <div class="video-card-body">
                                <div class="video-title">
                                    <a href="#">There are many variations of passages of Lorem</a>
                                </div>
                                <div class="video-page text-success">
                                    Education <a title="" data-placement="top"
                                                 data-toggle="tooltip" href="#" data-original-title="Verified"><i
                                        class="fas fa-check-circle text-success"></i></a>
                                </div>
                                <div class="video-view">
                                    1.8M views &nbsp;<i class="fas fa-calendar-alt"></i> 11 Months
                                    ago
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <div class="video-card">
                            <div class="video-card-image">
                                <a class="play-icon" href="#"><i class="fas fa-play-circle"></i></a>
                                <a href="#"><img class="img-fluid" src="/img/v6.png" alt=""></a>
                                <div class="time">3:50</div>
                            </div>
                            <div class="video-card-body">
                                <div class="video-title">
                                    <a href="#">There are many variations of passages of Lorem</a>
                                </div>
                                <div class="video-page text-danger">
                                    Education <a title="" data-placement="top"
                                                 data-toggle="tooltip" href="#"
                                                 data-original-title="Unverified"><i
                                        class="fas fa-frown text-danger"></i></a>
                                </div>
                                <div class="video-view">
                                    1.8M views &nbsp;<i class="fas fa-calendar-alt"></i> 11 Months
                                    ago
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <div class="video-card">
                            <div class="video-card-image">
                                <a class="play-icon" href="#"><i class="fas fa-play-circle"></i></a>
                                <a href="#"><img class="img-fluid" src="/img/v7.png" alt=""></a>
                                <div class="time">3:50</div>
                            </div>
                            <div class="video-card-body">
                                <div class="video-title">
                                    <a href="#">There are many variations of passages of Lorem</a>
                                </div>
                                <div class="video-page text-success">
                                    Education <a title="" data-placement="top"
                                                 data-toggle="tooltip" href="#" data-original-title="Verified"><i
                                        class="fas fa-check-circle text-success"></i></a>
                                </div>
                                <div class="video-view">
                                    1.8M views &nbsp;<i class="fas fa-calendar-alt"></i> 11 Months
                                    ago
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <div class="video-card">
                            <div class="video-card-image">
                                <a class="play-icon" href="#"><i class="fas fa-play-circle"></i></a>
                                <a href="#"><img class="img-fluid" src="/img/v8.png" alt=""></a>
                                <div class="time">3:50</div>
                            </div>
                            <div class="video-card-body">
                                <div class="video-title">
                                    <a href="#">There are many variations of passages of Lorem</a>
                                </div>
                                <div class="video-page text-success">
                                    Education <a title="" data-placement="top"
                                                 data-toggle="tooltip" href="#" data-original-title="Verified"><i
                                        class="fas fa-check-circle text-success"></i></a>
                                </div>
                                <div class="video-view">
                                    1.8M views &nbsp;<i class="fas fa-calendar-alt"></i> 11 Months
                                    ago
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
        <!-- Sticky Footer -->
        <%@include file="footer.jsp" %>
    </div>
    <!-- /.content-wrapper -->
</div>
<!-- /#wrapper -->
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top"> <i
        class="fas fa-angle-up"></i>
</a>
<!-- Logout Modal-->
<%@include file="/logout-modal.jsp" %>
<script>
    $(document).ready(function () {
        uk_main.stream();
    });
    let unfold = function () {
        $("#unfold").remove();
        $("#cht_div").css("display", "block");
        $("#video_div").removeClass("col-md-12");
        $("#video_div").addClass("col-md-10");
    }
</script>
</body>
</html>