<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8"); %>
<!-- Sidebar -->
<ul class="sidebar navbar-nav">
    <li class="nav-item active">
        <a class="nav-link" href="#" id="main" onclick="pagemove(this)">
            <i class="fas fa-fw fa-home"></i>
            <span>Home</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="#" id="channels" onclick="pagemove(this)">
            <i class="fas fa-fw fa-users"></i>
            <span>Channels</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="#" id="single-channel" onclick="pagemove(this)">
            <i class="fas fa-fw fa-user-alt"></i>
            <span>Single Channel</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="#" id="video-page" onclick="pagemove(this)">
            <i class="fas fa-fw fa-video"></i>
            <span>Video Page</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="#" id="upload-video" onclick="pagemove(this)">
            <i class="fas fa-fw fa-cloud-upload-alt"></i>
            <span>Upload Video</span>
        </a>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
           aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>Pages</span>
        </a>
        <div class="dropdown-menu">
            <h6 class="dropdown-header">Login Screens:</h6>
            <a class="dropdown-item" href="login.jsp" id="login" onclick="pagemove(this)">Login</a>
            <a class="dropdown-item" href="register.jsp" id="register" onclick="pagemove(this)">Register</a>
            <a class="dropdown-item" href="forgot-password.jsp" id="forgot-password" onclick="pagemove(this)">Forgot
                Password</a>
            <div class="dropdown-divider"></div>
            <h6 class="dropdown-header">Other Pages:</h6>
            <a class="dropdown-item" href="#" id="blog" onclick="pagemove(this)">Blog</a>
            <a class="dropdown-item" href="#" id="blog-detail" onclick="pagemove(this)">Blog Detail</a>
            <a class="dropdown-item" href="#" id="blank" onclick="pagemove(this)">Blank Page</a>
            <a class="dropdown-item" href="#" id="404" onclick="pagemove(this)">404 Page</a>
            <a class="dropdown-item" href="#" id="content" onclick="pagemove(this)">Contact</a>
        </div>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="#" id="history-page" onclick="pagemove(this)">
            <i class="fas fa-fw fa-history"></i>
            <span>History Page</span>
        </a>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
           aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-list-alt"></i>
            <span>Categories</span>
        </a>
        <div class="dropdown-menu">
            <a class="dropdown-item" href="#" id="categories" onclick="pagemove(this)">Movie</a>
            <a class="dropdown-item" href="#" id="categories" onclick="pagemove(this)">Music</a>
            <a class="dropdown-item" href="#" id="categories" onclick="pagemove(this)">Television</a>
        </div>
    </li>
    <li class="nav-item channel-sidebar-list">
        <h6>SUBSCRIPTIONS</h6>
        <ul>
            <li>
                <a href="#" id="subscriptions" onclick="pagemove(this)">
                    <img class="img-fluid" alt="" src="img/s1.png"> Your Life
                </a>
            </li>
            <li>
                <a href="#" id="subscriptions" onclick="pagemove(this)">
                    <img class="img-fluid" alt="" src="img/s2.png"> Unboxing <span
                        class="badge badge-warning">2</span>
                </a>
            </li>
            <li>
                <a href="#" id="subscriptions" onclick="pagemove(this)">
                    <img class="img-fluid" alt="" src="img/s3.png"> Product / Service
                </a>
            </li>
            <li>
                <a href="#" id="subscriptions" onclick="pagemove(this)">
                    <img class="img-fluid" alt="" src="img/s4.png"> Gaming
                </a>
            </li>
        </ul>
    </li>
</ul>
