<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-fluid pb-0" style="padding: 0px 30px 30px 240px;">
	<div class="video-block-right-list section-padding">
		<div class="row">
			<!-- stream-main-view -->
			<div class="col-md-10 padding-0">
				<!-- 영상 탑 -->
				<div class="col-12 px-0">
					<jsp:include page="./video_uk/video_top_uk.jsp"></jsp:include>
				</div>
				<!-- 영상화면 -->
				<div class="single-video col-12 px-0">
					<jsp:include page="./video_uk/video_uk.jsp" />
				</div>
				<!-- 카테고리 등등등 -->
				<div class="col-12">
					<jsp:include page="./video_uk/video_info_uk.jsp"></jsp:include>
				</div>
			</div>
			<!-- 채팅화면 -->
			<div class="col-md-2 padding-0">
				<jsp:include page="./cht_uk/cht_uk.jsp"></jsp:include>
			</div>
		</div>
	</div>
</div>
