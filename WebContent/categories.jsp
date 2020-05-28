<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Askbootstrap">
    <meta name="author" content="Askbootstrap">
    <title>JHTA-Twitch</title>
    <!-- Favicon Icon -->
    <link rel="icon" type="image/png" href="/img/favicon.png">
    <!-- Bootstrap core CSS-->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
          type="text/css">
    <!-- Custom styles for this template-->
    <link href="/css/osahan.css" rel="stylesheet">
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="/vendor/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="/vendor/owl-carousel/owl.theme.css">
    <link rel="stylesheet" href="/css/sc_custom.css">
    <link rel="stylesheet" href="/css/css_uk.css">
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Owl Carousel -->
    <script src="/vendor/owl-carousel/owl.carousel.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="/js/custom.js"></script>
    <script src="/js/sc_custom.js"></script>
    <script src="/js/js_uk.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.ui-autocomplete {
	max-height: 200px;
	overflow-y: auto;
	/* prevent horizontal scrollbar */
	overflow-x: hidden;
}
[data-tooltip-text]:hover {
	position: relative;
}

[data-tooltip-text]:after {
	-webkit-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
	-moz-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
	transition: bottom .3s ease-in-out, opacity .3s ease-in-out;

	background-color: rgba(232, 86, 133, 0.8);

  -webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	-moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	
  -webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	
  color: #FFFFFF;
	font-size: 12px;
	margin-bottom: 10px;
	padding: 7px 12px;
	position: absolute;
	width: auto;
	min-width: 50px;
	max-width: 300px;
	word-wrap: break-word;

	z-index: 9999;

	opacity: 0;
	left: -9999px;
  	top: 90%;
	
	content: attr(data-tooltip-text);
}

[data-tooltip-text]:hover:after {
	top: 0%;
	left: 30%;
	opacity: 1;
}
</style>
</head>

<body id="page-top">
<script>

    $(window).scroll(function () {
        var rno = $('.category-item2:last').attr('rownum');
        var findTag = $('#findSave').val();
        if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
            console.log("ajax start")

            <c:if test="${URI == 0}">
            $.ajax({
                type:'post',
                async:false,
                url:"/categoryPaging.sc",
                data:{'rno':rno,'findTag':findTag},
                error:(error)=>{
                    console.log(error);
                },
                success:(data)=>{
                    for(i of data){
                        let divCol = document.createElement('div');
                        divCol.className="col-xl-2 col-sm-6 mb-3";
                        divCol.setAttribute("onclick","findTag3("+"'"+i.cat_gname+"'"+")");
 
                        let divitem2 = document.createElement('div');
                        divitem2.className="category-item2 mt-0 mb-0";
                        divitem2.setAttribute("rownum",i.rno);
                        let a = document.createElement('a');
                        let img = document.createElement('img');
                        img.className = "img-fluid";
                        img.src = "/img/cate/"+i.cat_sysfile;
                        let h6 = document.createElement('h6');
                        h6.innerText = i.cat_gname;
                        let p = document.createElement('p');
                        p.innerText = "74,853 views";
                        let col12 = document.createElement('div');
                        col12.className = "col-xs-12";
                        col12.style.marginTop = "3%";

                        a.appendChild(img);
                        a.appendChild(h6);
                        a.appendChild(p);

                        for(j of i.genreList){
                            let tag = document.createElement('div');
                            tag.style.borderRadius = "2em";
                            tag.style.backgroundColor = "pink";
                            tag.style.color = 'black';
                            tag.style.display = 'inline';
                            tag.style.padding = '3px';
                            tag.innerHTML = j
                            col12.appendChild(tag);
                        }

                        divitem2.appendChild(a);
                        divitem2.appendChild(col12);

                        divCol.appendChild(divitem2);
                        $('.itemrow').append(divCol);
                       
                        
                    }
                }
            })
            </c:if>
            <c:if test="${URI == 1}">
                $.ajax({
                    type:'post',
                    url:"/streamingPaging.sc",
                    data:{'rno':rno,'findTag':findTag},
                    async:false,
                    error:(error)=>{
                        console.log(error);
                    },
                    success:(data)=>{
                        console.log(data);
                        for(i of data){
                        	
                            let divCol = document.createElement('div');
                            divCol.className="col-xl-2 col-sm-6 mb-3";
                            divCol.setAttribute("onclick","broadCastingView("+"'"+i.air_mid+"'"+")");
                            divCol.setAttribute("data-tooltip-text",i.air_content);
          
                            //data-toggle="tooltip" data-placement="top" title="${i.air_content}
                            let divitem2 = document.createElement('div');
                            divitem2.className="category-item2 mt-0 mb-0";
                            divitem2.setAttribute("rownum",i.rno);
                            let a = document.createElement('a');
                            let img = document.createElement('img');
                            img.className = "img-fluid thumbnail";
		    				img.style.backgroundSize = "100% 100%";
                            if(i.air_thumbnail == null){
                                img.style.backgroundImage = "url(/uploads/notThumbnail.png)";
                            } else {
                                img.style.backgroundImage = "url(/uploads/"+i.air_thumbnail+")";
                            }
		    				let h5 = document.createElement('h6');
                            h5.innerText = i.air_subject;
		    				h5.style.fontWeight = "bold";
                            h5.style.textAlign = "center";
                            h5.style.fontWeight = "bold"
         
                            let h6 = document.createElement('h6');
                            h6.innerText = i.air_mid;
		   					h6.style.color = "#7401DF";
		   					h6.style.fontWeight = "bold"

                            let h7 = document.createElement('h6');
                            h7.innerText = i.air_gname;
                            h7.style.fontWeight = "bold"
                            let p = document.createElement('h6');
                            p.innerText = "74,853 views";
                            p.style.color = "red";
                            
                            let col12 = document.createElement('div');
                            col12.className = "col-xs-12";
                            col12.style.marginTop = "3%";

                            a.appendChild(img);
		   					a.appendChild(h5);
                            a.appendChild(h6);
		    				a.appendChild(h7);
                            a.appendChild(p);

                            divitem2.appendChild(a);
                            divitem2.appendChild(col12);
							
                            divCol.appendChild(divitem2);
                            
                            $('.itemrow').append(divCol);
      
                            
                        }
                        
                    }
                })
            </c:if>


        }
    })
