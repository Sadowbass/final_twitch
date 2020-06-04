<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>ChartJS | Bootstrap Based Admin Template - Material Design</title>

</head>


<div class="container-fluid">
    <div class="block-header">
        <h2>
            수익관리
        </h2>
    </div>
    <div class="row clearfix">
        <!-- 도네 Chart -->
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>도네이션 수익</h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);" onclick="donation_m()">월간 수익</a></li>
                                <li><a href="javascript:void(0);" onclick="donation_q()">분기별 수익</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="body">
                    <canvas id="donation_chart" height="150"></canvas>
                </div>
            </div>
        </div>
        <!-- #END# 도네 Chart -->
        <!-- 구독 Chart -->
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>구독 수익</h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);" onclick="sub_m()">월간 수익</a></li>
                                <li><a href="javascript:void(0);" onclick="sub_q()">분기별 수익</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="body">
                    <canvas id="subscribe_chart" height="150"></canvas>
                </div>
            </div>
        </div>
        <!-- #END# 구독 Chart -->
    </div>

    <div class="row clearfix">
        <!-- 도네 수익 랭킹 -->
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>도네이션 수익 랭킹 </h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);">주간 랭킹</a></li>
                                <li><a href="javascript:void(0);">월간 랭킹</a></li>
                                <li><a href="javascript:void(0);">분기별 랭킹</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="body">
                    <div class="body table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>순위</th>
                                    <th>아이디</th>
                                    <th>이름</th>
                                    <th>수익</th>
                                </tr>
                            </thead>
                            <tbody>
                     			<c:forEach var="i" items="${d_list }" end="4" varStatus="j">
                     		     <tr onclick="s_detail('${i.don_oid}')">
                                    <th scope="row">${i.rn}</th>
                                    <td>${i.don_oid}</td>
                                    <td>${i.mem_name }</td>
                                    <td>${i.profit }</td>
                                </tr>
                     			</c:forEach>
                     			
                     			<c:if test="${fn:length(d_list) <5}">
                     			  <c:forEach  begin="1" end="${5-fn:length(d_list)}" varStatus="j">
                     				<tr>
                                    <th scope="row">#</th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                	</tr>
                     			  </c:forEach>
                     			</c:if>
                            </tbody>
                        </table>
                    </div>
                     <nav class="profit_pg">
                                <ul class="pagination">
                                <c:if test="${p.nowPage >1 }">
                                    <li>
                                        <a href="javascript:void(0);" class="waves-effect pg" onclick="d_list_b()">
                                            <i class="material-icons" >chevron_left</i>
                                        </a>
                                    </li>                                 
                                </c:if>
                                <c:if test="${p.nowPage <p.totPage}">
                                    <li>
                                        <a href="javascript:void(0);" class="waves-effect pg" onclick="d_list_n()">
                                            <i class="material-icons">chevron_right</i>
                                        </a>
                                    </li>                                
                                </c:if>
                                </ul>
                       </nav>
                </div>
            </div> 
           
        </div>
        <form name="he_form" id="he_form" method="post">
        	<input type="hidden" id="he_serial" name="he_serial"/>
        	<input type="hidden" id="page" name="page" value="${p.nowPage}"/>
        </form>
        <!-- #END# 도네 수익 랭킹 -->
        <!-- 구독랭킹-->
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>구독 수익 랭킹</h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);">주간 랭킹</a></li>
                                <li><a href="javascript:void(0);">월간 렝킹</a></li>
                                <li><a href="javascript:void(0);">분기별 랭킹</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="body">
                    <div class="body table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>순위</th>
                                    <th>아이디</th>
                                    <th>이름</th>
                                    <th>수익</th>
                                </tr>
                            </thead>
                            <tbody>
                               <c:forEach var="i" items="${s_list }"  varStatus="j">
                     		     <tr onclick="s_detail('${i.sub_oid}')">
                                    <th scope="row">${i.rn}</th>
                                    <td>${i.sub_oid}</td>
                                    <td>${i.mem_name }</td>
                                    <td>${i.profit }</td>
                                </tr>
                     			</c:forEach>
                     			
                     			<c:if test="${fn:length(s_list) <5}">
                     			  <c:forEach  begin="1" end="${5-fn:length(s_list)}" varStatus="j">
                     				<tr>
                                    <th scope="row">#</th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                	</tr>
                     			  </c:forEach>
                     			</c:if>
                            </tbody>
                        </table>
                    </div>
                     <nav class="profit_pg">
                                <ul class="pagination">
                                <c:if test="${p2.nowPage >1 }">
                                    <li>
                                        <a href="javascript:void(0);" class="waves-effect pg" onclick="s_list_b()">
                                            <i class="material-icons" >chevron_left</i>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${p2.nowPage <p2.totPage}">
                                    <li>
                                        <a href="javascript:void(0);" class="waves-effect pg" onclick="s_list_n()">
                                            <i class="material-icons">chevron_right</i>
                                        </a>
                                    </li>
                                </c:if>
                                </ul>
                       </nav>
                </div>
            </div>
        </div>
        <!-- #END# 구독 랭킹-->
        <form name="he_form2" id="he_form2" method="post">
        	<input type="hidden" id="he_serial2" name="he_serial2"/>
        	<input type="hidden" id="page2" name="page2" value="${p2.nowPage}"/>
        </form>
    </div>
    <div class="row clearfix">
        <!-- 도네 Chart -->
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>수익 구조</h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);" onclick="per_m()">월간 수익</a></li>
                                <li><a href="javascript:void(0);" onclick="per_y()">분기별 수익</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="body">
                    <canvas id="percent_chart" height="150"></canvas>
                </div>
            </div>
        </div>
        <!-- #END# 도네 Chart -->
        <!-- 구독 Chart -->
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>결제된 금액</h2>
                    <ul class="header-dropdown m-r--5">
                       
                    </ul>
                </div>
                <div class="body">
                    <canvas id="advertise_chart" height="150"></canvas>
                </div>
            </div>
        </div>
        <!-- #END# 구독 Chart -->
    </div>
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>총 수익</h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);" onclick="tot_m()">월간 수익</a></li>
                                <li><a href="javascript:void(0);" onclick="tot_y()">분기별 수익</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="body">
                    <canvas id="total_chart" height="70"></canvas>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="js/stream.js"></script>
