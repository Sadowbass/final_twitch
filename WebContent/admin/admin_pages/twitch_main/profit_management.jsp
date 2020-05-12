<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%request.setCharacterEncoding("utf-8"); %>
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
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">주간 수익</a></li>
                                        <li><a href="javascript:void(0);">월간 수익</a></li>
                                        <li><a href="javascript:void(0);">분기별 수익</a></li>
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
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">주간 수익</a></li>
                                        <li><a href="javascript:void(0);">월간 수익</a></li>
                                        <li><a href="javascript:void(0);">분기별 수익</a></li>
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
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
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
                                        <th>#</th>
                                        <th>FIRST NAME</th>
                                        <th>LAST NAME</th>
                                        <th>USERNAME</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Larry</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">4</th>
                                        <td>Larry</td>
                                        <td>Jellybean</td>
                                        <td>@lajelly</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">5</th>
                                        <td>Larry</td>
                                        <td>Kikat</td>
                                        <td>@lakitkat</td>
                                    </tr>
                         
                                </tbody>
                            </table>
                        </div>
                        </div>
                    </div>
                </div>
                <!-- #END# 도네 수익 랭킹 -->
                <!-- 구독랭킹-->
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>구독 랭킹</h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
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
                                        <th>#</th>
                                        <th>FIRST NAME</th>
                                        <th>LAST NAME</th>
                                        <th>USERNAME</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Larry</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">4</th>
                                        <td>Larry</td>
                                        <td>Jellybean</td>
                                        <td>@lajelly</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">5</th>
                                        <td>Larry</td>
                                        <td>Kikat</td>
                                        <td>@lakitkat</td>
                                    </tr>
                         
                                </tbody>
                            </table>
                        </div>
                        </div>
                    </div>
                </div>
                <!-- #END# 구독 랭킹-->
            </div>
                <div class="row clearfix">
                <!-- 도네 Chart -->
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>수익 구조</h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">주간 수익</a></li>
                                        <li><a href="javascript:void(0);">월간 수익</a></li>
                                        <li><a href="javascript:void(0);">분기별 수익</a></li>
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
                            <h2>광고 수익</h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">주간 수익</a></li>
                                        <li><a href="javascript:void(0);">월간 수익</a></li>
                                        <li><a href="javascript:void(0);">분기별 수익</a></li>
                                    </ul>
                                </li>
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
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">Action</a></li>
                                        <li><a href="javascript:void(0);">Another action</a></li>
                                        <li><a href="javascript:void(0);">Something else here</a></li>
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
	<script>
	   var ctx = document.getElementById('donation_chart').getContext('2d');
       var chart = new Chart(ctx, {
           // The type of chart we want to create
           type: 'line',

           // The data for our dataset
           data: {
               labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
               datasets: [{
                   label: 'My First dataset',
                   data: [0, 10, 5, 2, 20, 30, 45],
                   borderColor: 'rgba(0, 188, 212, 0.75)',
                   backgroundColor: 'rgba(0, 188, 212, 0.3)',
                   pointBorderColor: 'rgba(0, 188, 212, 0)',
                   pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
                   pointBorderWidth: 1
               },{
               	 label: "My Second dataset",
                    data: [28, 48, 40, 19, 86, 27, 90],
                    borderColor: 'rgba(233, 30, 99, 0.75)',
                    backgroundColor: 'rgba(233, 30, 99, 0.3)',
                    pointBorderColor: 'rgba(233, 30, 99, 0)',
                    pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
                    pointBorderWidth: 1
               }]
           },
           options: {
           	responsive: true,
               legend: false
           }
       });
       
       var ctx2 = document.getElementById('subscribe_chart').getContext('2d');
       var chart = new Chart(ctx2, {
           // The type of chart we want to create
           type: 'line',

           // The data for our dataset
           data: {
               labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
               datasets: [{
                   label: 'My First dataset',
                   data: [0, 10, 5, 2, 20, 30, 45],
                   borderColor: 'rgba(0, 188, 212, 0.75)',
                   backgroundColor: 'rgba(0, 188, 212, 0.3)',
                   pointBorderColor: 'rgba(0, 188, 212, 0)',
                   pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
                   pointBorderWidth: 1
               },{
               	 label: "My Second dataset",
                    data: [28, 48, 40, 19, 86, 27, 90],
                    borderColor: 'rgba(233, 30, 99, 0.75)',
                    backgroundColor: 'rgba(233, 30, 99, 0.3)',
                    pointBorderColor: 'rgba(233, 30, 99, 0)',
                    pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
                    pointBorderWidth: 1
               }]
           },
           options: {
           	responsive: true,
               legend: false
           }
       });
       
       var ctx3 = document.getElementById('total_chart').getContext('2d');
       var chart = new Chart(ctx3, {
           // The type of chart we want to create
           type: 'line',

           // The data for our dataset
           data: {
               labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
               datasets: [{
                   label: 'My First dataset',
                   data: [0, 10, 5, 2, 20, 30, 45],
                   borderColor: 'rgba(0, 188, 212, 0.75)',
                   backgroundColor: 'rgba(0, 188, 212, 0.3)',
                   pointBorderColor: 'rgba(0, 188, 212, 0)',
                   pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
                   pointBorderWidth: 1
               },{
               	 label: "My Second dataset",
                    data: [28, 48, 40, 19, 86, 27, 90],
                    borderColor: 'rgba(233, 30, 99, 0.75)',
                    backgroundColor: 'rgba(233, 30, 99, 0.3)',
                    pointBorderColor: 'rgba(233, 30, 99, 0)',
                    pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
                    pointBorderWidth: 1
               }]
           },
           options: {
           	responsive: true,
               legend: false
           }
       });
       
       var ctx4 = document.getElementById('percent_chart').getContext('2d');
       var myPieChart = new Chart(ctx4, {
           type: 'pie',
           data:  {
               datasets: [{
                   data: [10, 20, 60,10],
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
               
           }
           
       });
       
      var ctx5 = document.getElementById('advertise_chart').getContext('2d');
       var myBarChart = new Chart(ctx5, {
    	    type: 'horizontalBar',
    	    data: {
    	    	  labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
    	    	  datasets: [{
    	    	        data: [10, 20, 30, 40, 50, 60, 70],
    	    	  		fill:false,
    	    	  		label:"월별 광고 수익",
    	    	  		backgroundColor:["rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)"],
    	    	        borderColor:["rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)"],
    	    	        borderWidth:1
    	    	        
    	    	    }]
    	    },
    	    options: {
                responsive: true,
                scales:{
                	xAxes:[{
                		ticks:{
                			beginAtZero:true
                			}
                	}]
    	    	}
            }
    	});
	
	</script>
    


</html>
