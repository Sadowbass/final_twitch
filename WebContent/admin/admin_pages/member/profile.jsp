<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
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
<div class="container-fluid">
	<div class="row clearfix">
		<div class="col-xs-12 col-sm-3">
			<div class="card profile-card">
				<div class="profile-header">&nbsp;</div>
				<div class="profile-body">
					<div class="image-area">
						<img src="./images/user-lg.jpg"
							style="width: 127px; height: 127px;"
							alt="AdminBSB - Profile Image" id="adminImgTarget"
							onclick="document.getElementById('adminImg').click();" /> <input
							type="file" id="adminImg" onchange="LoadImg(this)"
							style="display: none;" />
					</div>
					<div align="center" style="margin-top: 10px">
						<button type="submit" class="btn btn-danger swalUpdate">수정</button>
					</div>
					<div class="content-area">
						<h3>Marc K. Hammond</h3>
						<p>Web Software Developer</p>
						<p>Administrator</p>
						
					</div>
					
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
								<form class="form-horizontal">
									<div class="form-group">
										<label for="adminName" class="col-sm-2 control-label">이름</label>
										<div class="col-sm-10">
											<div class="form-line">
												<input type="text" class="form-control" id="adminName"
													name="adminNmae" value="" required>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="Email" class="col-sm-2 control-label">Email</label>
										<div class="col-sm-10">
											<div class="form-line">
												<input type="email" class="form-control" id="Email"
													name="Email" placeholder="Email"
													value="example@example.com" required>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="birth" class="col-sm-2 control-label">생일</label>
										<div class="col-sm-10">
											<div>
												<div class="col-xs-2" style="padding-left: 0;">
													<input type="text" class="form-control" placeholder="년" />
												</div>
												<div class="col-xs-2" style="padding-left: 1px;">
													<input type="text" class="form-control" placeholder="월" />
												</div>
												<div class="col-xs-2" style="padding-left: 1px;">
													<input type="text" class="form-control" placeholder="일" />
												</div>
											</div>
										</div>

									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<input type="checkbox" id="terms_condition_check"
												class="chk-col-red filled-in" /> <label
												for="terms_condition_check">동의 하십니까?</label>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button disabled type="submit"  class="btn btn-danger" id="adminModifyBtn">수정</button>
										</div>
									</div>
								</form>
							</div>
							<div role="tabpanel" class="tab-pane fade in"
								id="change_password_settings">
								<form class="form-horizontal">
									<div class="form-group">
										<label for="OldPassword" class="col-sm-3 control-label">현재
											비밀번호</label>
										<div class="col-sm-9">
											<div class="form-line">
												<input type="password" class="form-control" id="OldPassword"
													name="OldPassword" placeholder="Old Password" required>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="NewPassword" class="col-sm-3 control-label">새
											비밀번호</label>
										<div class="col-sm-9">
											<div class="form-line">
												<input type="password" class="form-control" id="NewPassword"
													name="NewPassword" placeholder="New Password" required>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="NewPasswordConfirm" class="col-sm-3 control-label">세
											비밀번호 확인</label>
										<div class="col-sm-9">
											<div class="form-line">
												<input type="password" class="form-control"
													id="NewPasswordConfirm" name="NewPasswordConfirm"
													placeholder="New Password (Confirm)" required>
											</div>
										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-offset-3 col-sm-9">
											<button type="submit" class="btn btn-danger">수정</button>
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

<script>cmh.func();</script>




</html>
