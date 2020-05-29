<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@taglib
        prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css"
      href="https://fonts.googleapis.com/earlyaccess/jejugothic.css">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="Askbootstrap"/>
    <meta name="author" content="Askbootstrap"/>
    <title>JHTA-Twitch</title>
    <!-- Favicon Icon -->
    <link rel="icon" type="image/png" href="/img/favicon.png"/>
    <!-- Bootstrap core CSS-->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Custom fonts for this template-->
    <link
            href="/vendor/fontawesome-free/css/all.min.css"
            rel="stylesheet"
            type="text/css"
    />
    <style>
        textarea::placeholder{
            font-size:1.2rem;
            font-family: "Jeju Gothic";
        }
        .btn-font {
            font-family: "Helvetica Neue";
            font-size: small;
        }

        .modal-body-top-left {
            color: #000000;
        }

        p {
            color: #000000;
        }
        .inner-img{
            display: inline-block;
            padding-left: 10px;
            padding-right: 10px;
        }
        .circle-div{
            width: 70px;
            height: 70px;
            padding-top: 23px;
            background-color: #dddddd;
            border-radius: 100%;
        }
        .img-p{
            width: 70px;
        }
    </style>
    <!-- Custom styles for this template-->
    <link href="/css/osahan.css" rel="stylesheet"/>
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="/vendor/owl-carousel/owl.carousel.css"/>
    <link rel="stylesheet" href="/vendor/owl-carousel/owl.theme.css"/>
    <link rel="stylesheet" href="/css/sc_custom.css"/>
    <link rel="stylesheet" href="/css/css_uk.css"/>
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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body class="mostly-customized-scrollbar" id="page-top" style="width: 100%;">
<div id="topplace">
    <jsp:include page="/userinfo.sc" flush="false"></jsp:include>
</div>
<div id="sidebarplace" style="margin-top: 53px;">
    <jsp:include page="/sidebar.sc" flush="false"></jsp:include>
</div>
<!-- video_main_uk -->
<div class="video_main_uk" style="padding-top: -54px;">
    <!-- video_top_uk -->
    <div class="d-flex justify-content-between" id="videoTop">
        <!-- 스트리머 -->
        <div class="d-flex flex-row">
            <div class="p-1">
                <c:choose>
                    <c:when test="${vo.ph_sysfile == null}">
                        <img
                                src="/img/user-photo/guest-icon.png"
                                class="rounded-circle"
                                style="height: 35px; width: 35px;"
                        />
                    </c:when>
                    <c:otherwise>
                        <img
                                src="/img/user-photo/${vo.ph_sysfile}"
                                class="rounded-circle"
                                style="height: 35px; width: 35px;"
                        />
                    </c:otherwise>
                </c:choose>
                <a href="#">
                    ${vo.mem_id}
                    <span
                            title=""
                            data-placement="top"
                            data-toggle="tooltip"
                            data-original-title="Verified"
                    >
                <i class="fas fa-check-circle"></i>
              </span>
                </a>
            </div>
            <div class="p-1">
                <div class="onAir">생방송</div>
            </div>
        </div>

        <!-- 바로가기 메뉴 -->
        <div class="d-flex justify-content-center">
            <div class="px-1 pt-2">
                <a href="/${vo.mem_id}">홈</a>
            </div>
            <div class="px-1 pt-2">
                <a href="/${vo.mem_id}/video">동영상</a>
            </div>
