<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>twitch-adminPage</title>
    <!-- Favicon-->
    <link rel="icon" href="images/favicon.png" type="image/png">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet"
        type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="plugins/animate-css/animate.css" rel="stylesheet" />
	
    <!-- Morris Chart Css-->
    <link href="plugins/morrisjs/morris.css" rel="stylesheet" />
	
    <!-- Custom Css -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/member.css" rel="stylesheet">
    
    
     <!-- JQuery DataTable Css -->
   	<link href="https://cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.1.0/material.min.css" rel="stylesheet"/>
 	<link href="https://cdn.datatables.net/1.10.20/css/dataTables.material.min.css" rel="stylesheet"/>
 	<link href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css" rel="stylesheet"/>
    
    
    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="css/themes/all-themes.css" rel="stylesheet" />
    
     <!-- Jquery Core Js -->
    <script src="plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Select Plugin Js -->
    <script src="plugins/bootstrap-select/js/bootstrap-select.js"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="plugins/node-waves/waves.js"></script>
    
    <!-- Jquery CountTo Plugin Js -->
    <script src="plugins/jquery-countto/jquery.countTo.js"></script>

    <!-- Morris Plugin Js -->
    <script src="plugins/raphael/raphael.min.js"></script>
    <script src="plugins/morrisjs/morris.js"></script>

    <!-- ChartJs -->
    <script src="plugins/chartjs/Chart.bundle.js"></script>

    <!-- Flot Charts Plugin Js -->
 <!--<script src="plugins/flot-charts/jquery.flot.js"></script>
    <script src="plugins/flot-charts/jquery.flot.resize.js"></script>
    <script src="plugins/flot-charts/jquery.flot.pie.js"></script>
    <script src="plugins/flot-charts/jquery.flot.categories.js"></script>
    <script src="plugins/flot-charts/jquery.flot.time.js"></script>-->

    <!-- Sparkline Chart Plugin Js -->
    <script src="plugins/jquery-sparkline/jquery.sparkline.js"></script>
	
    <!-- Custom Js -->
    <script src="js/admin.js"></script>
    <!-- <script src="js/pages/index.js"></script>-->
    
    <!-- Demo Js -->
    <script src="js/demo.js"></script>
    
  
</head>
<%
	String inc ="home.jsp"; 
	if(request.getParameter("inc") != null){
		inc=request.getParameter("inc");
	}
%>


