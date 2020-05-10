<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/tgd_c/css/tgd.css">

<script src="<%=request.getContextPath()%>/tgd_c/js/tgd.js"></script>

</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div id="header">
					<%@ include file="top.jsp"%>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-2">
				<div id="sideMenu">
					<%@ include file="side.jsp"%>
				</div>
			</div>
			<div class="col-sm-10">
				<div id="content">
					<div class="col-xs-12">
						<div align="right">
							<form name="streamerFind_form" id="streamerFind_form"
								class="form-inline" method="post">
								<div class="form-group">
									<input type="text" class="form-control" name="streamerFind">
									<input type="hidden" name="nowPage" value="${p.nowPage }" /> <input
										type="hidden" name="nickname" /> <input type="button"
										value="검색" class="btn" id="btnFind"
										style="background-color: #6847A6 !important; color: white !important;" />

								</div>
							</form>
							<br>
						</div>

						<div class="list" id="streamerList" style="margin-left: 20px">
							<c:forEach var="i" begin="1" end="10">
								<div class='items' onclick="location.href='streamerMain.tgd'"
									style="float: left; margin: 10px; text-align: center;">
									<span class='photo_c'> <img
										src='https://via.placeholder.com/140' class="img-circle"><br>
										<span class="nickName">닉네임${i }</span></span>
								</div>
							</c:forEach>
						</div>
					</div>

					<div class="row" align="center">
						<div id="paging" class='col-xs-11'>
							<br>
							<br> <input type="button" class="btn" value="이전" onclick="">
							<c:forEach var="i" begin="1" end="5">
								<input type="button" class="btn" value="${i }">
							</c:forEach>
							<input type="button" class="btn" value="다음" onclick="">
						</div>
					</div>
					<br>
					<br>
					<br>




				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div id="footer">
					<%@include file="footer.jsp"%>
				</div>
			</div>
		</div>
	</div>





























</body>
</html>