<%--            <div class="px-1 pt-2">
                <a href="#">클립</a>
            </div>--%>
            <div class="px-1 pt-2">
                <a href="/${vo.mem_id}/followers">팔로워</a>
            </div>
        </div>

        <!-- 팔로우 구독 -->
        <div class="d-flex flex-row-reverse">
            <div class="text-right py-1 pl-1 pr-3" id="follow">
                <div class="channels-card-image-btn">
                    <c:choose>
                        <c:when test="${session_id == vo.mem_id}"></c:when>
                        <c:when test="${follow == true}">
                            <button type="button" class="btn btn-primary btn" onclick="follow(this)" style="padding-top: 0px; padding-bottom: 0px; height: 30px;">
                                <strong> <i class="far fa-heart"></i></strong> 팔로우
                            </button>
                        </c:when>
                        <c:otherwise>
                            <button type="button" class="btn btn-outline-danger btn" onclick="follow(this)" style="padding-top: 0px; padding-bottom: 0px; height: 30px;">
                                <strong> <i class="far fa-heart"></i></strong> 팔로우
                            </button>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
            <div class="text-right p-1">
                <div class="channels-card-image-btn">
                    <c:choose>
                        <c:when test="${session_id == vo.mem_id}"></c:when>
                        <c:otherwise>
                            <button type="button" class="btn btn-outline-danger btn" onclick="donation(this)" style="padding-top: 0px; padding-bottom: 0px; height: 30px;">
                                <strong> <i class="far fa-star"></i></strong>도네이션
                            </button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="text-right p-1">
                <div class="channels-card-image-btn">
                    <c:choose>
                        <c:when test="${session_id == vo.mem_id}"></c:when>
                        <c:otherwise>
                            <button type="button" class="btn btn-outline-danger btn" onclick="subscribe(this)" style="padding-top: 0px; padding-bottom: 0px; height: 30px;">
                                <strong> <i class="far fa-star"></i></strong> 구독
                            </button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

    <!-- 비디오 -->
    <jsp:include page="./video_uk.jsp"/>

    <!-- 기타 정보 -->
    <div class="d-flex" id="videoEtc">
        <div class="p-3">${vo.air_subject}</div>
        <div class="p-3">${vo.air_content}</div>
        <div class="ml-auto">
            <button class="btn" type="button">
                <i class="far fa-user p-1"></i>
            </button>

            <span class="pr-2" id="totalUserCnt"></span>

            <button class="btn" type="button">
                <i class="fas fa-eye p-1"></i>
            </button>

            <span class="pr-2" id="accArea"></span>

            <button
                    class="btn dropdown"
                    type="button"
                    id="dropdownMenuButton"
                    data-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
                    type="button"
            >
                <i class="fas fa-share-alt p-2"></i>
            </button>

            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <a class="dropdown-item" href="#">Something else here</a>
            </div>

            <button
                    class="btn dropdown"
                    type="button"
                    id="dropdownMenuButton2"
                    data-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
                    type="button"
            >
                <i class="fas fa-ellipsis-v pl-2 pr-4"></i>
            </button>

            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <a class="dropdown-item" href="#">Something else here</a>
            </div>
        </div>
    </div>
    <div class="d-flex d-flex flex-row" id="videoEtc2">
        <div class="p-3">
            <img src="/img/cate/${vo.ph_sysfile}" width="70px" height="100px";>
        </div>
        <div class="p-3">
            <h4>${vo.air_gname}</h4>
            <c:forEach var="i" items="${vo.tlist}">
                <div>#${i}</div>
            </c:forEach>
        </div>
    </div>
</div>
<input type="hidden" name="sid" id="sid" value="${vo.mem_id}">
<input type="hidden" name="uid" id="uid" value="${session_id}">

<!-- 펼치기 오른쪽 -->
<div class="unfold mr-1" id="unfold" onclick="uk.unfold()">
    <button class="btn" type="button">
        <i class="fas fa-sign-out-alt fa-2x fa-rotate-180 pl-1"></i>
    </button>
</div>
<!-- 펼치기 아래 -->
<div class="unfoldBottom" id="unfoldBottom" onclick="uk.unfoldBottom()">
    <button class="btn" type="button">
        <i class="fas fa-sign-out-alt fa-2x fa-rotate-270 pl-1"></i>
    </button>
</div>

<!-- 채팅화면 -->
<div class="cht_main_uk" id="cht_div">
    <jsp:include page="./cht_uk.jsp"/>
