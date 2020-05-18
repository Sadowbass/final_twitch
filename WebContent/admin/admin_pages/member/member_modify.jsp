<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <!-- Colorpicker Css -->
    <link href="plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.css" rel="stylesheet" />

    <!-- Dropzone Css -->
    <link href="plugins/dropzone/dropzone.css" rel="stylesheet">

    <!-- Multi Select Css -->
    <link href="plugins/multi-select/css/multi-select.css" rel="stylesheet">

    <!-- Bootstrap Spinner Css -->
    <link href="plugins/jquery-spinner/css/bootstrap-spinner.css" rel="stylesheet">

    <!-- Bootstrap Tagsinput Css -->
    <link href="plugins/bootstrap-tagsinput/bootstrap-tagsinput.css" rel="stylesheet">

    <!-- Bootstrap Select Css -->
    <link href="plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />

    <!-- noUISlider Css -->
    <link href="plugins/nouislider/nouislider.min.css" rel="stylesheet" />

    <!-- Sweet Alert Css -->
    <link href="plugins/sweetalert/sweetalert.css" rel="stylesheet" />

    <!-- table -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.1.0/material.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.material.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css" rel="stylesheet" />
    

    <link href="css/member.css" rel="stylesheet" />





</head>

<body>
    <div class="container-fluid member_insert">
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            회원 상세 정보
                        </h2>
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
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation">
                                <a href="#home_with_icon_title" data-toggle="tab">
                                    <i class="material-icons">face</i> 프로필
                                </a>
                            </li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade in active" id="home_with_icon_title">
                                <div class="row clearfix">
                                    <div class="col-md-12  col-xs-12">
                                        <div class="body">
                                            <div class="row clearfix">
                                                <div class="col-xs-12 ">
                                                 <c:if test="${empty vo.ph_serial}">
                                                    <img src="images/user.png" class="img-circle member_img"
                                                        id="member_img">
                                                 </c:if>
                                                 <c:if test="${not empty vo.ph_serial}">
                                                    <img src="images/${vo.ph_sysfile }" class="img-circle member_img"
                                                        id="member_img">
                                                 </c:if>

                                                </div>
                                            </div>
                                            <div class="row clearfix">
                                                <div class="col-md-12 col-sm-12">
                                                    <textarea class="form-control introduce" rows="3"
                                                         >${vo.mem_profile }</textarea>
                                                </div>
                                            </div>

                                            <div class="row clearfix">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                          		  아이디
                                                        </span>
                                                        <div class="form-line">
                                                            <input class="form-control" type="text" value="${vo.mem_id }" >
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                          		 구분
                                                        </span>
                                                        <div class="form-line">
                                                            <input class="form-control" type="text" value="${vo.mem_admin }">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row clearfix">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            	이름
                                                        </span>
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" value=${vo.mem_name }>
                                                        </div>
                                                    </div>
                                                </div>
                                                 <div class="col-md-6 col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            	현재상태
                                                        </span>
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" value="${vo.mem_status }">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row clearfix">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            	이메일	
                                                        </span>
                                                        <div class="form-line">
                                                            <input type="email" class="form-control" value="${vo.mem_email }">
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            		보유잔액
                                                        </span>
                                                        <div class="form-line">
                                                            <input type="email" class="form-control" value="${vo.mem_money }">
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row clearfix">
                                                 <div class="col-md-6 col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            	등록일	
                                                        </span>
                                                        <div class="form-line">
                                                            <input type="date" class="form-control" value="${vo.mem_rDate }">
                                                        </div>

                                                    </div>
                                                </div>
                                                 <div class="col-md-6 col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            	생일	
                                                        </span>
                                                        <div class="form-line">
                                                            <input type="date" class="form-control" value="${vo.mem_birth }">
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            
                                             <div class="row clearfix">
                                                <div class="col-md-3 col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            	우편번호
                                                        </span>
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" value="${vo.mem_zcode }">
                                                        </div>
                                                    </div>
                                                </div>
                                                 <div class="col-md-9 col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            	집주소 
                                                        </span>
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" value="${vo.mem_add1 } ${vo.mem_add2}">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="row clearfix js-sweetalert">
                                                <div class="col-lg-12 col-sm-12 saveButton">
                                                    <button type="button" class="btn waves-effect" data-type="modify">
                                                        <i class="material-icons">build</i>
                                                        <span>수정 저장</span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                       
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Tabs With Icon Title -->

    </div>
    <!-- Bootstrap Colorpicker Js -->
    <script src="plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>

    <!-- Dropzone Plugin Js -->
    <script src="plugins/dropzone/dropzone.js"></script>

    <!-- Input Mask Plugin Js -->
    <script src="plugins/jquery-inputmask/jquery.inputmask.bundle.js"></script>

    <!-- Multi Select Plugin Js -->
    <script src="plugins/multi-select/js/jquery.multi-select.js"></script>

    <!-- Jquery Spinner Plugin Js -->
    <script src="plugins/jquery-spinner/js/jquery.spinner.js"></script>

    <!-- Bootstrap Tags Input Plugin Js -->
    <script src="plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>

    <!-- Jquery Validation Plugin Css -->
    <script src="plugins/jquery-validation/jquery.validate.js"></script>

    <!-- JQuery Steps Plugin Js -->
    <script src="plugins/jquery-steps/jquery.steps.js"></script>

    <!-- Sweet Alert Plugin Js -->
    <script src="plugins/sweetalert/sweetalert.min.js"></script>

    <!-- alert dialog -->
    <script src="js/pages/ui/dialogs.js"></script>
    
  
   
	
	<!-- table -->

    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.material.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.print.min.js"></script>

    <!-- chart-js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>



    <script src="js/member.js"></script>
    <script>
        $(document).ready(function () {
            var table = $('#he_table').DataTable({
                columnDefs: [{
                    targets: [0, 1, 2],
                    className: 'mdl-data-table__cell--non-numeric'
                }]
            });

            new $.fn.dataTable.Buttons(table, {
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
            });

            table.buttons(0, null).container().prependTo(
                table.table().container()
            );
        });

        var ctx = document.getElementById('myChart').getContext('2d');
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
                }, {
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
        var ctx2 = document.getElementById('shop_buy_chart').getContext('2d');
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
                }]
            },
            options: {
                responsive: true,
                legend: false
            }
        });

        var ctx3 = document.getElementById('category_chart').getContext('2d');
        var myPieChart = new Chart(ctx3, {
            type: 'pie',
            data: {
                datasets: [{
                    data: [10, 20, 60, 10],
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
        var ctx4 = document.getElementById('shop_cate_chart').getContext('2d');
        var myPieChart = new Chart(ctx4, {
            type: 'pie',
            data: {
                datasets: [{
                    data: [10, 20, 60, 10],
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