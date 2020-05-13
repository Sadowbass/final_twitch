<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
    <script src="vendor/jquery/jquery.min.js"></script>
    <style>
    	#test{
			color: white;
    	}
    </style>
</head>
<body>
	<div id="test" style="background-color: rgba(255,0,0,0);"></div>
	<script>
		$(document).ready(function(){ 
			setInterval(function(){ 
				$('#test').html('qwdqwdwqdqwd');
			},2000) 
		};
	</script>
	
</body>
</html>