<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8"); %>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
<div class="container-fluid upload-details">
    <div class="row">
           
        <div class="col-lg-12">
            <div class="main-title" style="float:left;">
                   <br/>
                <h5 style="font-weight: bold;">프로필 사진</h5>
            </div>
        </div>
        <div class="col-lg-7">
           <div class="card">
	            <div class="card-body">
		   			<form action="" method="post" name="pwdm" id="pwdm">
		        		<input  type='file' class="imgInp" id="imgInp"  style="padding-left : 200px;" />
			   				<div class="imgm" id="imgm" style="width: 150px; height: 120px; overflow: hidden">
			        		<img class="foo" id="foo"src="#" style="width: 150px; height: 120px;"/>
			        		</div>
			    	</form>
	  			</div>
  			</div>
    	</div>
    	
    	<div class="col-lg-12">
            <div class="main-title">
                <h5 style="font-weight: bold">개인정보 변경</h5>
            </div>
        </div>
        <div class="col-lg-7">
           <div class="card">
	            <div class="card-body">
		   			<form method="post" name="pwdm">
		   			<input type="text" value="${session_id }" name="idchkm">
		   			<div class="row">
            			<div class="col-sm-5">
            			    <input class="form-control border-form-control singUp" type="hidden" id="suidm" name="suidm" value="${vo.mem_Id }">
			   				<label class="control-label">비밀번호 <span class="required"></span></label>
                    		<input class="form-control border-form-control singUp" placeholder="6자리 ~ 22자리 이내로 입력해주세요." type="password" id="supwdm" name="supwdm" value="${vo.mem_pwd }">
		                    <div id='supwdmck' class='supwdmck'></div>
		                    <label class="control-label">비밀번호 확인 <span class="required"></span></label>
                   			<input class="form-control border-form-control singUp" placeholder=""type="password" id="supwdcm">	
                   			<div id='supwdcmck' class='supwdcmck'></div>
		                    <label class="control-label">생년월일<span class="required" ></span></label>
		                    <input class="form-control border-form-control singUp" placeholder="년도/월/일" type="date"  id="subirthm" name="subirthm" value="${vo.mem_brith }">
		                    <label class="control-label">이메일<span class="required"></span></label>
		                    <input class="form-control border-form-control singUp" placeholder="twich@gmail.com" type="email" id="suemailm" name="suemailm" value="${vo.mem_profile }">
		  		        		</div>
		  		        	</div>
		  		        </div>		
			    </form>
	  		</div>
  		</div>
   	</div>
      	  <div class="col-lg-12">
            <div class="main-title">
            	<br/>
                <h5 style="font-weight: bold">자기 소개 수정</h5>
            </div>
            <form method="post" name="pwdm">
             <textarea placeholder="200이내로 작성해 주세요"
              id="e1" class="form-control" maxlength="200" style="width : 800px; height : 150px; resize : none;"></textarea>
              </form>
                  </div>
             </div>
    
        <div class="container">
        		<div class="row">
            		<div class="col text-center">
                		<button class="btn btn-primary" id="btnUpdatem" name="btnUpdatem" >저장</button>
            		</div>
            	</div>
         </div>
        
  
<!-- /.container-fluid -->
<!-- Sticky Footer -->
<%@include file="../footer.jsp" %>
<script type="text/javascript">
lm.func();
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('.foo').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $(".imgInp").change(function() {
        readURL(this);
    });

    
    function readURL1(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('.foo_m').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $(".imgInp_m").change(function() {
        readURL1(this);
    });
</script>