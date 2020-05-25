<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<script src="<%=request.getContextPath()%>/admin/js/admin_c.js"></script>
</head>

<form id="frm_reviewDetail_mh" name="frm_reviewDetail_mh" action="reviewView.mh"
											method="post">
<div class="container-fluid">
	<div class="block-header">
		<h2>게시판관리</h2>
	</div>
	<!-- Basic Table -->
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="header">
					<h2>리뷰관리</h2>
					<div class="row clearfix">
						<div
							class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-lg-offset-6 col-md-offset-6">
							<div class="form-inline" align="right">
								
									<input type="text" class="form-control" id="reviewFindStr"
										name="reviewFindStr" value="${p.findStr }" /> 
									<input type="button" class="form-control" value="검색"
										id="btn_reviewSearch_mh" name="btn_reviewSearch_mh" /> 
									<input type="hidden" id="nowPage" name="nowPage" value="${p.nowPage }" /> 
									<input type="hidden" id="review_serial" name="review_serial"/>
								
							</div>
						</div>
					</div>		
				</div>
				<div class="body table-responsive">
					<c:forEach var="i" items="${list }">
						<div class="row clearfix">
							<div
								class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">
								<div class="card review_row" onclick="cmh.review_view(${i.review_id })">
									<div class="header">
										<h2>
											상품명 : ${i.product_name } <br>${i.rSubject } <br> 작성자 : ${i.mem_id } <small>${i.review_date }</small>
										</h2>
										
										
			
										
											<input type="hidden" id="product_name" name="product_name" value="${i.product_name }" />
										
										<ul class="header-dropdown m-r--5">
											<li class=""><c:forEach var="a" begin="1"
													end="${i.review_like }">
													<i class="material-icons shop_star">star</i>

												</c:forEach> <c:forEach var="a" begin="${i.review_like+1 }" end="5">
													<i class="material-icons shop_star">star_border</i>

												</c:forEach></li>
										</ul>
									</div>
									<div class="body">
										<div class="row clearfix">
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
												<div class="review_1">
													<c:if test="${!empty i.photos[0].image1  }">
														<img
															src="<%=request.getContextPath() %>/admin/admin_pages/product_photo/${i.photos[0].image1}"
															class="review_img">
													</c:if>
												</div>
											</div>
											<div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
												<div class="review_2">
													<ol class="review_content">
														<li class="review_li">${i.rContent }
													</ol>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<div class="page_div">
					
						<div id='paging'>
							<c:if test="${p.startPage>p.blockSize }">
								<input type='button' value=' 이전 ' class="btn"
									onclick='cmh.go1(${p.startPage-1})' />
							</c:if>

							<c:forEach var='i' begin='${p.startPage }' end='${p.endPage }'>
								<input type='button' value=' ${i } ' class="btn ${(i==p.nowPage)? 'here' : '' }"
									onclick='cmh.go1(${i})' />
							</c:forEach>
							<c:if test="${p.endPage < p.totPage }">
								<input type='button' value=' 다음 ' class="btn"
									onclick='cmh.go1(${p.endPage+1})' />
							</c:if>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- #END# Basic Table -->
</div>
</form>
<script>
	cmh.func();
</script>
</html>