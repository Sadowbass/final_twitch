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
		session.removeAttribute("admin_id");
		session.removeAttribute("session_id");
		response.sendRedirect("../index.jsp");
	%>
</body>
</html>