</div>
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
<script>
    $(document).ready(function () {
        uk.stream();
    });

    let uid = $('#uid').val();
    let sid = $('#sid').val();

    let follow = function (check) {
        let followCheck = false;
        if ($('#uid').val() == "") {
            swal({
                text:"로그인을 해주세요",
                icon:"error"
            })
            return;
        }

        for (const x of check.classList) {
            if (x == "btn-primary") {
                followCheck = true;
            }
        }

        if (followCheck == true) {
            $.ajax({
                url: "/" + $('#uid').val() + "/follow",
                type: 'delete',
                data: {"sid": $('#sid').val()},
                success: (data) => {
                    check.classList.add("btn-outline-danger");
                    check.classList.remove("btn-primary")
                }
            })
        } else {
            $.ajax({
                url: "/" + $('#uid').val() + "/follow",
                type: 'post',
                data: {"sid": $('#sid').val()},
                success: (data) => {
                    check.classList.add("btn-primary")
                    check.classList.remove("btn-outline-danger");
                }
            })
        }
    }

    let subscribe = function (check) {
        let followCheck = false;
        if ($('#uid').val() == "") {
            swal({
                text:"로그인을 해주세요",
                icon:"error"
            })
            return;
        }
        $('#subModal').modal('toggle');
    }

    let goPay = function () {
        $.ajax({
            type:'post',
            data:{'uid':uid, 'sid':sid},
            url:'subCheck.sc',
            success : function (data) {
                if (data == 'already') {
                    $('#subModal').modal('hide');
                    swal({
                        text : "이미 구독중 입니다",
                        icon : "error"
                    })
                } else {
                    $('#subModal').modal('hide');
                    let json = JSON.parse(data);
                    $('#sidField').html("구독 할 스트리머 : "+json.sid);
                    $('#moneyField').html("현재 잔액 : " + json.money);
                    $('#payModal').modal('toggle');
                }
            }
        })
    }

    let commitSub = function () {
        let money = $('#moneyField').html().split(": ")[1];
        if (money < 10000) {
            swal({
                text:"잔액이 부족합니다",
                icon : "error"
            })
        } else {
            $.ajax({
                type : 'post',
                url : 'commitSub.sc',
                data : {
                    'sid' : sid,
                    'uid' : uid
                },
                success : function (data) {
                    swal({
                        text:"구독에 성공하셨습니다",
                        icon:"success"
                    })
                    $('#payModal').modal('hide');
                }
            })
        }
    }

    let donation = function (check) {
        if ($('#uid').val() == "") {
            swal({
                text:"로그인을 해주세요",
                icon:"error"
            })
            return;
        }
        $.ajax({
            data : {'uid' : uid, 'sid': sid},
            type : 'post',
            url : "moneyCheck.sc",
            success : function (data) {
                console.log(data);
                $('#textDonMoneyField').html("현재 머니 잔액 : "+data.money);
                $('#movieDonMoneyField').html("현재 머니 잔액 : "+data.money);
                $('#roulleteDonMoneyField').html("현재 머니 잔액 : "+data.money);
                if(data.roullete != null){
                    $('#kind').val(data.roullete);
                } else {
                    $('#kind').val("룰렛설정이 되어있지 않습니다");
                }
            }
        })
        $('#donationModal').modal('toggle');
    }

    let commitDon = function (check) {
        let cmd = $('.nav-tabs').children();
        let count;
        for (i = 0 ; i < cmd.length ; i++) {
            if(cmd[i].childNodes[1].className.indexOf('active') >= 0){
                count = i
            }
        }
        if( count == 0){ // 텍스트 도네
            let donationData = {
                'cmd' : count,
                'pay' : $('#textPay').val(),
                'content' : $('#textContent').val(),
                'sid' : sid,
                'uid' : uid
            }
            $.ajax({
                'data' : donationData,
                url : 'commitDon.sc',
                type : 'post',
                success : (data)=>{
                    swal({
                        text:data,
                        icon:'success'
                    })
                    $('#donationModal').modal('hide');
                    $('#textPay').val("");
                    $('#textContent').val("");
                }
            })
        } else if(count == 1){ // 영상 도네
            let donationData = {
                'cmd' : count,
                'pay' : $('#moviePay').val(),
                'url' : $('#movieUrl').val(),
                'sid' : sid,
                'uid' : uid
            }
            $.ajax({
                'cmd' : count,
                'data' : donationData,
                url : 'commitDon.sc',
                type : 'post',
                success : (data)=>{
                    $('#donationModal').modal('hide');
                    $('#movieUrl').val("");
                    $('#moviePay').val("");
                }
            })
        } else { // 룰렛 도네
            let donationData = {
                'cmd' : count,
                'pay' : $('#roulletePay').val(),
                'sid' : sid,
                'uid' : uid
            }
            $.ajax({
                'data' : donationData,
                url : 'commitDon.sc',
                type : 'post',
                success : (data)=>{
                    $('#donationModal').modal('hide');
                    $('#roulletePay').val("");
                }
            })
        }
    }


</script>
<jsp:include page="/logout-modal.jsp" flush="false"></jsp:include>

