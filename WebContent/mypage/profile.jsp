<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8"); %>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <script src="../css/mypage.css"></script>
<div class="container-fluid upload-details">
    <div class="row">
    <div class="col-3">
	                <ol>
	                  <a  href="#" id="mypage/profile" onclick="pagemove(this)"> &nbsp; 프로필</a>
	                  <a  href="#" id="broadCasting/index" onclick="pagemove(this)"> &nbsp; 방송하기</a>
	                </ol>	
                </div>
        <div class="col-lg-12">
            <div class="main-title">
                <h5 style="font-weight: bold">프로필 사진</h5>
            </div>
        </div>
        <div class="col-lg-10">
           <div class="card">
	            <div class="card-body">
		   			<form action="" method="post">
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
            	<br/>
                <h5 style="font-weight: bold">프로필 배너</h5>
            </div>
        </div>
        <div class="col-lg-10">
           <div class="card">
	            <div class="card-body">
		   			<form action="" method="post">
		        		<input  type='file' class="imgInp_m" id="imgInp_m" style="padding-left : 200px;" />
			   				<div class="imgmm" id="imgmm" style="width: 150px; height: 120px; overflow: hidden">
			        		<img class="foo_m" id="foo_m" src="#" style="width: 150px; height: 120px;"/>
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
                            <textarea placeholder="200이내로 작성해 주세요"
                                   id="e1" class="form-control" maxlength="200" style="width : 1360px; height : 150px; resize : none;"></textarea>
                  </div>
             </div>
     	</div>
        <div class="container">
        		<div class="row">
            		<div class="col text-center">
                		<button class="btn btn-primary">저장</button>
            		</div>
            	</div>
         </div>
            
  
<!-- /.container-fluid -->
<!-- Sticky Footer -->
<%@include file="../footer.jsp" %>
<script type="text/javascript">
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