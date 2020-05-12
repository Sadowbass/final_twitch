<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Twitch_Admin 생방송 관리</title>
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template-->
    <link href="css/live_broadcast.css" rel="stylesheet">
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="../vendor/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="../vendor/owl-carousel/owl.theme.css">


</head>

<div class="container-fluid">
    <!-- Image Gallery -->
    <div class="block-header">
        <h2>
            생방송 관리
        </h2>
    </div>
    <div class="row clearfix">
        <div class="col-xs-12">
            <div class="main-title">
                <div class="btn-group float-right right-action">
                    <a href="#" class="right-action-link text-gray" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false"> Sort by <i class="fa fa-caret-down" aria-hidden="true"></i>
                    </a>
                    <div class="dropdown-menu pull-right">
                        <a class="dropdown-item" href="#"><i class="fas fa-fw fa-star"></i> &nbsp; Top Rated</a> <a
                            class="dropdown-item" href="#"><i class="fas fa-fw fa-signal"></i> &nbsp; Viewed</a> <a
                            class="dropdown-item" href="#"><i class="fas fa-fw fa-times-circle"></i> &nbsp; Close</a>
                    </div>
                </div>
                <h6>생방송 목록</h6>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="video-card">
                <div class="video-card-image">
                    <a class="play-icon" href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp"><i class="fas fa-play-circle"></i></a>
                    <a href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp"><img class="img-fluid" src="../img/v1.png" alt=""></a>
                    <div class="time">3:50</div>
                </div>
                <div class="video-card-body">
                    <div class="video-title">
                        <a href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp">There are many variations of passages of Lorem</a>
                    </div>
                    <div class="video-page text-success">
                        Education <a title="" data-placement="top" data-toggle="tooltip" href="#"
                            data-original-title="Verified"><i class="fas fa-check-circle text-success"></i></a>
                    </div>
                    <div class="video-view">
                        1.8M views &nbsp;<i class="fas fa-calendar-alt"></i> 11 Months
                        ago
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="video-card">
                <div class="video-card-image">
                    <a class="play-icon" href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp"><i class="fas fa-play-circle"></i></a>
                    <a href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp"><img class="img-fluid" src="../img/v2.png" alt=""></a>
                    <div class="time">3:50</div>
                </div>
                <div class="video-card-body">
                    <div class="video-title">
                        <a href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp">There are many variations of passages of Lorem</a>
                    </div>
                    <div class="video-page text-success">
                        Education <a title="" data-placement="top" data-toggle="tooltip" href="#"
                            data-original-title="Verified"><i class="fas fa-check-circle text-success"></i></a>
                    </div>
                    <div class="video-view">
                        1.8M views &nbsp;<i class="fas fa-calendar-alt"></i> 11 Months
                        ago
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="video-card">
                <div class="video-card-image">
                    <a class="play-icon" href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp"><i class="fas fa-play-circle"></i></a>
                    <a href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp"><img class="img-fluid" src="../img/v3.png" alt=""></a>
                    <div class="time">3:50</div>
                </div>
                <div class="video-card-body">
                    <div class="video-title">
                        <a href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp">There are many variations of passages of Lorem</a>
                    </div>
                    <div class="video-page text-danger">
                        Education <a title="" data-placement="top" data-toggle="tooltip" href="#"
                            data-original-title="Unverified"><i class="fas fa-frown text-danger"></i></a>
                    </div>
                    <div class="video-view">
                        1.8M views &nbsp;<i class="fas fa-calendar-alt"></i> 11 Months
                        ago
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="video-card">
                <div class="video-card-image">
                    <a class="play-icon" href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp"><i class="fas fa-play-circle"></i></a>
                    <a href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp"><img class="img-fluid" src="../img/v4.png" alt=""></a>
                    <div class="time">3:50</div>
                </div>
                <div class="video-card-body">
                    <div class="video-title">
                        <a href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp">There are many variations of passages of Lorem</a>
                    </div>
                    <div class="video-page text-success">
                        Education <a title="" data-placement="top" data-toggle="tooltip" href="#"
                            data-original-title="Verified"><i class="fas fa-check-circle text-success"></i></a>
                    </div>
                    <div class="video-view">
                        1.8M views &nbsp;<i class="fas fa-calendar-alt"></i> 11 Months
                        ago
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="video-card">
                <div class="video-card-image">
                    <a class="play-icon" href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp"><i class="fas fa-play-circle"></i></a>
                    <a href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp"><img class="img-fluid" src="../img/v5.png" alt=""></a>
                    <div class="time">3:50</div>
                </div>
                <div class="video-card-body">
                    <div class="video-title">
                        <a href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp">There are many variations of passages of Lorem</a>
                    </div>
                    <div class="video-page text-success">
                        Education <a title="" data-placement="top" data-toggle="tooltip" href="#"
                            data-original-title="Verified"><i class="fas fa-check-circle text-success"></i></a>
                    </div>
                    <div class="video-view">
                        1.8M views &nbsp;<i class="fas fa-calendar-alt"></i> 11 Months
                        ago
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="video-card">
                <div class="video-card-image">
                    <a class="play-icon" href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp"><i class="fas fa-play-circle"></i></a>
                    <a href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp"><img class="img-fluid" src="../img/v6.png" alt=""></a>
                    <div class="time">3:50</div>
                </div>
                <div class="video-card-body">
                    <div class="video-title">
                        <a href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp">There are many variations of passages of Lorem</a>
                    </div>
                    <div class="video-page text-danger">
                        Education <a title="" data-placement="top" data-toggle="tooltip" href="#"
                            data-original-title="Unverified"><i class="fas fa-frown text-danger"></i></a>
                    </div>
                    <div class="video-view">
                        1.8M views &nbsp;<i class="fas fa-calendar-alt"></i> 11 Months
                        ago
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="video-card">
                <div class="video-card-image">
                    <a class="play-icon" href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp"><i class="fas fa-play-circle"></i></a>
                    <a href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp"><img class="img-fluid" src="../img/v7.png" alt=""></a>
                    <div class="time">3:50</div>
                </div>
                <div class="video-card-body">
                    <div class="video-title">
                        <a href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp">There are many variations of passages of Lorem</a>
                    </div>
                    <div class="video-page text-success">
                        Education <a title="" data-placement="top" data-toggle="tooltip" href="#"
                            data-original-title="Verified"><i class="fas fa-check-circle text-success"></i></a>
                    </div>
                    <div class="video-view">
                        1.8M views &nbsp;<i class="fas fa-calendar-alt"></i> 11 Months
                        ago
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        
            <div class="video-card">
                <div class="video-card-image">
                    <a class="play-icon" href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp"><i class="fas fa-play-circle"></i></a>
                    <a href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp"><img class="img-fluid" src="../img/v8.png" alt=""></a>
                    <div class="time">3:50</div>
                </div>
                <div class="video-card-body">
                    <div class="video-title">
                        <a href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp">There are many variations of passages of Lorem</a>
                    </div>
                    <div class="video-page text-success">
                        Education <a title="" data-placement="top" data-toggle="tooltip" href="#"
                            data-original-title="Verified"><i class="fas fa-check-circle text-success"></i></a>
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
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="../js/custom.js"></script>
<script src="../vendor/owl-carousel/owl.carousel.js"></script>