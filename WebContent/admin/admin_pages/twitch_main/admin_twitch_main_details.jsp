<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8"> 
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Image Gallery | Bootstrap Based Admin Template - Material Design</title>

    <!-- Favicon-->
    <link rel="icon" href="../../images/favicon.png" type="image/png"> 

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="../../plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="../../plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="../../plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Light Gallery Plugin Css -->
    <link href="../../plugins/light-gallery/css/lightgallery.css" rel="stylesheet">

    <!-- Custom Css -->
    <link href="../../css/style.css" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="../../css/themes/all-themes.css" rel="stylesheet" />
</head>

<body class="theme-red">
    <!-- Page Loader -->
    <div class="page-loader-wrapper">
        <div class="loader">
            <div class="preloader">
                <div class="spinner-layer pl-red">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
            <p>Please wait...</p>
        </div>
    </div>
    <!-- #END# Page Loader -->
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
    <!-- Search Bar -->
    <div class="search-bar">
        <div class="search-icon">
            <i class="material-icons">search</i>
        </div>
        <input type="text" placeholder="START TYPING...">
        <div class="close-search">
            <i class="material-icons">close</i>
        </div>
    </div>
    <!-- #END# Search Bar -->
    <!-- Top Bar -->
    <nav class="navbar">
       <%@include file='../../top.jsp' %>
    </nav>
    <!-- #Top Bar -->
    <section>
       <%@include file='menu.jsp' %>
    </section>
    <section class="content">
        <div class="container-fluid">
            <h4 class="text-center" style="color: #FFFFFF">생방송 자세히 보기</h4>
            <row>
                <div class="col-xs-8" style="color: #FFFFFF">동영상 플레이어 영역</div>
                <div class="col-xs-4" style="color: #ffffff">
                    <form>
                        <input type="text" name="mId" id="mId"><label> 스트리머 아이디</label>
                        <input type="text" name="subject" id="subject"><label> 제목</label>
                        <input type="text" name="content" id="content"><label> 방송안내</label>
                        <input type="text" name="report" id="report"><label> 신고횟수</label><br/>
                        <input type="button" value="강제종료" style="color: #000000">
                        <input type="button" value="방으로 이동" style="color: #000000">
                        <input type="button" value="뒤로" style="color: #000000">
                    </form>
                </div>
            </row>
        </div>
    </section>


    <!-- Jquery Core Js -->
    <script src="../../plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="../../plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Select Plugin Js -->
    <script src="../../plugins/bootstrap-select/js/bootstrap-select.js"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="../../plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="../../plugins/node-waves/waves.js"></script>

    <!-- Light Gallery Plugin Js -->
    <script src="../../plugins/light-gallery/js/lightgallery-all.js"></script>

    <!-- Custom Js -->
    <script src="../../js/pages/medias/image-gallery.js"></script>
    <script src="../../js/admin.js"></script>

    <!-- Demo Js -->
    <script src="../../js/demo.js"></script>
</body>

</html>
