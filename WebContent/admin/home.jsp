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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.1.0/material.min.css" rel="stylesheet"/>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.material.min.css" rel="stylesheet"/>
    <link href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css" rel="stylesheet"/>
</head>
<%
if(session.getAttribute("start") == null) {
%>
	    <script>location.href="home.he"</script>
<% 
}
session.removeAttribute("strat");

	
%>	
 <div class="container-fluid">
            <div class="block-header">
                <h2>DASHBOARD</h2>
            </div>

            <!-- Widgets -->
            <div class="row clearfix">
                <div class="new_count col-lg-3 col-md-6 col-sm-6 col-xs-12 ">
                    <div class="info-box hover-zoom-effect hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">live_tv</i>
                        </div>
                        <div class="content">
                            <div class="text">생방송 중인 채널</div>
                            <div class="number count-to" data-from="0" data-to="125" data-speed="15"
                                data-fresh-interval="20">${now[0] }</div>
                        </div>
                    </div>
                </div>
                <div class="new_count col-lg-3 col-md-6 col-sm-6 col-xs-12">
                    <div class="info-box  hover-zoom-effect hover-eㅈㄴxpand-effect">
                        <div class="icon">
                            <i class="material-icons">add_shopping_cart</i>
                        </div>
                        <div class="content">
                            <div class="text">오늘의 새로운 주문</div>
                            <div class="number count-to" data-from="0" data-to="257" data-speed="1000"
                                data-fresh-interval="20">${now[1] }</div>
                        </div>
                    </div>
                </div>
                <div class="new_count col-lg-3 col-md-6 col-sm-6 col-xs-12">
                    <div class="info-box hover-expand-effect hover-zoom-effect">
                        <div class="icon">
                            <i class="material-icons">forum</i>
                        </div>
                        <div class="content">
                            <div class="text">오늘의 새로운 리뷰</div>
                            <div class="number count-to" data-from="0" data-to="243" data-speed="1000"
                                data-fresh-interval="20">${now[2] }</div>
                        </div>
                    </div>
                </div>
                <div class="new_count col-lg-3 col-md-6 col-sm-6 col-xs-12">
                    <div class="info-box hover-expand-effect hover-zoom-effect">
                        <div class="icon">
                            <i class="material-icons">person_add</i>
                        </div>
                        <div class="content">
                            <div class="text">오늘의 새로운 회원</div>
                            <div class="number count-to" data-from="0" data-to="1225" data-speed="1000"
                                data-fresh-interval="20">${now[3] }</div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Widgets -->
            <!-- CPU Usage -->
            <div class="row clearfix">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="header">
                            <div class="row clearfix">
                                <div class="col-xs-12 col-sm-6">
                                    <h2>수익 현황 </h2>
                                </div>
                       
                            </div>
                    
                        </div>
                        <div class="body">
                            <canvas id="total_profit_chart" height="80"></canvas>
                        </div>
                    </div>
                </div>
            </div>
    
            <div class="row clearfix">
 
                <div class="home_table col-xs-12 col-sm-12 col-md-12 home_table col-lg-6">
                    
                    <div class="card">
                        <div class="header">
                            <h2>
                                많이 시청중인 방송 
                                <small>시청자수가 많은 방송 상위5</small>
                            </h2>
                        </div>
                        <div class="body table-responsive">
                            <table class="table table-condensed table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>스트리머 아이디</th>
                                        <th>카테고리</th>
                                        <th>시청자 수</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${onair}" end="4" var="i" varStatus="j">
	                                    <tr onclick= "broad_view('${i.air_mid}')">
	                                        <th scope="row">${j.count}</th>
	                                        <td>${i.air_mid}</td>
	                                        <td>${i.air_gname}</td>
	                                        <td>${i.cnt}</td>
	                                    </tr>
                                	</c:forEach>
                                <c:if test="${fn:length(onair) <5}">
                     			 <c:forEach  begin="1" end="${5-fn:length(onair)}" varStatus="j">
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
                    </div>
                </div>
  
                <!-- #END# Visitors -->
                <!-- Latest Social Trends -->
                <div class="col-xs-12 col-sm-12 col-md-12 home_table col-lg-6">
                      <div class="card">
                        <div class="header">
                            <h2>
                                많이 시청중인 카테고리 
                                <small>시청자수가 많은 카테고리 상위5</small>
                            </h2>
   
                        </div>
                        <div class="body table-responsive">
                            <table class="table table-condensed table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>카테고리</th>
                                        <th>방송중인 스트리머 수</th>
                                        <th>시청자 수</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${cate}" end="5" var="i" varStatus="j">
	                                    <tr>
	                                        <th scope="row">${j.count}</th>
	                                        <td>${i.air_gname}</td>
	                                        <td>${i.cnt2}</td>
	                                        <td>${i.cnt}</td>
	                                    </tr>
                                	</c:forEach>
                                <c:if test="${fn:length(cate) <5}">
                     			 <c:forEach  begin="1" end="${5-fn:length(cate)}" varStatus="j">
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
                    </div>
                </div>
                <!-- #END# Latest Social Trends -->

            </div>

            <div class="row clearfix today_hot_goods">
                <!-- Task Info -->
                <div class="col-xs-12 col-sm-12  col-lg-12 hot_cate">
           <div class="card hot1">
                        <div class="header">
                            <h2>오늘의 인기 상품</h2>
                        </div>
                               <div class="body table-responsive">
                            <table class="table table-condensed table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th style="width:10%">상품이미지</th>
                                        <th>상품번호</th>
                                		<th>상품명</th>
                                		<th>팔린 갯수</th>
                                		<th>카테고리</th>
                                		<th>가격</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${hit }" end="5" var="i" varStatus="j">
	                                    <tr onclick = "product_view('${i.product_id}')">
	                                        <th scope="row">${j.count }</th>
	                                        <td><img src="admin_pages/product_photo/${i.sysfile }" class="main_goods_img"></td>
	                                        <td>${i.product_id }</td>
	                                    	<td>${i.product_name }</td>
	                                    	<td>${i.cnt}</td>
	                                    	<td>${i.product_cate }</td>
	                                    	<td>${i.product_price }</td>
	                                    	</tr>
                                	</c:forEach>
                                </tbody>
                            </table>
                        </div>
                     
                    </div>
                </div>
                <form id="he_form" name="he_form" method="post">
                	<input type="hidden" id="productSerial" name="productSerial"/>
                </form>
                <!-- #END# Task Info -->
                <!-- Browser Usage -->
              <%--   <div class="col-xs-12 col-sm-12  col-lg-4 hot_cate">
                   <div class="card hot1">
                        <div class="header">
                            <h2>오늘의 인기 카테고리</h2>
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
                    
                    <c:forEach begin="1" end="5" var="i">
	                    <div class="info-box-3 bg-pink hover-zoom-effect home_box">
	                        <div class="icon">
	                            <i class="material-icons">email</i>
	                        </div>
	                        <div class="content home_box_content">
	                            <div class="number">${i}.</div>
	                            <div class="home_box_text">long pants</div>
	                        </div>
	                    </div>
                    </c:forEach>         
                    

               
                        </div>
                    </div>
                </div> --%>
                <!-- #END# Browser Usage -->
            </div>
        </div>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.material.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.flash.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.print.min.js"></script>        
