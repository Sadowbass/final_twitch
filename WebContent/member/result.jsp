<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="refresh" content="3;url=../index.jsp">
<script src="../js/login_m.js"></script>
<body id="page-top2">
<%@include file="top2.jsp" %>
<form id="signupform" class="form-horizontal" role="form" commandName = "userDto" method="post">
		<div id='member'>
			<div id='result'>
				<h1 class='text-center'>결과</h1>
				<div>
				<h3 class='text-center'>${msg }</h3>
				</div>	
				<h6 class='text-center'>3초후 메인페이지로 이동합니다. 바로 이동을 원하시면 확인을 누르세요 </h6>
				<br/><br/>
				<div class='text-center'>
				<input type='button' id='btnSelect' value='확인' onclick="location.href='../index.jsp'" />
					</div>
				</div>
			</div>

		</form>
</body>

	<script>lm.func()</script>



