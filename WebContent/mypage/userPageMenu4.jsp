<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.css" />
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.semanticui.min.css" />
<div class="body">
    <canvas id="payment_chart" height="150"></canvas>    
</div>
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
    
    var chart;
    var payment = function(){
    	var ctx = document.getElementById('payment_chart').getContext('2d');
        chart = new Chart(ctx, {
           // The type of chart we want to create
           type: 'line',

           // The data for our dataset
           data: {
               labels: ['1월','2월', '3월', '4월','5월','6월','7월','8월','9월','10월','11월','12월'],
               datasets: [{
                   label: '월별 결제 금액',
                   data: [0,0,0,0,0,0,0,0,0,0,0,0],
                   borderColor: 'rgb(255, 99, 132)',
                   backgroundColor: 'rgba(255, 99, 132, 0.2)',
                   pointBorderColor: 'rgb(255, 99, 132)',
                   pointBackgroundColor: 'rgba(255, 99, 132, 0.2)',
                   pointBorderWidth: 1
               }], 
           options: {
               responsive: true,
           }
          }
       });
        
        <c:forEach items="${payment}" var="i" varStatus="j">
        var k = Number(${i.month})-1;
        chart.data.datasets[0].data[k] =${i.profit}
        </c:forEach>
    }
    
    payment();
        
    </script>