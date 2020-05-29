<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.css" />
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.semanticui.min.css" />
<table id="paymentTable" class="ui celled table" style="width:100%">
        <thead>
            <tr>
                <th>No</th>
                <th>아이디</th>
                <th>결제 금액</th>
                <th>날짜</th>
            </tr>
        </thead>
        <tbody>

			<c:forEach var='i' items='${list }' varStatus="status">
	            <tr>
	                <td>${status.count}</td>
	                <td>${i.pay_mid }</td>
	                <td>${i.pay_money }</td>
	                <td>${i.pay_date }</td>     
	            </tr>
			</c:forEach>
        </tbody>
        <tfoot>
            <tr>
                <th>No</th>
                <th>이름</th>
                <th>결제 금액</th>
                <th>날짜</th>
            </tr>
        </tfoot>
    </table>
    <script>
    $(document).ready(function() {
        $('#paymentTable').DataTable();
        
    } );
    </script>