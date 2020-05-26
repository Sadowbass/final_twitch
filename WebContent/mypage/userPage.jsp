<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.nav-item {
	font-size: 15px;
}

.jumbotron {
	background-color: rgb(232, 86, 133);
	text-shadow: black 0.2em 0.2em 0.2em;
	color: white;
}
</style>
</head>
<body>
	<div class='container-fluid' id='userPage' style='margin-top: 5%'>
		<div class="jumbotron">
			<h1 class="text-center" style='color: white'>Twitch</h1>
			<p class="text-center">자신만의 방송채널을 가져보세요!</p>
			<p class="text-center">
				<a class="btn btn-primary btn-lg" href="#" role="button" style='border: 1px solid white !important'>방송 하러가기</a>
			</p>
		</div>



		<div class='row'>
			<ul class="nav nav-tabs" style='border: 0 !important'>
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#progfill">프로필</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#donationList">받은 후원 목록</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#donationList2">보낸 후원 목록</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#coinList">결제 목록</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#followList">팔로우 목록</a></li>
			</ul>
		</div>
		<div class='tab-content'>
			<div id='progfill' class='container tab-pane active'>
				<div class='row' style='margin-top: 2%'>

					<div class="col-sm-12 pt-3">

						<div class="card" style=''>
							<div class="card-header">
								<i class="fas fa-square"></i> 프로필 사진
							</div>
							<div class="card-body col-sm-12">
								<div class='row'>
								<div class='col-sm-2' style='margin-right: 0'>
								<img src='http://placehold.it/150x180' class='rounded-circle'
									id='target'
									style='float: left; width: 100px; height: 100px !important' />
								</div>
								<div class='col-sm-10' style='margin-top: 2%;text-align: left'>
									<button type="button" class="btn btn-outline-primary" id="saveProfill">프로필 사진추가</button>
									<p>10MB 이내의 JPEG, PNG, GIF 형식이어야 합니다.</p>
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
											class="form-control" readonly="readonly" value="" style=""></td>
									</tr>
									<tr style="line-height: 32px;">
										<td style="">비밀번호</td>
										<td><input type="text" name="userPwd" id='userPwd'
											class="form-control" value="" style=""></td>
									</tr>
									<tr style="line-height: 32px;">
										<td style="">비밀번호 확인</td>
										<td><input type="text" name="userPwdCheck" id='userPwdCheck'
											class="form-control" value="" style=""></td>
									</tr>
									<tr style="line-height: 32px;">
										<td style="">자기소개</td>
										<td><textarea rows="" cols="" style="width: 100% !important"
												name='userContent' id='userContent'></textarea></td>

									</tr>
									<tr>
										<td style="">보유 마일리지</td>
										<td><input type="text" readonly="readonly" name="userCoin" id='userCoin'
											class="form-control" value="" style="display: inline; width: 100px !important">
											<button type="button" class="btn btn-outline-primary" id="inputCoin">충전하기</button>
										</td>
										
									</tr>
									

								</tbody>
								
								
							</table>
							
							<div class='col-12 text-right'>
							<button style=''type="button" class="btn btn-outline-primary" id="updateProfill">변경 내용 저장</button>
							<button style='' type="button" class="btn btn-outline-primary" id="updateProfill">회원탈퇴</button>
							</div>
						</div>
					</div>
				</div>

				<div class="pt-3"></div>


			</div>


			<div id='donationList' class='container tab-pane'>
				<div class='row' style='margin-top: 2%'>
					<div class='col-12 text-right'>

						<input type='text' placeholder='후원자 검색..'/>
						<button type="button" class="btn btn-outline-primary btn-sm">검색</button>
					</div>
				
				

					<table class='table table-striped'>
						<thead>
						<tr>
							<th>번호</th>
							<th>메시지</th>
							<th>금액</th>
							<th>후원자</th>
							<th>날짜</th>
						</tr>
						</thead>
						<tr>
							<th>1</th>
							<th>메시지</th>
							<th>금액</th>
							<th>후원자</th>
							<th>날짜</th>
						</tr>	
						<tr>
							<th>2</th>
							<th>메시지</th>
							<th>금액</th>
							<th>후원자</th>
							<th>날짜</th>
						</tr>
						<tr>
							<th>3</th>
							<th>메시지</th>
							<th>금액</th>
							<th>후원자</th>
							<th>날짜</th>
						</tr>
						<tr>
							<th>4</th>
							<th>메시지</th>
							<th>금액</th>
							<th>후원자</th>
							<th>날짜</th>
						</tr>
						<tr>
							<th>5</th>
							<th>메시지</th>
							<th>금액</th>
							<th>후원자</th>
							<th>날짜</th>
						</tr>			
					</table>
					<div class='col-12 text-center'>

						<button type="button" class="btn btn-outline-primary">1</button>
						<button type="button" class="btn btn-outline-primary">2</button>
						<button type="button" class="btn btn-outline-primary">3</button>
						<button type="button" class="btn btn-outline-primary">4</button>
						<button type="button" class="btn btn-outline-primary">5</button>
									
					</div>
				</div>

			</div>
			<div id='donationList2' class='container tab-pane'>
				<div class='row' style='margin-top: 2%'>
				 <div class='col-12 text-right'>

						<input type='text' placeholder='스트리머 검색..'/>
						<button type="button" class="btn btn-outline-primary btn-sm">검색</button>
					</div>

					<table class='table table-striped'>
						<thead>
						<tr>
							<th>번호</th>
							<th>메시지</th>
							<th>금액</th>
							<th>스트리머</th>
							<th>날짜</th>
						</tr>
						</thead>
						<tr>
							<th>1</th>
							<th>메시지</th>
							<th>금액</th>
							<th>스트리머</th>
							<th>날짜</th>
						</tr>	
						<tr>
							<th>2</th>
							<th>메시지</th>
							<th>금액</th>
							<th>스트리머</th>
							<th>날짜</th>
						</tr>
						<tr>
							<th>3</th>
							<th>메시지</th>
							<th>금액</th>
							<th>스트리머</th>
							<th>날짜</th>
						</tr>
						<tr>
							<th>4</th>
							<th>메시지</th>
							<th>금액</th>
							<th>스트리머</th>
							<th>날짜</th>
						</tr>
						<tr>
							<th>5</th>
							<th>메시지</th>
							<th>금액</th>
							<th>스트리머</th>
							<th>날짜</th>
						</tr>			
					</table>
					<div class='col-12 text-center'>

						<button type="button" class="btn btn-outline-primary">1</button>
						<button type="button" class="btn btn-outline-primary">2</button>
						<button type="button" class="btn btn-outline-primary">3</button>
						<button type="button" class="btn btn-outline-primary">4</button>
						<button type="button" class="btn btn-outline-primary">5</button>
									
					</div>
				</div>

			</div>

			<div id='coinList' class='container tab-pane'>
				<div class='row' style='margin-top: 2%'>

					<table class='table table-striped'>
						<thead>
						<tr>
							<th>번호</th>
							<th>금액</th>
							<th>결제수단</th>
							<th>날짜</th>
						</tr>
						</thead>
						<tr>
							<th>1</th>
							<th>금액</th>
							<th>결제수단</th>
							<th>날짜</th>
						</tr>	
						<tr>
							<th>2</th>
							<th>금액</th>
							<th>결제수단</th>
							<th>날짜</th>
						</tr>
						<tr>
							<th>3</th>
							<th>금액</th>
							<th>결제수단</th>
							<th>날짜</th>
						</tr>
						<tr>
							<th>4</th>
							<th>금액</th>
							<th>결제수단</th>
							<th>날짜</th>
						</tr>
						<tr>
							<th>5</th>
							<th>금액</th>
							<th>결제수단</th>
							<th>날짜</th>
						</tr>			
					</table>
					<div class='col-12 text-center'>

						<button type="button" class="btn btn-outline-primary">1</button>
						<button type="button" class="btn btn-outline-primary">2</button>
						<button type="button" class="btn btn-outline-primary">3</button>
						<button type="button" class="btn btn-outline-primary">4</button>
						<button type="button" class="btn btn-outline-primary">5</button>
									
					</div>

				</div>

			</div>

			<div id='followList' class='container tab-pane'>
				<div class='row' style='margin-top: 2%'>

					<p>qwdwqdwqdq4</p>

				</div>

			</div>

		</div>

	</div>

	<%@include file="../footer.jsp"%>
</body>
</html>