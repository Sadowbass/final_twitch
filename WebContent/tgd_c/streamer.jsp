<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-10">
				<form name="streamerFind_form" id="streamerFind_form"
					class="form-inline" method="post">
					<div class="form-group">
						<input type="text" class="form-control" name="streamerFind">
						<input type="hidden" name="nowPage" value="${p.nowPage }" /> <input
							type="hidden" name="nickname" /> <input type="button" value="검색"
							id="btnFind" />
					</div>
				</form>
				<div class="list" align="left" id="streamerList">
					<c:forEach var="i" begin="1" end="10">
						<div class='items' onclick=""
							style="float: left; margin: 10px; text-align: center;">
							<span class='photo_c'> <img src='./images/anno.png'><br>
								<span class="nickName"">닉네임${i }</span></span>
						</div>
					</c:forEach>
				</div>

			</div>
		</div>
		<div class="row">
			<div id="paging" class='col-xs-9'>
				<input type="button" value="이전" onclick="">
				<c:forEach var="i" begin="1" end="5">
					<input type="button" value="${i }">
				</c:forEach>
				<input type="button" value="다음" onclick="">
			</div>
		</div>
	</div>
</body>
</html>