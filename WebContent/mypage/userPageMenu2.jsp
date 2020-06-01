<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.css" />
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.semanticui.min.css" />
<div class="body">
    <canvas id="donation_chart" height="150"></canvas>    
</div>
<table id="donationTable" class="ui celled table" style="width:100%;">
        <thead>
            <tr>
                <th>No</th>
                <th>스트리머</th>
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
                <th>스트리머</th>
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
    
    var myBarChart;
    var ad_chart = function(){
    	
        var ctx5 = document.getElementById('donation_chart').getContext('2d');
         myBarChart = new Chart(ctx5, {
            type: 'bar',
            data: {
                labels: [],
                datasets: [{
                    data: [0,0,0,0,0],
                    fill: false,
                    label: "보낸 도네이션 top 5",
                    backgroundColor: ["rgba(255, 99, 132, 0.2)", "rgba(255, 99, 132, 0.2)",
                        "rgba(255, 99, 132, 0.2)", "rgba(255, 99, 132, 0.2)", "rgba(255, 99, 132, 0.2)",
                        "rgba(255, 99, 132, 0.2)", "rgba(255, 99, 132, 0.2)","rgba(255, 99, 132, 0.2)","rgba(255, 99, 132, 0.2)",
                        "rgba(255, 99, 132, 0.2)","rgba(255, 99, 132, 0.2)","rgba(255, 99, 132, 0.2)"
                    ],
                    borderColor: ["rgb(255, 99, 132)", "rgb(255, 99, 132)", "rgb(255, 99, 132)",
                        "rgb(255, 99, 132)", "rgb(255, 99, 132)", "rgb(255, 99, 132)","rgb(255, 99, 132)","rgb(255, 99, 132)",
                        "rgb(255, 99, 132)","rgb(255, 99, 132)","rgb(255, 99, 132)","rgb(255, 99, 132)"
                    ],
                    borderWidth: 1

                }]
            },
            options: {
                responsive: true
         
            }
        });

        <c:forEach items="${send_list}" var="i" varStatus="j" end="5">
        myBarChart.data.labels[${j.index}] = '${i.don_oid}'
        myBarChart.data.datasets[0].data[${j.index}] =${i.profit}
        </c:forEach>

        myBarChart.update();
        
        
    }
    
    ad_chart();
    </script>