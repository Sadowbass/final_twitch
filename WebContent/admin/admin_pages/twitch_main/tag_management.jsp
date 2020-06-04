<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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

</head>

<div class="container-fluid">
    <div class="block-header">
        <h2>카테고리</h2>
    </div>

    <!-- Vertical Layout -->
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2 class="tag_header">
                        태그 추가·삭제
                    </h2>
                    <div class="tag_plus">
                     <i class="material-icons" data-toggle="modal" data-target="#tagplus">add_circle_outline</i>
                    </div>
                </div>
                <div class="body">
                    <div class="row clearfix">
                        <div class="col-lg-12 col-md-12  col-xs-12">
                            <div class="input-group serach_input_group">
                                <span class="input-group-addon" id=""><i class="material-icons"
                                        id="search_icon">search</i></span>
                                        <form id="find_form" name="find_form">
                                <input type="text" class="form-control input-lg search_input" placeholder="태그를 검색하세요"
                                    aria-describedby="basic-addon1" id="findTag" name="findTag">
                                    </form>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12  col-xs-12">
                            <div class="tag_list js-sweetalert" id="tag_list">
                            	<c:forEach var='i' items="${list }">
									<span class="label bg-indigo cate_tag">${i.tag_name}<i class="material-icons" onclick="showTagdel(${i.tag_serial})">close</i></span>
								</c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <form id="tag_form" name="tag_form" method ="post">
        	<input type="hidden" id="tag_serial" name="tag_serial">
        </form>
        <!-- #END# Vertical Layout -->
        <div class="modal fade" id="tagplus" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content cate_modi_content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">태그 추가 </h4>
                        </div>
                        <div class="modal-body">
                        	 <div class="form-group demo-tagsinput-area">
                        	<div class="form-line">
                        		<form name="insert_form" id="insert_form" method="post">
                           		 	<input type="text" class="form-control" data-role="tagsinput"
                               			  value="" id="cate_tags" name="cate_tags">
                               </form>
                        	</div>
                       </div>
                        </div>
                        <div class="modal-footer tag_button">
                            <button type="button" class="btn btn-link waves-effect" onclick="tag_save()">저장</button>
                            <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">취소</button>
                        </div>
                    </div>
                </div>
            </div>
		</div>
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

    <!-- Bootstrap Tags Input Plugin Js -->
    <script src="plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
    <script src="js/stream.js"></script>
    <script>

    </script>
    </body>

</html>