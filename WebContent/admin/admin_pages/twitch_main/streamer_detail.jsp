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
    <link href="css/member.css" rel="stylesheet">
     <!-- Sweet Alert Css -->
    <link href="plugins/sweetalert/sweetalert.css" rel="stylesheet" />

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
                	 <form name="he_form" id="he_form" method="post">
                	 <div class="row clearfix">
                                <div class="col-xs-12">
                                  <c:if test="${empty vo.ph_sysfile}">
                                   <img src="images/user.png" class="img-circle member_img" id="member_img" name="member_img">
                    			</c:if>
                    			<c:if test="${not empty vo.ph_sysfile}">
                      			 <img src="../img/user-photo/${vo.ph_sysfile }" class="img-circle member_img" id="member_img" name="member_img">
                   				</c:if>
                                    <div class="js-sweetalert broadstop_btn" id="broadstop">
                                   
                                    </div>
                                </div>
                            </div>
                	<div class="row">
                		<div class="col-xs-6">
		                    <label class="str_profile_label">아이디</label>
		                    <input type="text" class="form-control streamer_profile" value="${vo.mem_id }" name="he_serial">
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
                	</form>
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
                                <li><a href="javascript:void(0);" onclick="week_chart('${bt[0]}','${bt[1]}','${bt[2]}','${bt[3]}','${bt[4]}','${bt[5]}','${bt[6]}')">주별</a></li>
                                <li><a href="javascript:void(0);" onclick="month_chart('${bt2[0]}','${bt2[1]}','${bt2[2]}','${bt2[3]}','${bt2[4]}','${bt2[5]}','${bt2[6]}','${bt2[7]}','${bt2[8]}','${bt2[9]}','${bt2[10]}','${bt2[11]}')">월별</a></li>
                                <li><a href="javascript:void(0);" onclick="year_chart('${bt3[0]}','${bt3[1]}','${bt3[2]}','${bt3[3]}','${bt3[4]}','${bt3[5]}','${bt3[6]}','${bt3[7]}','${bt3[8]}','${bt3[9]}')">연도별</a></li>
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
                    <h2>구독자 수</h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);" onclick="week_chart2('${cnt2[0]}', '${cnt2[1]}', '${cnt2[2]}', '${cnt2[3]}', '${cnt2[4]}', '${cnt2[5]}', '${cnt2[6]}',
                                                                                         '${tot_cnt2[0]}', '${tot_cnt2[1]}', '${tot_cnt2[2]}', '${tot_cnt2[3]}', '${tot_cnt2[4]}', '${tot_cnt2[5]}', '${tot_cnt2[6]}')">주별</a></li>
                                <li><a href="javascript:void(0);" onclick="month_chart2('${m_cnt2[0]}', '${m_cnt2[1]}', '${m_cnt2[2]}', '${m_cnt2[3]}', '${m_cnt2[4]}', '${m_cnt2[5]}', '${m_cnt2[6]}','${m_cnt2[7]}','${m_cnt2[8]}','${m_cnt2[9]}','${m_cnt2[10]}','${m_cnt2[11]}',
                                                                                     '${t_m_cnt2[0]}', '${t_m_cnt2[1]}', '${t_m_cnt2[2]}', '${t_m_cnt2[3]}', '${t_m_cnt2[4]}', '${t_m_cnt2[5]}', '${t_m_cnt2[6]}','${t_m_cnt2[7]}','${t_m_cnt2[8]}','${t_m_cnt2[9]}','${t_m_cnt2[10]}','${t_m_cnt2[11]}')">월별</a></li>
                                <li><a href="javascript:void(0);" onclick="year_chart2('${y_cnt2[0]}', '${y_cnt2[1]}', '${y_cnt2[2]}', '${y_cnt2[3]}', '${y_cnt2[4]}', '${y_cnt2[5]}', '${y_cnt2[6]}','${y_cnt2[7]}','${y_cnt2[8]}','${y_cnt2[9]}',
                                                                                        '${t_y_cnt2[0]}', '${t_y_cnt2[1]}', '${t_y_cnt2[2]}', '${t_y_cnt2[3]}', '${t_y_cnt2[4]}', '${t_y_cnt2[5]}', '${t_y_cnt2[6]}','${t_y_cnt2[7]}','${t_y_cnt2[8]}','${t_y_cnt2[9]}')">연도별</a></li>
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
                    <h2>팔로우 수</h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);" onclick="week_chart5('${cnt[0]}', '${cnt[1]}', '${cnt[2]}', '${cnt[3]}', '${cnt[4]}', '${cnt[5]}', '${cnt[6]}',
                                                                            '${tot_cnt[0]}', '${tot_cnt[1]}', '${tot_cnt[2]}', '${tot_cnt[3]}', '${tot_cnt[4]}', '${tot_cnt[5]}', '${tot_cnt[6]}')">주별</a></li>
                                <li><a href="javascript:void(0);" onclick="month_chart5('${m_cnt[0]}', '${m_cnt[1]}', '${m_cnt[2]}', '${m_cnt[3]}', '${m_cnt[4]}', '${m_cnt[5]}', '${m_cnt[6]}','${m_cnt[7]}','${m_cnt[8]}','${m_cnt[9]}','${m_cnt[10]}','${m_cnt[11]}',
                                                                                 '${t_m_cnt[0]}', '${t_m_cnt[1]}', '${t_m_cnt[2]}', '${t_m_cnt[3]}', '${t_m_cnt[4]}', '${t_m_cnt[5]}', '${t_m_cnt[6]}','${t_m_cnt[7]}','${t_m_cnt[8]}','${t_m_cnt[9]}','${t_m_cnt[10]}','${t_m_cnt[11]}')">월별</a></li>
                                <li><a href="javascript:void(0);" onclick="year_chart5('${y_cnt[0]}', '${y_cnt[1]}', '${y_cnt[2]}', '${y_cnt[3]}', '${y_cnt[4]}', '${y_cnt[5]}', '${y_cnt[6]}','${y_cnt[7]}','${y_cnt[8]}','${y_cnt[9]}',
                                                                                    '${t_y_cnt[0]}', '${t_y_cnt[1]}', '${t_y_cnt[2]}', '${t_y_cnt[3]}', '${t_y_cnt[4]}', '${t_y_cnt[5]}', '${t_y_cnt[6]}','${t_y_cnt[7]}','${t_y_cnt[8]}','${t_y_cnt[9]}')">연도별</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="body">
                    <canvas id="follow_chart" height="150"></canvas>
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
    
    <div class="row clearfix">
    	 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
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
                                <li><a href="javascript:void(0);" onclick="week_chart3('${don}','${sub}')">주별</a></li>
                                <li><a href="javascript:void(0);" onclick="month_chart3('${m_don}','${m_sub}')">월별</a></li>
                                <li><a href="javascript:void(0);" onclick="year_chart3('${y_don}','${y_sub}')">연도별</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="body">
                    <canvas id="radar_chart" height="100"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>




