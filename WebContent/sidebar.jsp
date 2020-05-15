<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Sidebar -->
<ul class="sidebar navbar-nav" id="sidebar-navmain">
    <h6 class="sidebar-top">팔로우 중인 채널</h6>

    <c:forEach var="i" items="${list}">
        <li class="nav-item">
            <div class="nav-link nav-link-sc" onclick="javascript:onair('<c:out value="${i.air_mId}"/>')"
                 id="<c:out value="${i.air_mId}"/>">
                <img src="./img/s1.png" class="sidebar-list-img rounded-circle"></img>
                <div class="sidebar-list-content">
                    <div class="sidebar-list-text">
                        <span>${i.air_mId}</span><br/>
                        <span class="game-category">${i.air_gName}</span>
                    </div>
                    <div class="sidebar-list-viewer">
                        <i class="fas fa-circle" style="color: red; font-size: 3px"></i>
                        <span style="margin: 0px;">4,000</span>
                    </div>
                </div>
            </div>
        </li>
    </c:forEach>

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

        </div>
    </li>
</ul>

<ul class="sidebar navbar-nav" id="sidebar-friendlist">
    <li class="nav-item">
        <div class="nav-link nav-link-sc" id="<c:out value="${i.air_mId}"/>" onclick="">
            <img src="./img/s1.png" class="sidebar-list-img rounded-circle"></img>
            <div class="sidebar-list-content">
                <div class="sidebar-list-text">
                    <span>${i.air_mId}</span><br/>
                </div>
                <div class="sidebar-list-viewer">
                    <i class="fas fa-user-plus" style="font-size: 3px"></i>
                </div>
            </div>
        </div>
    </li>
</ul>

<form class="sidebar-friend-search fixed-bottom" style="right: auto;">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1">
                <i class="fas fa-search"></i>
            </span>
        </div>
        <input type="text" id='sidebar-friend-search' class="form-control" id="search-bar"
               placeholder="검색할 친구를 입력하세요" aria-label="Username"
               aria-describedby="basic-addon1">
    </div>
</form>