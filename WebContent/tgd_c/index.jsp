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
	<div id="top_c">
		<%@include file="top.jsp"%>
	</div>

	<div class="container" id="main_c" >
		<div class="row">
			<div id="main_list_c" class="col-xs-2" style="padding: 0; margin :0; background-color: #fff; width: 150px;">
				<ul>
					<li style="margin: 0; padding-left: 8px;"><i class="glyphicon glyphicon-align-justify"></i> <B style="color: #fff;">트게더 전체 메뉴</B></li>
					<li><a href=""><b>A</b> 전체 글 보기</a></li>
					<li><a href="#" onclick="tgd_c.streamer()"><b>B</b> 스트리머 게시판</a></li>
					<li><a href=""><b>C</b> 커뮤니티</a></li>
					<li><a href=""><b>H</b> 핫클립</a></li>
					<li><a href=""><b>G</b> 게임대회</a></li>
					<li><a href=""><b>P</b> 방송홍보</a></li>
					<li><a href=""><b>U</b> 구인구직</a></li>
					<li><a href=""><b>Q</b> Q&A</a></li>
					<li><a href=""><b>T</b> 방송 TIP</a></li>
					<li><a href=""><b>N</b> 공지사항</a></li>
					<li><a href=""><b>E</b> 이벤트</a></li>
					<li><a href=""><b>S</b> 건의/신고</a></li>
					
				</ul>
			</div>
			<div class="col-xs-10 " id="main-content">
				<div id="main_main" align="center">
					
						<div class="row">
							<div class="col-md-6"><h3>스포트라이트</h3></div>
							<div class="col-md-6" ><h3>트게더 포커스</h3></div>
						</div>
						<div class="row">
							<div class="col-md-6"><h3>커뮤니티 인기글</h3></div>
							<div class="col-md-6"><h3>스트리머 홍보</h3></div>
						</div>
						<div class="row">
							<div class="col-md-12"><h3>e스포츠 대회</h3></div>
						</div>
						<div class="row">
							<div class="col-md-12"><h3>핫클립</h3></div>
						</div>
						<div class="row">
							<div class="col-md-6"><h3>방송 홍보</h3></div>
							<div class="col-md-6"><h3>방송 qna</h3></div>
						</div>
						<div class="row">
							<div class="col-md-6"><h3>방송tip</h3></div>
							<div class="col-md-6"><h3>구인구직</h3></div>
						</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="footer">
		<%@include file="footer.jsp" %>
	</div>


</body>
</html>

