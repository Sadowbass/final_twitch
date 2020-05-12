<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
	<script src="vendor/jquery/jquery.min.js"></script>
</head>
<body>
<div id="topplace">
	<jsp:include page="./top.jsp"/>
</div>
<div id="sideplace"></div>
<div id="content-wrapper"></div>
<script>
	$(document).ready(function () {
		let path = window.location.pathname;
		if(path.indexOf("/final_twitch") >=0 ){
			path = path.replace("/final_twitch","");
		}
		console.log(path);
		$.ajax({
			type:'get',
			url:'./sidebar.sc',
			success:function (data) {
				$('#sideplace').html(data);
			}
		})
		$.ajax({
			type:'get',
			url:'faker',
			success:function (data) {
				$('#content-wrapper').html(data);
			}
		})
	})
</script>
</body>
</html>