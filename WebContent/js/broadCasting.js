let bc = {}
var tag = [];
var counter = 0;
var gameName = "";


function startAir(){
	
	$('#takTag').val(tag); // 태그 저장
	$('#takGame').val(gameName); // 게임이름 저장
	let param = $('#pk_broadCastingData').serialize();

	$.ajax({
		url : 'insertAir.bc',
		type : 'post',
		data : param,
		error : function(xhr, status, error){
			  console.log(xhr);
		},
		success : function(data, xhr, status ){	
			
			$('#videoView').html(data);
					
		}
			
	})
	
	
	
	
}

function stopAir() {
	
	let param = $('#pk_broadCastingData').serialize();
	
	$.ajax({
		url : 'deleteAir.bc',
		type : 'post',
		data : param,
		error : function(xhr, status, error){

		},
		success : function(data, xhr, status ){	
			$('#videoView').html(data);
		}
			
	})
	
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
	

	$('#updateBroadCasting').click(function() {
		$('#takTag').val(tag); // 태그 저장
		$('#takGame').val(gameName); // 게임이름 저장
		let param = $('#pk_broadCastingData').serialize();
		
		/*
		$.post("updateAir.bc", param, function(data, state){
			alert(data);
		});
		*/
		
		$.ajax({
			url : 'updateAir.bc',
			type : 'post',
			data : param,
			error : function(xhr, status, error){
				
			},
			success : function(data, xhr, status ){	
				if(data == '수정에 성공하셨습니다.'){
					Swal.fire({
						  position: 'center',
						  icon: 'success',
						  title: '<font color="white">수정에 성공하셨습니다.</font>',
						  background: '#18181b',
						  showConfirmButton: false,
						  timer: 1500
						})
				}else{
					Swal.fire({
						  position: 'center',
						  icon: 'error',
						  title: '<font color="white">수정에 실패하셨습니다.</font>',
						  background: '#18181b',
						  showConfirmButton: false,
						  timer: 1500
						})
				}
				
			}
				
		})
		
		
	})
	
	
	
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



function videoDonation(serial,oid,content,price,url) {
    var youtubeUrl = "https://www.youtube.com/embed/";
    var autoPlay = "?autoplay=1&mute=0";
	let donationData = '';
	donationData += '<iframe id="ytplayer" type="text/html" width="500" height="230" frameborder="0" src="' + youtubeUrl+url+autoPlay+'" allowfullscreen></iframe>';
	donationData += '<br />';
	donationData += '<span id="text-id" class="added-text"></span>';
	donationData += '<span style="color:#CC2EFA">' + oid +'님이</span> '
	donationData += '<span id="text-amount" class="added-text"></span>';
	donationData += '<span style="color:#CC2EFA">'+ price + '원을 후원하셨습니다.</span>';
	donationData += '<br />'
	donationData += '<span id="text-content" style="color:white">'+content+'</span>';
	donationData += '</div>';
    
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
		  html : donationData,
		  backdrop: `
		    rgba(0,0,123,0.4)
		    left top
		    no-repeat
		  `
	}).then((result) => {
		  if (result.value) {
			   
				$.ajax({
					url : 'sendDonation.bc',
					type : 'post',
					data : {"serial":serial} ,
					error : function(xhr, status, error){
						
					},
					success : function(data, xhr, status ){	
						
						if(data == "송출성공"){
							
							Swal.fire({
								  position: 'center',
								  icon: 'success',
								  title: '<font color="white">도네이션 송출에 성공하였습니다.</font>',
								  background: '#18181b',
								  showConfirmButton: false,
								  timer: 1500
								})
							
	
						}else if(data =="송출실패"){
							Swal.fire({
								  position: 'center',
								  icon: 'error',
								  title: '<font color="white">도네이션 송출에 실패하였습니다.</font>',
								  background: '#18181b',
								  showConfirmButton: false,
								  timer: 1500
								})
							
							
						}
					}
						
				})

			  
			  // if 끝
			  }
			})
}

function voiceDonation(serial,oid,content,price,type) {
	
	responsiveVoice.speak(content,"Korean Female");

	
	let donationData = '';
	let dType = '';
	donationData += '<i class="fas fa-volume-up fa-3x"></i>';
	donationData += '<div id="text-view">';
	donationData += '<img src="https://toothcdn.xyz:8432/uploaded/c5ebb8db982555470878a53cc8304ab5/alert_donation_1.img?v=1" style="width: 40%; top:-10%">';
	donationData += '<br />';
	donationData += '<span id="text-id" class="added-text"></span>';
	donationData += '<span style="color:#CC2EFA">' + oid +'님이</span> '
	donationData += '<span id="text-amount" class="added-text"></span>';
	donationData += '<span style="color:#CC2EFA">'+ price + '원을 후원하셨습니다.</span>';
	donationData += '<br />'
	donationData += '<span id="text-content" style="color:white">'+content+'</span>';
	donationData += '</div>';
	
	if(type == '0'){
		dType = '음성 후원'
	}else if (type == '2'){
		dType = '룰렛 후원'
	}

	Swal.fire({
		  title: '<font color="white">'+ dType + '</font>',
		  width: 600,
		  padding: '3em',
		  showCancelButton: true,
		  confirmButtonText: '송출',
		  confirmButtonColor: 'purple',
		  cancelButtonText: '닫기',
		  cancelButtonColor: 'purple',
		  html: donationData,
		  background: '#18181b',
		  backdrop: `
		    rgba(0,0,123,0.4)
		    left top
		    no-repeat
		  `
	}).then((result) => {
		  if (result.value) {
			   
				$.ajax({
					url : 'sendDonation.bc',
					type : 'post',
					data : {"serial":serial} ,
					error : function(xhr, status, error){
						
					},
					success : function(data, xhr, status ){	
						
						if(data == "송출성공"){
							
							Swal.fire({
								  position: 'center',
								  icon: 'success',
								  title: '<font color="white">도네이션 송출에 성공하였습니다.</font>',
								  background: '#18181b',
								  showConfirmButton: false,
								  timer: 1500
								})
							
	
						}else if(data =="송출실패"){
							Swal.fire({
								  position: 'center',
								  icon: 'error',
								  title: '<font color="white">도네이션 송출에 실패하였습니다.</font>',
								  background: '#18181b',
								  showConfirmButton: false,
								  timer: 1500
								})
							
							
						}
					}
						
				})

			  
			  // if 끝
			  }
			})
}

function broadCastingSetting() {
	let mId = $('#mId').val();
	$('#rul1').val('');
	$('#rul2').val('');
	$('#rul3').val('');
	$('#rul4').val('');
	$('#rul5').val('');
	
	$.ajax({
		url : 'selectRoulette.bc',
		type : 'post',
		data : {"mId":mId},
		dataType : 'json',
		error : function(xhr, status, error){

		},
		success : function(data, xhr, status ){	
			
			if(data != null){
				if(data[0].rul_result == '조회성공'){
				let array = data[0].rul_data.split(',');
				for(let i = 0; i<array.length;i++){
					console.log(array[i]);
					$('#rul'+(i+1)).val(array[i].trim());
				}
				$('#flagRul').val('true');
				}else if(data[0].rul_result == '조회실패'){
					$('#flagRul').val('false');
				}
				
			}
		}
			
	})
	
	$('#modalBox').modal('show');

}


