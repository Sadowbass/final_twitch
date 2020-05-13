<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-fluid pb-0" style="padding: 0px 0px 0px 225px;">
	<div class="video-block-right-list section-padding">
		<!-- stream view start -->
		<!-- stream view start -->
		<!-- stream view start -->
		<!-- stream view start -->
		<div class="row mx-0">
			<!-- main-view -->
			<!-- main-view -->
			<!-- main-view -->
			<!-- main-view -->
			<!-- main-view -->
			<!-- main-view -->
			<div class="col-md-10" style="padding-left: 0px; padding-right: 37px;" id="video_div">
				<!-- video_top -->
				<!-- video_top -->
				<!-- video_top -->
				<div class="row mx-0">
					<!-- main-view -->
					<!-- main-view -->
					<!-- main-view -->
					<!-- main-view -->
					<!-- main-view -->
					<!-- main-view -->
					<div class="col-md-10" style="padding-left: 0px; padding-right: 37px;" id="video_div">
						<!-- video_top -->
						<!-- video_top -->
						<!-- video_top -->
						<div class="row mx-0">
							<div class="col-md-3">
								<div class="row mx-0 pt-1">
									<div class="col-md-9 text-left pl-2">
										<img src="img/s1.png" alt="" class="rounded-circle" style="height: 35px; width: 35px;" />
										<a href="#">
											${vo.mem_Id}
											<span title="" data-placement="top" data-toggle="tooltip" data-original-title="Verified">
										<i class="fas fa-check-circle"></i>
									</span>
										</a>
									</div>
									<div class="col-md-3 text-left p-0">
										<div class="onAir">생방송</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 text-left p-0">
								<div class="onAir">생방송</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 text-center pt-2">
						<div class="row mx-0">
							<div class="col-md-4 p-0"></div>
							<div class="col-md-1 p-0">
								<a href="#">홈</a>
							</div>
							<div class="col-md-1 p-0">
								<a href="#">동영상</a>
							</div>
							<div class="col-md-1 p-0">
								<a href="#">클립</a>
							</div>
							<div class="col-md-1 p-0">
								<a href="#">팔로워</a>
								<div class="col-md-4  p-0"></div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="row mx-0" id="add_unfold">
							<div class="col-md-7 text-right p-0" id="follow">
								<div class="channels-card-image-btn">
									<button type="button" class="btn btn-outline-secondary btn-sm">
										<strong>
											<i class="fa fa-heart"></i>
										</strong>
										팔로우
									</button>
								</div>
							</div>
							<div class="col-md-5 text-right p-0">
								<div class="channels-card-image-btn">
									<button type="button" class="btn btn-outline-secondary btn-sm">
										<strong>
											<i class="fa fa-star"></i>
										</strong>
										구독하기
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- video -->
				<!-- video -->
				<!-- video -->
				<jsp:include page="./video_uk.jsp" />
				<!-- video_info -->
				<!-- video_info -->
				<!-- video_info -->
				<div class="row mx-0">
					<div class="col-md-6">방송 제목</div>
					<div class="col-md-6 text-right">
						<i class="far fa-user mr-1"></i>
						<span>5,233</span>
						<i class="fas fa-eye mr-1 ml-2"></i>
						<span>37,681,571</span>
						<i class="fas fa-share-alt mx-2"></i>
						<i class="fas fa-ellipsis-v mx-2"></i>
					</div>
				</div>
				<div class="row mx-0">
					<div class="col-md-2">이미지</div>
					<div class="col-md-10">
						<div class="row mx-0">
							<div class="col-md-12">카테고리: just Chatting</div>
						</div>
						<div class="row mx-0">
							<div class="col-md-12">#리얼라이프</div>
							<div class="col-md-12">#리얼라이프</div>
							<div class="col-md-12">#리얼라이프</div>
							<div class="col-md-12">#리얼라이프</div>
							<div class="col-md-12">#리얼라이프</div>
							<div class="col-md-12">#리얼라이프</div>
							<div class="col-md-12">#리얼라이프</div>
							<div class="col-md-12">#리얼라이프</div>
							<div class="col-md-12">#리얼라이프</div>
							<div class="col-md-12">#리얼라이프</div>
							<div class="col-md-12">#리얼라이프</div>
							<div class="col-md-12">#리얼라이프</div>
							<div class="col-md-12">#리얼라이프</div>
							<div class="col-md-12">#리얼라이프</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 채팅화면 -->
			<!-- 채팅화면 -->
			<!-- 채팅화면 -->
			<!-- 채팅화면 -->
			<!-- 채팅화면 -->
			<!-- 채팅화면 -->
			<!-- 채팅화면 -->
			<!-- 채팅화면 -->
			<div class="col-md-2 cht_main_uk pt-2" id="cht_div">
				<jsp:include page="./cht_uk.jsp"></jsp:include>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	uk.stream();
});

let unfold = function() {

    $("#unfold").remove();

    $("#cht_div").css("display","block");
    $("#video_div").removeClass("col-md-12");
    $("#video_div").addClass("col-md-10");
}
</script>