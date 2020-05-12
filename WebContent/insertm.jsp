<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8"); %>
<div class="container-fluid upload-details">
    <div class="row">
        <div class="col-lg-12">
            <div class="main-title">
                <h4>회원가입</h4>
            </div>
        </div>
    </div>
    <form method='post' name='insert_m' id='insert_m'>
        <div class="row">
            <div class="col-sm-12">
                <div class="forcm-group">
                    <label class="control-label">아이디 <span class="required"></span></label>
                    <input class="form-control border-form-control singUp" value="" placeholder="" type="text" id="suidm">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="control-label">비밀번호 <span class="required"></span></label>
                    <input class="form-control border-form-control singUp" value="" placeholder="" type="password" id="supwdm">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="control-label">비밀번호 확인 <span class="required"></span></label>
                    <input class="form-control border-form-control singUp" value="" placeholder=""type="password" id="supwdm">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="control-label">생년월일<span class="required" ></span></label>
                    <input class="form-control border-form-control singUp" value="" placeholder="년도/월/일" 
                    type="date"  id="sudatem">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="control-label">이메일<span class="required"></span></label>
                    <input class="form-control border-form-control singUp" value="" placeholder="twich@gmail.com"
                         type="email" id="suemailm">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="control-label">자기소개<span class="required"></span></label>
                  	<textarea cols="50" rows ="8" class="form-control"  placeholder="글내용" maxlength="200"
						style="width : 440px; height : 150px; resize : none;"></textarea>
                </div>
            </div>
        </div>
        
      
        <div class="row">
            <div class="col-lg-12 text-center">
                <button type="button" disabled="true" class="btn btn-primary btn-block btn-lg" id="btnsum">회원가입</button>
            </div>
        </div>
    </form>
    
    <script>
   	function numberMaxLength(e){
    if(e.value.length > e.maxLength){
    	e.value = e.value.slice(0, e.maxLength);
    	}
    	}   
    $(function(){
    	$('.singUp').on('input',function(){
      	if($('#suidm').val() == '' || $('#supwdm').val() == ''|| $('#sudatem').val() == ''|| $('#suemailm').val() == ''|| $('#suprofile').val() == ''){
      		$("#btnsum").attr("disabled", true);
      		}else{
      		$("#btnsum").attr("disabled", false);
      		}			
      		})
      	})
    	 lm.func();
    	
    </script>
</div>