<div class="modal fade" id="subModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width: 620px;">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    <c:choose>
                        <c:when test="${vo.ph_sysfile == null}">
                            <img src="/img/user-photo/guest-icon.png" style="width: 50px; height: 50px;">
                        </c:when>
                        <c:otherwise>
                            <img src="/img/user-photo/${ph_sysfile}" style="width: 50px; height: 50px;">
                        </c:otherwise>
                    </c:choose>${vo.mem_id}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row" style="border-bottom: 1px solid #dee2e6; padding-bottom: 1rem">
                    <div class="modal-body-top-left col-8">
                        <span>티어1 정기구독</span><br>
                        <span>10,000원에 1개월간 구독됩니다</span>
                    </div>
                    <div class="modal-body-top-right col-4 text-right">
                        <button class="btn btn-primary btn-font" onclick="goPay()">
                            <i class="fa fa-star"></i>
                            <span>정기구독</span>
                            <span>10,000</span>
                        </button>
                    </div>
                </div>
                <div class="row" style="padding-top: 1rem">
                    <div class="col-12" >
                        <h4 style="font-weight: 600; font-size: 1.4rem">티어 1 정기구독</h4>
                        <p>정기구독은 좋아하는 스트리머를 직접 지원하고 혜택까지 받는 좋은 방법입니다!</p>
                        <div>
                            <h5 style="font-size: 1rem; font-weight: 600;">혜택</h5>
                            <div class="text-center">
                                <div class="inner-img">
                                    <div class="circle-div" style="width: 70px;height: 70px;">
                                        <img src="https://static.twitchcdn.net/assets/interruption-free-viewing-4f9e3f5877a2ce0a92c6.png" style="width: 35px; height: 25.92px;">
                                    </div>
                                    <p class="img-p">광고 없이 보기</p>
                                </div>
                                <div class="inner-img">
                                    <div class="circle-div" style="width: 70px;height: 70px;">
                                        <img src="https://static.twitchcdn.net/assets/sub-only-chat-432211050c885b3070f1.png" style="width: 35px; height: 35px;">
                                    </div>
                                    <p class="img-p">구독자 전용 채팅</p>
                                </div>
                                <div class="inner-img">
                                    <div class="circle-div" style="width: 70px;height: 70px;">
                                        <img src="https://static-cdn.jtvnw.net/subs-image-assets/subscriber-streams.svg" style="width: 35px; height: 25.92px;">
                                    </div>
                                    <p class="img-p">정기구독자 방송</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="payModal" tabindex="-1" role="dialog" aria-labelledby="subPayLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width: 620px;">
            <div class="modal-header">
                <h5 class="modal-title" id="subPayLabel">구매완료</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row" style="border-bottom: 1px solid #dee2e6; padding-bottom: 1rem">
                    <div class="col-1">
                        <c:choose>
                            <c:when test="${vo.ph_sysfile == null}">
                                <img
                                        src="/img/user-photo/guest-icon.png"
                                        class="rounded-circle"
                                        style="height: 35px; width: 35px;"
                                />
                            </c:when>
                            <c:otherwise>
                                <img
                                        src="/img/user-photo/${vo.ph_sysfile}"
                                        class="rounded-circle"
                                        style="height: 35px; width: 35px;"
                                />
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="modal-body-top-left col-11">
                        <span>티어1 정기구독</span><br>
                        <span>10,000원에 1개월간 구독됩니다</span>
                    </div>
                </div>
                <div class="row" style="padding-top: 1rem">
                    <div class="col-12" >
                        <h4 style="font-weight: 600; font-size: 1.4rem">구매정보</h4>
                        <p>구독전 정보를 확인하세요</p>
                        <div>
                            <h5 id="sidField" style="font-size: 1rem; font-weight: 600;">구독할 스트리머 : </h5>
                            <h5 id="moneyField" style="font-size: 1rem; font-weight: 600;">현재 머니 잔액 : </h5>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 text-right">
                        <button class="btn-primary" onclick="commitSub()">구독</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--도네이션 모달--%>
