<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

					<table class='table table-striped' style='height: 100px'>
						<thead>
						<tr>
							<th style='color: white'>아이디</th>
							<th style='color: white'>날짜</th>
						</tr>
						</thead>
						<c:forEach var='i' items='${list }'>
						<tr>
							<th style='color: #BE81F7'>${i.mfo_oid }</th>
							<th style='color: white'>${i.mfo_date }</th>
						</tr>	
						</c:forEach>
					</table>
