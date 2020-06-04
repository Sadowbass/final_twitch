<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.1.0/material.min.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.material.min.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css" rel="stylesheet" />
<link href="css/member.css" rel="stylesheet">
<div class="container-fluid">
    <div class="block-header">
        <h2>
            스트리머 관리
        </h2>
    </div>
    <!-- Basic Examples -->
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        스트리머 목록
                    </h2>
                </div>
                <div class="body">
                    <div class="table-responsive">
                        <table id="he_table" class="hover mdl-data-table member_table" style="width:100%">
                            <thead>
                                <tr>
                                    <th>아이디</th>
                                    <th>이름</th>
                                    <th>이메일</th>
                                    <th>현재 상태</th>
                                    <th>팔로워수</th>
                                    <th>누적수익</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="i" items="${list }">
                                    <!-- 속성 list 값이 하나씩 vo에 들어옴 -->
                                    <tr onclick="streamer_view('${i.mem_id}')">
                                        <td>${i.mem_id }</td>
                                        <td>${i.mem_name }</td>
                                        <td>${i.mem_email }</td>
                                        <td>${i.mem_status }</td>
                                        <td>${i.cnt }</td>
                                        <td>${i.profit }</td>
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
<form id="he_form" name="he_form" method="post">
	<input type=hidden id="he_serial" name="he_serial"/>
</form>
<!-- Jquery DataTable Plugin Js -->
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
                targets: [0, 1, 2],
                className: 'mdl-data-table__cell--non-numeric'
            }],
            "lengthChange": false
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
                }
            ]
        });

        table.buttons(0, null).container().prependTo(
            table.table().container()
        );
    });
    

</script>