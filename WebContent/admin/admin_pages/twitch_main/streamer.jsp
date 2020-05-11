<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8"); %>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.1.0/material.min.css" rel="stylesheet"/>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.material.min.css" rel="stylesheet"/>
    <link href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css" rel="stylesheet"/>
    <link href="css/member.css" rel="stylesheet">
    <div class="container-fluid">
        <div class="block-header">
            <h2>
                회원조회
            </h2>
        </div>
        <!-- Basic Examples -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            회원목록
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
                                    <th>아이디</th>
                                    <th>이름</th>
                                    <th>이메일</th>
                                    <th>구분</th>
                                    <th>등록일</th>
                                    <th>총수익</th>
                                </tr>
                                </thead>
                                <tbody> 
                                <tr onclick="location.href='./admin_pages/twitch_main/streamer_detail.jsp'">
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr onclick="location.href='./admin_pages/twitch_main/streamer_detail.jsp'">
                                    <td>Garrett Winters</td>
                                    <td>Accountant</td>
                                    <td>Tokyo</td>
                                    <td>63</td>
                                    <td>2011/07/25</td>
                                    <td>$170,750</td>
                                </tr>
                                <tr onclick="location.href='./admin_pages/twitch_main/streamer_detail.jsp'">
                                    <td>Ashton Cox</td>
                                    <td>Junior Technical Author</td>
                                    <td>San Francisco</td>
                                    <td>66</td>
                                    <td>2009/01/12</td>
                                    <td>$86,000</td>
                                </tr>
                                <tr onclick="location.href='./admin_pages/twitch_main/streamer_detail.jsp'">
                                    <td>Cedric Kelly</td>
                                    <td>Senior Javascript Developer</td>
                                    <td>Edinburgh</td>
                                    <td>22</td>
                                    <td>2012/03/29</td>
                                    <td>$433,060</td>
                                </tr>
                                <tr onclick="location.href='./admin_pages/twitch_main/streamer_detail.jsp'">
                                    <td>Airi Satou</td>
                                    <td>Accountant</td>
                                    <td>Tokyo</td>
                                    <td>33</td>
                                    <td>2008/11/28</td>
                                    <td>$162,700</td>
                                </tr>
                                <tr onclick="location.href='./admin_pages/twitch_main/streamer_detail.jsp'">
                                    <td>Brielle Williamson</td>
                                    <td>Integration Specialist</td>
                                    <td>New York</td>
                                    <td>61</td>
                                    <td>2012/12/02</td>
                                    <td>$372,000</td>
                                </tr>
                                <tr onclick="location.href='./admin_pages/twitch_main/streamer_detail.jsp'">
                                    <td>Herrod Chandler</td>
                                    <td>Sales Assistant</td>
                                    <td>San Francisco</td>
                                    <td>59</td>
                                    <td>2012/08/06</td>
                                    <td>$137,500</td>
                                </tr>
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

    <script>
        $(document).ready(function () {
            var table = $('#he_table').DataTable({
                columnDefs: [{
                    targets: [0, 1, 2],
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
                    }
                ]
            });

            table.buttons(0, null).container().prependTo(
                table.table().container()
            );
        });
    </script>

