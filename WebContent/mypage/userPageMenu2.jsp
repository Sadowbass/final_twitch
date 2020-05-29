<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.css" />
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.semanticui.min.css" />
<table id="donationTable" class="ui celled table" style="width:100%;">
        <thead>
            <tr>
                <th>No</th>
                <th>후원자</th>
                <th>내용</th>
                <th>금액</th>
                <th>날짜</th>
                <th>타입</th>
            </tr>
        </thead>
        <tbody>

			<c:forEach var='i' items='${list }' varStatus="status">
	            <tr>
	                <td>${status.count}</td>
	                <td>${i.don_oid}</td>
	                <td>${i.don_content }</td>
	                <td>${i.don_price }</td>    
	                <td>${i.don_rdate }</td> 
	                <c:if test="${i.type eq '0' }"><td>음성후원</td> </c:if>
	                <c:if test="${i.type eq '1' }"><td>영상후원</td> </c:if>
	                <c:if test="${i.type eq '2' }"><td>룰렛후원</td> </c:if>
	                <c:if test="${i.type eq '3' }"><td>구독</td> </c:if>   
	            </tr>
			</c:forEach>
        </tbody>
        <tfoot>
            <tr>
                <th>No</th>
                <th>후원자</th>
                <th>내용</th>
                <th>금액</th>
                <th>날짜</th>
                <th>타입</th>
            </tr>
        </tfoot>
    </table>
    <script>
    $(document).ready(function() {
        $('#donationTable').DataTable();
        
    } );
    </script>