﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.1.0/material.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.material.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css" rel="stylesheet" />
    <link href="css/member.css" rel="stylesheet">
</head>


<div class="container-fluid">
    <div class="block-header">
        <h2>
           	 쇼핑몰 통계자료
        </h2>
    </div>
    <div class="row clearfix">
        <!-- Line Chart -->
        <div class="col-lg-12 col-md-6 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>매출</h2>
                    <!-- <ul class="header-dropdown m-r--5">
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
                    </ul> -->
                </div>
                <div class="body">
                    <canvas id="shop_profit_chart" height="100"></canvas>
                </div>
            </div>
        </div>
        <!-- #END# Line Chart -->
        <!-- Bar Chart -->
        <%-- <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>고객 성비</h2>
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
                    <canvas id="shop_gender_chart" height="150"></canvas>
                </div>
            </div>
        </div> --%>
        <!-- #END# Bar Chart -->
    </div>

    <div class="row clearfix">
        <!-- Radar Chart -->
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>고객 연령대 비율</h2>
                    <!-- <ul class="header-dropdown m-r--5">
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
                    </ul> -->
                </div>
                <div class="body">
                    <canvas id="shop_age_chart" height="150"></canvas>
                </div>
            </div>
        </div>
        <!-- #END# Radar Chart -->
        <!-- Pie Chart -->
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>카테고리별 판매비율</h2>
                    <!-- <ul class="header-dropdown m-r--5">
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
                    </ul> -->
                </div>
                <div class="body">
                    <canvas id="shop_cate_chart" height="150"></canvas>
                </div>
            </div>
        </div>
        <!-- #END# Pie Chart -->
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>가장 많이 팔린 상품</h2>
                    <!-- <ul class="header-dropdown m-r--5">
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
                    </ul> -->
                </div>
                <div class="body">
                    <div class="body table-responsive">
                        <table id="he_table" class="hover mdl-data-table member_table" style="width:100%">
                            <thead>
                                <tr>
                                    <th>순위</th>
                                    <th style="width:11% !important">제품이미지</th>
                                    <th>상품번호</th>
                                    <th>상품명</th>
                                    <th>판매량</th>
                                    <th>가격</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="i" items="${rankproductList }">
                                    <!-- 속성 list 값이 하나씩 vo에 들어옴 -->
                                    <tr onclick="member_view()">
                                        <td>${i.rank }</td>
                                        <td><img src="<%=request.getContextPath() %>/admin/admin_pages/product_photo/${i.sysfile}" class="goods_img" style="witdh : 60px;"></td>
                                        <td>${i.product_id }</td>
                                        <td>${i.product_name }</td>
                                        <td>${i.count }</td>
                                        <td>${i.product_price }원</td>

                                    </tr>
                                </c:forEach>


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Pie Chart -->

    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
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
    
    var amountMonth=[];
    var amountMonth2=[];
    <c:forEach var="item" items="${monthAmountList}">
    amountMonth.push("${item.amount}");
    amountMonth2.push("${item.order_date}")
    </c:forEach>
    
     var ageCount1=[];
     var ageCount2=[];
    <c:forEach var="item" items="${ageCountList}">

    	 <c:choose>
    		<c:when test='${item.age == 0}' >
				ageCount1.push("10대 미만");
			</c:when>
    		<c:when test='${item.age eq 10}'>
    			ageCount1.push("10대");
    		</c:when>
    		<c:when test ='${item.age eq 20}'>
    			ageCount1.push("20대");
    		</c:when>
    		<c:when test = '${item.age eq 30}'>
    			ageCount1.push("30대");
    		</c:when>
    		<c:when test = '${item.age eq 40}'>
				ageCount1.push("40대");
			</c:when>
			<c:when test = '${item.age eq 50}'>
				ageCount1.push("50대");
			</c:when>
			<c:when test = '${item.age eq 60}'>
				ageCount1.push("60대");
			</c:when>
			<c:when test = '${item.age eq 70}'>
				ageCount1.push("70대");
			</c:when>
			<c:when test = '${item.age eq 80}'>
				ageCount1.push("80대");
			</c:when>
    	</c:choose> 
    	ageCount2.push("${item.count}");
    </c:forEach> 
    
    var cateCount1=[];
    var cateCount2=[];
   <c:forEach var="item" items="${cateCountList}">
   cateCount1.push("${item.product_cate}");
   cateCount2.push("${item.count}");
   </c:forEach> 
	  
    
    
    var ctx = document.getElementById('shop_profit_chart').getContext('2d');
    
    var chart = new Chart(ctx, {
        // The type of chart we want to create
        // type: 'line',
        type : 'bar',

        // The data for our dataset
        data: {
            labels: amountMonth2,
            datasets: [{
                /* label: 'My First dataset', */
                data: amountMonth,
                barThickness: 50,
                /* borderColor: 'rgba(0, 188, 212, 0.75)',
                backgroundColor: 'rgba(0, 188, 212, 0.3)',
                pointBorderColor: 'rgba(0, 188, 212, 0)',
                pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
                pointBorderWidth: 1 */
                backgroundColor: 'rgba(0, 188, 212, 0.3)'
            }]
        },
        options: {
            responsive: true,
            legend: false
        }
    });
    /* var ctx2 = document.getElementById('shop_gender_chart').getContext('2d');
    var chart = new Chart(ctx2, {
        // The type of chart we want to create

        type: 'bar',
        data: {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [{
                label: "My First dataset",
                data: [65, 59, 80, 81, 56, 55, 40],
                backgroundColor: 'rgba(0, 188, 212, 0.8)'
            }, {
                label: "My Second dataset",
                data: [28, 48, 40, 19, 86, 27, 90],
                backgroundColor: 'rgba(233, 30, 99, 0.8)'
            }]
        },
        options: {
            responsive: true,
            legend: false
        }
    }); */
    
    // 고객 연령대 비율
    var ctx3 = document.getElementById('shop_age_chart').getContext('2d');
    new Chart(ctx3, {
        type: 'pie',
        data: {
            labels: ageCount1,
            datasets: [{
               /*  label: "My First dataset", */
                data: ageCount2,
                backgroundColor: [
                    "rgb(233, 30, 99)",
                    "rgb(255, 193, 7)",
                    "rgb(0, 188, 212)",
                    "rgb(139, 195, 74)",
                    "rgb(0, 195, 74)",
                    "rgb(0, 5, 74)"
                ],
            }]
        },
        options: {
            /* responsive: true,
            legend: false */
        	responsive: true,
        }
    });
    var ctx4 = document.getElementById('shop_cate_chart').getContext('2d');
    var myPieChart = new Chart(ctx4, {
        type: 'pie',
        data: {
            datasets: [{
                data: cateCount2,
                backgroundColor: [
                    "rgb(233, 30, 99)",
                    "rgb(255, 193, 7)",
                    "rgb(0, 188, 212)",
                    "rgb(139, 195, 74)",
                    "rgb(0, 195, 74)"
                ],
            }],
            labels: cateCount1
        },
        options: {
            responsive: true,
        }
    });
    /*table*/

    $(document).ready(function () {
       /*  var table = $('#he_table').DataTable({
            columnDefs: [{
                targets: [0, 1, 2, 3, 4, 5],
                className: 'mdl-data-table__cell--non-numeric'
            }]
        }); */

        /* new $.fn.dataTable.Buttons(table, {
            buttons: [{
                    dom: 'Bfrtip',
                    text: 'excel',
                    extend: 'excel'
                },
                {
                    dom: 'Bfrtip',
                    text: 'csv',
                    extend: 'csv'
                },
                {
                    dom: 'Bfrtip',
                    text: 'copy',
                    extend: 'copy'
                },
                {
                    dom: 'Bfrtip',
                    text: 'pdf',
                    extend: 'pdf'
                },
                {
                    dom: 'Bfrtip',
                    text: 'print',
                    extend: 'print'
                }
            ]
        }); */

        /* table.buttons(0, null).container().prependTo(
            table.table().container()
        ); */
    });
</script>

</html>