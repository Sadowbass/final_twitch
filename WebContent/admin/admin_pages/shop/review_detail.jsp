<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link href="plugins/sweetalert/sweetalert.css" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/admin/js/admin_c.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>


<div class="container-fluid">
	<div class="row clearfix">

		<div
			class="col-lg-8 col-md-10 col-sm-10 col-xs-12 col-lg-offset-2 col-md-offset-1 col-sm-offset-1">
			<div class="card">
				<div class="body">
					<div>
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#home"
								aria-controls="home" role="tab" data-toggle="tab">댓글 상세보기</a></li>

						</ul>
						<form id="frm_reviewDetail_mh">
							<input type="hidden" id="review_id" value = "${vo.review_id } "/>
						</form>
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="home">
								<div class="panel panel-default panel-post review_detail_panel">
									<div class="panel-heading">
										<div class="media">

											<div class="media-body">
												<h2 class="media-heading">
													작성일자&nbsp;&nbsp; ${vo.review_date } <br>
													상품명&nbsp;&nbsp;&nbsp; ${param.product_name }<br>
													작성자&nbsp;&nbsp;&nbsp; ${vo.mem_id }
												</h2>
											</div>
										</div>
									</div>
									<div class="panel-body review_detail_panel_body">
										<div class="post">
											<div class="post-heading">
												<label>댓글 제목</label> <input type="text"
													class="form-control" value="${vo.rSubject }" readonly style="color : white;"/> <label
													class="star_label">별점</label>
												<ul class="review_detail_stars">

													<li class="">
													<c:forEach var="i" begin="1"
															end="${vo.review_like }">
															<i class="material-icons shop_star">star</i>
														</c:forEach>
														<c:forEach var="i" begin="1" end="${5-vo.review_like }">
																<i class="material-icons shop_star">star_border</i>
														</c:forEach>	
													</li>
												</ul>
											</div>
											<div class="post-content">

												<div class=" review_detail_content">
													<textarea class="form-control" rows="5" style="color : white;" readonly>${vo.rContent }</textarea>
												</div>

											</div>
										</div>
									</div>
									<div class="panel-footer review_footer" id="reviewPhotoList">
										<div id="carousel-example-generic" class="carousel slide review_slide" data-ride="carousel">
											<!-- Indicators -->
											<ol class="carousel-indicators">
												<c:if test="${!empty vo.photos[0]}">
												<li data-target="#carousel-example-generic"
													data-slide-to="0" class="active"></li>
													
												</c:if>
												<c:if test="${!empty vo.photos[1]}">
												<li data-target="#carousel-example-generic"
													data-slide-to="1"></li>
													</c:if>
													<c:if test="${!empty vo.photos[2]}">
												<li data-target="#carousel-example-generic"
													data-slide-to="2"></li>
													</c:if>
											</ol>

											<!-- Wrapper for slides -->
											<div class="carousel-inner" role="listbox">
												
																			
												<div class="item active" id="target1">
													<img id="photo1" src="<%=request.getContextPath() %>\admin\admin_pages\product_photo\1589699401213-20200513_184013.png" />
												</div>
												<div class="item" id="target2" >
													<img id="photo2" src="<%=request.getContextPath() %>\admin\admin_pages\product_photo\1589699401213-20200513_184013.png" />
												</div>
												<div class="item" id="target3" >
													<img id="photo3" src="<%=request.getContextPath() %>\admin\admin_pages\product_photo\1589699401213-20200513_184013.png"  />
												</div> 
											</div>
											
											

											<!-- Controls -->
											<a class="left carousel-control"
												href="#carousel-example-generic" role="button"
												data-slide="prev"> <span
												class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
												<span class="sr-only">Previous</span>
											</a> <a class="right carousel-control"
												href="#carousel-example-generic" role="button"
												data-slide="next"> <span
												class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
												<span class="sr-only">Next</span>
											</a>
										</div>
									</div>
									
									<script>
												if("${!empty vo.photos}"){
															if("${!empty vo.photos[1]}"){
																$('#target2').remove();
																$('#target3').remove();
															}else if("${!empty vo.photos[2]}"){
																
																$('#target3').remove();
															}
															
												}else{
													alert("비어있음")
													$('#reviewPhotoList').hide();
												}
											</script>
								</div>
								<div class="js-sweetalert help_detail_btn">
									<p>
										<button class="btn btn-defalt waves-effect"
											data-type="cancel2" id="btn_reviewDelete_mh">삭제</button>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- Custom Js -->

<script src="js/pages/examples/profile.js"></script>
<!-- <script src="plugins/sweetalert/sweetalert.min.js"></script> -->
<script src="js/pages/ui/dialogs.js"></script>
<!-- <script src="js/shop.js"></script> -->
<script>cmh.func();</script>



</html>