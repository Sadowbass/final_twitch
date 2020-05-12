<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.1.0/material.min.css" rel="stylesheet"/>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.material.min.css" rel="stylesheet"/>
    <link href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css" rel="stylesheet"/>
    <link href="css/member.css" rel="stylesheet">
</head>


        <div class="container-fluid">
            <div class="block-header">
                <h2>도움말</h2>
            </div>
            <!-- #END# Bordered Table -->
            <!-- Hover Rows -->
           <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        도움말 글 목록
                    </h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown"
                               role="button" aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);">Action</a></li>
                                <li><a href="javascript:void(0);">Another action</a></li>
                                <li><a href="javascript:void(0);">Something else here</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="body">
                    <div class="table-responsive">
                        <table id="he_table" class="hover mdl-data-table member_table" style="width:100%">
                            <thead>
                            <tr>
                                <th>구분</th>
                                <th>작성자</th>
                                <th>제목</th>
                                <th>소제목</th>
                                <th>등록일</th>
                                <th>조회수</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="i" begin="1" end="57"><!-- 속성 list 값이 하나씩 vo에 들어옴 -->
                                	<tr onclick="help_view()">
	                                    <td>시작하기</td>
	                                    <td>관리자1</td>
	                                    <td>확장프로그램 사용하는 방법</td>
	                                    <td>이 글은 당신이 확장프로그램을 사용하는데 도움되는 정보를 제공합니다</td>
	                                    <td>2011/04/25</td>
	                                    <td>128300</td>
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
            <!-- #END# Hover Rows -->
            </div>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.material.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.flash.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.print.min.js"></script>

<script src="js/stream.js"></script>
<script>
    $(document).ready(function () {
        var table = $('#he_table').DataTable({
            columnDefs: [{
                targets: [0, 1, 2,3,4,5],
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
                },{
                	text:'새글 등록',
                	action:function(e,dt,node,conf){
                		location.href="index.jsp?inc=admin_pages/twitch_main/new_help.jsp"
                	}
                }
            ]
        });

        table.buttons(0, null).container().prependTo(
            table.table().container()
        );
    });
</script>

</body>

</html>
