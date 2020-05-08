<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<body>
	<div class="container-fluid">
		<div class="board-header">
			<div class="row">
				<div class="col-xs-12 board">
					<h3 style="text-align: left">
						<span>제목입니다</span>
					</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12" style="text-align: left;">
					<span><b>닉네임</b></span>님
				</div>
				<br>
			</div>
		</div>
		<div>
			<div class="row">
				<div class="col-xs-12">
					<div style='height: 25px; background-color: #eeeeee'>
							
					</div>
					<div style="border: 1px solid #eeeeee; height: 500px; border-bottom: 0px">
						내용입니다.
					</div>
					<div id="vote-area" style="border: 1px solid #eeeeee; border-top: 0px">
						<button class="btn" style="background-color: #EBF7FF !important"><i class="glyphicon glyphicon-thumbs-up" > <b>추천</b></i></button>
					</div>
					
					<div style="text-align: left; background-color: #eeeeee">
						<button class="btn"><i class="glyphicon glyphicon-list"></i> 목록</button>
						<button class="btn"><i class="glyphicon glyphicon-exclamation-sign"></i> 신고</button>
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-xs-12" style="text-align: left">
					<i class="glyphicon glyphicon-comment"></i><span> 댓글 </span>
				</div>
				
			</div>
			<c:forEach var="i" begin="1" end="3">
				<div style="text-align: left">
					<div style="margin-bottom : 10px; border: 1px solid #eeeeee">
						<div style="background-color: #eeeeee; padding: 5px;">아이디</div>
						<div style="padding: 5px;">댓글 내용</div>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>
</body>
</html>