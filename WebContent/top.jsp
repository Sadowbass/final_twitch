<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script src="/js/login_m.js"></script>
<style>
    .btn-disabled {
        cursor: not-allowed;
        background: darkgrey !important;
    }
</style>
<nav class="navbar navbar-expand navbar-light bg-white osahan-nav fixed-top "><!-- sticky-top static-top fixed-top -->
<button class="btn btn-link btn-sm text-secondary order-1 order-sm-0" id="sidebarToggle">
    <i class="fas fa-bars"></i>
</button>
&nbsp;&nbsp;
<a class="navbar-brand mr-1" href="/" id="main" onclick="pagemove(this)">
    <img class="img-fluid" alt="" src="/img/favicon.png"> &nbsp;&nbsp;<img class="img-fluid" alt=""
		src="/img/Twitch_logo.png" width="100px"></a>

     <a class="" href="/categories" id="categories" style='font-size: 20px;'><font style="font-weight: bold">&nbsp;탐색</font></a>
	 <%if(session.getAttribute("session_id") != null){ %>
	 <a class="" href="/store/" id="store" style='font-size: 20px;'><i style=''></i> &nbsp; <font style="font-weight: bold">스토어</font></a>
	 <%} %>
<!-- Navbar Search -->
<form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-5 my-2 my-md-0 osahan-navbar-search">
    <div class="input-group">
        <input type="text" class="form-control" placeholder="Search for...">
        <div class="input-group-append">
            <button class="btn btn-light" type="button">
                <i class="fas fa-search"></i>
            </button>
        </div>
    </div>
</form>
<input type='hidden' id="loginId" value="${loginInfo.mem_id}"/>
<!-- Navbar -->
<c:choose>

    <c:when test="${loginInfo.mem_id == null}">
        <%--비회원일때 보이는 메뉴--%>
        <ul class="guest-nav" style="margin-top: 7.51px; margin-bottom: 7.51px;">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#login">로그인</button>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#sign-in">회원가입</button>
        </ul>
        </nav>
    </c:when>
   
    <c:otherwise>
        <%--회원 로그인시 보이는 메뉴--%>
        <ul class="navbar-nav ml-auto ml-md-0 osahan-right-navbar" id="user-nav">
            <li class="nav-item mx-1">
                <a class="nav-link" href="#" id="upload" onclick="pagemove(this)">
                    <i class="fas fa-plus-circle fa-fw"></i>
                    Upload Video
                </a>
            </li>
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-bell fa-fw"></i>
                    <span class="badge badge-danger">9+</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
                    <a class="dropdown-item" href="#"><i class="fas fa-fw fa-edit "></i> &nbsp; Action</a>
                    <a class="dropdown-item" href="#"><i class="fas fa-fw fa-headphones-alt "></i> &nbsp; Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#"><i class="fas fa-fw fa-star "></i> &nbsp; Something else here</a>
                </div>
            </li>

            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-envelope fa-fw"></i>
                    <span class="badge badge-success">7</span>
                </a>

                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
                    <a class="dropdown-item" href="#"><i class="fas fa-fw fa-edit "></i> &nbsp; Action</a>
                    <a class="dropdown-item" href="#"><i class="fas fa-fw fa-headphones-alt "></i> &nbsp; Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#"><i class="fas fa-fw fa-star "></i> &nbsp; Something else here</a>
                </div>
            </li>

            <li class="nav-item dropdown no-arrow osahan-right-navbar-user">
                <a class="nav-link dropdown-toggle user-dropdown-link" href="#" id="userDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <c:choose>
                        <c:when test="${loginInfo.ph_sysfile == null}">
                            <img src="/img/user-photo/guest-icon.png" id="top-userphoto">
                        </c:when>
                        <c:otherwise>
                            <img src="/img/user-photo/${loginInfo.ph_sysfile}" id="top-userphoto">
                        </c:otherwise>
                    </c:choose>
                    <span id="top-username">${loginInfo.mem_name}</span>
                </a>

                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                	<%if(session.getAttribute("admin_id")!=null) { %>
                		<a class="dropdown-item" href="/admin/home.he" id="admin/index"><i class="fas fa-fw fa-user-circle"></i> &nbsp; 관리자페이지</a>
                	<%}else{%>
					<a class="dropdown-item" href="/mypage/userPage.jsp" id="mypage/userPage" ><i class="fas fa-fw fa-user-circle"></i> &nbsp; My
                    Account</a>
                    <a class="dropdown-item" href="#" id="broadCasting/index" onclick="pagemove(this)"><i
                            class="fas fa-fw fa-video"></i> &nbsp;
                        방송하기</a>
                    <a class="dropdown-item" href="#" id="settings" onclick="pagemove(this)"><i
                            class="fas fa-fw fa-cog"></i> &nbsp; Settings</a>
                    <%}%>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal"><i
                            class="fas fa-fw fa-sign-out-alt"></i> &nbsp; Logout</a>
                </div>
            </li>
        </ul>
        </nav>
    </c:otherwise>