<script>
var ctx = document.getElementById('total_profit_chart').getContext('2d');
var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'line',

    // The data for our dataset
    data: {
        labels: [getbefore(4), getbefore(3), getbefore(2), getbefore(1), getToday()],
        datasets: [{
            label: '트위치 메인 페이지 수익',
            data: [0, 0, 0, 0, 0],
            borderColor: 'rgba(102, 102, 153, 0.75)',
            backgroundColor: 'rgba(102, 102, 153, 0.3)',
            pointBorderColor: 'rgba(102, 102, 153, 0)',
            pointBackgroundColor: 'rgba(102, 102, 153, 0.9)',
            pointBorderWidth: 1
        },{
        	 label: "쇼핑몰 페이지 수익",
             data: [0, 0, 0, 0, 0],
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

<c:forEach items="${main}" var="i" varStatus="j">
 for(var i=0 ; i<5; i++){
	 if(chart.data.labels[i] == '${i.pay_date}'){
		 chart.data.datasets[1].data[i] = ${i.profit}
	 }
 }
</c:forEach>

<c:forEach items="${main2}" var="i" varStatus="j">
for(var i=0 ; i<5; i++){
	 if(chart.data.labels[i] == '${i.pay_date}'){
		 chart.data.datasets[0].data[i] = ${i.profit}
	 }
}
</c:forEach>

for(var i=0; i<5; i++){
	var total = chart.data.datasets[1].data[i]+chart.data.datasets[0].data[i];
	chart.data.datasets[2].data[i] = total;
}

chart.update();


	$(document).ready(function(){
		
		$('.today_hot_goods').each(function(){
			
			var highestBox = 0;
			
			$('.hot1', this).each(function(){
				if($(this).height() > highestBox) highestBox = $(this).height();
			});
		
			$('.hot1',this).height(highestBox);

		});
		
		});
	
function getToday(){//오늘날짜
	var date = new Date();
	return date.getFullYear() +"-" +("0"+(date.getMonth()+1)).slice(-2)+"-"+("0"+date.getDate()).slice(-2);
}

function getbefore(cnt){//전날짜
	var before = new Date(getToday());
	before.setDate(before.getDate()-Number(cnt));
	var df = new Date(before);
	
	var lday = df.getFullYear() +"-" +("0"+(df.getMonth()+1)).slice(-2)+"-"+("0"+df.getDate()).slice(-2);
	
	return lday
}
</script>