<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Kakao Talk Channel Chat Button Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="localhost/store/">Home</a></li>
            <li><a href="">Store</a></li>
            <li class="active">Q & A</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-3">
            <ul class="list-group margin-bottom-25 sidebar-menu">
              <li class="list-group-item clearfix"><a href="javascript:;" onclick="store.qna()"><i class="fa fa-angle-right"></i> 자주 묻는 질문</a></li>
              <li class="list-group-item clearfix"><a href="javascript:;" onclick="store.inquiry()"><i class="fa fa-angle-right"></i> 1:1 문의</a></li>
            
            </ul>
          </div>
          <!-- END SIDEBAR -->
             
          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-9">
            <h1>1:1 문의</h1>
             <div class='col-md-12 col-xs-6' style='margin-top:5%'>
		
		<div id="kakao-talk-channel-chat-button"></div>
	
   </div>
             
               
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>
    
    
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
 
    Kakao.init('d1d52a6f2e6fcf4dfdec6cbc4fa58d1a'); //
   
    // 카카오톡 채널 1:1채팅 버튼을 생성합니다.
    Kakao.Channel.createChatButton({
      container: '#kakao-talk-channel-chat-button',
      channelPublicId: '_cXCxexb' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
    });
  
  //]]>
</script>
</body>
</html>