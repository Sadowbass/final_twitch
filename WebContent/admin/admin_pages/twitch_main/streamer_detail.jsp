<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link href="css/member.css" rel="stylesheet">
</head>
<div class="container-fluid">
    <div class="block-header">
        <h2>
            스트리머 상세 정보
        </h2>
    </div>
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>스트리머 프로필</h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">
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
                	 <div class="row clearfix">
                                <div class="col-xs-12">
                                    <img src="../img/user-photo/${vo.ph_sysfile }" class="img-circle member_img" id="member_img" name="member_img">
                                </div>
                            </div>
                	<div class="row">
                		<div class="col-xs-6">
		                    <label class="str_profile_label">아이디</label>
		                    <input type="text" class="form-control streamer_profile" value="${vo.mem_id }">
                		</div>
                		<div class="col-xs-6">
		                    <label class="str_profile_label">이름</label>
		                    <input type="text" class="form-control streamer_profile" value="${vo.mem_name }">
                		</div>
                	
                	</div>
                	<div class="row">
                		<div class="col-xs-6">
		                    <label class="str_profile_label">이메일</label>
		                    <input type="text" class="form-control streamer_profile" value="${vo.mem_email }">
                		</div>
                		<div class="col-xs-6">
		                    <label class="str_profile_label">현재상태</label>
		                    <input type="text" class="form-control streamer_profile" value="${vo.mem_status }">
                		</div>
                	</div>
                	<div class="row">
                		<div class="col-xs-4">
                			<label class="str_profile_label">팔로워 수</label>
		                    <input type="text" class="form-control streamer_profile" value="${vo.cnt }">
                		</div>
                		<div class="col-xs-4">
                			<label class="str_profile_label">구독자 수</label>
		                    <input type="text" class="form-control streamer_profile" value="${vo.cnt2 }">
                		</div>
                		<div class="col-xs-4">
                			<label class="str_profile_label">평균 시청자수</label>
		                    <input type="text" class="form-control streamer_profile" placeholder="">
                		</div>
                	</div>
                	<div class="row">
                		<div class="col-xs-4">
                			<label class="str_profile_label">총 구독 수익</label>
		                    <input type="text" class="form-control streamer_profile" value="${vo.sub_profit }">
                		</div>
                		<div class="col-xs-4">
                			<label class="str_profile_label">총 도네 수익</label>
		                    <input type="text" class="form-control streamer_profile" value="${vo.don_profit }">
                		</div>
                		<div class="col-xs-4">
                			<label class="str_profile_label">총 수익</label>
		                    <input type="text" class="form-control streamer_profile" placeholder="${vo.profit }">
                		</div>
                	</div>
                </div>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <!-- Line Chart -->
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>방송시간 </h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);" onclick="week_chart()">주별</a></li>
                                <li><a href="javascript:void(0);" onclick="month_chart()">월별</a></li>
                                <li><a href="javascript:void(0);" onclick="year_chart()">연도별</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="body" id="broad_time">
                    <canvas id="week_chart" height="150"></canvas>
                </div>
            </div>
        </div>
        <!-- #END# Line Chart -->
        <!-- Bar Chart -->
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>구독자 수·팔로워 수</h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);" onclick="week_chart2()">주별</a></li>
                                <li><a href="javascript:void(0);" onclick="month_chart2()">월별</a></li>
                                <li><a href="javascript:void(0);" onclick="year_chart2()">연도별</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="body">
                    <canvas id="bar_chart" height="150"></canvas>
                </div>
            </div>
        </div>
        <!-- #END# Bar Chart -->
    </div>

    <div class="row clearfix">
        <!-- Radar Chart -->
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>도네이션·구독 수익</h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);" onclick="week_chart3()">주별</a></li>
                                <li><a href="javascript:void(0);" onclick="month_chart3()">월별</a></li>
                                <li><a href="javascript:void(0);" onclick="year_chart3()">연도별</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="body">
                    <canvas id="radar_chart" height="150"></canvas>
                </div>
            </div>
        </div>
        <!-- #END# Radar Chart -->
        <!-- Pie Chart -->
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>자주하는 카테고리</h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);" onclick="week_chart4()">주별</a></li>
                                <li><a href="javascript:void(0);" onclick="month_chart4()">월별</a></li>
                                <li><a href="javascript:void(0);" onclick="year_chart4()">연도별</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="body">
                    <canvas id="pie_chart" height="150"></canvas>
                </div>
            </div>
        </div>
        <!-- #END# Pie Chart -->
    </div>
