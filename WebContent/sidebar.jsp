<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Sidebar -->
<style>
    .rounded-circle{
        width: 32px;
        height: 32px;
    }
</style>
<ul class="sidebar navbar-nav" id="sidebar-navmain">
    <c:choose>
        <c:when test="${login != null}">
            <h6 class="sidebar-top">팔로우 중인 채널</h6>
        </c:when>
        <c:otherwise>
            <h6 class="sidebar-top">추천 채널</h6>
        </c:otherwise>
    </c:choose>

    <c:forEach var="i" items="${list}">
        <li class="nav-item">
            <a href="/${i.air_mid}">
                <div class="nav-link nav-link-sc" id="${i.air_mid }">
                    <c:choose>
                        <c:when test="${i.ph_sysfile == null}">
                            <img src="/img/s1.png" class="sidebar-list-img rounded-circle"></img>
                        </c:when>
                        <c:otherwise>
                            <img src="/img/user-photo/${i.ph_sysfile}" class="sidebar-list-img rounded-circle"></img>
                        </c:otherwise>
                    </c:choose>

                    <div class="sidebar-list-content">
                        <div class="sidebar-list-text">
                            <span>${i.air_mid}</span><br/>
                            <span class="game-category">${i.air_gname}</span>
                        </div>
                        <div class="sidebar-list-viewer">
                            <i class="fas fa-circle" style="color: red; font-size: 3px"></i>
                            <span style="margin: 0px;">${i.cnt}</span>
                        </div>
                    </div>
                </div>
            </a>
        </li>
    </c:forEach>


</ul>

<ul class="sidebar navbar-nav" id="sidebar-friendlist">
    <li class="nav-item">
        <div class="nav-link nav-link-sc" id="<c:out value="${i.air_mid}"/>">
            <img src="/img/s1.png" class="sidebar-list-img rounded-circle"></img>
            <div class="sidebar-list-content">
                <div class="sidebar-list-text">
                    <span>${i.air_mid}</span><br/>
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