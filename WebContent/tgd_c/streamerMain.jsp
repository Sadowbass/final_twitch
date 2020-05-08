<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<div id="board-info" class="container-fluid">
		<h1>
			<a href="#">괴물쥐</a>
		</h1>
		<div id="article-list" align="center">
			<div id="article-list-category">
				<a href="#"><i class="glyphicon glyphicon-home"></i></a>
				<ul>
					<c:forEach var="i" begin="1" end="5">

						<li><a>메뉴${i }</a></li>

					</c:forEach>
				</ul>
			</div>
			<br />
			<div id="streamer-board">
				<c:forEach var="i" begin="1" end="20">
					<div class="row">
						<div class="col-xs-12" id="board-list">

							<div class="col-xs-2 category">
								<span>카테고리</span>
							</div>
							<div class="col-xs-7" >
								<span class="board-subject">제목</span>
							</div>
							<div class="col-xs-2 nickname">
								<span>닉네임</span>
							</div>
							<div class="col-xs-1 rdate">
								<span>날짜</span>
							</div>

						</div>
					</div>

					<!-- <div id="all-board" >
						<span id="category">카테고리</span> <span id="subject">제목</span> <span
							id="nickname">닉네임</span> <span id="rdate">날짜</span>
					</div> -->
				</c:forEach>

			</div>
			<div>
				<div id="paging">
					<input type="button" value="이전" onclick="">
					<c:forEach var="i" begin="1" end="5">
						<input type="button" value="${i }">
					</c:forEach>
					<input type="button" value="다음" onclick="">
					<input type="button" value="글쓰기" style="float : right">
				</div>
			</div>
		</div>
	</div>
	<script>tgd_c.func()</script>
</body>
</html>