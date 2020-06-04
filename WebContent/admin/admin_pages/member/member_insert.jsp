<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%request.setCharacterEncoding("utf-8"); %>
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

</head>

<body>
    <div class="container-fluid member_insert">
        <div class="block-header">
            <h2>회원 입력</h2>

            <!-- Input Group -->
            <div class="row clearfix">
                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2">
                    <div class="card">
                        <form id="he_form" name="he_form" method="post" enctype='multipart/form-data'>
                        <div class="header member_header">
                            <div class="member_input">등급 구분</div>
                            <select class="form-control show-tick" name="member_grade">
                                <option value="0">일반회원</option>
                                <option value="1">관리자</option>
                            </select>

                        </div>
                        <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12">
                                    <img src="images/user.png" class="img-circle member_img" id="member_img" name="member_img">
                                    <div class="filebox">
                                        <label for="profile_img">프로필 사진 추가</label>
                                        <input type="file" name="profile_img" id="profile_img"
                                            class="profile_img_button" />
                                    </div>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-md-12 col-sm-12">
                                    <textarea class="form-control introduce" rows="3"
                                        placeholder="자기소개(300자 미만)" name="member_introduce"></textarea>
                                </div>
                            </div>

                            <div class="row clearfix">
                                <div class="col-md-12 col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">star</i>
                                        </span>
                                        <div class="form-line">
                                            <input class="form-control" type="text" placeholder="아이디" name="member_id">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row clearfix">
                                <div class="col-md-12 col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">person</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control" placeholder="이름" name="member_name">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row clearfix">
                                <div class="col-md-12 col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">@</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="email" class="form-control" placeholder="이메일" name="member_email">
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="row clearfix">
                                <div class="col-md-12 col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">lock</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="password" class="form-control" placeholder="비밀번호" name="member_pwd">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row clearfix birth">
                                <p>생일</p>
                                <div class="col-xs-12 ">
                                    <div class="input-group">
                                        <div class="form-line">
                                             <input type="date" class="form-control" value="" name="member_birth">
                                        </div>
                                    </div>
                                </div>
             
                            </div>
                            <div class="row clearfix">
                                <div class="col-lg-12 col-sm-12 saveButton">
                                    <button type="button" class="btn waves-effect" id="he_save_btn" name="save_btn" onclick='member_insert2()'>
                                        <i class="material-icons">save</i>
                                        <span>SAVE</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- #END# Input Group -->

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

    <!-- noUISlider Plugin Js -->
    <script src="plugins/nouislider/nouislider.js"></script>

    <script src="js/pages/forms/advanced-form-elements.js"></script>
    <script src="js/member.js"></script>
    <script>

    </script>

</body>

</html>