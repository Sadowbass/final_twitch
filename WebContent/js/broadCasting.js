let bc = {}
var tag = [];
var counter = 0;
var gameName = "";



function startAir(){
	
	let param = $('#pk_broadCastingData').serialize();
	
	
	$.post("insertAir.bc?tags=" + tag +"&gameName=" + gameName , param, function(data, state){
		
	});
	
	
}

function stopAir() {
	
	
}



function addTag (value,value2) {
	
	if(counter > 4){
		alert("태그는 5개까지만 등록가능합니다.")
		return;
	}
	
	 var result = Object.values(tag).filter(function (word) {
		 if(value2 != 'cate'){
         return word === value;
		 }else{
			 return word === 0;
		 }
     })
	
 
     // 태그 중복 검사
     if (result.length == 0) { 
    	 if(value2 != 'cate'){
         $("#tag-list").append("<li class='tag-item'>"+value+"<span class='del-btn' onclick='delTag(this)' idx='"+counter+"'>x</span></li>");
    	 }else{
    		 $("#tag-list").append("<li class='tag-item tag-cate'>"+value+"<span idx='"+counter+"'></span></li>");
    	 }
     } else {
         alert("태그값이 중복됩니다.");
         return;
     }
	
	
    tag[counter] = value; 
    counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
}

function delTag(idx) {
	console.log(idx);
    var index = $(idx).attr("idx");
    tag.splice(index, 1);
    counter--;
    $(idx).parent().remove();
}


bc.func = function(){
	

	$("#findCate").autocomplete({
		matchContains: true,
        source : function( request, response ) {
             $.ajax({
                    type: 'post',
                    url: "selectCate.bc",
                    dataType: "json",
                    success: function(data) {
                        response(
                            $.map(data, function(item) {   
                            	if ( item.cat_gname.indexOf($("#findCate").val()) != -1) {
                            		
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
        	
        	var numItems = $('.tag-cate').length;
          	$('.tag-cate').remove();
          	counter = counter - numItems;
          	$("#cate-list").html('');
          	gameName = ui.item.value;
          	$("#cate-list").append("<li class='cate-item'><span style='color:white'><img width = '40px'src='../img/cate/" + ui.item.test + "'/>&nbsp;"+ ui.item.value +"</span></li>");
          	
        	
        	var array = ui.item.cate.split(',');
        	
        	for(let i=0;i<array.length;i++){
        	addTag(array[i],'cate');	
        	}
            
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
//        disabled: true, //자동완성 기능 끄기
        position: { my : "right top", at: "right bottom" },    //잘 모르겠음
        close : function(event){    //자동완성창 닫아질때 호출
            console.log(event);
        }
    }).autocomplete( "instance" )._renderItem = function( ul, item ) {    //요 부분이 UI를 마음대로 변경하는 부분
        return $( "<li>" )    //기본 tag가 li로 되어 있음 
        .append( "<div style='background-color: rgb(58, 58, 60); color: white;'><img width = '40px'src='../img/cate/" + item.test + "'/>"+ "&nbsp;" + item.value + "</div>" )    //여기에다가 원하는 모양의 HTML을 만들면 UI가 원하는 모양으로 변함.
        .appendTo( ul );
 };
	
	

	
	$("#findTag").autocomplete({
		matchContains: true,
        source : function( request, response ) {
             $.ajax({
                    type: 'post',
                    url: "selectTag.bc",
                    dataType: "json",
                    success: function(data) {
                        response(
                            $.map(data, function(item) {   
                            	if ( item.indexOf($("#findTag").val()) != -1) {
                            		
                            		return {
                                        label: item,    
                                        value: item,   
                                        test : item

                                    }
                            	                 	
                            	}                    
                            })
                        );
                    }
               });
            },   
        select : function(event, ui) {   // 아이템 선택 시 
        	
         addTag(ui.item.value);	
        	
            
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
//        disabled: true, //자동완성 기능 끄기
        position: { my : "right top", at: "right bottom" },    //잘 모르겠음
        close : function(event){    //자동완성창 닫아질때 호출
            console.log(event);
        }
    }).autocomplete( "instance" )._renderItem = function( ul, item ) {    //요 부분이 UI를 마음대로 변경하는 부분
        return $( "<li>" )    //기본 tag가 li로 되어 있음 
        .append( "<div style='background-color: rgb(58, 58, 60); color: white;'>" + item.value + "<br>" + "</div>" )    //여기에다가 원하는 모양의 HTML을 만들면 UI가 원하는 모양으로 변함.
        .appendTo( ul );
 };
};






let videoDonation = function() {
	Swal.fire({
		  title: '<font color="white">영상 후원</font>',
		  width: 600,
		  padding: '3em',
		  showCancelButton: true,
		  confirmButtonText: '송출',
		  confirmButtonColor: 'purple',
		  cancelButtonText: '닫기',
		  cancelButtonColor: 'purple',
		  background: '#18181b',
		  html : '<video id="myVideo" width="400px" src="../upload/jyt.mp4" controls autoplay></video>',
		  backdrop: `
		    rgba(0,0,123,0.4)
		    left top
		    no-repeat
		  `
	})
}

let voiceDonation = function(text,type) {
	
	responsiveVoice.speak(text,type);
	
	Swal.fire({
		  title: '<font color="white">음성 후원</font>',
		  width: 600,
		  padding: '3em',
		  showCancelButton: true,
		  confirmButtonText: '송출',
		  confirmButtonColor: 'purple',
		  cancelButtonText: '닫기',
		  cancelButtonColor: 'purple',
		  html: '<i class="fas fa-volume-up fa-3x"></i>',
		  background: '#18181b',
		  backdrop: `
		    rgba(0,0,123,0.4)
		    left top
		    no-repeat
		  `
	})
}