</c:choose>

<%--로그인 모달--%>
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" tyle="margin-left: 20px;"><img src="/img/favicon.png"> 로그인</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="loginForm">
                    <span>아이디</span><br/>
                    <input type="text" class="form-control" name="id" id="login-id-field" style="width: 100%;"><br/>
                    <span>비밀번호</span><br/>
                    <input type="password" class="form-control" name="pwd" id="login-pwd-field"
                           style="width: 100%;"><br/><br/>
                </form>
                <%-- <a href="#"><span id="forget-pwd" style="color: mediumpurple;">비밀번호 찾기</span></a> #1 --%>
                <a href="/member_m/memberSearch.jsp"><span id="forget-pwd" style="color: mediumpurple;">비밀번호 찾기</span></a>
            </div>
            <button type="button" class="btn btn-primary btn-disabled" id="button-login"
                    style="margin-left: 20px; margin-right: 20px; margin-bottom: 30px;" disabled>로그인
            </button>
        </div>
    </div>
</div>
</div>

<%--회원가입 모달--%>
<div class="modal fade" id="sign-in" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
               <%--  <h5 class="modal-title" style="margin-left: 20px;"><img src="/img/favicon.png"> 로그인</h5> #2 --%>
                <h5 class="modal-title" style="margin-left: 20px;"><img src="/img/favicon.png"> 회원가입</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
               <%--  아이디<br/> #3 --%>
            
             <%@include file="/insertm.jsp" %>
              <!--   아이디<br/>
                <input type="text" class="form-control sign-in" name="id" id="sign-in-id-field"
                       style="width: 100%;"><br/><br/>
                비밀번호<br/>
                <input type="password" class="form-control pwd-form sign-in" name="pwd" id="sign-in-pwd-field"
                       style="width: 100%;"><br/>
                <span id="message"></span><br/>
                비밀번호 확인<br>
                <input type="password" class="form-control pwd-form sign-in" name="pcheck" id="sign-in-pwd-check"
                       style="width: 100%;"><br/>
                <span id="checkMessage"></span><br/>
                생년월일<br>
                <input type="date" class="form-control sign-in" name="birth" id="sign-in-birth"
                       style="width: 100%;"><br><br>
                이메일<br>
                <input type="text" class="form-control sign-in" name="email" id="sign-in-email"
                       style="width: 100%;"><br><br>
            </div>
            <button type="button" class="btn btn-primary btn-disabled"
                    style="margin-left: 20px; margin-right: 20px; margin-bottom: 30px;" id="button-sign-in" disabled>
                회원가입
            </button> -->
        </div>
    </div>
</div>
</div>