<!-- Chart Plugins Js -->
<script src="plugins/chartjs/Chart.bundle.js"></script>
<!-- Sweet Alert Plugin Js -->
<script src="plugins/sweetalert/sweetalert.min.js"></script>

<!-- Custom Js -->
<script src="js/stream.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.26.0/moment.min.js"></script>
<script>
//console.log(moment().day(0)._d);//이번주 일욜
//console.log(moment().day(0)._d.add(7,"days"))//이번주 토욜?
//console.log(moment().subtract(7, 'days'));
//console.log(moment().day(-7)._d);
//console.log(moment().day(-14)._d);
//console.log(moment().day(-21)._d);

var ctx1 = document.getElementById('week_chart').getContext('2d')
var chart = new Chart(ctx1,{
	// The type of chart we want to create
    type: 'line',
    // The data for our dataset
    data: {
        labels: ['일','월', '화', '수', '목', '금', '토'],
        datasets: [{
            label: '방송 시간',
            data: [${bt[0]}, ${bt[1]}, ${bt[2]}, ${bt[3]}, ${bt[4]}, ${bt[5]}, ${bt[6]}],
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
	 type: 'line',
     data: {
    	 labels: ['일','월', '화', '수', '목', '금', '토'],
         datasets: [{
             label: "새 구독자 수 ",
             data: [${cnt2[0]}, ${cnt2[1]}, ${cnt2[2]}, ${cnt2[3]}, ${cnt2[4]}, ${cnt2[5]}, ${cnt2[6]}],
             borderColor: 'rgba(0, 188, 212, 0.75)',
             backgroundColor: 'rgba(0, 188, 212, 0.3)',
             pointBorderColor: 'rgba(0, 188, 212, 0)',
             pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
             pointBorderWidth: 1
         }, {
                 label: "누적 구독자 수",
                 data: [${tot_cnt2[0]}, ${tot_cnt2[1]}, ${tot_cnt2[2]}, ${tot_cnt2[3]}, ${tot_cnt2[4]}, ${tot_cnt2[5]}, ${tot_cnt2[6]}],
                 borderColor: 'rgba(233, 30, 99, 0.75)',
                 backgroundColor: 'rgba(233, 30, 99, 0.3)',
                 pointBorderColor: 'rgba(233, 30, 99, 0)',
                 pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
                 pointBorderWidth: 1
             }]
     },
     options: {
         responsive: true,
         
     }
}); 

var ctx6 = document.getElementById('follow_chart').getContext('2d')

var chart6 = new Chart(ctx6,{
	 type: 'line',
     data: {
    	 labels: ['일','월', '화', '수', '목', '금', '토'],
         datasets: [{
             label: "새 팔로우 수 ",
             data: [${cnt[0]}, ${cnt[1]}, ${cnt[2]}, ${cnt[3]}, ${cnt[4]}, ${cnt[5]}, ${cnt[6]}],
             borderColor: 'rgba(0, 188, 212, 0.75)',
             backgroundColor: 'rgba(0, 188, 212, 0.3)',
             pointBorderColor: 'rgba(0, 188, 212, 0)',
             pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
             pointBorderWidth: 1
         }, {
                 label: "누적 팔로우 수",
                 data: [${tot_cnt[0]}, ${tot_cnt[1]}, ${tot_cnt[2]}, ${tot_cnt[3]}, ${tot_cnt[4]}, ${tot_cnt[5]}, ${tot_cnt[6]}],
                 borderColor: 'rgba(233, 30, 99, 0.75)',
                 backgroundColor: 'rgba(233, 30, 99, 0.3)',
                 pointBorderColor: 'rgba(233, 30, 99, 0)',
                 pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
                 pointBorderWidth: 1
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
	        labels: ['일', '월', '화', '수', '목', '금', '토'],
	        datasets: [{
	            label: '구독 수익',
	            data: [${sub[0]}, ${sub[1]}, ${sub[2]}, ${sub[3]}, ${sub[4]}, ${sub[5]}, ${sub[6]}],
	            borderColor: 'rgba(102, 102, 153, 0.75)',
	            backgroundColor: 'rgba(102, 102, 153, 0.3)',
	            pointBorderColor: 'rgba(102, 102, 153, 0)',
	            pointBackgroundColor: 'rgba(102, 102, 153, 0.9)',
	            pointBorderWidth: 1
	        },{
	        	 label: "도네 수익",
	             data: [${don[0]}, ${don[1]}, ${don[2]}, ${don[3]}, ${don[4]}, ${don[5]}, ${don[6]}],
	             borderColor: 'rgba(233, 30, 99, 0.75)',
	             backgroundColor: 'rgba(233, 30, 99, 0.3)',
	             pointBorderColor: 'rgba(233, 30, 99, 0)',
	             pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
	             pointBorderWidth: 1
	        },{
	            label: '총 수익',
	            data: [${don[0]}+${sub[0]},${don[1]}+${sub[1]}, ${don[2]}+${sub[2]}, ${don[3]}+${sub[3]}, ${don[4]}+${sub[4]}, ${don[5]}+${sub[5]}, ${don[6]}+${sub[6]}],
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
             data: [100],
             backgroundColor: [
                 "rgb(233, 30, 99)",
                 "rgb(255, 193, 7)",
                 "rgb(0, 188, 212)",
                 "rgb(139, 195, 74)"
             ],
         }],
         labels: [
          	"null"
         ]
     },
     options: {
         responsive: true,
     }
});


<c:forEach items="${g_cate}" var="i" varStatus="j">
chart5.data.datasets[0].data[${j.index}] =${i.cnt}
chart5.data.labels[${j.index}] ='${i.gamename}'
</c:forEach>
chart5.update();



if(${isban}>0){
	let str = '<button type="button" class="btn waves-effect" onclick="broad_ok('+'\'${vo.mem_id}\''+')">'
	+'<i class="material-icons">autorenew</i>'
    +'<span>방송 이용 정지 해제</span>'
    +'</button>'
	$("#broadstop").html(str);
}else{
	let str2 = '<button type="button" class="btn waves-effect" onclick="broad_stop('+'\'${vo.mem_id}\''+')">'
	+'<i class="material-icons">block</i>'
    +'<span>방송 이용 정지</span>'
    +'</button>'
    $("#broadstop").html(str2);
}

let month_chart4= function(){
	chart5.destroy();
	var ctx2 = document.getElementById('pie_chart').getContext('2d');
	 chart5 = new Chart(ctx2, {
	    // The type of chart we want to create
	    type: 'pie',
	    // The data for our dataset
	    data: {
	         datasets: [{
	             data: [0],
	             backgroundColor: [
	                 "rgb(233, 30, 99)",
	                 "rgb(255, 193, 7)",
	                 "rgb(0, 188, 212)",
	                 "rgb(139, 195, 74)"
	             ],
	         }],
	         labels: [
	             "null"
	      
	         ]
	     },
	     options: {
	         responsive: true,
	         
	     }
	});
	 

	 <c:forEach items="${gm}" var="i" varStatus="j">
	 chart5.data.datasets[0].data[${j.index}] =${i.cnt}
	 chart5.data.labels[${j.index}] ='${i.gamename}'
	 </c:forEach>
	 chart5.update();
	
	
}


let week_chart4= function(g){
	chart5.destroy();
	var ctx2 = document.getElementById('pie_chart').getContext('2d');
	 chart5 = new Chart(ctx2, {
	    // The type of chart we want to create
	    type: 'pie',
	    // The data for our dataset
	    data: {
	         datasets: [{
	        	 data: [0],
	             backgroundColor: [
	                 "rgb(233, 30, 99)",
	                 "rgb(255, 193, 7)",
	                 "rgb(0, 188, 212)",
	                 "rgb(139, 195, 74)"
	             ],
	         }],
	         labels: [
	             "null",
	         ]
	     },
	     options: {
	         responsive: true,
	         
	     }
	});
	 
	 <c:forEach items="${g_cate}" var="i" varStatus="j">
	 chart5.data.datasets[0].data[${j.index}] =${i.cnt}
	 chart5.data.labels[${j.index}] ='${i.gamename}'
	 </c:forEach>
	 chart5.update();
	
}

let year_chart4= function(){
	chart5.destroy();
	var ctx2 = document.getElementById('pie_chart').getContext('2d');
	 chart5 = new Chart(ctx2, {
	    // The type of chart we want to create
	    type: 'pie',
	    // The data for our dataset
	    data: {
	         datasets: [{
	        	 data: [0],
	             backgroundColor: [
	                 "rgb(233, 30, 99)",
	                 "rgb(255, 193, 7)",
	                 "rgb(0, 188, 212)",
	                 "rgb(139, 195, 74)"
	             ],
	         }],
	         labels: [
	             "null"
	    
	         ]
	     },
	     options: {
	         responsive: true,
	         
	     }
	});
	 
	 <c:forEach items="${gy}" var="i" varStatus="j">
	 chart5.data.datasets[0].data[${j.index}] =${i.cnt}
	 chart5.data.labels[${j.index}] ='${i.gamename}'
	 </c:forEach>
	 chart5.update();
	
}

</script>

</body>

</html>