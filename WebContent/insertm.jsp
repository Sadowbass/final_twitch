<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8"); %>
<script src="./js/login_m.js"></script>
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
                    <input class="form-control border-form-control singUp" minlength='2' maxlength="16" placeholder="영어 대소문자 최소 2글자 이상 최대 16글자 이하" type="text" id="suidm" name="suidm">
                    <div id='suidmck' class='suidmck'></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="control-label">비밀번호 <span class="required"></span></label>
                    <input class="form-control border-form-control singUp" placeholder="6자리 ~ 22자리 이내로 입력해주세요." type="password" id="supwdm" name="supwdm">
                    <div id='supwdmck' class='supwdmck'></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="control-label">비밀번호 확인 <span class="required"></span></label>
                    <input class="form-control border-form-control singUp" placeholder=""type="password" id="supwdcm">
                    <div id='supwdcmck' class='supwdcmck'></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="control-label">생년월일<span class="required" ></span></label>
                    <input class="form-control border-form-control singUp" placeholder="년도/월/일" type="date"  id="subirthm" name="subirthm">
                    <div id='subirthmck' class='subirthmck'></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="control-label">이메일<span class="required"></span></label>
                    <input class="form-control border-form-control singUp" placeholder="twich@gmail.com" 
                    type="email" id="suemailm" name="suemailm">
                    <div id='suemailmck' class='suemailmck'></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="control-label">자기소개<span class="required"></span></label>
                  	<textarea name="suprofilem" class="form-control"  placeholder="200이내로 작성해 주세요" maxlength="200"
						style="width : 440px; height : 150px; resize : none;"></textarea>
					<div id='suprofilemck' class='suprofilemck'></div>
                </div>
            </div>
        </div>
        
				    <p>회원으로 가입하면 <a href=''>서비스 약관</a>과 <a href=''>개인정보 처리방침</a>을 읽고 이해한 것으로 간주됩니다.</p>
      
        <div class="row">
            <div class="col-lg-12 text-center">
                <button type="button" disabled="true" class="btn btn-primary btn-block btn-lg" id="btnsum">회원가입</button>
            </div>
        </div>
    

    
    </form>
    
    
    
    <script>
    lm.func();
    
   	function numberMaxLength(e){
    if(e.value.length > e.maxLength){
    	e.value = e.value.slice(0, e.maxLength);
    	}
    	}   
    $(function(){
    	$('.singUp').on('input',function(){
      	if($('#suidm').val() == '' || $('#supwdm').val() == ''|| $('#supwdcm').val() == ''|| $('#subirthm').val() == ''|| $('#suemailm').val() == ''){
      		$("#btnsum").attr("disabled", true);
      		}else{
      		$("#btnsum").attr("disabled", false);
      		}			
      		})
      	})
      	
    	
    </script>
</div>


