﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
    <link href="css/member.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/admin/js/admin_c.js"></script> 
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
</head>



<div class="container-fluid">
    <div class="block-header">
        <h2>게시글 관리</h2>
    </div>

    <!-- CKEditor -->
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        	 글 수정
                    </h2>
                    <!-- div class="new_help_header">
                        <label>글 분류</label>
                        <select class="selectpicker form-control">
                            <option>공지사항</option>
                            <option>Q&A</option>
                        </select>
                    </div> -->

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
                    <form method="post" id="frm_noticeModify">
                        <!-- <textarea id="summernote" name="editordata">
                                <h2>WYSIWYG Editor</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ullamcorper sapien non nisl facilisis bibendum in quis tellus. Duis in urna bibendum turpis pretium fringilla. Aenean neque velit, porta eget mattis ac, imperdiet quis nisi. Donec non dui et tortor vulputate luctus. Praesent consequat rhoncus velit, ut molestie arcu venenatis sodales.</p>
                                <h3>Lacinia</h3>
                                <ul>btn_modifyNotice
                                    <li>Suspendisse tincidunt urna ut velit ullamcorper fermentum.</li>
                                    <li>Nullam mattis sodales lacus, in gravida sem auctor at.</li>
                                    <li>Praesent non lacinia mi.</li>
                                    <li>Mauris a ante neque.</li>
                                    <li>Aenean ut magna lobortis nunc feugiat sagittis.</li>
                                </ul>
                                <h3>Pellentesque adipiscing</h3>
                                <p>Maecenas quis ante ante. Nunc adipiscing rhoncus rutrum. Pellentesque adipiscing urna mi, ut tempus lacus ultrices ac. Pellentesque sodales, libero et mollis interdum, dui odio vestibulum dolor, eu pellentesque nisl nibh quis nunc. Sed porttitor leo adipiscing venenatis vehicula. Aenean quis viverra enim. Praesent porttitor ut ipsum id ornare.</p>
                            </textarea> -->
                            
                            <div class="form-group">
                            	<label >제목</label>
                            	<input type ="text" name="noticeSubject" value="${vo.subject }"class="form-control" placeholder=" Subject " style="width : 20%; color : black;" />
                            	<br>
                            	<label >내용</label><br>
                            	<textarea class="form-control" name="noticeContent" rows="10" placeholder=" Content " style="width : 50%; color : black;">${vo.content }</textarea>
                            	
                            </div>
                            <input type="hidden" value="${vo.no }" id="noticeNO" name="noticeNO"/>
                    </form>
                    <div class="saveButton new_help_save">
                        <button type="button" class="btn waves-effect" id="btn_modifyNotice">
                            <i class="material-icons">save</i>
                            <span>수정</span>
                        </button>
                        <button type="button" class="btn waves-effect" id="btn_deleteNotice">
                            <i class="material-icons">delete</i>
                            <span>삭제</span>
                        </button>
                    </div>
                    
                </div>
            </div>
        </div>

    </div>
    <!-- #END# CKEditor -->
</div>




<!-- Ckeditor -->
<!--<script src="plugins/ckeditor/ckeditor.js"></script>

 

    <!-- Custom Js -->
<!-- <script src="js/pages/forms/editors.js"></script>
    <!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>

<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/i18n/defaults-*.min.js"></script>
<!-- include summernote css/js -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>

<script>
	cmh.func();
</script>

<script>
    $(document).ready(function () {
        $('#summernote').summernote();
    });
</script>

</body>

</html>