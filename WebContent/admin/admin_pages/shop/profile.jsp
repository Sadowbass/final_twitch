<%@page import="bean.UserInfoVo"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <script src="<%=request.getContextPath() %>/admin/js/admin_c.js"></script>

</head>

<%
	String img = null;
	if(request.getAttribute("vo") !=null){
		UserInfoVo vo = (UserInfoVo)request.getAttribute("vo");
		session.setAttribute("vo", vo);
		
		
		if(vo.getPh_sysfile() == null){
			img="img/user-photo/guest-icon.png";
		}else{
			img="img/user-photo/" + vo.getPh_sysfile();
		}
		/* System.out.println("★★★★" + vo.getMem_birth());
		String y,m,d; */
		System.out.println(img);
	}
%>

<form id="frm_profile" class="form-horizontal">
<div class="container-fluid">
	<div class="row clearfix">
		<div class="col-xs-12 col-sm-3">
			<div class="card profile-card">
				<div class="profile-header">&nbsp;</div>
				<div class="profile-body">
					<div class="image-area">
						<img src="<%=request.getContextPath() %>/<%=img %>"
							style="width: 127px; height: 127px;"
							alt="AdminBSB - Profile Image" id="adminImgTarget"
							onclick="document.getElementById('adminImg').click();" /> 
							<input 	type="file" id="adminImg" name="adminImg" onchange="LoadImg(this)" style="display: none;" />
						
					</div>
					<div align="center" style="margin-top: 10px">
						<button id="adminPhotoModify" class="btn btn-danger swalUpdate">수정</button>
						<input type="hidden" value="${vo.mem_id}" name="userId"/>
						<input type="hidden" value="${vo.ph_sysfile}" name="delFile" />
					</div>
					<!-- <div class="content-area">
						<h3>Marc K. Hammond</h3>
						<p>Web Software Developer</p>
						<p>Administrator</p>
						
					</div> -->
					
				</div>

			</div>


		</div>
		<div class="col-xs-12 col-sm-9">
			<div class="card">
				<div class="body">
					<div>
						<ul class="nav nav-tabs" role="tablist">

							<li role="presentation" class="active"><a
								href="#profile_settings" aria-controls="settings" role="tab"
								data-toggle="tab">기본 정보 변경</a></li>
							<li role="presentation"><a href="#change_password_settings"
								aria-controls="settings" role="tab" data-toggle="tab">비밀번호
									변경</a></li>
						</ul>

						<div class="tab-content">

							<div role="tabpanel" class="tab-pane fade in active"
								id="profile_settings">
								
									<div class="form-group">
										<label for="adminName" class="col-sm-2 control-label">이름</label>
										<div class="col-sm-10">
											<div class="form-line">
												<input type="text" class="form-control" id="adminName"
													name="adminName" value="${vo.mem_name }" required  style = "color : black; ">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="Email" class="col-sm-2 control-label">이메일</label>
										<div class="col-sm-10">
											<div class="form-line">
												<input type="email" class="form-control" id="email"
													name="email" placeholder="Email"
													value="${vo.mem_email }" required style = "color : black; ">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="birth" class="col-sm-2 control-label">생일</label>
										<div class="col-sm-10">
											<div>
												<div class="col-xs-2" style="padding-left: 0;">
													<input type="text" class="form-control" id="year" placeholder="년"  style = "color : black; " value="${fn:substring(vo.mem_birth,0,4)}"/>
												</div>
												<div class="col-xs-2" style="padding-left: 1px;">
													<input type="text" class="form-control" id="month" placeholder="월"  style = "color : black; " value="${fn:substring(vo.mem_birth,5,7)}"/>
												</div>
												<div class="col-xs-2" style="padding-left: 1px;">
													<input type="text" class="form-control" id="day" placeholder="일"  style = "color : black; " value="${fn:substring(vo.mem_birth,8,10) }"/>
												</div>
												<input type="hidden" id="birth" name="birth" />
											</div>
										</div>

									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<input type="checkbox" id="terms_condition_check"
												class="chk-col-red filled-in" /> 
												동의 하십니까?
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button disabled class="btn btn-danger" id="adminModifyBtn">수정</button>
										</div>
									</div>
								
							</div>
							<div role="tabpanel" class="tab-pane fade in"
								id="change_password_settings">
								
									<div class="form-group">
										<label for="NewPassword" class="col-sm-3 control-label">새
											비밀번호</label>
										<div class="col-sm-9">
											<div class="form-line">
												<input type="password" class="form-control" id="NewPassword"
													name="NewPassword" placeholder="New Password" required style = "color : black; ">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="NewPasswordConfirm" class="col-sm-3 control-label">새
											비밀번호 확인</label>
										<div class="col-sm-9">
											<div class="form-line">
												<input type="password" class="form-control"
													id="NewPasswordConfirm" name="NewPasswordConfirm"
													placeholder="New Password (Confirm)" required style = "color : black; ">
											</div>
										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-offset-3 col-sm-9">
											<input type="button" class="btn btn-danger" disabled value="수정" id="adminPwdModify">
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
</form>

<script>cmh.func();</script>




</html>