<script>
    /*로그인*/
    /*id, pwd 입력시 공란일경우 방지*/
    $('#login-id-field').keyup(function () {
        if ($.trim($('#login-id-field').val()) != "" && $.trim($('#login-pwd-field').val()) != "") {
            $('#button-login').removeAttr("disabled")
            $('#button-login').removeClass("btn-disabled");
        } else {
            $('#button-login').prop('disabled', 'true');
            $('#button-login').addClass("btn-disabled");
        }
    })

    /*id, pwd 입력시 공란일경우 방지*/
    $('#login-pwd-field').keyup(function () {
        if ($.trim($('#login-id-field').val()) != "" && $.trim($('#login-pwd-field').val()) != "") {
            $('#button-login').removeAttr("disabled")
            $('#button-login').removeClass("btn-disabled");
        } else {
            $('#button-login').prop('disabled', 'true');
            $('#button-login').addClass("btn-disabled");
        }
    })

    /*로그인 버튼 클릭시*/
    $('#button-login').click(function () {
        let fd = {
            "id": $('#login-id-field').val(),
            "pwd": $('#login-pwd-field').val()
        }

        $.ajax({
            url: "/idcheck.sc",
            data: fd,
            type: 'post',
            error: function (error) {
                console.log(error);
            },
            success: function (data) {
                if (data == "true") {
                    location.href = "/";
                } else {
                    alert("아이디 혹은 비밀번호를 확인해 주세요")
                }
            }
        })
    })
    /*로그인 끝*/

    /*회원가입*/
    /*아이디 입력 후*/
    /* $('#sign-in-id-field').blur(function () { #5 */
 /*회원가입*/
    /*아이디 입력 후*/
   
   /*  $('#sign-in-id-field').blur(function () {
        if ($.trim($('#sign-in-id-field').val()).length > 0) {
            $.ajax({
                data: {"mId": $('#sign-in-id-field').val()},
                url: "dupIdCheck.sc",
                type: 'post',
                error: function (err) {
                    console.log(err);
                },
                success: function (data) {
                    if (data.result == 1) {
                        alert("이미 가입된 아이디 입니다");
                        $('#sign-in-id-field').val("");
                        $('#sign-in-id-field').focus();
                    } else {
                        alert("가입 가능한 아이디 입니다");
                    }
                }
            })
        }
    })

    $('#sign-in-pwd-field').keyup(function () {
        let pwd = $('#sign-in-pwd-field').val();
        if (pwd.length < 8 && pwd.length > 0) {
            $('#message').html("비밀번호는 8자리 이상이어야 합니다");
            $('#sign-in-pwd-field').focus();
            return;
        } else {
            $('#message').html("");
        }
    })

    $('#sign-in-pwd-check').keyup(function () {
        let pwd = $('#sign-in-pwd-check').val();
        if (pwd != $('#sign-in-pwd-field').val()) {
            $('#checkMessage').html("비밀번호를 확인 해 주세요");
        } else {
            $('#checkMessage').html("비밀번호가 동일합니다");
        }
    })

    $('.sign-in').change(function () {
        let id = $.trim($('.sign-in')[0].value);
        let pwd = $.trim($('.sign-in')[1].value);
        let birth = $.trim($('.sign-in')[3].value);
        let email = $.trim($('.sign-in')[4].value);

        if (id.length != 0 && pwd.length != 0 && birth.length != 0 && email.length != 0) {
            $('#button-sign-in').removeClass("btn-disabled");
            $('#button-sign-in').removeAttr('disabled')
        } else {
            $('#button-sign-in').addClass("btn-disabled");
            $('#button-sign-in').prop("disabled", 'true');
        }
    })

    $('#button-sign-in').click(function () {
        let id = $.trim($('.sign-in')[0].value);
        let pwd = $.trim($('.sign-in')[1].value);
        let birth = $.trim($('.sign-in')[3].value);
        let email = $.trim($('.sign-in')[4].value);

        let fd = {
            'id': id,
            'pwd': pwd,
            'birth': birth,
            'email': email
        }

        $.ajax({
            url: "/" + id,
            data: fd,
            type: 'post',
            error: function (error) {
                console.log(error);
            },
            success: function (data) {
                console.log(data);
            }
        })
    }) */


</script>

<script>
	if($("#loginId").val()!=null)uk.connectAllWS($("#loginId").val());
</script>