<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/admin/css/cmh.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>

<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/i18n/defaults-*.min.js"></script>
<script src="<%=request.getContextPath()%>/admin/js/admin_c.js"></script>

<link href="https://cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.1.0/material.min.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.material.min.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css" rel="stylesheet" />
<link href="css/member.css" rel="stylesheet">

<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.material.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.flash.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.print.min.js"></script>
<style>
	.input-sm{
		color : black !important;
	}
	
</style>
	
</head>

<body>
	<div class="container-fluid">

		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="card">
					<div class="header">
						<div class="row">
							<div style="float: left; margin-left: 20px;">
								<h2>상품 조회</h2>
							</div>
							<div align="right" style="margin-right: 10px;">
								<!-- <input type="button" class="btn btn-info" id="btn_refleshList_c"
									value="새로고침" /> -->
							</div>
						</div>
						<br>
						<form method="post" name="frm_product_select"
							id="frm_product_select" action="product_select.mh">
							<div class="row" style="margin-top: 10px; text-align: right;">
								<div class="col-sm-12">
									<div class="form-inline">
										<!-- <select class="selectpicker form-control">
											<option selected>상품명</option>
											<option>제조사</option>
										</select>  --><input type="hidden" class="form-control" id="product_search"
											name="product_search" value="${p.findStr }" /> <input
											type="hidden" name="nowPage" value="${p.nowPage }" /><!--  <input
											type="button" class="form-control" value="검색"
											id="btn_search_mh" name="btn_search_mh" />  --><input
											type="hidden" id="productSerial" name="productSerial">

									</div>

								</div>
							</div>

						</form>

						<div class="body" style="text-align: center">
							<%-- <div class="row" id="board1_c" style="text-align: left">
								<div class="no_c"
									style="display: inline-block; width: 5%; text-align: center;">
									<span>상품번호</span>
								</div>
								<div
									style="display: inline-block; width: 20%; text-align: center;">
									<span class="save_c">상품 사진</span>
								</div>

								<div
									style="display: inline-block; width: 20%; text-align: center;">
									<span class="name_c">상품명</span>
								</div>
								<div
									style="display: inline-block; width: 15%; text-align: center">
									<span class="price_c">판매가</span>
								</div>

								<!-- <div
									style="display: inline-block; width: 5%; text-align: center">
									<span class="status_c">상태</span>
								</div> -->
								<div
									style="display: inline-block; width: 5%; text-align: center">
									<span class="hit_c">조회</span>
								</div>
								<div
									style="display: inline-block; width: 5%; text-align: center">
									<span class="order_c">주문</span>
								</div>
								<div
									style="display: inline-block; width: 5%; text-align: center">
									<span class="sell_c">판매</span>
								</div>
								<div
									style="display: inline-block; width: 5%; text-align: center">
									<span class="interest_c">관심</span>
								</div>
								<div
									style="display: inline-block; width: 5%; text-align: center">
									<span class="put_c">담기</span>
								</div>
								<div
									style="display: inline-block; width: 5%; text-align: center">
									<span class="stock_c">재고</span>
								</div>

							</div>
							<div>
								<c:forEach var="i" items="${list }">
									<input type="hidden" id="productState" name="productState" value="${i.product_state }" />
									<div class="row product_list_c">
										<div class="no_c"
											style="display: inline-block; width: 5%; text-align: center;">
											<span>${i.product_id} </span>
										</div>

										<div
											style="display: inline-block; width: 20%; text-align: center;">
											<img
												src="<%=request.getContextPath() %>/admin/admin_pages/product_photo/${i.photos[0].sysfile}"
												alt="" style="width: 70px; height: 70px;" />
										</div>
										<div
											style="display: inline-block; width: 20%; text-align: center;"
											class="product_name_c"
											onclick="cmh.productView(${i.product_id});">
											<span>${i.product_name}</span>
										</div>
										<div
											style="display: inline-block; width: 15%; text-align: center;">
											<span>${i.product_price }</span>

										</div>

										<div
											style="display: inline-block; width: 5%; text-align: center;">
											<span>${i.product_state }</span>
											
										</div>
										<div
											style="display: inline-block; width: 5%; text-align: center;">
											<span class="hit_c">0</span>
										</div>
										<div
											style="display: inline-block; width: 5%; text-align: center;">
											<span class="order_c">0</span>
										</div>
										<div
											style="display: inline-block; width: 5%; text-align: center;">
											<span class="sell_c">0</span>
										</div>
										<div
											style="display: inline-block; width: 5%; text-align: center;">
											<span class="interest_c">0</span>
										</div>
										<div
											style="display: inline-block; width: 5%; text-align: center;">
											<span class="put_c">0</span>
										</div>
										<div
											style="display: inline-block; width: 5%; text-align: center;">
											<span class="stock_c">${i.product_count}</span>
										</div>
									</div>
								</c:forEach>
							</div>

							<div>
								<div class="row">
									<div class="col-xs-12">

										<br>
										<div id='paging'>
											<c:if test="${p.startPage>p.blockSize }">
												<input type='button' value=' 이전 ' class="btn"
													onclick='cmh.go(${p.startPage-1})' />
											</c:if>

											<c:forEach var='i' begin='${p.startPage }'
												end='${p.endPage }'>
												<input type='button' value=' ${i } '
													class="btn ${(i==p.nowPage)? 'here' : '' }"
													onclick='cmh.go(${i})' />
											</c:forEach>
											<c:if test="${p.endPage < p.totPage }">
												<input type='button' value=' 다음 ' class="btn"
													onclick='cmh.go(${p.endPage+1})' />
											</c:if>

										</div>
									</div>

								</div>
							</div> --%>
							<div class="table-responsive">
								<table id="he_table" class="hover mdl-data-table member_table"
									style="width: 100%">
									<thead>
										<tr>
											<th>상품 번호</th>
											<th>상품 사진</th>
											<th>카테고리</th>
											<th>상품명</th>
											<th>판매가</th>
											<th>재고</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="i" items="${list }">
									
											<tr onclick="cmh.productView(${i.product_id});">
												<td>${i.product_id}</td>
												<td>
													<img src="<%=request.getContextPath() %>/admin/admin_pages/product_photo/${i.photos[0].sysfile}"
														 alt="" style="width: 70px; height: 70px;" />
												</td>
												<td>${i.product_cate }</td>
												<td>${i.product_name}</td>
												<td>${i.product_price }</td>																						
												<td>${i.product_count}</td>


											</tr>
										</c:forEach>

									</tbody>

								</table>

								<!-- #END# Basic Examples -->
								<!-- Exportable Table -->
							</div>
						</div>

						
					</div>

				</div>
			</div>
		</div>
	</div>

	<script>
	cmh.func();
	 $(document).ready(function () {
	        var table = $('#he_table').DataTable({
	        	"lengthChange": false,
	        	
	            columnDefs: [{
	            targets: [0, 1,2,3,4,5],
	            className: 'mdl-data-table__cell--non-numeric'
	            }]
	        });

	        new $.fn.dataTable.Buttons(table, {
	            buttons: [{
	                    dom: 'Bfrtip',
	                    text: 'excel',
	                    extend: 'excel'
	                },
	                {
	                    dom: 'Bfrtip',
	                    text: 'csv',
	                    extend: 'csv'
	                },
	                {
	                    dom: 'Bfrtip',
	                    text: 'copy',
	                    extend: 'copy'
	                },
	                {
	                    dom: 'Bfrtip',
	                    text: 'pdf',
	                    extend: 'pdf'
	                },
	                {
	                    dom: 'Bfrtip',
	                    text: 'print',
	                    extend: 'print'
	                }/* , {
	                    text: '새글 등록',
	                    action: function (e, dt, node, conf) {
	                    	location.href="productInsert.mh";
	                    }
	                } */
	            ]
	        });

	        table.buttons(0, null).container().prependTo(
	            table.table().container()
	        );
	    });
</script>
</body>
</html>