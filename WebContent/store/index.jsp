<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<!--
Template: Metronic Frontend Freebie - Responsive HTML Template Based On Twitter Bootstrap 3.3.4
Version: 1.0.0
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase Premium Metronic Admin Theme: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
  <meta charset="utf-8">
  <title>twitch_store</title>

  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <meta content="Metronic Shop UI description" name="description">
  <meta content="Metronic Shop UI keywords" name="keywords">
  <meta content="keenthemes" name="author">

  <meta property="og:site_name" content="-CUSTOMER VALUE-">
  <meta property="og:title" content="-CUSTOMER VALUE-">
  <meta property="og:description" content="-CUSTOMER VALUE-">
  <meta property="og:type" content="website">
  <meta property="og:image" content="-CUSTOMER VALUE-"><!-- link to image for socio -->
  <meta property="og:url" content="-CUSTOMER VALUE-">

  <link rel="shortcut icon" href="../img/favicon.png">

  <!-- Fonts START -->
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css"><!--- fonts for slider on the index page -->  
  <!-- Fonts END -->

  <!-- Global styles START -->          
  <link href="./assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="./assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Global styles END --> 
   
  <!-- Page level plugin styles START -->
  <link href="./assets/pages/css/animate.css" rel="stylesheet">
  <link href="./assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
  <link href="./assets/plugins/owl.carousel/./assets/owl.carousel.css" rel="stylesheet">
  <link href="./assets/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">
  <link href="./assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin styles END -->

  <!-- Theme styles START -->
  <link href="./assets/pages/css/components.css" rel="stylesheet">
  <link href="./assets/pages/css/slider.css" rel="stylesheet">
  <link href="./assets/pages/css/style-shop.css" rel="stylesheet" type="text/css">
  <link href="./assets/corporate/css/style.css" rel="stylesheet">
  <link href="./assets/corporate/css/style-responsive.css" rel="stylesheet">
  <link href="./assets/corporate/css/themes/purple.css" rel="stylesheet" id="style-color">
  <link href="./assets/corporate/css/custom.css" rel="stylesheet">
  
  
  <link href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css"><!-- for slider-range -->
  
  
  <script src="./js/store.js?ver=<%=System.currentTimeMillis() %>"></script>

  
  <!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="ecommerce">
  <%
  request.setCharacterEncoding("utf-8");

  String inc = "mainPage.jsp";
  if(request.getParameter("inc") != null){
	   inc  = request.getParameter("inc");
  }
  %>

    <!-- BEGIN HEADER -->
     <div>
       <%@include file = "./top.jsp" %>
     </div>
    <!-- Header END -->
    
    <!-- Begin Main -->
       <div id="sh_main">
         <jsp:include page="<%=inc %>"></jsp:include>
       </div> 
    <!-- Main End -->   

    <!-- BEGIN PRE-FOOTER -->
    <div>
      <%@include file = "./bottom.jsp" %>
    </div>
   
    <!-- END FOOTER -->

    

    <!-- Load javascripts at bottom, this will reduce page load time -->
    <!-- BEGIN CORE PLUGINS (REQUIRED FOR ALL PAGES) -->
    <!--[if lt IE 9]>
    <script src="./assets/plugins/respond.min.js?ver=<%=System.currentTimeMillis() %>"></script>  
    <![endif]-->
    <!--  <script src="./lib/jquery-3.4.1.js?ver=<%=System.currentTimeMillis() %>"></script>  -->
    <script src="./assets/plugins/jquery.min.js?ver=<%=System.currentTimeMillis() %>" type="text/javascript">
  
    </script>
    <script src="./assets/plugins/jquery-migrate.min.js?ver=<%=System.currentTimeMillis() %>" type="text/javascript"></script>
    <script src="./assets/plugins/bootstrap/js/bootstrap.min.js?ver=<%=System.currentTimeMillis() %>" type="text/javascript"></script>      
    <script src="./assets/corporate/scripts/back-to-top.js?ver=<%=System.currentTimeMillis() %>" type="text/javascript"></script>
    <script src="./assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js?ver=<%=System.currentTimeMillis() %>" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->

    <!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
    <script src="./assets/plugins/fancybox/source/jquery.fancybox.pack.js?ver=<%=System.currentTimeMillis() %>" type="text/javascript"></script><!-- pop up -->
    <script src="./assets/plugins/owl.carousel/owl.carousel.min.js?ver=<%=System.currentTimeMillis() %>" type="text/javascript">
 
    </script><!-- slider for products -->
    <script src='./assets/plugins/zoom/jquery.zoom.min.js?ver=<%=System.currentTimeMillis() %>' type="text/javascript"></script><!-- product zoom -->
    <script src="./assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js?ver=<%=System.currentTimeMillis() %>" type="text/javascript"></script><!-- Quantity -->
    <script src="./assets/plugins/uniform/jquery.uniform.min.js?ver=<%=System.currentTimeMillis() %>" type="text/javascript"></script>
 
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js?ver=<%=System.currentTimeMillis() %>" type="text/javascript"></script><!-- for slider-range -->
    <script src="./assets/corporate/scripts/layout.js?ver=<%=System.currentTimeMillis() %>" type="text/javascript"></script>
    <script src="./assets/pages/scripts/bs-carousel.js?ver=<%=System.currentTimeMillis() %>" type="text/javascript"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js?ver=<%=System.currentTimeMillis() %>"></script> <!-- swal -->
    <script type="text/javascript">
        //jQuery.noConflict();
        jQuery(document).ready(function() {
            Layout.init();    
            Layout.initOWL();
            Layout.initImageZoom();
            Layout.initTouchspin();
            Layout.initTwitter();
            Layout.initSliderRange();
            Layout.initUniform();
        });
    </script>
    <script type="text/javascript">
   
      store.func();
      
	
      
     
     
    </script>
    <!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>