<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8"); %>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
    <button class="btn btn-link btn-sm text-secondary order-1 order-sm-0" id="sidebarToggle">
        <i class="fas fa-bars"></i>
    </button> &nbsp;&nbsp;
    <a class="navbar-brand mr-1" href="#" id="index" onclick="pagemove(this)"><img class="img-fluid" alt="" src="img/favicon.png"></a>
    <!-- 버튼 -->
		    <button class="btn btn-link" id="btnfollow_m">팔로잉</button>
		    <button class="btn btn-link" id="btnsrc_m">탐색</button>
		    <button class="btn btn-link" id="btnesp_m">e스포츠</button>
		    <button class="btn btn-link" id="btnmusic_m">음악</button>
		   
    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-5 my-2 my-md-0 osahan-navbar-search">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search for...">
            <div class="input-group-append">
                <button class="btn btn-light" type="button">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>
    </form>
    <!-- 로그인 -->
    <button type="button" class="btn btn-primary " data-toggle="modal" data-target="#myModal"> 로그인  </button>
 			   <div class="modal fade" id="myModal">
				    <div class="modal-dialog modal-dialog-centered">
				      <div class="modal-content">
				      
				        <!-- Modal Header -->
				        <div class="modal-header">
				          <h4 class="modal-title">트위치에 로그인 하세요</h4>
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				        </div>
				        
				        <!-- Modal body -->
				        <div class="modal-body">
				      		<%@include file="login.jsp" %>
				      		
				        </div>
				      </div>
				    </div>
				  </div>
    
     <button type="button" class="btn btn-primary " data-toggle="modal" data-target="#myModal1"> 회원가입 </button>
 			   <div class="modal fade" id="myModal1" style="height : auto;">
				    <div class="modal-dialog modal-dialog-centered">
				      <div class="modal-content">
				      
				        <!-- Modal Header -->
				        <div class="modal-header">
				          <h4 class="modal-title">트위치에 회원가입 하세요</h4>
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				        
				        </div>
				        
				        <!-- Modal body -->
				        <div class="modal-body">
				      <%@include file="insertm.jsp" %>
	
				        </div>
				      </div>
				    </div>
				  </div>

      
    </html>