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
    $(window).scroll(function () {
        let rno = $('.history-video:last').attr('rownum');
        let id = window.location.pathname.split("/")[1];
        if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
            $.ajax({
                url:'/'+id+"/videoPaging.sc",
                type:'post',
                data:{'rno':rno},
                error:(error)=>{
                    console.log(error)
                },
                success:(data)=>{
                    for(it of data){
                        let divTop = document.createElement('div');
                        divTop.className = "col-xl-3 col-sm-6 mb-3";
                        let divSec = document.createElement('div');
                        divSec.className = "video-card history-video";
                        divSec.setAttribute('rownum',it.rno);

                        let divVideo = document.createElement('div');
                        divVideo.className = "video-card-image";
                        let a1 = document.createElement('a');
                        a1.className = "play-icon";
                        let i = document.createElement('i');
                        i.className = "fas fa-play-circle";
                        let a2 = document.createElement('a');
                        let img = document.createElement('img');
                        img.src = "/img/v1.png";
                        let div3 = document.createElement('div');
                        div3.className = "time";
                        div3.innerHTML = it.bef_time;

                        let divBody = document.createElement('div');
                        divBody.className = "video-card-body";
                        let divTitle = document.createElement('div');
                        divTitle.className = "video-title";
                        let titleA = document.createElement('a');
                        titleA.innerText = it.bef_subject
                        let divPage = document.createElement('div');
                        divPage.className = "video-page";
                        divPage.innerText = it.bef_mid;

                        divTitle.appendChild(titleA);
                        divBody.appendChild(divTitle);
                        divBody.appendChild(divPage)

                        divVideo.appendChild(a1);
                        divVideo.appendChild(a2);
                        a2.appendChild(img);
                        divVideo.appendChild(div3);

                        divSec.appendChild(divVideo);
                        divSec.appendChild(divBody);
                        divTop.appendChild(divSec);
                        $('.itemrow').append(divTop);
                    }
                }
            })
        }
    })
</script>
<div id="topplace">
    <jsp:include page="/userinfo.sc" flush="false"></jsp:include>
</div>
<div id="wrapper">
    <div id="sidebarplace" style="margin-top: 53px;">
        <jsp:include page="sidebar.sc" flush="false"></jsp:include>
    </div>
    <div id="content-wrapper" style="margin-top: 53px;">
        <div class="container-fluid">
            <div class="video-block section-padding">
                <div class="row itemrow">
                    <div class="col-md-12">
                        <div class="main-title">
                            <h6>Watch History</h6>
                        </div>
                    </div>

                    <c:forEach var="i" items="${list}">
                        <div class="col-xl-3 col-sm-6 mb-3">
                            <div class="video-card history-video" rownum="${i.rno}">
                                <div class="video-card-image">
                                    <a class="play-icon" href="#"><i class="fas fa-play-circle"></i></a>
                                    <a href="#"><img class="img-fluid" src="/img/v1.png" alt=""></a>
                                    <div class="time">${i.bef_time}</div>
                                </div>
                                <div class="video-card-body">
                                    <div class="video-title">
                                        <a href="#">${i.bef_subject}</a>
                                    </div>
                                    <div class="video-page">
                                        ${i.bef_mid}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

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
</body>
</html>








