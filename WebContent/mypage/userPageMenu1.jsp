<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<form name='frm_myPage' id='frm_myPage' method='post'
				enctype='multipart/form-data' >
				<div class='row' style='margin-top: 2%'>

					<div class="col-sm-12 pt-3">
						<div class="card" style=''>
							<div class="card-header">
								<i class="fas fa-square"></i> 프로필 사진
							</div>
							<div class="card-body col-sm-12">
								<div class='row'>
								<div class='col-sm-2' style='margin-right: 0'>
								<input type='hidden' id='delFile' name='delFile' value='${vo.ph_sysfile }'/>
								<c:if test="${empty vo.ph_sysfile }">
								<img src='http://placehold.it/150x180' class='rounded-circle'
									id='targetImage'
									style='float: left; width: 100px; height: 100px !important' />
								</c:if>
								<c:if test="${not empty vo.ph_sysfile }">
								<img src='../img/user-photo/${vo.ph_sysfile }' class='rounded-circle'
									id='targetImage'
									style='float: left; width: 100px; height: 100px !important' />
								</c:if>
								</div>
								<div class='col-sm-10' style='margin-top: 2%;text-align: left'>
									<button type="button" class="btn btn-outline-primary" id="changeProfill">프로필 사진변경</button>
									<p>10MB 이내의 JPEG, PNG, GIF 형식이어야 합니다.</p>
									<input type='file' id='userPhoto' name='userPhoto' style='display: none' onchange="readURL(this);" >
								</div>
								</div>
							</div>
						</div>


					</div>
				</div>

				<div class="pt-3"></div>

				<div class="card" style=''>

					<div class="card-body">
						<div class="table-responsive">
							<table class="table">
								<tbody>
									<tr style="line-height: 32px;">
										<td style="">아이디</td>
										<td><input type="text" name="userId" id='userId'
											class="form-control" readonly="readonly" value="${vo.mem_id }" style=""></td>
									</tr>
									<tr style="line-height: 32px;">
										<td style="">닉네임</td>
										<td><input type="text" name="userName" id='userName'
											class="form-control" onblur="nameCheckBlur()" value="${vo.mem_name }" style="">
											<div id='checkDiv2' style="display: none;">
												
											</div>
											
											</td>
									</tr>
									<tr style="line-height: 32px;">
										<td style="">이메일</td>
										<td><input type="text" name="userEmail" id='userEmail'
											class="form-control" value="${vo.mem_email }" style=""></td>
									</tr>
									<tr style="line-height: 32px;">
										<td style="">비밀번호</td>
										<td><input type="password" name="userPwd" id='userPwd'
											class="form-control" readonly="readonly" value="${vo.mem_pwd }" style="width: 60% !important;display: inline;">
											<button type="button" class="btn btn-outline-primary" id="" onclick="updatePwd()">재설정</button>
											</td>
									</tr>
									<tr style="line-height: 32px;">
										<td style="">비밀번호 확인</td>
										<td><input type="password" name="userPwdCheck" id='userPwdCheck' onblur="pwdCheckBlur()"
											class="form-control" value="" style="width: 60% !important;">
											<div id='checkDiv' style="display: none;">
												
											</div>
											</td>
									</tr>
									<tr style="line-height: 32px;">
										<td style="">자기소개</td>
										<td><textarea rows="" cols="" style="height: 100px;width: 100% !important;background-color: rgb(233,236,239)"
												name='userContent' id='userContent'>${vo.mem_profile }</textarea></td>

									</tr>
									<tr>
										<td style="">보유 마일리지</td>
										<td><input type="text" readonly="readonly" name="userCoin" id='userCoin'
											class="form-control" value="${vo.mem_money }" style="display: inline; width: 100px !important">
											<button type="button" class="btn btn-outline-primary" id="inputCoin" onclick="insertCoin()">충전하기</button>
										</td>
										
									</tr>
									

								</tbody>
								
								
							</table>
							
							<div class='col-12 text-right'>
							<button style=''type="button" class="btn btn-outline-primary" id="updateProfill">변경 내용 저장</button>
							<button style='' type="button" class="btn btn-outline-primary" id="deleteUser">회원탈퇴</button>
							<button style='' type="button" class="btn btn-outline-primary" id="takeyes">홍채인식</button>
							</div>
						</div>
					</div>
				</div>

				<div class="pt-3"></div>
				</form>
				<script>
				my.func();
				</script>

    