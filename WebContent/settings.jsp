<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8"); %>
<div class="container-fluid upload-details">
    <div class="row">
        <div class="col-lg-12">
            <div class="main-title">
                <h6>회원가입</h6>
            </div>
        </div>
    </div>
    <form>
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
               <label>생년월일</label>
            <div class="col-sm-3">
                <div class="form-group">
                    <label class="control-label"><span class="required" ></span></label>
                    <input class="form-control border-form-control singUp" value="" placeholder="년" 
                    type="number" maxlength="4" oninput="numberMaxLength(this);" id="suyearm">
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label"><span class="required singUp"></span></label>
                    <select class="custom-select">
                    <option value="">월</option>
                        <option value="1">1월</option>
                        <option value="2">2월</option>
                        <option value="3">3월</option>
                        <option value="4">4월</option>
                        <option value="5">5월</option>
                        <option value="6">6월</option>
                        <option value="7">7월</option>
                        <option value="8">8월</option>
                        <option value="9">9월</option>
                        <option value="10">10월</option>
                        <option value="11">11월</option>
                        <option value="12">12월</option>
                        
                    </select>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="form-group">
                    <label class="control-label"> <span class="required singUp"></span></label>
                  <input class="form-control border-form-control singUp" value="" placeholder="일"
                        type="number" maxlength="2" oninput="numberMaxLength(this);" id="sudaym">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="control-label">이메일<span class="required"></span></label>
                    <input class="form-control border-form-control singUp" value="" placeholder="twich@gmail.com"
                         type="email" id="suemailm">
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
      			if($('#suidm').val() == '' || $('#supwdm').val() == ''|| $('#suyearm').val() == ''|| $('#sudaym').val() == ''|| $('#suemailm').val() == ''){
      				$("#btnsum").attr("disabled", true);
      			}else{
      				$("#btnsum").attr("disabled", false);
      			}		
      			
      		})
      	})
    	
    	
    </script>
</div>


