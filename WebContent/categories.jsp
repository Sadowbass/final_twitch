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
    $(window).scroll(function () {
        var rno = $('.category-item2:last').attr('rownum');
        if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
            console.log("ajax start")

            <c:if test="${URI == 0}">
            $.ajax({
                type:'post',
                async:false,
                url:"/categoryPaging.sc",
                data:{'rno':rno},
                error:(error)=>{
                    console.log(error);
                },
                success:(data)=>{
                    for(i of data){
                        let divCol = document.createElement('div');
                        divCol.className="col-xl-2 col-sm-6 mb-3";
                        let divitem2 = document.createElement('div');
                        divitem2.className="category-item2 mt-0 mb-0";
                        divitem2.setAttribute("rownum",i.rno);
                        let a = document.createElement('a');
                        let img = document.createElement('img');
                        img.className = "img-fluid";
                        img.src = "/img/cate/"+i.cat_sysfile;
                        let h6 = document.createElement('h6');
                        h6.innerText = i.cat_gname;
                        let p = document.createElement('p');
                        p.innerText = "74,853 views";
                        let col12 = document.createElement('div');
                        col12.className = "col-xs-12";
                        col12.style.marginTop = "3%";

                        a.appendChild(img);
                        a.appendChild(h6);
                        a.appendChild(p);

                        for(j of i.genreList){
                            let tag = document.createElement('div');
                            tag.style.borderRadius = "2em";
                            tag.style.backgroundColor = "pink";
                            tag.style.color = 'black';
                            tag.style.display = 'inline';
                            tag.style.padding = '3px';
                            tag.innerHTML = j
                            col12.appendChild(tag);
                        }

                        divitem2.appendChild(a);
                        divitem2.appendChild(col12);

                        divCol.appendChild(divitem2);
                        $('.itemrow').append(divCol);
                    }
                }
            })
            </c:if>
            <c:if test="${URI == 1}">
                $.ajax({
                    type:'post',
                    url:"/streamingPaging.sc",
                    data:{'rno':rno},
                    async:false,
                    error:(error)=>{
                        console.log(error);
                    },
                    success:(data)=>{
                        console.log(data);
                        for(i of data){
                            let divCol = document.createElement('div');
                            divCol.className="col-xl-2 col-sm-6 mb-3";
                            let divitem2 = document.createElement('div');
                            divitem2.className="category-item2 mt-0 mb-0";
                            divitem2.setAttribute("rownum",i.rno);
                            let a = document.createElement('a');
                            let img = document.createElement('img');
                            img.className = "img-fluid";
                            if(i.ph_sysfile == null){
                                img.src = "/img/user-photo/guest-icon.png";
                            } else {
                                img.src = "/img/user-photo/"+i.ph_sysfile;
                            }
                            let h6 = document.createElement('h6');
                            h6.innerText = i.air_mId
                            let p = document.createElement('p');
                            p.innerText = "74,853 views";
                            let col12 = document.createElement('div');
                            col12.className = "col-xs-12";
                            col12.style.marginTop = "3%";

                            a.appendChild(img);
                            a.appendChild(h6);
                            a.appendChild(p);

                            divitem2.appendChild(a);
                            divitem2.appendChild(col12);

                            divCol.appendChild(divitem2);
                            $('.itemrow').append(divCol);
                        }
                    }
                })
            </c:if>


        }
    })
</script>
<div id="topplace">
    <%@include file="/top.jsp" %>
