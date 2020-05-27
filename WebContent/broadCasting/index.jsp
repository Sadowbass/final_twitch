<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<meta charset="EUC-KR">
<title>JHTA-Twitch-방송관리자</title>
<link rel="icon" type="image/png" href="../img/favicon.png">
<script src="../vendor/jquery/jquery.min.js"></script>
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- <script src="../js/broadCasting.js"></script>-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link href="../css/osahan.css" rel="stylesheet">
<link rel="stylesheet" href="../css/broadCasting.css">
<script src="../js/broadCasting.js"></script>
<script
	src="https://code.responsivevoice.org/responsivevoice.js?key=WpsYh9WB"></script>
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/earlyaccess/jejugothic.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<script
	src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<!-- 관욱-->
<script src="/js/js_uk.js"></script>
<link rel="stylesheet" href="/css/css_uk.css">
<style>
.ui-autocomplete {
	max-height: 100px;
	overflow-y: auto;
	/* prevent horizontal scrollbar */
	overflow-x: hidden;
}

.toast-success {
	background-color: #CC2EFA;
}
</style>
</head>
<body>
	<div id='broadCastingPage'>
		<%@include file="top.jsp"%>
		<div class='container-fluid'>
			<div class='row'>
				<div class='col-12 col-sm-4'
					style='border: 1px solid black; background-color: rgb(24, 24, 27) !important; padding: 0'>
					<div class='col-12' style="border-bottom: 1px solid white;">
						<font style='color: white'>방송정보편집</font>
					</div>
					<div class='col-12' style="height: 850px">

						<form name="pk_broadCastingData" id="pk_broadCastingData"
							method="post">
							<input type='hidden' name='flagRul' id='flagRul' />
							<input type='hidden' name='mId' id='mId' value='<%=session.getAttribute("session_id")%>' /> <input
								type='hidden' name='tags' id='takTag' /> <input type='hidden'
								name='gameName' id='takGame' />
							<div id="modalBox" class="modal fade" id="myModal" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel"
								style="background-color: rgba(0, 0, 123, 0.4)">
								<div class="modal-dialog" role="document">
									<div class="modal-content"
										style="background-color: rgb(24, 24, 27) !important;">
										<div class="modal-header" style='border: 0 !important'>
											<img class="img-fluid" alt="" src="../img/favicon.png">&nbsp;<img
												class="img-fluid" alt="" src="../img/Twitch_logo.png"
												width="100px">&nbsp;&nbsp;
											<h4 class="modal-title" id="myModalLabel"
												style="color: white">방송 설정</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true" style="color: white">×</span>
											</button>
										</div>
										<div class="modal-body">
											<div class='row'>
												<ul class="nav nav-tabs" style='border: 0 !important'>
													<li class="nav-item"><a class="nav-link active"
														data-toggle="tab" href="#rull">룰렛 설정</a></li>
													<li class="nav-item"><a class="nav-link"
														data-toggle="tab" href="#hosting">호스팅 설정</a></li>
												</ul>
											</div>
											<div class='tab-content'>
												<div id='rull' class='container tab-pane active'>
													<div class='row' style='margin-top: 4%'>
														<hr/>
														<div class='col-3' style='color:White'>룰렛1</div>
														<div class='col-9'>
															<input type='text' autocomplete="off" id='rul1' name='rul1' style='border-radius:2em;background-color: rgb(58, 58, 60);color:white;text-align: center;width: 100% '/>
														</div>
														<hr/>
														<div class='col-3' style='color:White'>룰렛2</div>
														<div class='col-9'>
															<input type='text' autocomplete="off" id='rul2' name='rul2' style='border-radius:2em;background-color: rgb(58, 58, 60);color:white;text-align: center;width: 100% '/>
														</div>
														<hr/>
														<div class='col-3' style='color:White'>룰렛3</div>
														<div class='col-9'>
															<input type='text' autocomplete="off" id='rul3' name='rul3' style='border-radius:2em;background-color: rgb(58, 58, 60);color:white;text-align: center;width: 100% '/>
														</div>
														<hr/>
														<div class='col-3' style='color:White'>룰렛4</div>
														<div class='col-9'>
															<input type='text' autocomplete="off" id='rul4' name='rul4' style='border-radius:2em;background-color: rgb(58, 58, 60);color:white;text-align: center;width: 100% '/>
														</div>
														<hr/>
														<div class='col-3' style='color:White'>룰렛5</div>
														<div class='col-9'>
															<input type='text' autocomplete="off" id='rul5' name='rul5' style='border-radius:2em;background-color: rgb(58, 58, 60);color:white;text-align: center;width: 100% '/>
														</div>
														<hr/>
														<hr/>
														<p style='color: red'>* 룰렛은 최대 5개까지 입력가능합니다.</p>
													</div>

												</div>

												<div id='hosting' class='container tab-pane'>
													<div class='row' style='margin-top: 2%'>호스팅</div>

												</div>

											</div>

										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-outline-primary" id="saveModalBtn">저장</button>
											<button type="button" class="btn btn-outline-primary"
												id="closeModalBtn">취소</button>
										</div>
									</div>
								</div>
							</div>


							<div id="modalBox2" class="modal fade" id="myModal" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel"
								style="background-color: rgba(0, 0, 123, 0.4)">
								<div class="modal-dialog" role="document">
									<div class="modal-content"
										style="background-color: rgb(24, 24, 27) !important;">
										<div class="modal-header" style='border: 0 !important'>
											<img class="img-fluid" alt="" src="../img/favicon.png">&nbsp;<img
												class="img-fluid" alt="" src="../img/Twitch_logo.png"
												width="100px">&nbsp;&nbsp;
											<h4 class="modal-title" id="myModalLabel"
												style="color: white">팔로워 목록</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true" style="color: white">×</span>
											</button>
										</div>
										<div class="modal-body" id='followList' style='height:300px;overflow: auto;'>
										ㅂㅈㅇㅈㅂ
										</div>
										<div class="modal-footer">

											<button type="button" class="btn btn-outline-primary"
												id="closeModalBtn2">닫기</button>
										</div>
									</div>
								</div>
							</div>





							<div class="col-sm-12 pt-3">
								<div class="card"
									style='background-color: rgb(24, 24, 27) !important'>

									<div class="card-body">
										<div class="table-responsive">
											<table class="table">
												<tbody>
													<tr style="line-height: 32px;">
														<td style="color: white">제목</td>
														<td><textarea rows="" cols=""
																style="width: 100%; background-color: rgb(58, 58, 60); color: white"
																name='broadCastingTitle' id='broadCastingTitle'></textarea></td>

													</tr>
													<tr style="line-height: 32px;">
														<td style="color: white">내용</td>
														<td><textarea rows="" cols=""
																style="width: 100%; background-color: rgb(58, 58, 60); color: white"
																name='broadCastingContent' id='broadCastingContent'></textarea></td>

													</tr>
													<tr>
														<td style="color: white">카테고리</td>
														<td><input type="text" name="findCate" id='findCate'
															class="form-control" value=""
															style="background-color: rgb(58, 58, 60); color: white"
															id='broadCastingCate'>
															<ul id="cate-list">
        													</ul>

															</td>

													</tr>
													<tr>
														<td style="color: white">태그</td>
														<td><input type="text" name="findTag" id="findTag"
															class="form-control" value=""
															style="background-color: rgb(58, 58, 60); color: white;"
															autocomplete="off">

															<ul id="tag-list">
        												    </ul>
															<button id='updateBroadCasting' class="btn btn-outline-primary" type="button" style="float: right;margin-top: 2%;display: none">수정</button>
															</td>

													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>

								<div class="pt-3"></div>

								<div class="card"
									style='background-color: rgb(24, 24, 27) !important'>
									<div class="card-header">
										<i class="fas fa-square"></i> 스트림 키
									</div>
									<div class="card-body">

										<input type="text" id="streamKey" name="streamKey" class="form-control"
											value=""
											style="display: inline-block; background-color: rgb(58, 58, 60); color: white">

									</div>
								</div>

							</div>

						</form>
						<div class="text-center mt-3" id='toggleDiv'>
							<section>
								<a id="pk_switch">๑</a> <span></span>
							</section>
						</div>


					</div>
				</div>
				<div class='col-12 col-sm-4'
					style='border: 1px solid black; background-color: rgb(24, 24, 27) !important; padding: 0'>
					<div class='col-12' style="border-bottom: 1px solid white;">
						<font style='color: white'>뉴스피드</font>
					</div>
					<!--
					<div class='col-12' style="height: 850px; text-align: center;">
						<div style="padding-top: 60%">이곳에서 새로운 팔로우,구독,후원목록을 표시합니다.</div>
					</div>
					-->
					<div class='col-12' style="height: 300px; overflow: auto;"
						id='donationDiv'>
						<!--
						<div class='row' style="margin-top: 2%">

							<div class='col-1'>
								<i class="fas fa-heart fa-3x"></i>
							</div>
							<div class='col-8'>

								<div class='col-12' style="color: white">
									tac890
								</div>
								<div class='col-12'>
									팔로우하셨습니다.
								</div>

							</div>
							<div class='col-3' style="text-align: center;padding-top: 10px">16:43 ago</div>
						</div>

												<div class='row' style="margin-top: 2%">
							<div class='col-1'>
								<i class="fas fa-volume-up fa-3x"></i>
							</div>
							<div class='col-8' onclick="voiceDonation('게임을 그 정도밖에 못하냐?','Korean Female');">

								<div class='col-12' style="color: white">
									shredless
								</div>
								<div class='col-12'>
									2000원, "게임을 그 정도 밖에 못하냐??"
								</div>

							</div>
							<div class='col-3' style="text-align: center;padding-top: 10px">16:43 ago</div>
						</div>

												<div class='row' style="margin-top: 2%" onclick="videoDonation()">
							<div class='col-1'>
								<i class="fas fa-video fa-3x"></i>
							</div>
							<div class='col-8'>

								<div class='col-12' style="color: white">
									company12
								</div>
								<div class='col-12'>
									[영상] 3000원, "ㅋㅋㅋㅋㅋㅋㅋㅋㅋ"
								</div>

							</div>
							<div class='col-3' style="text-align: center;padding-top: 10px">16:43 ago</div>
						</div>

												<div class='row' style="margin-top: 2%">
							<div class='col-1'>
								<img
									src="../img/favicon.png" style="width: 40px">
							</div>
							<div class='col-8'>

								<div class='col-12' style="color: white">
									asdf1234
								</div>
								<div class='col-12'>
									1개월 구독하셨습니다.
								</div>

							</div>
							<div class='col-3' style="text-align: center;padding-top: 10px">16:43 ago</div>
						</div>
													<div class='row' style="margin-top: 2%">
							<div class='col-1'>
								<img
									src="../img/favicon.png" style="width: 40px">
							</div>
							<div class='col-8'>

								<div class='col-12' style="color: white">
									asdf1234
								</div>
								<div class='col-12'>
									1개월 구독하셨습니다.
								</div>

							</div>
							<div class='col-3' style="text-align: center;padding-top: 10px">16:43 ago</div>
						</div>
						-->
					</div>
					<div class='col-12'
						style="border-bottom: 1px solid white; border-top: 1px solid white">
						<font style='color: white'>방송 미리보기</font>
					</div>
					<div class='col-12' >
						<div class='row' style="" id='videoView'>
							<jsp:include page="./video_tak.jsp" />
						</div>
					</div>
					<div class='col-12'>
						<div class='row'>
							<div class='col-12' style='text-align: center'>
							<button class="btn btn-outline-primary" type="button" style='margin-top: 10%' id='imageCut'>썸네일 저장</button>
							</div>
							<div class='col-12' style='margin-top: 3%;text-align: center'>
							<i class="fas fa-images fa-2x" ></i><font style='color:white;margin-left: 2%'>방송중인 화면을 썸네일로 사용하실 수 있습니다.</font>
							</div>
						</div>
					</div>

				</div>
				<div class='col-12 col-sm-4'
					style='border: 1px solid black; background-color: rgb(24, 24, 27) !important; padding: 0'>

					<div class='col-12' style="border-bottom: 1px solid white;">
						<font style='color: white'>시청자 목록</font>
					</div>
					<div class='col-12' style="height: 300px; overflow: auto;" id="userList">



						<div class='row' style="margin-top: 2%">
							<div class='col-1'>
								<i class="fas fa-crown" style="color: yellow;"></i>
							</div>
							<div class='col-11' style="padding: 0">tac890</div>
						</div>

						<div class='row' style="margin-top: 2%">
							<div class='col-10'>frend</div>
						</div>

						<div class='row' style="margin-top: 2%">
							<div class='col-10'>company11</div>
						</div>

						<div class='row' style="margin-top: 2%">
							<div class='col-1'>
								<i class="fas fa-wrench" style="color: green"></i>
							</div>
							<div class='col-11' style='padding: 0'>dragon123</div>

						</div>

						<div class='row' style="margin-top: 2%">
							<div class='col-10'>kizaru</div>

						</div>

						<div class='row' style="margin-top: 2%">
							<div class='col-10'>aio</div>

						</div>

						<div class='row' style="margin-top: 2%">
							<div class='col-10'>dark</div>

						</div>

						<div class='row' style="margin-top: 2%">
							<div class='col-10'>white</div>

						</div>


					</div>

					<div class='col-12'
						style="border-bottom: 1px solid white; border-top: 1px solid white">
						<font style='color: white'>생방송 채팅</font>
					</div>
					<div class='col-12' style="height: 550px; padding: 0">

						<div class='col-12 chtArea' style="height: 500px" id="chtArea">
							<!-- <div style="padding-top: 5%;">채팅방에 오신것을 환영합니다!</div>-->
							<div class='row' style="margin-top: 2%">
								<div class='col-1'>
									<i class="fas fa-crown" style="color: yellow;"></i>
								</div>
								<div class='col-2' style="padding: 0">tac890</div>
								<div class='col-9'>모두 어여들 들어오라고!</div>

							</div>

							<div class='row' style="margin-top: 2%">
								<div class='col-2'>frend</div>
								<div class='col-9'>안녕하세요</div>

							</div>

							<div class='row' style="margin-top: 2%">
								<div class='col-2'>company11</div>
								<div class='col-9'>추하다 민호야</div>
							</div>

							<div class='row' style="margin-top: 2%">
								<div class='col-1'>
									<i class="fas fa-wrench" style="color: green"></i>
								</div>
								<div class='col-2' style='padding: 0'>dragon123</div>
								<div class='col-9'>저게 사람이냐?</div>

							</div>

							<div class='row' style="margin-top: 2%">
								<div class='col-2'>kizaru</div>
								<div class='col-9'>????????</div>

							</div>

							<div class='row' style="margin-top: 2%">
								<div class='col-2'>aio</div>
								<div class='col-9'>엄준식이다!</div>

							</div>

							<div class='row' style="margin-top: 2%">
								<div class='col-2'>dark</div>
								<div class='col-9'>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</div>

							</div>

							<div class='row' style="margin-top: 2%">
								<div class='col-2'>white</div>
								<div class='col-9'>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</div>

							</div>
						</div>
						<div class='col-12'>
							<div class="input-group mb-3">
								<input type="text" class="form-control" placeholder="메시지 보내기" id="sendArea"
									style="border: 1px solid red; background-color: rgb(58, 58, 60); color: white">
								<div class="input-group-prepend">
									<button class="btn btn-outline-primary" type="button" onclick="uk.takTxt()">채팅</button>
								</div>

							</div>
						</div>

					</div>

				</div>

			</div>
			<div class="row" style="background-color: rgb(24, 24, 27) !important">
				<%@include file="footer.jsp"%>
			</div>
		</div>
	</div>
	<script>
		$(document)
				.ready(
						function() {


							$('#updateBroadCasting').hide();
							// 방송스위치 --------------------------------------------------------------
							$('#pk_switch').on('click', function() {
								$(this).toggleClass('on');
								if ($(this).hasClass('on') === true) { // 방송 켜졌을 때
									startAir();

								} else { // 방송 꺼졌을때
									stopAir();

								}
							});

							$('#closeModalBtn').on('click', function() {
								$('#modalBox').modal('hide');

								console.log("click close");
							});

							$('#closeModalBtn2').on('click', function() {
								$('#modalBox2').modal('hide');

								console.log("click close");
							});


							$('#saveModalBtn').on('click', function() {

								let count = 0;

								for(let i=1; i<6; i++){
									if($('#rul'+i).val() != ''){
										count++;
									}
								}

								if(count == 0){
									let mId = $('#mId').val();

									$.ajax({
										url : 'deleteRoulette.bc',
										type : 'post',
										async:false,
										data : {"mId": mId},
										error : function(xhr, status, error){

										},
										success : function(data, xhr, status ){
											if(data =="성공"){
												Swal.fire({
													  position: 'center',
													  icon: 'success',
													  title: '<font color="white">저장되었습니다.</font>',
													  background: '#18181b',
													  showConfirmButton: false,
													  timer: 1500
													})
													$('#flagRul').val('false');
											}else if(data =="실패"){
												Swal.fire({
													  position: 'center',
													  icon: 'error',
													  title: '<font color="white">저장에 실패하였습니다.</font>',
													  background: '#18181b',
													  showConfirmButton: false,
													  timer: 1500
													})
											}
										}

									})

									return;

								}

								if(count < 2){
									Swal.fire({
										  position: 'center',
										  icon: 'error',
										  title: '<font color="white">2개 이상의 값을 입력해주세요.</font>',
										  background: '#18181b',
										  showConfirmButton: false,
										  timer: 1500
										})

										return;
								}


								let param = $('#pk_broadCastingData').serialize();

									$.ajax({
										url : 'saveRoulette.bc',
										type : 'post',
										data : param,
										async:false,
										error : function(xhr, status, error){

										},
										success : function(data, xhr, status ){
											if(data =="성공"){
												Swal.fire({
													  position: 'center',
													  icon: 'success',
													  title: '<font color="white">저장되었습니다.</font>',
													  background: '#18181b',
													  showConfirmButton: false,
													  timer: 1500
													})
													$('#flagRul').val('true');
											}else if(data =="실패"){
												Swal.fire({
													  position: 'center',
													  icon: 'error',
													  title: '<font color="white">저장에 실패하였습니다.</font>',
													  background: '#18181b',
													  showConfirmButton: false,
													  timer: 1500
													})
											}
										}

									})


							});

							$('#modalBox').on('show.bs.modal', function(e) {
								console.log("show.bs.modal");
							});
							$('#modalBox').on('shown.bs.modal', function(e) {
								console.log("shown.bs.modal");
							});
							$('#modalBox').on('hide.bs.modal', function(e) {
								console.log("hide.bs.modal");
							});
							$('#modalBox').on('hidden.bs.modal', function(e) {
								console.log("hidden.bs.modal");
							});

							initUser();
							initAir();

						});
	</script>
	<script>
		bc.func()
	</script>

</body>
</html>