<div class="modal fade" id="donationModal" tabindex="-1" role="dialog" aria-labelledby="subPayLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width: 620px;">
            <div class="modal-header">
                <h5 class="modal-title" id="donationModalLabel"> <img src="/img/favicon.png" style="height: 32px;width: 32px;">도네이션</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs justify-content-center" style="margin-bottom: 10px;">
                    <li class="nav-item">
                        <a href="#textDonation" data-toggle="tab" class="nav-link active">텍스트</a>
                    </li>
                    <li class="nav-item">
                        <a href="#movieDonation" data-toggle="tab" class="nav-link" >영상</a>
                    </li>
                    <li class="nav-item">
                        <a href="#roulleteDonation" data-toggle="tab" class="nav-link" >룰렛</a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane fade show active" id="textDonation">
                        <div class="row" style="border-bottom: 1px solid #dee2e6; padding-bottom: 1rem">
                            <div class="col-1">
                                <c:choose>
                                    <c:when test="${vo.ph_sysfile == null}">
                                        <img
                                                src="/img/user-photo/guest-icon.png"
                                                class="rounded-circle"
                                                style="height: 35px; width: 35px;"
                                        />
                                    </c:when>
                                    <c:otherwise>
                                        <img
                                                src="/img/user-photo/${vo.ph_sysfile}"
                                                class="rounded-circle"
                                                style="height: 35px; width: 35px;"
                                        />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="modal-body-top-left col-11">
                                <span>텍스트 도네이션</span><br>
                                <span>스트리머의 방송을 후원하세요!</span>
                            </div>
                        </div>
                        <div class="row" style="padding-top: 1rem">
                            <div class="col-12" >
                                <div>
                                    <h5 id="textDonMoneyField" style="font-size: 1rem; font-weight: 600;">현재 머니 잔액 : </h5>
                                    <h5 id="textDonMuchField" style="font-size: 1rem; font-weight: 600;">도네이션 금액 :  </h5>
                                    <input type="text" name="pay" id="textPay" class="form-control" style="margin-bottom: 20px;">
                                    <textarea name="pay" id="textContent" class="form-control" style="margin-bottom: 20px; resize: none" rows="10" placeholder="후원과 함께 보낼 메시지를 입력해주세요"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 text-right">
                                <button class="btn-primary" onclick="commitDon()">도네이션</button>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="movieDonation">
                        <div class="row" style="border-bottom: 1px solid #dee2e6; padding-bottom: 1rem">
                            <div class="col-1">
                                <c:choose>
                                    <c:when test="${vo.ph_sysfile == null}">
                                        <img
                                                src="/img/user-photo/guest-icon.png"
                                                class="rounded-circle"
                                                style="height: 35px; width: 35px;"
                                        />
                                    </c:when>
                                    <c:otherwise>
                                        <img
                                                src="/img/user-photo/${vo.ph_sysfile}"
                                                class="rounded-circle"
                                                style="height: 35px; width: 35px;"
                                        />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="modal-body-top-left col-11">
                                <span>영상 도네이션</span><br>
                                <span>스트리머의 방송을 후원하세요!</span>
                            </div>
                        </div>
                        <div class="row" style="padding-top: 1rem">
                            <div class="col-12" >
                                <div>
                                    <h5 id="movieDonMoneyField" style="font-size: 1rem; font-weight: 600;">현재 머니 잔액 : </h5>
                                    <h5 id="movieDonMuchField" style="font-size: 1rem; font-weight: 600;">도네이션 금액 :  </h5>
                                    <input type="text" name="pay" id="moviePay" class="form-control" style="margin-bottom: 20px;">
                                    <h5 id="urlField" style="font-size: 1rem; font-weight: 600;">URL :  </h5>
                                    <input type="text" name="url" id="movieUrl" class="form-control" style="margin-bottom: 20px;">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 text-right">
                                <button class="btn-primary" onclick="commitDon()">도네이션</button>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="roulleteDonation">
                        <div class="row" style="border-bottom: 1px solid #dee2e6; padding-bottom: 1rem">
                            <div class="col-1">
                                <c:choose>
                                    <c:when test="${vo.ph_sysfile == null}">
                                        <img
                                                src="/img/user-photo/guest-icon.png"
                                                class="rounded-circle"
                                                style="height: 35px; width: 35px;"
                                        />
                                    </c:when>
                                    <c:otherwise>
                                        <img
                                                src="/img/user-photo/${vo.ph_sysfile}"
                                                class="rounded-circle"
                                                style="height: 35px; width: 35px;"
                                        />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="modal-body-top-left col-11">
                                <span>룰렛 도네이션</span><br>
                                <span>스트리머의 방송을 후원하세요!</span>
                            </div>
                        </div>
                        <div class="row" style="padding-top: 1rem">
                            <div class="col-12" >
                                <div>
                                    <h5 id="roulleteDonMoneyField" style="font-size: 1rem; font-weight: 600;">현재 머니 잔액 : </h5>
                                    <h5 id="roulleteDonMuchField" style="font-size: 1rem; font-weight: 600;">도네이션 금액 :  </h5>
                                    <input type="text" name="pay" id="roulletePay" class="form-control" style="margin-bottom: 20px;">
                                    <h5 id="roulleteKind" style="font-size: 1rem; font-weight: 600;">현재 룰렛 종류</h5>
                                    <input type="text" class="form-control" name="king" id="kind" style="margin-bottom: 20px;" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 text-right">
                                <button class="btn-primary" onclick="commitDon()">도네이션</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>