</div>
<div id="wrapper">
    <div id="sidebarplace" style="margin-top: 53px;">
    </div>
    <div id="content-wrapper" style="margin-top: 53px;">
        <div class="container-fluid">
            <div class="video-block section-padding">
                <div class="row">
                    <div class="col-md-12">
                        <div class="main-title">
                            <h2 style="font-weight: bold;display: inline;margin-right: 2%">탐색</h2>
                            <div class="btn-group" role="group" aria-label="..." style="margin-bottom: 1%">
                                <c:if test="${URI == 0}">
                                    <button type="button" class="btn btn-primary button-class1"
                                            style='border: 2px solid pink; font-weight: bold;'>카테고리
                                    </button>
                                    <button type="button" class="btn btn-default button-class2"
                                            style='border: 2px solid pink; font-weight: bold' onclick="location.href='/categories/all'">생방송채널
                                    </button>
                                </c:if>
                                <c:if test="${URI == 1}">
                                    <button type="button" class="btn btn-default button-class1"
                                            style='border: 2px solid pink; font-weight: bold;' onclick="location.href='/categories'">카테고리
                                    </button>
                                    <button type="button" class="btn btn-primary button-class2"
                                            style='border: 2px solid pink; font-weight: bold'>생방송채널
                                    </button>
                                </c:if>
                            </div>
                            <div class="btn-group float-right right-action">
                                <a href="#" class="right-action-link text-gray"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    정렬 <i class="fa fa-caret-down" aria-hidden="true"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="#"><i
                                            class="fas fa-fw fa-star"></i> &nbsp; 팔로우 수</a> <a
                                        class="dropdown-item" href="#"><i
                                        class="fas fa-fw fa-signal"></i> &nbsp; 시청자 수</a> <a
                                        class="dropdown-item" href="#"><i
                                        class="fas fa-fw fa-times-circle"></i> &nbsp; 닫기</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="input-group" style='width: 300px;border: 1px solid pink'>
                    <input type="text" class="form-control" placeholder="태그검색..." id="findTag">
                    <div class="input-group-append">
                        <button class="btn btn-light" type="button" onclick="findTag()">
                            <i class="fas fa-search" style='color: pink'></i>
                        </button>
                    </div>
                </div>
                <c:if test="${URI == 0}">
                    <div class='row itemrow' style='margin-top: 2%' id="gameRow">
                        <c:forEach var="i" items="${list}">
                            <div class="col-xl-2 col-sm-6 mb-3">
                                <div class="category-item2 mt-0 mb-0" rownum="${i.rno}">
                                    <a href="shop.jsp">
                                        <img class="img-fluid" src="/img/cate/${i.cat_sysfile}"/>
                                        <h6>${i.cat_gname}</h6>
                                        <p>74,853 views</p>
                                    </a>
                                    <div class="col-xs-12" style="margin-top: 3%">
                                        <c:forEach var="tag" items="${i.genreList}">
                                            <div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>${tag}</div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>

                <c:if test="${URI == 1}">
                    <div class='row itemrow' style='margin-top: 2%' id="gameRow">
                        <c:forEach var="i" items="${list}">
                            <div class="col-xl-2 col-sm-6 mb-3">
                                <div class="category-item2 mt-0 mb-0" rownum="${i.rno}">
                                    <a href="shop.jsp">
                                        <c:choose>
                                            <c:when test="${i.ph_sysfile == null}">
                                                <img class="img-fluid" src="/img/user-photo/guest-icon.png"/>
                                            </c:when>
                                            <c:otherwise>
                                                <img class="img-fluid" src="/img/user-photo/${i.ph_sysfile}"/>
                                            </c:otherwise>
                                        </c:choose>
                                        <h6>${i.air_mId}</h6>
                                        <p>74,853 views</p>
                                    </a>
                                    <div class="col-xs-12" style="margin-top: 3%">
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
            <script>
                $(function () {
                    $('.button-class1').click(function () {
                        if ($(this).hasClass('btn-default'))
                            $(this).removeClass('btn-default');
                        if (!$(this).hasClass('btn-primary'))
                            $(this).addClass('btn-primary');
                        if ($('.button-class2').hasClass('btn-primary'))
                            $('.button-class2').removeClass('btn-primary');
                        if (!$('.button-class2').hasClass('btn-default'))
                            $('.button-class2').addClass('btn-default');
                    });

                    $('.button-class2').click(function () {
                        if ($(this).hasClass('btn-default'))
                            $(this).removeClass('btn-default');
                        if (!$(this).hasClass('btn-primary'))
                            $(this).addClass('btn-primary');
                        if ($('.button-class1').hasClass('btn-primary'))
                            $('.button-class1').removeClass('btn-primary');
                        if (!$('.button-class1').hasClass('btn-default'))
                            $('.button-class1').addClass('btn-default');
                    });

                });
            </script>
            <!-- /.container-fluid -->
            <!-- /.content-wrapper -->
        </div>
        <!-- Sticky Footer -->
        <%@include file="/footer.jsp" %>
        <!-- /#wrapper -->
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top"> <i
                class="fas fa-angle-up"></i>
        </a>
        <!-- Logout Modal-->
        <%@include file="/logout-modal.jsp" %>
</body>
</html>