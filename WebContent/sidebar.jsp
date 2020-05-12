<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8"); %>
<!-- Sidebar -->
<ul class="sidebar navbar-nav">
    <h6 class="sidebar-top">팔로우 중인 채널</h6>
    <li class="nav-item">
        <a class="nav-link nav-link-sc" href="faker.sc" id="main">
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

    <li class="nav-item">
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

    <li class="nav-item">
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

    <li class="nav-item">
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
    <div>
        <button class="btn btn-link">
            <span style="color: #ffffff; font-size: 15px">더 보기</span>
        </button>
    </div>
    <li class="nav-item channel-sidebar-list">
        <h6>추천채널</h6>
        <ul>
            <li class="nav-item" style="margin-bottom: 0;">
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
        <div>
            <button class="btn btn-link">
                <span style="color: #ffffff; font-size: 15px">더 보기</span>
            </button>

            <!-- 관욱 테스트 -->
            <p/>
            <button class="btn btn-link" onclick="uk.streamGo()">
                <span style="color: #ffffff; font-size: 15px">streaming_page</span>
            </button>
            <!-- 관욱 테스트 -->

        </div>
    </li>
</ul>
<form class="sidebar-friend-search fixed-bottom" style="right: auto;">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1"><i class="fas fa-search"></i></span>
        </div>
        <input type="text" class="form-control" placeholder="검색할 친구를 입력하세요" aria-label="Username" aria-describedby="basic-addon1">
    </div>
</form>