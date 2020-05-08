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
    <link href="css/member.css" rel="stylesheet" />

    <!-- Sweet Alert Css -->
    <link href="plugins/sweetalert/sweetalert.css" rel="stylesheet" />

    <!-- table -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.1.0/material.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.material.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css" rel="stylesheet" />
    <link href="css/member.css" rel="stylesheet">





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
                            <li role="presentation">
                                <a href="#messages_with_icon_title" data-toggle="tab">
                                    <i class="material-icons">live_tv</i> 방송 이용내역
                                </a>
                            </li>
                            <li role="presentation">
                                <a href="#settings_with_icon_title" data-toggle="tab">
                                    <i class="material-icons">local_mall</i> 쇼핑 이용내역
                                </a>
                            </li>
                            <li role="presentation">
                                <a href="#profile_with_icon_title" data-toggle="tab">
                                    <i class="material-icons">library_books</i> 트게더 이용내역
                                </a>
                            </li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade in active" id="home_with_icon_title">
                                <div class="body">
                                    <div class="row clearfix">
                                        <div class="col-xs-12">
                                            <img src="images/user.png" class="img-circle member_img" id="member_img">

                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-md-6 col-sm-8">
                                            <textarea class="form-control introduce" rows="3"
                                                placeholder="자기소개(300자 미만)"></textarea>
                                        </div>
                                    </div>

                                    <div class="row clearfix">
                                        <div class="col-md-6 col-sm-8">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="material-icons">star</i>
                                                </span>
                                                <div class="form-line">
                                                    <input class="form-control" type="text" placeholder="아이디">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row clearfix">
                                        <div class="col-md-6 col-sm-8">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="material-icons">person</i>
                                                </span>
                                                <div class="form-line">
                                                    <input type="text" class="form-control" placeholder="이름">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row clearfix">
                                        <div class="col-md-6 col-sm-8">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="material-icons">@</i>
                                                </span>
                                                <div class="form-line">
                                                    <input type="email" class="form-control" placeholder="이메일">
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="row clearfix birth">
                                        <p>생일</p>
                                        <div class="col-lg-2 col-sm-4 ">
                                            <div class="input-group">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" placeholder="년">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-2 col-sm-4">

                                            <select class="form-control show-tick">
                                                <option>월</option>
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                                <option>6</option>
                                                <option>7</option>
                                                <option>8</option>
                                                <option>9</option>
                                                <option>10</option>
                                                <option>11</option>
                                                <option>12</option>
                                            </select>

                                        </div>
                                        <div class="col-lg-2 col-sm-4">
                                            <div class="input-group">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" placeholder="일">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix js-sweetalert">
                                        <div class="col-lg-6 col-sm-12 saveButton">
                                            <button type="button" class="btn waves-effect" data-type="confirm">
                                                <i class="material-icons">block</i>
                                                <span>계정 이용 정지</span>
                                            </button>
                                            <button type="button" class="btn waves-effect" data-type="cancel">
                                                <i class="material-icons">delete</i>
                                                <span>계정 삭제</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="profile_with_icon_title">
                                <div class="row clearfix">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="card">
                                            <div class="header">
                                                <h2>
                                                    작성한 게시물 목록
                                                </h2>
                                                <ul class="header-dropdown m-r--5">
                                                    <li class="dropdown">
                                                        <a href="javascript:void(0);" class="dropdown-toggle"
                                                            data-toggle="dropdown" role="button" aria-haspopup="true"
                                                            aria-expanded="false">
                                                            <i class="material-icons">more_vert</i>
                                                        </a>
                                                        <ul class="dropdown-menu pull-right">
                                                            <li><a href="javascript:void(0);">Action</a></li>
                                                            <li><a href="javascript:void(0);">Another action</a></li>
                                                            <li><a href="javascript:void(0);">Something else here</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="body">
                                                <div class="table-responsive">
                                                    <table id="he_table" class="hover mdl-data-table member_table"
                                                        style="width:100%">
                                                        <thead>
                                                            <tr>
                                                                <th>메뉴</th>
                                                                <th>날짜</th>
                                                                <th>제목</th>
                                                                <th>댓글수</th>
                                                                <th>조회수</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="i" begin="1" end="57">
                                                                <!-- 속성 list 값이 하나씩 vo에 들어옴 -->
                                                                <tr onclick="board_view()">
                                                                    <td>스트리머 게시판</td>
                                                                    <td>2020-12-04</td>
                                                                    <td>안녕하새요!</td>
                                                                    <td>2</td>
                                                                    <td>20</td>
                                                                </tr>
                                                            </c:forEach>

                                                        </tbody>

                                                    </table>

                                                    <!-- #END# Basic Examples -->
                                                    <!-- Exportable Table -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="messages_with_icon_title">
                                <b>Message Content</b>
                                <p>
                                    Lorem ipsum dolor sit amet, ut duo atqui exerci dicunt, ius impedit mediocritatem
                                    an. Pri ut tation electram moderatius.
                                    Per te suavitate democritum. Duis nemore probatus ne quo, ad liber essent aliquid
                                    pro. Et eos nusquam accumsan, vide mentitum fabellas ne est, eu munere gubergren
                                    sadipscing mel.
                                </p>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="settings_with_icon_title">
                                <div class="row clearfix">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="card">
                                            <div class="header">
                                                <h2>
                                                   	 최근 쇼핑 내역 
                                                </h2>
                                         
                                            </div>
                                            <div class="body">
                                                <div class="bs-example" data-example-id="media-alignment">
                                                 <c:forEach var="i" begin="1" end="10">
                                                    <div class="media">
                                                        <div class="media-left media-middle">
                                                            <a href="javascript:void(0);">
                                                                <img class="media-object member_shop_list"
                                                                    src="images/goods.jpg">
                                                            </a>
                                                        </div>
                                                        <div class="media-body">
                                                            <h4 class="media-heading">2020-12-02</h4>
                                                            <p>
                                                               DIATEC 필코 마제스터치 컨버터블2 크림치즈 한글
                                                            </p>
                                                            <p>
                                                               175,000원
                                                            </p>
                                                            <p>
                                                               	배송완료
                                                            </p>
                                                        </div>
                                                    </div>
                                                   </c:forEach>
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
    </script>



</body>

</html>