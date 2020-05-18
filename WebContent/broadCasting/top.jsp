<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<nav
	class="navbar navbar-expand navbar-light bg-white static-top osahan-nav sticky-top"
	style='background-color: rgb(24, 24, 27) !important'>


	&nbsp;<a class="navbar-brand mr-1" href="../" id="main"
		onclick="pagemove(this)"><img class="img-fluid" alt=""
		src="../img/favicon.png">&nbsp;<img class="img-fluid" alt=""
		src="../img/Twitch_logo.png" width="100px"></a>


	<div
		style='margin: 10px; background-color: rgb(14, 14, 16); border-radius: 1em'>
		<div style='text-align: center; color: white'>0:00:00</div>
		<div style='text-align: center'>방송시간</div>
	</div>
	<div
		style='margin: 10px; background-color: rgb(14, 14, 16); border-radius: 1em'>
		<div style='text-align: center; color: white'>0</div>
		<div style='text-align: center'>시청자 수</div>
	</div>
	<div
		style='margin: 10px; background-color: rgb(14, 14, 16); border-radius: 1em'>
		<div style='text-align: center; color: white'>0</div>
		<div style='text-align: center'>팔로워</div>
	</div>

	<!-- Navbar -->

	<ul class="navbar-nav ml-auto osahan-right-navbar"
		style='float: right;'>
		<li class="nav-item dropdown no-arrow osahan-right-navbar-user">
			<a class="nav-link dropdown-toggle user-dropdown-link" href="#"
			id="userDropdown" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> <img alt="Avatar"
				src="../img/user.png"> <font color="white">BJ민호</font>
		</a>
			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="userDropdown">
				<a class="dropdown-item" href="../index.jsp" id="account"><i
					class="fas fa-fw fa-user-circle"></i> &nbsp; Twitch 돌아가기</a> <a
					class="dropdown-item" id="broadCastingSetting" onclick="broadCastingSetting()"><i
					class="fas fa-fw fa-cog"></i> &nbsp; 설정</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#" data-toggle="modal"
					data-target="#logoutModal"><i class="fas fa-fw fa-sign-out-alt"></i>
					&nbsp; 로그아웃</a>
			</div>
		</li>
	</ul>


</nav>
