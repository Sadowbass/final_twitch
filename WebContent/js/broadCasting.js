let bc = {}
var tag = [];
var counter = 0;
var gameName = "";
var btime = 0;

function initAir() {
	let mId = $('#mId').val();
	
	$.ajax({
		url : 'selectAir.bc',
		type : 'post',
		async: false,
		data : {"mId":mId},
		dataType: "json",
		error : function(xhr, status, error){
			  console.log(xhr);
		},
		success : function(data, xhr, status ){	
			if(data[0].result == '성공'){
				$('#broadCastingTitle').val(data[0].air_subject);
				$('#broadCastingContent').val(data[0].air_content);
				$('#findCate').val(data[0].air_gname);
				$('#updateBroadCasting').show();
				$('#streamKey').val(data[0].mem_skey);
				$('#streamKey').prop('readonly',true);
				if ($('#pk_switch').hasClass('on') === false) { // 방송 켜졌을 때
					$('#pk_switch').toggleClass('on');
				}
				var oldTime = new Date(data[0].air_starttime)
				var newTime = new Date();
				var gap = newTime.getTime() - oldTime.getTime();
				btime = gap/1000;
				
				gameName = data[0].air_gname;
	          	$("#cate-list").append("<li class='cate-item'><span style='color:white'><img width = '40px'src='../img/cate/" + data[0].cat_sysfile + "'/>&nbsp;"+ data[0].air_gname +"</span></li>");
				
				let array = data[0].air_tnames.split(","); //디비에있는 태그
				let array2 = data[0].cat_genre.split(","); //게임태그
				
				
				for(let n = 0; n<array2.length;n++){
					array.splice($.inArray(array2[n], array),1);
				}
	
				for(let j=0; j<array2.length;j++){
					addTag(array2[j],'cate');
				}
				for(let i=0; i<array.length;i++){
					addTag(array[i]);
				}
				
				$.ajax({
					url : 'initAir.bc',
					type : 'post',
					async: false,
					data : {"sKey":$('#streamKey').val()},
					error : function(xhr, status, error){
						  console.log(xhr);
					},
					success : function(data, xhr, status ){	
						
						$('#videoView').html(data);
						setDonation();
						broadCastingTime();
						selectFollow();
								
					}
						
				})
				
				 
				
				
			}else if(data[0].result =='실패'){
				
			}			
		}		
	})
	
	
}

function initUser() {
	let mId = $('#mId').val();
	
	$.ajax({
		url : 'initUser.bc',
		type : 'post',
		async:false,
		data : {"mId":mId},
		dataType: 'json',
		error : function(xhr, status, error){
			  console.log(xhr);
		},
		success : function(data, xhr, status ){	
			
			$('#memberName').html(data.mem_name);
			$('#memberPhoto').attr("src","../img/user-photo/"+data.ph_sysfile);
					
		}
			
	})
	
}


function broadCastingTime() {
	
	time2 = setInterval(
			function() {
				
				btime = btime + 1;
				var newTime = new Date(btime * 1000).toISOString().substr(11, 8);
				$('#broadCastingTime').html(newTime);
				
				
				/*
				$.ajax({
					url : 'broadCastingTime.bc',
					type : 'post',
					dataType :'text',
					async:false,
					error : function(xhr, status, error){

					},
					success : function(data, xhr, status ){	
						$('#broadCastingTime').html(data);
					}
						
				})
				*/
						

			}, 1000);
}

function startAir(){
	
	$('#takTag').val(tag); // 태그 저장
	$('#takGame').val(gameName); // 게임이름 저장
	let param = $('#pk_broadCastingData').serialize();

	$.ajax({
		url : 'insertAir.bc',
		type : 'post',
		async:false,
		data : param,
		error : function(xhr, status, error){
			  console.log(xhr);
		},
		success : function(data, xhr, status ){	
			
			$('#videoView').html(data);
			setDonation();
			btime = 0;
			broadCastingTime();
			selectFollow();
					
		}
			
	})
	
}