</script>
<input type='hidden' id='findBc'/>
<div id="topplace">
    <jsp:include page="/userinfo.sc" flush="false"></jsp:include>
</div>
<div id="wrapper">
    <div id="sidebarplace" style="margin-top: 53px;">
        <jsp:include page="/sidebar.sc" flush="false"></jsp:include>
    </div>
    <div id="content-wrapper" style="margin-top: 53px;">
        <div class="container-fluid">
            <div class="video-block section-padding">
                <div class="row">
                    <div class="col-md-12">
                        <div class="main-title">
                        	<input type='hidden' id='findSave' value='${findChannel}'/>
                            <h2 style="font-weight: bold;display: inline;margin-right: 2%">탐색</h2>
                            <div class="btn-group" role="group" aria-label="..." style="margin-bottom: 1%">
                                <c:if test="${URI == 0}">
                                    <button type="button" class="btn btn-primary button-class1"
                                            style='border: 2px solid pink; font-weight: bold;'>카테고리
                                    </button>
                                    <button type="button" class="btn btn-default button-class2"
                                            style='border: 2px solid pink; font-weight: bold' onclick="location.href='/categories/all'">생방송채널
                                    </button>
                                </c:if>
                                <c:if test="${URI == 1}">
                                    <button type="button" class="btn btn-default button-class1"
                                            style='border: 2px solid pink; font-weight: bold;' onclick="location.href='/categories'">카테고리
                                    </button>
                                    <button type="button" class="btn btn-primary button-class2"
                                            style='border: 2px solid pink; font-weight: bold'>생방송채널
                                    </button>
                                </c:if>
                            </div>
                            <div class="btn-group float-right right-action">
                                <a href="#" class="right-action-link text-gray"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    정렬 <i class="fa fa-caret-down" aria-hidden="true"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="#"><i
                                            class="fas fa-fw fa-star"></i> &nbsp; 팔로우 수</a> <a
                                        class="dropdown-item" href="#"><i
                                        class="fas fa-fw fa-signal"></i> &nbsp; 시청자 수</a> <a
                                        class="dropdown-item" href="#"><i
                                        class="fas fa-fw fa-times-circle"></i> &nbsp; 닫기</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="input-group" style='width: 300px;border: 1px solid pink'>
                	<c:if test="${URI == 0}">
                    <input type="text" class="form-control" placeholder="게임검색..." id="findTag2">
                     <div class="input-group-append">
                        <button class="btn btn-light" type="button" onclick="findTag2()">
                            <i class="fas fa-search" style='color: pink'></i>
                        </button>
                    </div>
                    </c:if>
                   <c:if test="${URI == 1}">
                    <input type="text" class="form-control" placeholder="생방송검색..." id="findTag">
                     <div class="input-group-append">
                        <button class="btn btn-light" type="button" onclick="findTag()">
                            <i class="fas fa-search" style='color: pink'></i>
                        </button>
                    </div>
                    </c:if>

                </div>
                <c:if test="${URI == 0}">
                    <div class='row itemrow' style='margin-top: 2%' id="gameRow">
                        <c:forEach var="i" items="${list}">
                            <div class="col-xl-2 col-sm-6 mb-3" onclick="findTag3('${i.cat_gname}')">
                                <div class="category-item2 mt-0 mb-0" rownum="${i.rno}">
                                    <a href="javascript:void(0)">
                                        <img class="img-fluid" src="/img/cate/${i.cat_sysfile}"/>
                                        <h6>${i.cat_gname}</h6>
                                        <p>74,853 views</p>
                                    </a>
                                    <div class="col-xs-12" style="margin-top: 3%">
                                        <c:forEach var="tag" items="${i.genreList}">
                                            <div style='border-radius: 2em;background-color: pink;color: black;display: inline;padding: 3px'>${tag}</div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>

                <c:if test="${URI == 1}">
                    <div class='row itemrow' style='margin-top: 2%' id="gameRow">
                        <c:forEach var="i" items="${list}">
                            <div class="col-xl-2 col-sm-6 mb-3" data-tooltip-text="${i.air_content}"  onclick="broadCastingView('${i.air_mid}')">
                                <div class="category-item2 mt-0 mb-0" rownum="${i.rno}">
                                    <a href="javascript:void(0)">
                                        <c:choose>
                                            <c:when test="${i.air_thumbnail == null}">
                                                <img class="img-fluid thumbnail" width="100%" height="auto" style="background-size:100% 100%;background-image : url(/uploads/notThumbnail.png)"/>
                                            </c:when>
                                            <c:otherwise>
                                                <img class="img-fluid thumbnail" width="100%" height="auto" style="background-size:100% 100%;background-image : url(/uploads/${i.air_thumbnail})" />
                                            </c:otherwise>
                                        </c:choose>
                                        <h6 style='font-weight: bold;text-align: center;'>${i.air_subject}</h6>
                                        <h6 style='font-weight: bold;text-align: center;color:#7401DF'>${i.air_mid}</h6>
                                        <h6 style='font-weight: bold'>${i.air_gname}</h6>
                                        <h6 style="color:red">74,853 views</h6>
                                    </a>
                                    <div class="col-xs-12" style="margin-top: 3%">
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
            <script>
                $(function () {
                    $('.button-class1').click(function () {
                        if ($(this).hasClass('btn-default'))
                            $(this).removeClass('btn-default');
                        if (!$(this).hasClass('btn-primary'))
                            $(this).addClass('btn-primary');
                        if ($('.button-class2').hasClass('btn-primary'))
                            $('.button-class2').removeClass('btn-primary');
                        if (!$('.button-class2').hasClass('btn-default'))
                            $('.button-class2').addClass('btn-default');
                    });

                    $('.button-class2').click(function () {
                        if ($(this).hasClass('btn-default'))
                            $(this).removeClass('btn-default');
                        if (!$(this).hasClass('btn-primary'))
                            $(this).addClass('btn-primary');
                        if ($('.button-class1').hasClass('btn-primary'))
                            $('.button-class1').removeClass('btn-primary');
                        if (!$('.button-class1').hasClass('btn-default'))
                            $('.button-class1').addClass('btn-default');
                    });

                });
            </script>
            <!-- /.container-fluid -->
            <!-- /.content-wrapper -->
        </div>
        <!-- Sticky Footer -->
        <%@include file="/footer.jsp" %>
        <!-- /#wrapper -->
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top"> <i
                class="fas fa-angle-up"></i>
        </a>
        <!-- Logout Modal-->
        <%@include file="/logout-modal.jsp" %>
        <script>
        function findTag(){
        	

        location.href='/categories/all?findTag='+ $('#findTag').val();

        	
        }
        function findTag2(){
        	location.href='/categories?findTag='+ $('#findTag2').val();
        	        	
        }
        function findTag3(gameName){
        	location.href='/categories/all?findTag='+ gameName;
        }
        
        function broadCastingView(bId){
          	 
          	 location.href = "/"+bId;
           }
        
        
    	$("#findTag2").autocomplete({
    		matchContains: true,
            source : function( request, response ) {
                 $.ajax({
                        type: 'post',
                        url: "selectCate.bc",
                        dataType: "json",
                        async:false,
                        success: function(data) {
                            response(
                                $.map(data, function(item) {   
                                	if ( item.cat_gname.indexOf($("#findTag2").val()) != -1) {
                                		
                                		return {
                                            label: item.cat_gname,    
                                            value: item.cat_gname,   
                                            test : item.cat_sysfile,
                                            cate : item.cat_genre

                                        }
                                	                 	
                                	}                    
                                })
                            );
                        }
                   });
                },   
            select : function(event, ui) {   // 아이템 선택 시 
            	
          
                
            },
            focus : function(event, ui) {    //포커스
                return false;
            },
            minLength: 0,// 최소 글자수
            autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
            classes: {  
                "ui-autocomplete": "highlight"
            },
            delay: 500, 
//            disabled: true, //자동완성 기능 끄기
            position: { my : "right top", at: "right bottom" },    //잘 모르겠음
            close : function(event){    //자동완성창 닫아질때 호출
                console.log(event);
            }
        }).autocomplete( "instance" )._renderItem = function( ul, item ) {    //요 부분이 UI를 마음대로 변경하는 부분
            return $( "<li>" )    //기본 tag가 li로 되어 있음 
            .append( "<div style='background-color: rgb(232, 86, 133); color: white;'><img width = '40px'src='./img/cate/" + item.test + "'/>"+ "&nbsp;" + item.value + "</div>" )    //여기에다가 원하는 모양의 HTML을 만들면 UI가 원하는 모양으로 변함.
            .appendTo( ul );
     };

     
    	
        </script>
</body>
</html>