<body class="theme-red">
    <!-- Page Loader -->
    <div class="page-loader-wrapper">
        <div class="loader">
            <div class="preloader">
                <div class="spinner-layer pl-red">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
            <p>Please wait...</p>
        </div>
    </div>
    <!-- #END# Page Loader -->
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
    <!-- Search Bar -->
    <div class="search-bar">
        <div class="search-icon">
            <i class="material-icons">search</i>
        </div>
        <input type="text" placeholder="START TYPING...">
        <div class="close-search">
            <i class="material-icons">close</i>
        </div>
    </div>
    <!-- #END# Search Bar -->
    <!-- Top Bar -->
    <nav class="navbar">
        <%@include file='./top.jsp' %>
    </nav>
    <!-- #Top Bar -->
    <section>
        <!-- Left Sidebar -->
        <aside id="leftsidebar" class="sidebar">
            <!-- User Info -->
            <div class="user-info">
                <div class="image">
                    <img src="images/user.png" width="48" height="48" alt="User" />
                </div>
                <div class="info-container">
                    <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">John Doe</div>
                    <div class="email">john.doe@example.com</div>
                    <div class="btn-group user-helper-dropdown">
                        <i class="material-icons" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="true">keyboard_arrow_down</i>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="admin_pages/member/profile.jsp"><i class="material-icons">person</i>Profile</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="javascript:void(0);"><i class="material-icons">input</i>Sign Out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- #User Info -->
            <!-- Menu -->
            <div class="menu">
                <ul class="list">

                    <li class="active">
                        <a href="index.jsp">
                            <i class="material-icons">home</i>
                            <span>Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">account_circle</i> <!-- 아이콘 --> 
                            <span>회원관리</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="index.jsp?inc=admin_pages/member/member_select.jsp">회원조회</a>
                            </li>
                            <li>
                                <a href="index.jsp?inc=admin_pages/member/member_insert.jsp">회원추가</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">live_tv</i>
                            <span>트위치 메인</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="javascript:void(0);" class="menu-toggle">
                                    <span>방송관리</span>
                                </a>
                                <ul class="ml-menu">
                                    <li>
                                        <a href="index.jsp?inc=admin_pages/twitch_main/live_broadcast.jsp">생방송 관리</a>
                                    </li>
                                    <li>
                                        <a href="index.jsp?inc=admin_pages/twitch_main/streamer.jsp">스트리머 관리</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="menu-toggle">
                                    <span>카테고리 관리 </span>
                                </a>
                                <ul class="ml-menu">
                                    <li>
                                        <a href="index.jsp?inc=admin_pages/twitch_main/category_select.jsp">카테고리 조회</a>
                                    </li>
                                    <li>
                                        <a href="index.jsp?inc=admin_pages/twitch_main/category_insert.jsp">카테고리 추가</a>
                                    </li>
                                     <li>
                                        <a href="index.jsp?inc=admin_pages/twitch_main/tag_management.jsp">태그 관리</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="menu-toggle">
                                    <span>수익 관리 </span>
                                </a>
                                <ul class="ml-menu">
                                    <li>
                                        <a href="admin_pages/twitch_main/advertise.jsp">광고 관리</a>
                                    </li>
                                    <li>
                                        <a href="index.jsp?inc=admin_pages/twitch_main/profit_management.jsp">수익 관리</a>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript:void(0);" class="menu-toggle">
                                    <span>게시판 관리</span>
                                </a>
                                <ul class="ml-menu"> 
                                    <li>
                                        <a href="index.jsp?inc=admin_pages/twitch_main/help.jsp">도움말 관리</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">local_mall</i>
                            <span>쇼핑몰</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="javascript:void(0);" class="menu-toggle">
                                    <span>상품관리</span>
                                </a>
                                <ul class="ml-menu">
                                    <li>
                                        <a href="admin_pages/shop/product_select.jsp">상품조회</a>
                                    </li>
                                    <li>
                                        <a href="admin_pages/shop/product_insert.jsp">상품추가</a>
                                    </li>
                                </ul>

                            </li>
                            <li>
                                <a href="javascript:void(0);" class="menu-toggle">
                                    <span>주문관리</span>
                                </a>
                                <ul class="ml-menu">
                                    <li>
                                        <a href="admin_pages/shop/order_select.jsp">주문조회</a>
                                    </li>
                                    <li>
                                        <a href="admin_pages/shop/order_treat.jsp">주문처리</a>
                                    </li>
                                </ul>

                            </li>
                        
                            <li>
                                <a href="javascript:void(0);" class="menu-toggle">
                                    <span>통계</span>
                                </a>
                                <ul class="ml-menu">
                                    <li>
                                        <a href="admin_pages/shop/customer_statistic.jsp">고객 통계</a>
                                    </li>
                                    <li>
                                        <a href="admin_pages/shop/product_statistic.jsp">상품 통계</a>
                                    </li>
                                </ul>

                            </li>
                            <li>
                                <a href="javascript:void(0);" class="menu-toggle">
                                    <span>게시판 관리</span>
                                </a>
                                <ul class="ml-menu">
                                    <li>
                                        <a href="admin_pages/shop/notice.jsp">공지사항</a>
                                    </li>
                                    <li>
                                        <a href="admin_pages/shop/review.jsp">리뷰</a>
                                    </li>
                                </ul>

                            </li>
                            <li>
                                <a href="admin_pages/shop/shop_category.jsp">
                                    <span>카테고리 관리</span>
                                </a>
                            </li>
                             <li>
                                <a href="admin_pages/shop/stock.jsp">
                                    <span>재고 관리</span>
                                </a>
                            </li>



                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">library_books</i>
                            <span>트게더</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="javascript:void(0);" class="menu-toggle">
                                    <span>스트리머게시판 관리</span>
                                </a>
                                <ul class="ml-menu">
                                    <li>
                                        <a href="admin_pages/tgd/board_select.jsp">게시판 조회</a>
                                    </li>
                                    <li>
                                        <a href="admin_pages/tgd/streamerBoard_request.jsp">게시판 신청 관리</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="menu-toggle">
                                    <span>전체메뉴 관리</span>
                                </a>
                                <ul class="ml-menu">
                                    <li>
                                        <a href="admin_pages/tgd/menu_modify.jsp">메뉴 추가·삭제</a>
                                    </li>
                                    <li>
                                        <a href="admin_pages/tgd/board_management.jsp">게시글 관리</a>
                                    </li>
                                    <li>
                                        <a href="admin_pages/tgd/hotClip_management.jsp">핫클립 관리</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="menu-toggle">
                                    <span>운영자 메뉴 관리</span>
                                </a>
                                <ul class="ml-menu">
                                    <li>
                                        <a href="admin_pages/tgd/suggesion&report.jsp">건의/신고</a>
                                    </li>
                                    <li>
                                        <a href="admin_pages/tgd/event.jsp">이벤트</a>
                                    </li>
                                    <li>
                                        <a href="admin_pages/tgd/notice.jsp">공지사항</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="admin_pages/tgd/advertise.jsp">
                                    <span>광고관리</span>
                                </a>
                            </li>
                            <li>
                                <a href="admin_pages/tgd/statistic.jsp">
                                    <span>통계</span>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">perm_media</i>
                            <span>기존메뉴</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="pages/medias/image-gallery.html">Image Gallery</a>
                            </li>
                            <li>
                                <a href="pages/medias/carousel.html">Carousel</a>
                            </li>
                            <li>
                                <a href="pages/charts/morris.html">Morris</a>
                            </li>
                            <li>
                                <a href="pages/charts/flot.html">Flot</a>
                            </li>
                            <li>
                                <a href="pages/charts/chartjs.html">ChartJS</a>
                            </li>
                            <li>
                                <a href="pages/charts/sparkline.html">Sparkline</a>
                            </li>
                            <li>
                                <a href="pages/charts/jquery-knob.html">Jquery Knob</a>
                            </li>
                            <li>
                                <a href="pages/examples/profile.html">Profile</a>
                            </li>
                            <li>
                                <a href="pages/examples/sign-in.html">Sign In</a>
                            </li>
                            <li>
                                <a href="pages/examples/sign-up.html">Sign Up</a>
                            </li>
                            <li>
                                <a href="pages/examples/forgot-password.html">Forgot Password</a>
                            </li>
                            <li>
                                <a href="pages/examples/blank.html">Blank Page</a>
                            </li>
                            <li>
                                <a href="pages/examples/404.html">404 - Not Found</a>
                            </li>
                            <li>
                                <a href="pages/examples/500.html">500 - Server Error</a>
                            </li>
                            <li>
                                <a href="pages/maps/google.html">Google Map</a>
                            </li>
                            <li>
                                <a href="pages/maps/yandex.html">YandexMap</a>
                            </li>
                            <li>
                                <a href="pages/maps/jvectormap.html">jVectorMap</a>
                            </li>
                            <li>
                                <a href="pages/changelogs.html">Changelogs</a>
                            </li>

                            <li>
                                <a href="pages/ui/notifications.html">Notifications</a>
                            </li>
                            <li>
                                <a href="pages/ui/pagination.html">Pagination</a>
                            </li>
                            <li>
                                <a href="pages/ui/preloaders.html">Preloaders</a>
                            </li>
                            <li>
                                <a href="pages/ui/progressbars.html">Progress Bars</a>
                            </li>
                            <li>
                                <a href="pages/ui/range-sliders.html">Range Sliders</a>
                            </li>
                            <li>
                                <a href="pages/ui/sortable-nestable.html">Sortable & Nestable</a>
                            </li>
                            <li>
                                <a href="pages/ui/tabs.html">Tabs</a>
                            </li>
                            <li>
                                <a href="pages/ui/thumbnails.html">Thumbnails</a>
                            </li>
                            <li>
                                <a href="pages/ui/tooltips-popovers.html">Tooltips & Popovers</a>
                            </li>
                            <li>
                                <a href="pages/ui/waves.html">Waves</a>
                            </li>
                            <li>
                                <a href="pages/typography.html">typography</a>
                            </li>
                            <li>
                                <a href="pages/helper-classes.html">helper</a>
                            </li>
                            <li>
                                <a href="pages/widgets/cards/basic.html">card-basic</a>
                            </li>
                            <li>
                                <a href="pages/widgets/cards/colored.html">card-colored</a>
                            </li>
                            <li>
                                <a href="pages/widgets/infobox/infobox-1.html">infobox1</a>
                            </li>
                            <li>
                                <a href="pages/widgets/infobox/infobox-2.html">infobox2</a>
                            </li>
                            <li>
                                <a href="pages/ui/colors.html">colors</a>
                            </li>
                            <li>
                                <a href="pages/ui/dialogs.html">dialogs</a>
                            </li>
                            <li>
                                <a href="pages/ui/icons.html">icons</a>
                            </li>
                            <li>
                                <a href="pages/ui/labels.html">labels</a>
                            </li>
                            <li>
                                <a href="pages/forms/basic-form-elements.html">basic-form</a>
                            </li>
                            <li>
                                <a href="pages/forms/advanced-form-elements.html">advanced-form</a>
                            </li>
                            <li>
                                <a href="pages/forms/form-examples.html">form-example</a>
                            </li>
                            <li>
                                <a href="pages/forms/form-validation.html">form-validation</a>
                            </li>
                            <li>
                                <a href="pages/forms/form-wizard.html">form-wizard</a>
                            </li>
                            <li>
                                <a href="pages/ui/modals.html">modals</a>
                            </li>
                            <li>
                                <a href="pages/forms/editors.html">editors</a>
                            </li>
                            <li>
                                <a href="pages/ui/list-group.html">list-group</a>
                            </li>
                            <li>
                                <a href="pages/ui/media-object.html">media-object</a>
                            </li>
                            <li>
                                <a href="pages/tables/normal-tables.html">normal-table</a>
                            </li>
                            <li>
                                <a href="pages/tables/jquery-datatable.html">Jquery-datatable</a>
                            </li>
                            <li>
                                <a href="pages/tables/editable-table.html">Editable Tables</a>
                            </li>

                        </ul>

                    </li>

                </ul>
            </div>
            <!-- #Menu -->
            <!-- Footer -->
            <div class="legal">
                <div class="copyright">
                    &copy; 2016 - 2017 <a href="javascript:void(0);">AdminBSB - Material Design</a>.
                </div>
                <div class="version">
                    <b>Version: </b> 1.0.5
                </div>
            </div>
            <!-- #Footer -->
        </aside>
        <!-- #END# Left Sidebar -->
        <!-- Right Sidebar -->
        <aside id="rightsidebar" class="right-sidebar">
            <ul class="nav nav-tabs tab-nav-right" role="tablist">
                <li role="presentation" class="active"><a href="#skins" data-toggle="tab">SKINS</a></li>
                <li role="presentation"><a href="#settings" data-toggle="tab">SETTINGS</a></li>
            </ul>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active in active" id="skins">
                    <ul class="demo-choose-skin">
                        <li data-theme="red" class="active">
                            <div class="red"></div>
                            <span>Red</span>
                        </li>
                        <li data-theme="pink">
                            <div class="pink"></div>
                            <span>Pink</span>
                        </li>
                        <li data-theme="purple">
                            <div class="purple"></div>
                            <span>Purple</span>
                        </li>
                        <li data-theme="deep-purple">
                            <div class="deep-purple"></div>
                            <span>Deep Purple</span>
                        </li>
                        <li data-theme="indigo">
                            <div class="indigo"></div>
                            <span>Indigo</span>
                        </li>
                        <li data-theme="blue">
                            <div class="blue"></div>
                            <span>Blue</span>
                        </li>
                        <li data-theme="light-blue">
                            <div class="light-blue"></div>
                            <span>Light Blue</span>
                        </li>
                        <li data-theme="cyan">
                            <div class="cyan"></div>
                            <span>Cyan</span>
                        </li>
                        <li data-theme="teal">
                            <div class="teal"></div>
                            <span>Teal</span>
                        </li>
                        <li data-theme="green">
                            <div class="green"></div>
                            <span>Green</span>
                        </li>
                        <li data-theme="light-green">
                            <div class="light-green"></div>
                            <span>Light Green</span>
                        </li>
                        <li data-theme="lime">
                            <div class="lime"></div>
                            <span>Lime</span>
                        </li>
                        <li data-theme="yellow">
                            <div class="yellow"></div>
                            <span>Yellow</span>
                        </li>
                        <li data-theme="amber">
                            <div class="amber"></div>
                            <span>Amber</span>
                        </li>
                        <li data-theme="orange">
                            <div class="orange"></div>
                            <span>Orange</span>
                        </li>
                        <li data-theme="deep-orange">
                            <div class="deep-orange"></div>
                            <span>Deep Orange</span>
                        </li>
                        <li data-theme="brown">
                            <div class="brown"></div>
                            <span>Brown</span>
                        </li>
                        <li data-theme="grey">
                            <div class="grey"></div>
                            <span>Grey</span>
                        </li>
                        <li data-theme="blue-grey">
                            <div class="blue-grey"></div>
                            <span>Blue Grey</span>
                        </li>
                        <li data-theme="black">
                            <div class="black"></div>
                            <span>Black</span>
                        </li>
                    </ul>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="settings">
                    <div class="demo-settings">
                        <p>GENERAL SETTINGS</p>
                        <ul class="setting-list">
                            <li>
                                <span>Report Panel Usage</span>
                                <div class="switch">
                                    <label><input type="checkbox" checked><span class="lever"></span></label>
                                </div>
                            </li>
                            <li>
                                <span>Email Redirect</span>
                                <div class="switch">
                                    <label><input type="checkbox"><span class="lever"></span></label>
                                </div>
                            </li>
                        </ul>
                        <p>SYSTEM SETTINGS</p>
                        <ul class="setting-list">
                            <li>
                                <span>Notifications</span>
                                <div class="switch">
                                    <label><input type="checkbox" checked><span class="lever"></span></label>
                                </div>
                            </li>
                            <li>
                                <span>Auto Updates</span>
                                <div class="switch">
                                    <label><input type="checkbox" checked><span class="lever"></span></label>
                                </div>
                            </li>
                        </ul>
                        <p>ACCOUNT SETTINGS</p>
                        <ul class="setting-list">
                            <li>
                                <span>Offline</span>
                                <div class="switch">
                                    <label><input type="checkbox"><span class="lever"></span></label>
                                </div>
                            </li>
                            <li>
                                <span>Location Permission</span>
                                <div class="switch">
                                    <label><input type="checkbox" checked><span class="lever"></span></label>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </aside>
        <!-- #END# Right Sidebar -->
    </section>

    <section class="content">
      <jsp:include page="<%=inc%>" />
    </section>
  
</body>

</html>