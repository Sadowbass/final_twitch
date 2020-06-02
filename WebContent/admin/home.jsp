<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.1.0/material.min.css" rel="stylesheet"/>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.material.min.css" rel="stylesheet"/>
    <link href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css" rel="stylesheet"/>
</head>
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
                                <div class="col-xs-12 col-sm-6 align-right">
                                    <div class="switch panel-switch-btn">
                                        <span class="m-r-10 font-12">REAL TIME</span>
                                        <label>OFF<input type="checkbox" id="realtime" checked><span
                                                class="lever switch-col-cyan"></span>ON</label>
                                    </div>
                                </div>
                            </div>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown"
                                        role="button" aria-haspopup="true" aria-expanded="false">
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
                        <div class="body table-responsive">
                            <table class="table table-condensed">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>스트리머 아이디</th>
                                        <th>카테고리</th>
                                        <th>시청자 수</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${onair}" end="5" var="i" varStatus="j">
	                                    <tr>
	                                        <th scope="row">${j.count}</th>
	                                        <td>${i.air_mid}</td>
	                                        <td>${i.air_gname}</td>
	                                        <td>${i.cnt}</td>
	                                    </tr>
                                	</c:forEach>
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
                        <div class="body table-responsive">
                            <table class="table table-condensed">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>카테고리</th>
                                        <th>방송중인 스트리머 수</th>
                                        <th>시청자 수</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach begin="1" end="5" var="i">
	                                    <tr>
	                                        <th scope="row">${i }</th>
	                                        <td>legue of legend</td>
	                                        <td>10</td>
	                                        <td>30000</td>
	                                    </tr>
                                	</c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- #END# Latest Social Trends -->

            </div>

            <div class="row clearfix today_hot_goods">
                <!-- Task Info -->
                <div class="col-xs-12 col-sm-12  col-lg-8 hot_cate">
           <div class="card hot1">
                        <div class="header">
                            <h2>오늘의 인기 상품</h2>
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
                               <div class="body table-responsive">
                            <table class="table table-condensed table-bordered">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th style="width:10%">상품이미지</th>
                                        <th>상품번호</th>
                                		<th>상품명</th>
                                		<th>재고</th>
                                		<th>등록일</th>
                                		<th>가격</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach begin="1" end="5" var="i">
	                                    <tr>
	                                        <th scope="row">${i }</th>
	                                        <td><img src="images/goods.jpg" class="main_goods_img"></td>
	                                        <td>1233454-232131254</td>
	                                    	<td> DIATEC 필코 마제스터치 컨버터블2 크림치즈 한글</td>
	                                    	<td>61</td>
	                                    	<td>2011/04/25</td>
	                                    	<td>$320,800</td>
	                                    	</tr>
                                	</c:forEach>
                                </tbody>
                            </table>
                        </div>
                     
                    </div>
                </div>
                <!-- #END# Task Info -->
                <!-- Browser Usage -->
                <div class="col-xs-12 col-sm-12  col-lg-4 hot_cate">
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
                </div>
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
        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
        datasets: [{
            label: '트위치 메인 페이지 수익',
            data: [40, 70, 20, 50, 20, 30, 45],
            borderColor: 'rgba(102, 102, 153, 0.75)',
            backgroundColor: 'rgba(102, 102, 153, 0.3)',
            pointBorderColor: 'rgba(102, 102, 153, 0)',
            pointBackgroundColor: 'rgba(102, 102, 153, 0.9)',
            pointBorderWidth: 1
        },{
        	 label: "쇼핑몰 페이지 수익",
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


	$(document).ready(function(){
		
		$('.today_hot_goods').each(function(){
			
			var highestBox = 0;
			
			$('.hot1', this).each(function(){
				if($(this).height() > highestBox) highestBox = $(this).height();
			});
		
			$('.hot1',this).height(highestBox);

		});
		
		<%if(session.getAttribute("start") == null){ %>
		  start();
		<%
		}%>
		<%session.removeAttribute("start");%>
		});
	
	
	
let start = function(){
	location.href = "home.he"
}



</script>