</div>



<!-- Chart Plugins Js -->
<script src="plugins/chartjs/Chart.bundle.js"></script>

<!-- Custom Js -->
<script src="js/stream.js"></script>
<script>

var ctx1 = document.getElementById('week_chart').getContext('2d')
var chart = new Chart(ctx1,{
	// The type of chart we want to create
    type: 'line',
    // The data for our dataset
    data: {
        labels: ['일','월', '화', '수', '목', '금', '토'],
        datasets: [{
            label: '방송 시간',
            data: [0, 10, 5, 2, 20, 30, 45],
            borderColor: 'rgba(0, 188, 212, 0.75)',
			backgroundColor: 'rgba(0, 188, 212, 0.3)',
			pointBorderColor: 'rgba(0, 188, 212, 0)',
			pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
			pointBorderWidth: 1
        }]
    },
    options: {
        responsive: true,
        legend: false
    }
}); 

var ctx3 = document.getElementById('bar_chart').getContext('2d')
var chart3 = new Chart(ctx3,{
	 type: 'bar',
     data: {
         labels: ["January", "February", "March", "April", "May", "June", "July"],
         datasets: [{
             label: "구독자 수 ",
             data: [65, 59, 80, 81, 56, 55, 40],
             backgroundColor: 'rgba(0, 188, 212, 0.8)'
         }, {
                 label: "팔로워 수",
                 data: [28, 48, 40, 19, 86, 27, 90],
                 backgroundColor: 'rgba(233, 30, 99, 0.8)'
             }]
     },
     options: {
         responsive: true,
         
     }
}); 

var ctx4 = document.getElementById('radar_chart').getContext('2d')
var chart4 = new Chart(ctx4,{
	 type: 'line',

	    // The data for our dataset
	    data: {
	        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
	        datasets: [{
	            label: '구독 수익',
	            data: [40, 70, 20, 50, 20, 30, 45],
	            borderColor: 'rgba(102, 102, 153, 0.75)',
	            backgroundColor: 'rgba(102, 102, 153, 0.3)',
	            pointBorderColor: 'rgba(102, 102, 153, 0)',
	            pointBackgroundColor: 'rgba(102, 102, 153, 0.9)',
	            pointBorderWidth: 1
	        },{
	        	 label: "도네 수익",
	             data: [28, 48, 40, 19, 86, 27, 90],
	             borderColor: 'rgba(233, 30, 99, 0.75)',
	             backgroundColor: 'rgba(233, 30, 99, 0.3)',
	             pointBorderColor: 'rgba(233, 30, 99, 0)',
	             pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
	             pointBorderWidth: 1
	        },{
	            label: '총 수익',
	            data: [68, 118, 60, 69, 116, 57, 135],
	            borderColor: 'rgba(204, 000, 204, 0.75)',
	            backgroundColor: 'rgba(204, 000, 204, 0.3)',
	            pointBorderColor: 'rgba(204, 000, 204, 0)',
	            pointBackgroundColor: 'rgba(204, 000, 204, 0.9)',
	            pointBorderWidth: 1
	        }]
	    },
	    options: {
	    	responsive: true,
	    
	    }
}); 

var ctx5 = document.getElementById('pie_chart').getContext('2d')
var chart5 = new Chart(ctx5,{
	 type: 'pie',
     data: {
         datasets: [{
             data: [225, 50, 100, 40],
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

</script>

</body>

</html>