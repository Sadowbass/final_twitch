<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
<%
	request.setCharacterEncoding("utf-8");
	System.out.println(request.getAttribute("pagename"));
	String inc = null;
	if(request.getAttribute("pagename") != null){ 
		inc = (String)request.getAttribute("pagename");
	} else {
		inc = "main";
	}
%>
	<%@include file=" " %>
</body>
</html>