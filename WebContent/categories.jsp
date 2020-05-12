<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<div class="container-fluid">
	<div class="video-block section-padding">
		<div class="row">
			<div class="col-md-12">
				<div class="main-title">
					<h2 style="font-weight: bold;display: inline;margin-right: 2%">탐색</h2>
					<div class="btn-group" role="group" aria-label="..." style="margin-bottom: 1%">
						<button type="button" class="btn btn-primary button-class1"
							style='border: 2px solid pink; font-weight: bold;'>카테고리</button>
						<button type="button" class="btn btn-default button-class2"
							style='border: 2px solid pink; font-weight: bold'>생방송채널</button>
					</div>
					<div class="btn-group float-right right-action">
						<a href="#" class="right-action-link text-gray"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							정렬 <i class="fa fa-caret-down" aria-hidden="true"></i>
						</a>
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item" href="#"><i
								class="fas fa-fw fa-star"></i> &nbsp; 팔로우 수</a> <a
								class="dropdown-item" href="#"><i
								class="fas fa-fw fa-signal"></i> &nbsp; 시청자 수</a> <a
								class="dropdown-item" href="#"><i
								class="fas fa-fw fa-times-circle"></i> &nbsp; 닫기</a>
						</div>
					</div>
				

				</div>
			</div>
			</div>
			<div class="input-group" style='width: 300px;border: 1px solid pink' >
            <input type="text" class="form-control" placeholder="태그검색..." id="findTag">
            <div class="input-group-append">
                <button class="btn btn-light" type="button" onclick="findTag()">
                    <i class="fas fa-search" style='color: pink'></i>
                </button>
                <!--  
               <c:if test="${not empty tagList }">
               		<c:forEach var="i" items="${tagList}">
							<div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>${i}</div>
					</c:forEach>
               </c:if>
               -->
            </div>
        	</div>
			<div class='row' style='margin-top: 2%'>
			<div class="col-xl-2 col-sm-6 mb-3">
				<div class="category-item2 mt-0 mb-0">
					<a href="shop.jsp"> <img class="img-fluid" src="img/cate/Animal Crossing_ New Horizons-285x380.jpg"
						alt="">
						<h6>
							Animal Crossing <span title="" data-placement="top"
								data-toggle="tooltip" data-original-title="Verified"><i
								class="fas fa-check-circle text-success"></i></span>
						</h6>
						<p>74,853 views</p>
					</a>
					<div class="col-xs-12" style="margin-top: 3%">
					<div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>시뮬레이션</div>
					</div>
				</div>
			</div>
			<div class="col-xl-2 col-sm-6 mb-3">
				<div class="category-item2 mt-0 mb-0">
					<a href="shop.jsp"> <img class="img-fluid" src="img/cate/Just Chatting-285x380.jpg"
						alt="">
						<h6>
							Just Chatting <span title="" data-placement="top"
								data-toggle="tooltip" data-original-title="Verified"><i
								class="fas fa-check-circle text-success"></i></span>
						</h6>
						<p>74,853 views</p>
					</a>
					<div class="col-xs-12" style="margin-top: 3%">
					<div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>리얼라이프</div>
					
					</div>
				</div>
			</div>
			<div class="col-xl-2 col-sm-6 mb-3">
				<div class="category-item2 mt-0 mb-0">
					<a href="shop.jsp"> <img class="img-fluid" src="img/cate/League of Legends-285x380.jpg"
						alt="">
						<h6>League of Legends</h6>
						<p>74,853 views</p>
					</a>
					<div class="col-xs-12" style="margin-top: 3%">
					<div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>MOBA</div>
					
					</div>
				</div>
			</div>
			<div class="col-xl-2 col-sm-6 mb-3">
				<div class="category-item2 mt-0 mb-0">
					<a href="shop.jsp"> <img class="img-fluid" src="img/cate/MapleStory-285x380.jpg"
						alt="">
						<h6>
							MapleStory <span title="" data-placement="top" data-toggle="tooltip"
								data-original-title="Verified"><i
								class="fas fa-check-circle text-success"></i></span>
						</h6>
						<p>74,853 views</p>
					</a>
					<div class="col-xs-12" style="margin-top: 3%">
					<div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>액션</div>
					<div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>어드벤처게임</div>
					</div>
				</div>
			</div>
			<div class="col-xl-2 col-sm-6 mb-3">
				<div class="category-item2 mt-0 mb-0">
					<a href="shop.jsp"> <img class="img-fluid" src="img/cate/Minecraft-285x380.jpg"
						alt="">
						<h6>Minecraft</h6>
						<p>74,853 views</p>
					</a>
					<div class="col-xs-12" style="margin-top: 3%">
					<div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>액션</div>
					<div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>어드벤처게임</div>
					</div>
				</div>
			</div>
			<div class="col-xl-2 col-sm-6 mb-3">
				<div class="category-item2 mt-0 mb-0">
					<a href="shop.jsp"> <img class="img-fluid" src="img/cate/Music & Performing Arts-285x380.jpg"
						alt="">
						<h6>음악&공연</h6>
						<p>74,853 views</p>
					</a>
					<div class="col-xs-12" style="margin-top: 3%">
					<div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>리얼라이프</div>
					<div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>크리에이티브</div>
					</div>
				</div>
			</div>
			<div class="col-xl-2 col-sm-6 mb-3">
				<div class="category-item2 mt-0 mb-0">
					<a href="shop.jsp"> <img class="img-fluid" src="img/cate/Overwatch-285x380.jpg"
						alt="">
						<h6>Overwatch</h6>
						<p>74,853 views</p>
					</a>
					<div class="col-xs-12" style="margin-top: 3%">
					<div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>FPS</div>
					<div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>슈팅 장르</div>
					</div>
				</div>
			</div>
			<div class="col-xl-2 col-sm-6 mb-3">
				<div class="category-item2 mt-0 mb-0">
					<a href="shop.jsp"> <img class="img-fluid" src="img/cate/PLAYERUNKNOWN'S BATTLEGROUNDS-285x380.jpg"
						alt="">
						<h6>BattleGround</h6>
						<p>74,853 views</p>
					</a>
					<div class="col-xs-12" style="margin-top: 3%">
					<div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>FPS</div>
					<div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>슈팅 장르</div>
					</div>
				</div>
			</div>
			<div class="col-xl-2 col-sm-6 mb-3">
				<div class="category-item2 mt-0 mb-0">
					<a href="shop.jsp"> <img class="img-fluid" src="img/cate/Super Mario Maker 2-285x380.jpg"
						alt="">
						<h6>Super Mario Maker 2</h6>
						<p>74,853 views</p>
					</a>
					<div class="col-xs-12" style="margin-top: 3%">
					<div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>플랫포머 게임</div>
			
					</div>
				</div>
			</div>
			<div class="col-xl-2 col-sm-6 mb-3">
				<div class="category-item2 mt-0 mb-0">
					<a href="shop.jsp"> <img class="img-fluid" src="img/cate/Teamfight Tactics-285x380.jpg"
						alt="">
						<h6>Teamfight Tactics</h6>
						<p>74,853 views</p>
					</a>
					<div class="col-xs-12" style="margin-top: 3%">
					<div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>전략</div>
					<div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>오토배틀러</div>
					</div>
				</div>
			</div>
			<div class="col-xl-2 col-sm-6 mb-3">
				<div class="category-item2 mt-0 mb-0">
					<a href="shop.jsp"> <img class="img-fluid" src="img/cate/Tom Clancy's Rainbow Six_ Siege-285x380.jpg"
						alt="">
						<h6>
							Rainbow Six <span title="" data-placement="top" data-toggle="tooltip"
								data-original-title="Verified"><i
								class="fas fa-check-circle text-success"></i></span>
						</h6>
						<p>74,853 views</p>
					</a>
					<div class="col-xs-12" style="margin-top: 3%">
					<div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>FPS</div>
					<div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>슈팅 장르</div>
					</div>
				</div>
			</div>
			<div class="col-xl-2 col-sm-6 mb-3">
				<div class="category-item2 mt-0 mb-0">
					<a href="shop.jsp"> <img class="img-fluid" src="img/cate/VALORANT-285x380.jpg"
						alt="">
						<h6>VALORANT</h6>
						<p>74,853 views</p>
					</a>
					<div class="col-xs-12" style="margin-top: 3%">
					<div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>FPS</div>
					<div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>슈팅 장르</div>
					</div>
				</div>
			</div>
		</div>

		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center pagination-sm mb-0">
				<li class="page-item disabled"><a class="page-link" href="#"
					tabindex="-1">Previous</a></li>
				<li class="page-item active"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>
	</div>
</div>
<script>
	$(function() {
		$('.button-class1').click(function() {
			if ($(this).hasClass('btn-default'))
				$(this).removeClass('btn-default');
			if (!$(this).hasClass('btn-primary'))
				$(this).addClass('btn-primary');
			if ($('.button-class2').hasClass('btn-primary'))
				$('.button-class2').removeClass('btn-primary');
			if (!$('.button-class2').hasClass('btn-default'))
				$('.button-class2').addClass('btn-default');
		});

		$('.button-class2').click(function() {
			if ($(this).hasClass('btn-default'))
				$(this).removeClass('btn-default');
			if (!$(this).hasClass('btn-primary'))
				$(this).addClass('btn-primary');
			if ($('.button-class1').hasClass('btn-primary'))
				$('.button-class1').removeClass('btn-primary');
			if (!$('.button-class1').hasClass('btn-default'))
				$('.button-class1').addClass('btn-default');
		});

	});	
</script>
<!-- /.container-fluid -->
<!-- Sticky Footer -->
<%@include file="footer.jsp"%>