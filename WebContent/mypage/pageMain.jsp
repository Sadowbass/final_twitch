<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8"); %>
        <div class="container-fluid pb-0">
            <div class="row">
                <div class="col-3">
	                <ol>
	                  <a  href="#" id="mypage/profile" onclick="pagemove(this)"> &nbsp; 프로필</a>
	                  <a  href="#" id="broadCasting/index" onclick="pagemove(this)"> &nbsp; 방송하기</a>
	                </ol>	
                </div>
                <%@ include file="pwdchk.jsp" %>
              </div>
          </div>
        <hr>
            
 
        <!-- /.container-fluid -->
    <%@include file="../footer.jsp" %>