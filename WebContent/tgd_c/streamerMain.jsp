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
					<div class="row">
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
											<div class="col-xs-7">
												<span class="board-subject"
													onclick="location.href='boardView.tgd'">제목 <span
													class="serial">${i }</span>
												</span>
											</div>
											<div class="col-xs-2 nickname">
												<span>닉네임</span>
											</div>
											<div class="col-xs-1 rdate">
												<span>날짜</span>
											</div>

										</div>
									</div>
								</c:forEach>

							</div>
							<div style="margin-top: 20px; float: right;">
								<input type="button" id="board_insert_c" class="btn" value="글쓰기" />
							</div>
							<!-- 페이지 전환 -->
							<div id="paging" class='col-xs-11'>
								<br> <br> <input type="button" class="btn" value="이전"
									onclick="">
								<c:forEach var="i" begin="1" end="5">
									<input type="button" class="btn" value="${i }">
								</c:forEach>
								<input type="button" class="btn" value="다음" onclick="">
							</div>

						</div>

						<br> <br>
					</div>

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
	<script>
		$('.serial').hide();
		tgd_c.func()
	</script>
</body>
</html>