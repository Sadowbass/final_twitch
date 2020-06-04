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
                                         <form id="he_form" name="he_form" method="post" enctype='multipart/form-data'>
                                            <div class="row clearfix">
                                                <div class="col-xs-12 ">
                                                 <c:if test="${empty vo.ph_serial}">
                                                    <img src="images/user.png" class="img-circle member_img"
                                                        id="member_img">
                                                 </c:if>
                                                 <c:if test="${not empty vo.ph_serial}">
                                                    <img src="../img/user-photo/${vo.ph_sysfile }" class="img-circle member_img"
                                                        id="member_img">
                                                 </c:if>
                                                 <div class="filebox">
                                        			<label for="profile_img">프로필 사진 수정</label>
                                       			 	<input type="file" name="profile_img" id="profile_img"
                                            			class="profile_img_button" />
                                    			</div>

                                                </div>
                                            </div>
                                            <div class="row clearfix">
                                                <div class="col-md-12 col-sm-12">
                                                    <textarea class="form-control introduce" rows="3" name="member_introduce"
                                                         >${vo.mem_profile }</textarea>
                                                </div>
                                            </div>

                                            <div class="row clearfix">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon iga">
                                                          		  아이디
                                                        </span>
                                                        <div class="form-line">
                                                            <input class="form-control" type="text" value="${vo.mem_id }" name="member_id" >
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon iga">
                                                          		 구분
                                                        </span>
                                                        <div class="form-line">
                                                            <!--<input class="form-control" type="text" value="${vo.mem_admin }" name="member_grade">-->
                                                            <select class="form-control show-tick" name="member_grade">
                                								<option <c:if test="${vo.mem_admin == 0 }">selected</c:if> value="0">일반회원</option>
                                								<option <c:if test="${vo.mem_admin == 1 }">selected</c:if> value="1">관리자</option>
                            								</select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row clearfix">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon iga">
                                                            	이름
                                                        </span>
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" value="${vo.mem_name }" name="member_name">
                                                        </div>
                                                    </div>
                                                </div>
                                                 <div class="col-md-6 col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon iga">
                                                            	현재상태
                                                        </span>
                                                        <div class="form-line">
                                                            <!--<input type="text" class="form-control" value="${vo.mem_status }" name="member_status">-->
                                                            <select class="form-control show-tick" name="member_status">
                                								<option <c:if test="${vo.mem_admin == 0 }">selected</c:if> value="0">오프라인</option>
                                								<option <c:if test="${vo.mem_admin == 1 }">selected</c:if> value="1">온라인</option>
                                								<option <c:if test="${vo.mem_admin == 2 }">selected</c:if> value="2">방송중</option>
                            								</select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row clearfix">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon iga">
                                                            	이메일	
                                                        </span>
                                                        <div class="form-line">
                                                            <input type="email" class="form-control" value="${vo.mem_email }" name="member_email">
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon iga">
                                                            		보유잔액
                                                        </span>
                                                        <div class="form-line">
                                                            <input type="email" class="form-control" value="${vo.mem_money }" name="member_money">
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row clearfix">
                                                 <div class="col-md-6 col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon iga">
                                                            	등록일	
                                                        </span>
                                                        <div class="form-line">
                                                            <input type="date" class="form-control" value="${vo.mem_rDate }" name="member_rdate">
                                                        </div>

                                                    </div>
                                                </div>
                                                 <div class="col-md-6 col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon iga">
                                                            	생일	
                                                        </span>
                                                        <div class="form-line">
                                                            <input type="date" class="form-control" value="${vo.mem_birth }" name="member_birth">
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            
                                             <div class="row clearfix">
                                                <div class="col-md-3 col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon iga">
                                                            	우편번호
                                                        </span>
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" value="${vo.mem_zcode }" name="member_zcode">
                                                        </div>
                                                    </div>
                                                </div>
                                                 <div class="col-md-3 col-sm-6 col-xs-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon iga">
                                                            	집주소 
                                                        </span>
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" value="${vo.mem_add1 }" name="member_add1 ">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12" >
                                                    <div class="input-group">
                                                       
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" value="${vo.mem_add2}" name="member_add2">
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
                                                    <button type="button" class="btn waves-effect" onclick="backSelect()">
                                                    <i class="material-icons">cached</i>
                                                        <span>취소</span>
                                                    </button>
                                                </div>
                                            </div>
                                            </form>
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
    	/*modify_result();*/
    </script>



</body>

</html>