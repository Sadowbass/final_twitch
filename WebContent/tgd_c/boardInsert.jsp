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
<script src="<%=request.getContextPath()%>/tgd_c/js/summernote-lite.js"></script>
<script src="<%=request.getContextPath()%>/tgd_c/js/summernote-ko-KR.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/tgd_c/css/summernote-lite.css">
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
					<div class="board-header">
						<h1>
							<a href="#">괴물쥐 - 새 글 작성하기</a>
						</h1>
						<form action="">
							<div class="row">
								<div class="col-xs-12 board">
									<div class="col-xs-2" id="board-cate-select">
										<select class="form-control" name="" id="">
											<option value="" selected>카테고리1</option>
											<option value="">카테고리2</option>
											<option value="">카테고리3</option>
											<option value="">카테고리4</option>
										</select>
									</div>
									<div class="col-xs-10" style="padding: 0px">
										<input type="text" class="form-control" placeholder="제목" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<textarea name="editordata" id="summernote"></textarea>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12" style="padding-top: 15px;">
									<div class="col-xs-2" style="padding: 0px;">
										<input type="button" class="btn" value="작성취소" onclick="location.href='streamerMain.tgd'"/>
									</div>
									<div class="col-xs-offset-8 col-xs-2"
										style="padding: 0px; text-align: right;">
										<input class="btn" type="button" value="쓰기" id="board_write_c"/>
									</div>
								</div>
							</div>
						</form>
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
		$('#summernote').summernote({
			height : 300,
			minHeight : null,
			maxHeight : null,
			focus : true,
			lang : "ko-KR",
			placeholder : '내용을 작성해주세요^^'
		})
	</script>
</body>
</html>