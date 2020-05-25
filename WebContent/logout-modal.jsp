<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><img src="/img/favicon.png">트위치TV</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">트위치에서 로그아웃 하시겠어요?</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                <button class="btn btn-primary" id="logout-button">로그아웃</button>
            </div>
        </div>
    </div>
</div>

<script>
    $('#logout-button').click(function () {
        $.ajax({
            url:'/logout.sc',
            type:'get',
            error:function (err) {
                console.log(err);
            },
            success:function () {
                location.href="/";
            }
        })
    })
</script>