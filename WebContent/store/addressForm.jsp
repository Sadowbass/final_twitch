<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="">Store</a></li>
            <li class="active">My Page</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
           <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-3">
            <ul class="list-group margin-bottom-25 sidebar-menu">
              <li class="list-group-item clearfix"><a href="javascript:;" onclick="store.myPage()"><i class="fa fa-angle-right"></i> 주문 내역</a></li>
              <li class="list-group-item clearfix"><a href="javascript:;" onclick="store.addressInsert()"><i class="fa fa-angle-right"></i> 배송지입력</a></li>
              <li class="list-group-item clearfix"><a href="javascript:;" onclick="store.wishList()"><i class="fa fa-angle-right"></i> 위시리스트</a></li>
            </ul>
          </div>
          <!-- END SIDEBAR -->
           
           <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-7">
            <h1>배송 정보</h1>
            <div class="content-form-page">
              <form role="form" class="form-horizontal form-without-legend">
                <div class="form-group">
                
                  <label class="col-lg-2 control-label" for="first-name">우편번호 <span class="require">*</span></label>
                   <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" >
                  <div class="col-lg-8">
                    <input type="text" id="sample4_postcode" placeholder="우편번호" class="form-control">
          
                  </div>
                 </div>
                 
                 <div class="form-group">  
                  <label class="col-lg-2 control-label" for="first-name">도로명 주소<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="text" id="sample4_roadAddress" placeholder="도로명주소" class="form-control">
                  </div>
                 </div>
                 
                 <div class="form-group"> 
                  <label class="col-lg-2 control-label" for="first-name">지번 주소<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="text" id="sample4_jibunAddress" placeholder="지번주소" class="form-control">
                  </div>
               </div>
               
                  <span id="guide" style="color:#999"></span>
                  
               
               
                <div class="row">
                  <div class="col-lg-8 col-md-offset-6 padding-left-0 padding-top-20">
                    <button class="btn btn-primary" type="submit">확인</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
          <!-- END CONTENT -->
         
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>
    
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
 
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
 
                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
 
                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
</body>
</html>