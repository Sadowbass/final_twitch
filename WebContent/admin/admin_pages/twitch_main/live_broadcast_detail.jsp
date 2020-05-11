<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8"> 
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
</head>

<body>
        <div class="container-fluid">
            <h4 class="text-center" style="color: #FFFFFF">생방송 자세히 보기</h4>
            <row>
                <div class="col-xs-8" style="color: #FFFFFF">동영상 플레이어 영역</div>
                <div class="col-xs-4" style="color: #ffffff">
                    <form>
                        <input type="text" name="mId" id="mId"><label> 스트리머 아이디</label>
                        <input type="text" name="subject" id="subject"><label> 제목</label>
                        <input type="text" name="content" id="content"><label> 방송안내</label>
                        <input type="text" name="report" id="report"><label> 신고횟수</label><br/>
                        <input type="button" value="강제종료" style="color: #000000">
                        <input type="button" value="방으로 이동" style="color: #000000">
                        <input type="button" value="뒤로" style="color: #000000">
                    </form>
                </div>
            </row>
        </div>
</body>

</html>
