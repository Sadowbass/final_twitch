<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8"); %>
<!-- Sidebar -->
<ul class="sidebar navbar-nav">
    <h6 class="sidebar-top">팔로우 중인 채널</h6>
    <li class="nav-item active">
        <a class="nav-link nav-link-sc" href="#" id="main" onclick="pagemove(this)">
            <img src="./img/s1.png" class="sidebar-list-img rounded-circle"></img>
            <div class="sidebar-list-content">
                <div class="sidebar-list-text">
                    <span>방송1</span><br/>
                    <span class="game-category">League of Legends</span>
                </div>
                <div class="sidebar-list-viewer">
                    <i class="fas fa-circle" style="color: red; font-size: 3px"></i>
                    <span style="margin: 0px">3,000</span>
                </div>
            </div>
        </a>
    </li>

    <li class="nav-item active">
        <a class="nav-link nav-link-sc" href="#" id="main" onclick="pagemove(this)">
            <img src="./img/s1.png" class="sidebar-list-img rounded-circle"></img>
            <div class="sidebar-list-content">
                <div class="sidebar-list-text">
                    <span>방송2</span><br/>
                    <span class="game-category">Legends of Runetera</span>
                </div>
                <div class="sidebar-list-viewer">
                    <i class="fas fa-circle" style="color: red; font-size: 3px"></i>
                    <span style="margin: 0px">3,000</span>
                </div>
            </div>
        </a>
    </li>

    <li class="nav-item active">
        <a class="nav-link nav-link-sc" href="#" id="main" onclick="pagemove(this)">
            <img src="./img/s1.png" class="sidebar-list-img rounded-circle"></img>
            <div class="sidebar-list-content">
                <div class="sidebar-list-text">
                    <span>방송3</span><br/>
                    <span class="game-category">World of Warcraft</span>
                </div>
                <div class="sidebar-list-viewer">
                    <i class="fas fa-circle" style="color: red; font-size: 3px"></i>
                    <span style="margin: 0px">3,000</span>
                </div>
            </div>
        </a>
    </li>

    <li class="nav-item active">
        <a class="nav-link nav-link-sc" href="#" id="main" onclick="pagemove(this)">
            <img src="./img/s1.png" class="sidebar-list-img rounded-circle offline"></img>
            <div class="sidebar-list-content">
                <div class="sidebar-list-text">
                    <span>방송4</span><br/>
                    <span class="game-category">League of Legends</span>
                </div>
                <div class="sidebar-list-viewer">
                    <span style="margin: 0px">오프라인</span>
                </div>
            </div>
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
        <h6>추천채널</h6>
        <ul>

            <li class="nav-item">
                <a class="nav-link nav-link-sc" href="#" id="main" onclick="pagemove(this)">
                    <img src="./img/s1.png" class="sidebar-list-img rounded-circle"></img>
                    <div class="sidebar-list-content">
                        <div class="sidebar-list-text">
                            <span>추천1</span><br/>
                            <span class="game-category">League of Legends</span>
                        </div>
                        <div class="sidebar-list-viewer">
                            <i class="fas fa-circle" style="color: red; font-size: 3px"></i>
                            <span style="margin: 0px">3,000</span>
                        </div>
                    </div>
                </a>
            </li>

        </ul>
    </li>

    <nav class="navbar fixed-bottom">
        <form class="sidebar-friend-search">
            <div class="input-group">
                <input type="text" name="findField" id="findField">
                <div class="input-group-append">
                    <button class="btn btn-light" type="button">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </div>
        </form>
    </nav>

</ul>