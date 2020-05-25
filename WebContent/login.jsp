<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta name="description" content="Askbootstrap">
      <meta name="author" content="Askbootstrap">
      <title>VIDOE - Video Streaming Website HTML Template</title>
     
      <!-- Bootstrap core CSS-->
      <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
      <!-- Custom fonts for this template-->
      <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
      <!-- Custom styles for this template
      <link href="css/osahan.css" rel="stylesheet">-->
      <!-- Owl Carousel -->
      <link rel="stylesheet" href="vendor/owl-carousel/owl.carousel.css">
      <link rel="stylesheet" href="vendor/owl-carousel/owl.theme.css">
      <script src="js/login_m.js"></script>
   </head>
   <body class="login-main-body">

      <section class="login-main-wrapper_m">

                     <form action="index.jsp" id='frm_loginm' method='post'>
                        <div class="form-group">
                           <label>아이디</label>
                           <input type="text" class="form-control loginTest" placeholder="ID" 
                           id="text_idm" name="logidm">
                        </div>
                        <div class="form-group">
                           <label>비밀번호</label>
                           <input type="password" class="form-control loginTest" placeholder="Password" 
                           id='text_pwdm' name="logpwdm">
                        </div>
                        <div id="login_msg" class= "login_msg"></div>
                        <div class ="pwd_m">
                        	<a href = "./member/memberSearch.jsp">
                        		<p class="pwd_longin_m">로그인이 안되세요?</p>
                        	</a>	                        	
                        </div>
                    
                        <div class="mt-4">
                           <div class="row">
                              <div class="col-12">
                                 <button disabled="true" type="submit" class="btn btn-primary btn-block btn-lg" 
                                 id="btn_login_m">로그인</button>
                              </div>
                           </div>
                        </div>
                     </form>
                     <div class="text-center mt-5">
                        <p class="light-gray"> <a href="register.jsp"></a></p>
                     </div>
      </section>
      <!-- Bootstrap core JavaScript-->
      <script src="vendor/jquery/jquery.min.js"></script>
      <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      <!-- Core plugin JavaScript-->
      <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
      <!-- Owl Carousel -->
      <script src="vendor/owl-carousel/owl.carousel.js"></script>
      <!-- Custom scripts for all pages-->
      <script src="js/custom.js"></script>
      <script type="text/javascript">
      lm.func();
      	$(function(){
 
      		$('.loginTest').on('input',function(){
      			if($('#text_idm').val() == '' || $('#text_pwdm').val() == ''){
      				$("#btn_login_m").attr("disabled", true);
      			}else{
      				$("#btn_login_m").attr("disabled", false);
      			}		
      			
      		})
      	})
     </script>
      
   </body>
</html>