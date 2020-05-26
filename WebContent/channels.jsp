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
                            <h4>팔로워 ${cnt}</h4>
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
                                            <a href="#"><img class="img-fluid" src="/img/user-photo/${i.ph_sysfile}"
                                                             alt=""></a>
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
                </div>

                <hr>
            </div>
            <!-- /.container-fluid -->
            <!-- Sticky Footer -->
        </div>
        <%@include file="footer.jsp" %>
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
            console.log($(window).scrollTop());
            $(window).scroll(()=>{
            })
        });

    </script>
</body>
</html>