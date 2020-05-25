<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand navbar-light bg-white osahan-nav" ><!-- sticky-top static-top fixed-top -->

    <button class="btn btn-link btn-sm text-secondary order-1 order-sm-0" id="sidebarToggle">
    
        <i class="fas fa-bars"></i>

    </button> &nbsp;&nbsp;

    <a class="navbar-brand mr-1" href="/" id="main" onclick="pagemove(this)">
    <img class="img-fluid" alt="" src="img/favicon.png"> &nbsp;Twitch</a>

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
    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0 osahan-left-navbar">
        <li class="nav-item mx-1">
            <a class="nav-link" href="#" id="upload" onclick="pagemove(this)">
                <i class="fas fa-plus-circle fa-fw"></i>
                Upload Video
            </a>
        </li>
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <span class="badge badge-danger">9+</span>
            </a>

            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
                <a class="dropdown-item" href="#"><i class="fas fa-fw fa-edit "></i> &nbsp; Action</a>
                <a class="dropdown-item" href="#"><i class="fas fa-fw fa-headphones-alt "></i> &nbsp; Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#"><i class="fas fa-fw fa-star "></i> &nbsp; Something else here</a>

            </div>

        </li>

        <li class="nav-item dropdown no-arrow mx-1">

            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown"

               aria-haspopup="true" aria-expanded="false">

                <i class="fas fa-envelope fa-fw"></i>

                <span class="badge badge-success">7</span>

            </a>

            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">

                <a class="dropdown-item" href="#"><i class="fas fa-fw fa-edit "></i> &nbsp; Action</a>

                <a class="dropdown-item" href="#"><i class="fas fa-fw fa-headphones-alt "></i> &nbsp; Another action</a>

                <div class="dropdown-divider"></div>

                <a class="dropdown-item" href="#"><i class="fas fa-fw fa-star "></i> &nbsp; Something else here</a>

            </div>

        </li>


        <li class="nav-item dropdown no-arrow osahan-right-navbar-user">
            <a class="nav-link dropdown-toggle user-dropdown-link" href="#" id="userDropdown" role="button"

               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                <img alt="Avatar" src="img/user.png">
            </a>
       

            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">

                <a class="dropdown-item" href="#" id="account" onclick="pagemove(this)"><i class="fas fa-fw fa-user-circle"></i> &nbsp; MyAccount</a>
      <c:if test="${session_id != null }">
                <a class="dropdown-item" href="#" id="mypage/pwdchk" onclick="pagemove(this)"><i class="fas fa-fw fa-cog"></i> &nbsp; 프로필</a>
                <a class="dropdown-item" href="#" id="broadCasting/index" onclick="pagemove(this)"><i class="fas fa-fw fa-video"></i> &nbsp; 방송하기</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#"> <i class="fas fa-fw fa-sign-out-alt" ></i>
		<input type='button' value='로그아웃' id='btn_logout_m' style="border : 0; outline : 0;" />
	  		</a>
	  		</c:if>
            </div>

        </li>

    </ul>

 <c:if test="${empty session_id }">
    <button type="button" class="btn btn-primary" id="btnloginm" data-backdrop="static" data-toggle="modal" data-target="#myModal" style="float: right; margin-right : 10px; margin-left : 10px;"> 로그인  </button>
     <button type="button" class="btn btn-primary " data-toggle="modal" data-target="#myModal1" style="float: right;"> 회원가입 </button>
 			   <div class="modal fade" id="myModal1" style="height : auto;">
				    <div class="modal-dialog modal-dialog-centered fixed-top">
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
    
    </c:if>
			   <div class="modal fade" id="myModal">
				    <div class="modal-dialog modal-dialog-centered fixed-top" >
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

<input type='text' name="suidm" value="${session_id}"/>
<input type='text' name="supwdm" value="${vo.getMem_pwd}"/>
 		
</nav>
<!-- 영탁 -->



<script>lm.func();</script>
 


    </html>

