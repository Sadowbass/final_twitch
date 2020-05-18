<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id='member'>
	<div id='header'>결과 페이지</div>
	${msg}

	<form id="frm_mm" name="frm_mm" method="post">
		<input type="button" value="목록으로" id="btnFind">

		<input type="text" name="findStr" id="findStr" value="">
		<input type="text" name="nowPage" value="">
		<input type="text" name="serial" value="">
	</form>
</div>
