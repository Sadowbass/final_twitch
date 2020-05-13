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
        <div class="col-lg-12">
            <div class="main-title">
                <h6>프로필 사진</h6>
            </div>
        </div>
        <div class="col-lg-2">
            <div class="imgplace"></div>
        </div>
        <div class="col-lg-10">
           <div class="card">
	            <div class="card-body">
		   			<form action="" method="">
		        		<input  type='file' class="imgInp" id="imgInp"  style="margin:0 0 0 150px;" />
			   				<div class="imgm" id="imgm" style="width: 90px; height: 60px; overflow: hidden">
			        		<img class="foo" id="foo"src="#" style="width: 90px; height: 60px;"/>
			        		</div>
			    	</form>
	  			</div>
  			</div>
    	</div>
    <div class="col-lg-12">
            <div class="main-title">
                <h6>프로필 배너</h6>
            </div>
        </div>
        <div class="col-lg-2">
            <div class="imgplace"></div>
        </div>
        <div class="col-lg-10">
           <div class="card">
	            <div class="card-body">
		   			<form action="" method="">
		        		<input  type='file' class="imgInp_m" id="imgInp_m" style="margin:0 0 0 150px;" />
			   				<div class="imgmm" id="imgmm" style="width: 150px; height: 90px; overflow: hidden">
			        		<img class="foo_m" id="foo_m" src="#" style="width: 150px; height: 90px;"/>
			        		</div>
			    	</form>
	  			</div>
  			</div>
    	</div>
    <hr>
    <div class="row">
        <div class="col-lg-12">
            <div class="osahan-form">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label for="e1">Video Title</label>
                            <input type="text" placeholder="Contrary to popular belief, Lorem Ipsum (2020) is not."
                                   id="e1" class="form-control">
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label for="e2">About</label>
                            <textarea rows="3" id="e2" name="e2" class="form-control">Description</textarea>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="e3">Orientation</label>
                            <select id="e3" class="custom-select">
                                <option>Straight</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="e4">Privacy Settings</label>
                            <select id="e4" class="custom-select">
                                <option>Public</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="e5">Monetize</label>
                            <select id="e5" class="custom-select">
                                <option>Yes</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="e6">License</label>
                            <select id="e6" class="custom-select">
                                <option>Standard</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5">
                        <div class="form-group">
                            <label for="e7">Tags (13 Tags Remaining)</label>
                            <input type="text" placeholder="Gaming, PS4" id="e7" class="form-control">
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="e8">Cast (Optional)</label>
                            <input type="text" placeholder="Nathan Drake," id="e8" class="form-control">
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="e9">Language in Video (Optional)</label>
                            <select id="e9" class="custom-select">
                                <option>English</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-lg-12">
                        <div class="main-title">
                            <h6>Category ( you can select upto 6 categories )</h6>
                        </div>
                    </div>
                </div>
             
            </div>
            <div class="osahan-area text-center mt-3">
                <button class="btn btn-outline-primary">Save Changes</button>
            </div>
            <hr>
            <div class="terms text-center">
                <p class="mb-0">There are many variations of passages of Lorem Ipsum available, but the majority <a
                        href="#">Terms of Service</a> and <a href="#">Community Guidelines</a>.</p>
                <p class="hidden-xs mb-0">Ipsum is therefore always free from repetition, injected humour, or non</p>
            </div>
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