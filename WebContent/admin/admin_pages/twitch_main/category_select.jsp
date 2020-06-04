<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link href="plugins/sweetalert/sweetalert.css" rel="stylesheet" />
    <!-- Bootstrap Tagsinput Css -->
    <link href="plugins/bootstrap-tagsinput/bootstrap-tagsinput.css" rel="stylesheet">
    <link href="css/member.css" rel="stylesheet">
</head>

<div class="container-fluid">
    <div class="block-header">
        <h2>카테고리</h2>
    </div>
    <!-- Custom Content -->
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        카테고리 조회
                        <small>등록된 카테고리의 수정 ·삭제 가능</small>
                    </h2>

                </div>
                <div class="body">
                    <div class="row">
                    <c:forEach var="i" items="${list }">
                        <div class="col-sm-6 col-md-3 col-lg-2 cate_width">
                            <div class="thumbnail">
                                <img src="../img/cate/${i.cat_sysfile}">
                                <div class="caption cate_thumnail">
                                    <h3>${i.cat_gname }</h3>
                                    <p>
                                    	<c:forEach var="j" items="${fn:split(i.cat_genre ,',')}" end="1">
	                                        <span class="label bg-indigo cate_tag">${j} </span>
                                    	</c:forEach>
                                    </p>
                                    <div class="js-sweetalert">
                                        <p>
                                            <button class="btn btn-defalt waves-effect" onclick="showCancel2Message(${i.cat_serial})">삭제</button>
                                            <button type="button" class="btn btn-defalt waves-effect"
                                                data-toggle="modal" data-target="#defaultModal" onclick="cate_modify(${i.cat_serial})">수정</button>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                  
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- #END# Custom Content -->
</div>
<form id="he_form" name="he_form" method="post">
   <input type="hidden" name="cat_serial" id="cat_serial"/>
</form>
<!-- 수정 모달  -->
<div class="modal fade" id="defaultModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content cate_modi_content">
            <div class="modal-header">
                <h4 class="modal-title" id="defaultModalLabel">카테고리 수정</h4>
            </div>
            <div class="modal-body">
            <form name="modal_form" id="modal_form" method="post" enctype='multipart/form-data'>
                <div class="col-lg-12 col-md-12 col-xs-12">
                    <img src="http://placehold.it/285x380" class="img-rounded category_img" id="category_img">
                     <div class="filebox3">
                         <label for="profile_img">프로필 사진 수정</label>
                         <input type="file" name="profile_img" id="profile_img" class="profile_img_button" />
                     </div>
                </div>
                <div class="col-xs-12">
                    <div class="cate_name_label">카테고리 이름</div>
                    <div class="form-line">
                        <input type="text" class="form-control category_name_modify" placeholder="" id="cate_name" name="cate_name">
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="form-group demo-tagsinput-area">
                        <div class="cate_tag_label">태그</div>
                        <div class="form-line">
                            <input type="text" class="form-control" data-role="tagsinput"
                                value="" id="cate_tags" name="cate_tags">
                        </div>
                    </div>
                </div>
                <input type="hidden" id="cate_serial" name="cate_serial" >
                </form>
            </div>
            <div class="modal-footer js-sweetalert">
                <button class="btn btn-modal waves-effect" data-type="modify2">수정</button>
                <button type="button" class="btn btn-modal waves-effect" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>
<script src="plugins/sweetalert/sweetalert.min.js"></script>
<script src="js/pages/ui/dialogs.js"></script>
<!-- Bootstrap Tags Input Plugin Js -->
<script src="plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
<script src="js/stream.js"></script>

<script>
var cate_modify = function(serial){
	$('#cat_serial').val(serial);
	let param = $('#he_form').serialize();
	$.ajax({ 
		type: "GET", 
		url : "category_view.he",
		data: param, 
		async: true, 
		success : function(data, status, xhr) { 
			 $('#cate_name').val(data.cate.cat_gname);
			 $('#cate_tags').tagsinput('removeAll');
			 $('#cate_tags').tagsinput('add',data.cate.cat_genre);
			 $("#category_img").attr("src", '../img/cate/'+data.cate.cat_sysfile);
			 $('#cate_serial').val(data.cate.cat_serial);
	
		},
		error: function(jqXHR, textStatus, errorThrown) { 
			alert(jqXHR.responseText); 
			} 
		});

}

</script>
</body>

</html>