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
	                <td><font style='font-weight: bold'>${status.count}</font></td>
	                <td><c:if test="${empty i.ph_sysfile }"><img class='img-fluid imgTak' style="width: 40px" src="../img/user-photo/guest-icon.png" id="memberPhoto"></c:if>
	                <c:if test = "${not empty i.ph_sysfile }"><img class='img-fluid imgTak' style="width: 40px" src="../img/user-photo/${i.ph_sysfile }" id="memberPhoto"></c:if>
	                <font style="font-weight: bold">&nbsp;&nbsp;${i.don_oid}</font></td>
	                <td><font style='font-weight: bold'>${i.don_content }</font></td>
	                <td><font style='font-weight: bold'>${i.don_price }</font></td>    
	                <td><font style='font-weight: bold'>${i.don_rdate }</font></td> 
	                <c:if test="${i.type eq '0' }"><td><div style='display:inline-block;background-color:rgb(232, 86, 133);color: white'>&nbsp;음성후원&nbsp;</div></td> </c:if>
	                <c:if test="${i.type eq '1' }"><td><div style='display:inline-block;background-color:rgb(232, 86, 133);color: white'>&nbsp;영상후원&nbsp;</div></td> </c:if>
	                <c:if test="${i.type eq '2' }"><td><div style='display:inline-block;background-color:rgb(232, 86, 133);color: white'>&nbsp;룰렛후원&nbsp;</div></td> </c:if>
	                <c:if test="${i.type eq '3' }"><td><div style='display:inline-block;background-color:rgb(232, 86, 133);color: white'>&nbsp;구독&nbsp;</div></td> </c:if>   
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
            	 responsive: true,
                 legend: {
                    labels: {
                       fontColor: "#9a9a9a",
                    }
                 },
                 scales: {
                    yAxes: [{
                       ticks: {
                          beginAtZero: true,
                          fontColor : "#9a9a9a",
                       },
                       gridLines:{
                          /*color: '#eee'*/
                       }
                    }],
                    xAxes: [{
                       ticks:{
                          fontColor : '#9a9a9a'
                       },
                       gridLines:{
                          /*color: "#eee"*/
                       }
                    }]
                 }
         
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