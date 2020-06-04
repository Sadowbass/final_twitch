<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

                <h6>생방송 목록</h6>
            </div>
        </div>
        
        <c:forEach items="${ list}" var="i">

        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">

            <div class="video-card">
                <div class="video-card-image">
                    <a class="play-icon" href="/${i.air_mid }"><i
                            class="fas fa-play-circle"></i></a>
                    <a href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp">
                    <c:if test="${empty i.air_thumbnail}">
                      <img src="../uploads/notThumbnail.png" class="img-fluid">
                    </c:if>
                    <c:if test="${not empty i.air_thumbnail}">
                      <img src="../uploads/${vo.ph_sysfile }" class="img-fluid">
                   </c:if>
                    </a>
                    
                </div>
                <div class="video-card-body">
                    <div class="video-title">
                        <a href="index.jsp?inc=admin_pages/twitch_main/live_broadcast_detail.jsp">${i.air_subject}
                        	<c:if test="${i.air_subject ==null}">${i.air_mid }의 방송입니다!</c:if>
                        </a>
                    </div>
                    <div class="video-page text-success">
                        ${i.air_gname }
                        <a title="" data-placement="top" data-toggle="tooltip" href="#"
                            data-original-title="Verified"><i class="fas fa-check-circle text-success"></i></a>
                    </div>
                    <div class="video-view">
                        ${i.cnt}
                    </div>
                </div>
            </div>
        </div>
        
        </c:forEach>


 



    </div>
</div>
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="../js/custom.js"></script>
<script src="../vendor/owl-carousel/owl.carousel.js"></script>