function stopAir() {
	
	let param = $('#pk_broadCastingData').serialize();
	
	$.ajax({
		url : 'deleteAir.bc',
		type : 'post',
		data : param,
		async:false,
		error : function(xhr, status, error){

		},
		success : function(data, xhr, status ){	
			$('#videoView').html(data);
			clearInterval(time1);
			clearInterval(time2);
			clearInterval(time3);
			$('#broadCastingTime').html('0:00:00');
			$('#broadCastingFollow').html('0');	
			

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
    		 $("#tag-list").append("<li class='tag-item tag-cate' tak='"+value+"'>"+value+"<span idx='"+counter+"'></span></li>");
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
			async:false,
			error : function(xhr, status, error){
				
			},
			success : function(data, xhr, status ){	
				if(data == '성공'){
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
	
	$("#imageCut").click(function() {
		let mId = $('#mId').val();
		let sKey = $('#streamKey').val();
		let duration1 = jwplayer('mediaplayer').getPosition();
		duration1 = Math.floor(duration1);
		
		$.ajax({
			url : 'imageCut.bc',
			type : 'post',
			async:false,
			data : {"mId":mId,"sKey":sKey,"duration1":duration1},
			error : function(xhr, status, error){
				
			},
			success : function(data, xhr, status ){	
				
				if(data == "성공"){
					
					Swal.fire({
						  position: 'center',
						  icon: 'success',
						  title: '<font color="white">썸네일이 저장되었습니다.</font>',
						  background: '#18181b',
						  showConfirmButton: false,
						  timer: 1500
						})
					

				}else if(data =="실패"){
					Swal.fire({
						  position: 'center',
						  icon: 'error',
						  title: '<font color="white">썸네일 저장에 실패하였습니다.</font>',
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
                    async:false,
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
          	counter = counter - numItems;
          	$("#cate-list").html('');
          	gameName = ui.item.value;
          	$("#cate-list").append("<li class='cate-item'><span style='color:white'><img width = '40px'src='../img/cate/" + ui.item.test + "'/>&nbsp;"+ ui.item.value +"</span></li>");
          	
          	
            let fileData = new Array(numItems);

            for(let i=0; i<fileData.length; i++){                          
                 fileData[i] = $(".tag-cate").eq(i).attr('tak');
            }

          	for(let j = 0; j<fileData.length;j++){
          		tag.splice($.inArray(fileData[j], tag),1);
          	}
            
          	$('.tag-cate').remove();
            
        	
        	let arrayCate = ui.item.cate.split(',');
        	
        	for(let i=0;i<arrayCate.length;i++){
        	addTag(arrayCate[i],'cate');	
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
                    async:false,
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



function videoDonation(serial,mid,content,price,url) {
    var youtubeUrl = "https://www.youtube.com/embed/";
    var autoPlay = "?autoplay=1&mute=0";
	let donationData = '';
	donationData += '<iframe id="ytplayer" type="text/html" width="500" height="230" frameborder="0" src="' + youtubeUrl+url+autoPlay+'" allowfullscreen></iframe>';
	donationData += '<br />';
	donationData += '<span id="text-id" class="added-text"></span>';
	donationData += '<span style="color:#CC2EFA">' + mid +'님이</span> '
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
					async:false,
					data : {"serial":serial} ,
					error : function(xhr, status, error){
						
					},
					success : function(data, xhr, status ){	
						
						if(data == "성공"){
							
							Swal.fire({
								  position: 'center',
								  icon: 'success',
								  title: '<font color="white">도네이션 송출에 성공하였습니다.</font>',
								  background: '#18181b',
								  showConfirmButton: false,
								  timer: 1500
								})
							
	
						}else if(data =="실패"){
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

function voiceDonation(serial,mid,content,price,type) {
	
	responsiveVoice.speak(content,"Korean Female");

	
	let donationData = '';
	let dType = '';
	donationData += '<i class="fas fa-volume-up fa-3x"></i>';
	donationData += '<div id="text-view">';
	donationData += '<img src="https://toothcdn.xyz:8432/uploaded/c5ebb8db982555470878a53cc8304ab5/alert_donation_1.img?v=1" style="width: 40%; top:-10%">';
	donationData += '<br />';
	donationData += '<span id="text-id" class="added-text"></span>';
	donationData += '<span style="color:#CC2EFA">' + mid +'님이</span> '
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
					async:false,
					error : function(xhr, status, error){
						
					},
					success : function(data, xhr, status ){	
						
						if(data == "성공"){
							
							Swal.fire({
								  position: 'center',
								  icon: 'success',
								  title: '<font color="white">도네이션 송출에 성공하였습니다.</font>',
								  background: '#18181b',
								  showConfirmButton: false,
								  timer: 1500
								})
							
	
						}else if(data =="실패"){
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

function followView(){
	
	let param = $('#mId').val();
	
	$.ajax({
		url : 'selectFollowList.bc',
		type : 'post',
		data : {"mId":param} ,
		async:false,
		error : function(xhr, status, error){
			
		},
		success : function(data, xhr, status ){	
			$('#followList').html(data);	
		}
			
	})
	
	
	$('#modalBox2').modal('show');
	
}



function selectFollow() {
	time3 = setInterval(function(){
		let param = $('#mId').val();
		
		$.ajax({
			url : 'selectFollow.bc',
			type : 'post',
			data : {"mId":param} ,
			async:false,
			dataType : 'json',
			error : function(xhr, status, error){
				
			},
			success : function(data, xhr, status ){	
				$('#broadCastingFollow').html(data.result);	
			}
				
		})
		
		
	},5000);
	
}




function setDonation(){
	time1 = setInterval(
			function() {
				let param = $('#mId').val();
				$
						.ajax({
							url : 'selectDonation.bc?mId='
									+ param,
							type : 'post',
							dataType : 'json',
							async:false,
							error : function(xhr,
									status, error) {
								console.log('실패');
							},
							success : function(data,
									xhr, status) {
								console.log(data);
								if (data != null) {
									for (let i = 0; i < data.length; i++) {

										console
												.log(data[i]);
										let divRow = document
												.createElement("div");
										divRow.className = "row";
										divRow.style.marginTop = "2%";

										if (data[i].type == '0' || data[i].type =='2') {
											divRow.onclick = function() {
												voiceDonation(
														data[i].don_serial,
														data[i].don_mid,
														data[i].don_content,
														data[i].don_price,
														data[i].type);
											};

										} else if (data[i].type == '1') {
											divRow.onclick = function() {
												videoDonation(
														data[i].don_serial,
														data[i].don_mid,
														data[i].don_content,
														data[i].don_price,
														data[i].url)
											};
										}

										let divCol1 = document
												.createElement("div");
										divCol1.className = "col-1";

										let j = document
												.createElement('i');
										if (data[i].type == '0') {
											j.className = "fas fa-volume-up fa-3x";
										} else if (data[i].type == '1') {
											j.className = "fas fa-video fa-3x";
										} else if (data[i].type == '2'){
											j.className = "fas fa-question fa-3x";
										}

										let divCol8 = document
												.createElement("div");
										divCol8.className = "col-8";

										let divCol12 = document
												.createElement("div");
										divCol12.className = "col-12";
										divCol12.innerHTML = data[i].don_mid;
										divCol12.style.color = "white";

										let divCol122 = document
												.createElement("div");
										divCol122.className = "col-12";
										divCol122.innerHTML = "["
												+ data[i].don_price
												+ "]&nbsp;"
												+ data[i].don_content;

										let divCol3 = document
												.createElement("div");
										divCol3.className = 'col-3';
										divCol3.style.textAlign = "center";
										divCol3.style.paddingTop = "3px";
										divCol3.innerHTML = data[i].don_rdate;

										divRow
												.appendChild(divCol1);
										divRow
												.appendChild(divCol8);
										divRow
												.appendChild(divCol3);
										divCol1
												.appendChild(j);
										divCol8
												.appendChild(divCol12);
										divCol8
												.appendChild(divCol122);
										let donationDiv = document
												.getElementById('donationDiv');
										donationDiv
												.appendChild(divRow);

										/*
										let html = '';
										if(data[i].type == '0'){
										html += '<div class="row" style="margin-top: 2%" onclick="voiceDonation(' + data[i].don_serial + ')">';
										}else if(data[i].type =='1'){
										html += '<div class="row" style="margin-top: 2%" onclick="videoDonation(' + data[i].don_serial + ')">';
										}
										html += "<div class='col-1'>";
										if(data[i].type == '0'){
											html += "<i class='fas fa-volume-up fa-3x'></i>";
										}else if(data[i].type =='1'){
											html += "<i class='fas fa-video fa-3x'></i>";
										}
										html += "</div>";
										html += "<div class='col-8'>";
										html += "<div class='col-12' style='color: white'>";
										html += data[i].don_oid;
										html += "</div>";
										html += "<div class='col-12'>";
										html += "<font size='2' color='white' face='돋움'>["+data[i].don_price+"]</font>" + data[i].don_content;
										html += "</div>";
										html += "</div>";
										html += "<div class='col-3' style='text-align: center;padding-top: 10px'>";
										html += data[i].don_rdate;
										html += "</div>";
										$('#donationDiv').append(html);

										 */

										toastr.options = {
											"closeButton" : false,
											"debug" : false,
											"newestOnTop" : false,
											"progressBar" : false,
											"positionClass" : "toast-top-center",
											"preventDuplicates" : false,
											"onclick" : null,
											"showDuration" : "300",
											"hideDuration" : "1000",
											"timeOut" : "3000",
											"extendedTimeOut" : "1000",
											"showEasing" : "swing",
											"hideEasing" : "linear",
											"showMethod" : "fadeIn",
											"hideMethod" : "fadeOut",
											"bdColor" : "#444"
										}
										toastr.options.onclick = function() {
											if (data[i].type == '0' || data[i].type =='2') {
												voiceDonation(
														data[i].don_serial,
														data[i].don_mid,
														data[i].don_content,
														data[i].don_price,
														data[i].type);
											} else if (data[i].type == '1') {
												videoDonation(
														data[i].don_serial,
														data[i].don_mid,
														data[i].don_content,
														data[i].don_price,
														data[i].url)
											}
										}

										if (data[i].type == '0') {
											toastr
													.success('음성후원이 도착하였습니다');
										} else if (data[i].type == '1') {
											toastr
													.success('영상후원이 도착하였습니다');
										} else if (data[i].type == '2'){
											toastr
												    .success('룰렛후원이 도착하였습니다');
										}

									}

								}

							}
						});

			}, 5000);
	
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
		async:false,
		error : function(xhr, status, error){

		},
		success : function(data, xhr, status ){	
			
			if(data != null){
				if(data[0].rul_result == '성공'){
				let array = data[0].rul_data.split(',');
				for(let i = 0; i<array.length;i++){
					console.log(array[i]);
					$('#rul'+(i+1)).val(array[i].trim());
				}
				$('#flagRul').val('true');
				}else if(data[0].rul_result == '실패'){
					$('#flagRul').val('false');
				}
				
			}
		}
			
	})
	
	$('#modalBox').modal('show');

}