<script>
var chart;
var donation_chart = function(){
	
	var ctx = document.getElementById('donation_chart').getContext('2d');
    chart = new Chart(ctx, {
       // The type of chart we want to create
       type: 'line',

       // The data for our dataset
       data: {
           labels: ['1월','2월', '3월', '4월', '5월', '6월', '7월','8월','9월','10월','11월','12월'],
           datasets: [{
               label: '도네이션 수익',
               data: [0, 0, 0, 0, 0, 0, 0,0,0,0,0,0],
               borderColor: 'rgba(0, 188, 212, 0.75)',
               backgroundColor: 'rgba(0, 188, 212, 0.3)',
               pointBorderColor: 'rgba(0, 188, 212, 0)',
               pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
               pointBorderWidth: 1
           }, {
               label: "도네이션 누적수익",
               data: [0, 0, 0, 0, 0, 0, 0,0,0,0,0,0],
               borderColor: 'rgba(233, 30, 99, 0.75)',
               backgroundColor: 'rgba(233, 30, 99, 0.3)',
               pointBorderColor: 'rgba(233, 30, 99, 0)',
               pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
               pointBorderWidth: 1
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


var tot_array =[];
var tot_p=0;
<c:forEach items="${done_list}" var="i" varStatus="j">
var k = Number(${i.month})-1;
chart.data.datasets[0].data[k] =${i.profit}

tot_p += ${i.profit}

var data =  new Object();
data.month = k;;
data.tot = tot_p;

tot_array.push(data)
</c:forEach>


for(var d=0; d<tot_array.length; d++){
	if(d == tot_array.length -1){
		for(var j=tot_array[d].month; j<12; j++){
	 		chart.data.datasets[1].data[j] = tot_array[d].tot;
	 	}
	}else{
	 	for(var j=tot_array[d].month; j<tot_array[d+1].month; j++){
	 		chart.data.datasets[1].data[j] = tot_array[d].tot;
	 	}
	}
}

chart.update();



}


var donation_m = function(){
	chart.destroy();
	donation_chart();
}


var donation_q = function(){
	chart.destroy();
	var ctx = document.getElementById('donation_chart').getContext('2d');
    chart = new Chart(ctx, {
       // The type of chart we want to create
       type: 'line',

       // The data for our dataset
       data: {
           labels: ['1분기','2분기', '3분기', '4분기'],
           datasets: [{
               label: '도네이션 수익',
               data: [0, 10, 5, 2],
               borderColor: 'rgba(0, 188, 212, 0.75)',
               backgroundColor: 'rgba(0, 188, 212, 0.3)',
               pointBorderColor: 'rgba(0, 188, 212, 0)',
               pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
               pointBorderWidth: 1
           }, {
               label: "도네이션 누적수익",
               data: [0, 3, 10, 2],
               borderColor: 'rgba(233, 30, 99, 0.75)',
               backgroundColor: 'rgba(233, 30, 99, 0.3)',
               pointBorderColor: 'rgba(233, 30, 99, 0)',
               pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
               pointBorderWidth: 1
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
}

var chart2;
var sub_chart = function(){
	
	var ctx2 = document.getElementById('subscribe_chart').getContext('2d');
    chart2 = new Chart(ctx2, {
       // The type of chart we want to create
       type: 'line',

       // The data for our dataset
       data: {
           labels: ['1월','2월', '3월', '4월', '5월', '6월', '7월','8월','9월','10월','11월','12월'],
           datasets: [{
               label: '구독 수익',
               data: [0, 0, 0, 0, 0, 0, 0,0,0,0,0,0],
               borderColor: 'rgba(0, 188, 212, 0.75)',
               backgroundColor: 'rgba(0, 188, 212, 0.3)',
               pointBorderColor: 'rgba(0, 188, 212, 0)',
               pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
               pointBorderWidth: 1
           }, {
               label: "구독 누적 수익",
               data: [0, 0, 0, 0, 0, 0, 0,0,0,0,0,0],
               borderColor: 'rgba(233, 30, 99, 0.75)',
               backgroundColor: 'rgba(233, 30, 99, 0.3)',
               pointBorderColor: 'rgba(233, 30, 99, 0)',
               pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
               pointBorderWidth: 1
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
    
    var tot_array =[];
    var tot_p=0;
    <c:forEach items="${sub_list}" var="i" varStatus="j">
    var k = Number(${i.month})-1;
    chart2.data.datasets[0].data[k] =${i.profit}

    tot_p += ${i.profit}

    var data =  new Object();
    data.month = k;;
    data.tot = tot_p;

    tot_array.push(data)
    </c:forEach>


    for(var d=0; d<tot_array.length; d++){
    	if(d == tot_array.length -1){
    		for(var j=tot_array[d].month; j<12; j++){
    	 		chart2.data.datasets[1].data[j] = tot_array[d].tot;
    	 	}
    	}else{
    	 	for(var j=tot_array[d].month; j<tot_array[d+1].month; j++){
    	 		chart2.data.datasets[1].data[j] = tot_array[d].tot;
    	 	}
    	}
    }

    chart2.update();
	
}

var sub_m = function(){
	chart2.destroy();
	sub_chart();
}


var sub_q = function(){
	chart2.destroy();
	var ctx2 = document.getElementById('subscribe_chart').getContext('2d');
    chart2 = new Chart(ctx2, {
       // The type of chart we want to create
       type: 'line',
       // The data for our dataset
       data: {
           labels: ['1분기','2분기', '3분기', '4분기'],
           datasets: [{
               label: '구독 수익',
               data: [0, 10, 5, 2],
               borderColor: 'rgba(0, 188, 212, 0.75)',
               backgroundColor: 'rgba(0, 188, 212, 0.3)',
               pointBorderColor: 'rgba(0, 188, 212, 0)',
               pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
               pointBorderWidth: 1
           }, {
               label: "구독 누적 수익",
               data: [12, 10, 5, 2],
               borderColor: 'rgba(233, 30, 99, 0.75)',
               backgroundColor: 'rgba(233, 30, 99, 0.3)',
               pointBorderColor: 'rgba(233, 30, 99, 0)',
               pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
               pointBorderWidth: 1
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
}

var chart3;
var total_chart = function(){
	
	var ctx3 = document.getElementById('total_chart').getContext('2d');
    chart3 = new Chart(ctx3, {
       // The type of chart we want to create
       type: 'line',

       // The data for our dataset
       data: {
           labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월','8월','9월','10월','11월','12월'],
           datasets: [{
               label: '총 수익',
               data: [0, 0, 0, 0, 0, 0, 0,0,0,0,0,0],
               borderColor: 'rgba(0, 188, 212, 0.75)',
               backgroundColor: 'rgba(0, 188, 212, 0.3)',
               pointBorderColor: 'rgba(0, 188, 212, 0)',
               pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
               pointBorderWidth: 1
           }, {
               label: "누적 총 수익",
               data: [0, 0, 0, 0, 0, 0, 0,0,0,0,0,0],
               borderColor: 'rgba(233, 30, 99, 0.75)',
               backgroundColor: 'rgba(233, 30, 99, 0.3)',
               pointBorderColor: 'rgba(233, 30, 99, 0)',
               pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
               pointBorderWidth: 1
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
    
   for(var i=0; i<12;i++){
	   var tp = chart2.data.datasets[0].data[i] + chart.data.datasets[0].data[i]
	   chart3.data.datasets[0].data[i] = tp;
	   var tp2 = chart2.data.datasets[1].data[i] + chart.data.datasets[1].data[i]
	   chart3.data.datasets[1].data[i] = tp2;
   }
   
   chart3.update();   
	
}

var tot_m = function(){
	chart3.destroy();
	total_chart();
}


var tot_y = function(){
	chart3.destroy();
	var ctx3 = document.getElementById('total_chart').getContext('2d');
    chart3 = new Chart(ctx3, {
       // The type of chart we want to create
       type: 'line',

       // The data for our dataset
       data: {
           labels: ['1분기', '2분기', '3분기', '4분기'],
           datasets: [{
               label: '총 수익',
               data: [0, 10, 5, 2],
               borderColor: 'rgba(0, 188, 212, 0.75)',
               backgroundColor: 'rgba(0, 188, 212, 0.3)',
               pointBorderColor: 'rgba(0, 188, 212, 0)',
               pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
               pointBorderWidth: 1
           }, {
               label: "누적 총 수익",
               data: [28, 48, 40, 13],
               borderColor: 'rgba(233, 30, 99, 0.75)',
               backgroundColor: 'rgba(233, 30, 99, 0.3)',
               pointBorderColor: 'rgba(233, 30, 99, 0)',
               pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
               pointBorderWidth: 1
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
}

var myPieChart;
var percent_chart = function(){
	var ctx4 = document.getElementById('percent_chart').getContext('2d');
    myPieChart = new Chart(ctx4, {
       type: 'pie',
       data: {
           datasets: [{
               data: [0 , 0],
               backgroundColor: [
                   "rgb(233, 30, 99)",
                   "rgb(255, 193, 7)",
                   "rgb(0, 188, 212)",
                   "rgb(139, 195, 74)"
               ],
           }],
           labels: [
               "구독 수익",
               "도네 수익"
           ]
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
    
   myPieChart.data.datasets[0].data[0] =chart2.data.datasets[1].data[11]
   myPieChart.data.datasets[0].data[1] =chart.data.datasets[1].data[11]
   myPieChart.update();
	
}

var per_m = function(){
	myPieChart.destroy();
	percent_cahrt();
}

var per_y = function(){
	myPieChart.destroy();
	var ctx4 = document.getElementById('percent_chart').getContext('2d');
    myPieChart = new Chart(ctx4, {
       type: 'pie',
       data: {
           datasets: [{
               data: [10, 20, 50, 40],
               backgroundColor: [
                   "rgb(233, 30, 99)",
                   "rgb(255, 193, 7)",
                   "rgb(0, 188, 212)",
                   "rgb(139, 195, 74)"
               ],
           }],
           labels: [
               "Pink",
               "Amber",
               "Cyan",
               "Light Green"
           ]
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
}

var ad_chart = function(){
	
    var ctx5 = document.getElementById('advertise_chart').getContext('2d');
    var myBarChart = new Chart(ctx5, {
        type: 'bar',
        data: {
            labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월','8월','9월','10월','11월','12월'],
            datasets: [{
                data: [0,0, 0, 0, 0, 0, 0,0,0,0,0,0],
                fill: false,
                label: "월별 결제된 금액",
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
    
    var tot_array =[];
    var tot_p=0;
    <c:forEach items="${pay}" var="i" varStatus="j">
    var k = Number(${i.month})-1;
    myBarChart.data.datasets[0].data[k] =${i.profit}
    </c:forEach>

    myBarChart.update();
    
}

donation_chart();
sub_chart();
total_chart();
percent_chart();
ad_chart();

</script>



</html>