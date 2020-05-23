var streamer_view = function(id){
	$('#he_serial').val(id);
	$('#he_form').attr('action','streamer_view.he').submit();	
}
var help_view = function(){
	location.href = "index.jsp?inc=admin_pages/twitch_main/help_detail.jsp"
	
}
$("#help_modify_btn").click (function(){
	location.href = "index.jsp?inc=admin_pages/twitch_main/help_modify.jsp"
})

function showCancel2Message(serial) {
    swal({
        title: "정말 삭제하시겠습니까?",
        text: "다시 복구할 수 없습니다!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#e14eca",
        confirmButtonText: "삭제",
        cancelButtonText: "취소",
        closeOnConfirm: false,
        closeOnCancel: false
    }, function (isConfirm) {
        if (isConfirm) {
        	$('#cat_serial').val(serial);
        	let param = $('#he_form').serialize();
        	$.post("category_delete.he", param, function (data, state) {
                showCateDelete();
            })
        } else {
            swal("취소됨", "카테고리 삭제가 취소되었습니다", "error");
        }
    });
}

function showCateDelete(){
	swal({
        title: "삭제 완료",
        text: "해당 카테고리가 성공적으로 삭제되었습니다",
        type: "success",
        closeOnConfirm: true
    }, function () {
        location.href = "category_select.he"
    });
}

let btn = document.getElementById('profile_img')
if(btn != null){
	btn.onchange = function (event) {
		let ele = event.srcElement;
		let url = ele.files[0];
		let reader = new FileReader();
		reader.readAsDataURL(url);
		reader.onload = function (ev) {
			let img = new Image();
			img.src = ev.target.result;
			document.getElementById('category_img').src = img.src;
		}
	}
}

let cate_save =  function(){
	let fd = new FormData($('#he_form')[0])//object형태로 데이터 생성 
	
	$.ajax({
		url:'category_insertR.he',
		type:'post',
		data:fd,
		contentType:false,
		processData:false,
		error: function(xhr,status,error){
			swal("에러발생",error, "error");
		},
		success:function(data,xhr,status){
			swal({
		        title: "입력 완료",
		        text: "카테고리가 성공적으로 입력되었습니다",
		        type: "success",
		        closeOnConfirm: true
		    }, function () {
		        location.href = "category_insert.he"
		    });
		}
   })
}

$('#findTag').keyup(function(){
	let param = $('#find_form').serialize();
	$.ajax({
		url:'tag_search.he',
		type:'post',
		data:param,
		error: function(xhr,status,error){
			swal("에러발생",error, "error");
		},
		success:function(data,xhr,status){
			let str= "";
			for(let i=0; i <data.length; i++){
				let d = data[i];
				console.log(d.tag_name);
				str+='<span class="label bg-indigo cate_tag">'+d.tag_name+'<i class="material-icons" onclick="showTagdel('+d.tag_serial+')">close</i></span>'
			}
			$('#tag_list').html(str);
		
		}
   })
	
})

let tag_delete = function(serial){
	$('#tag_serial').val(serial);
	let param = $('#tag_form').serialize();
	$.ajax({
		url:'tag_delete.he',
		type:'post',
		data:param,
		error: function(xhr,status,error){
			swal("에러발생",error, "error");
		},
		success:function(data,xhr,status){
			swal({
		        title: "삭제 완료",
		        text: "해당 태그가  삭제되었습니다",
		        type: "success",
		        closeOnConfirm: true
		    }, function () {
		        location.href = "tag_management.he"
		    });
		}
   })
}

function showTagdel(serial) {
    swal({
        title: "정말 삭제하시겠습니까?",
        text: "다시 복구할 수 없습니다!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#e14eca",
        confirmButtonText: "삭제",
        cancelButtonText: "취소",
        closeOnConfirm: false,
        closeOnCancel: false
    }, function (isConfirm) {
        if (isConfirm) {
        	tag_delete(serial);
        } else {
            swal("취소됨", "태그 삭제가 취소되었습니다", "error");
        }
    });
}

let tag_save =  function(){
	let param = $('#insert_form').serialize();
	$.ajax({
		url:'tag_insert.he',
		type:'post',
		data:param,
		error: function(xhr,status,error){
			swal("에러발생",error, "error");
		},
		success:function(data,xhr,status){
			swal({
		        title: "추가 완료",
		        text: "해당 태그가  추가되었습니다",
		        type: "success",
		        closeOnConfirm: true
		    }, function () {
		        location.href = "tag_management.he"
		    });
		}
   })
}

let month_chart = function(a,b,c,d,e,f,g,h,i,j,k,l){
	chart.destroy();
	var ctx2 = document.getElementById('week_chart').getContext('2d');
	 chart = new Chart(ctx2, {
	    // The type of chart we want to create
	    type: 'line',
	    // The data for our dataset
	    data: {
	        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월','8월','9월','10월','11월','12월'],
	        datasets: [{
	            label: '방송 시간',
	            data: [a, b, c, d, e, f, g,h,i,j,k,l],
	            borderColor: 'rgba(0, 188, 212, 0.75)',
	            backgroundColor: 'rgba(0, 188, 212, 0.3)',
	            pointBorderColor: 'rgba(0, 188, 212, 0)',
	            pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
	            pointBorderWidth: 1
	        }]
	    },
	    options: {
	        responsive: true,
	        legend: false
	    }
	});
	
}

let week_chart =function(mon,tue,wen,thr,fri,sat,sun){
	chart.destroy();
	var ctx1 = document.getElementById('week_chart').getContext('2d')
	 chart = new Chart(ctx1,{
		// The type of chart we want to create
		type: 'line',
		// The data for our dataset
		data: {
			 labels: ['일','월', '화', '수', '목', '금', '토'],
			datasets: [{
				label: '방송 시간',
				data: [mon,tue,wen,thr,fri,sat,sun],
				borderColor: 'rgba(0, 188, 212, 0.75)',
				backgroundColor: 'rgba(0, 188, 212, 0.3)',
				pointBorderColor: 'rgba(0, 188, 212, 0)',
				pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
				pointBorderWidth: 1
			}]
		},
		options: {
			responsive: true,
			legend: false
		}
	}); 
}

let year_chart =function(a,b,c,d,e,f,g,h,i,j){
	chart.destroy();
	var ctx1 = document.getElementById('week_chart').getContext('2d')
	 chart = new Chart(ctx1,{
		// The type of chart we want to create
		type: 'line',
		// The data for our dataset
		data: {
			labels: ['2011', '2012', '2013', '2014', '2015', '2016','2017','2018','2019','2020'],
			datasets: [{
				label: '방송 시간',
				data: [a, b, c, d, e, f, g,h,i,j],
				borderColor: 'rgba(0, 188, 212, 0.75)',
				backgroundColor: 'rgba(0, 188, 212, 0.3)',
				pointBorderColor: 'rgba(0, 188, 212, 0)',
				pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
				pointBorderWidth: 1
			}]
		},
		options: {
			responsive: true,
			legend: false
		}
	}); 
}

let month_chart2 = function(){
	chart3.destroy();
	var ctx2 = document.getElementById('bar_chart').getContext('2d');
	 chart3 = new Chart(ctx2, {
	    // The type of chart we want to create
	    type: 'bar',
	    // The data for our dataset
	    data: {
	        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월','8월','9월','10월','11월','12월'],
	         datasets: [{
	             label: "구독자 수",
	             data: [65, 59, 80, 81, 56, 55, 40,23,34,45,23,35],
	             backgroundColor: 'rgba(0, 188, 212, 0.8)'
	         }, {
	                 label: "팔로워 수",
	                 data: [28, 48, 40, 19, 86, 27, 90,23,34,25,56,24],
	                 backgroundColor: 'rgba(233, 30, 99, 0.8)'
	             }]
	    },
	    options: {
	        responsive: true,
	        
	    }
	});
	
}

let week_chart2 =function(){
	chart3.destroy();
	var ctx2 = document.getElementById('bar_chart').getContext('2d');
	 chart3 = new Chart(ctx2, {
	    // The type of chart we want to create
	    type: 'bar',
	    // The data for our dataset
	    data: {
	    	 labels: ['일','월', '화', '수', '목', '금', '토'],
	         datasets: [{
	             label: "구독자 수",
	             data: [65, 59, 80, 81, 56, 55, 40],
	             backgroundColor: 'rgba(0, 188, 212, 0.8)'
	         }, {
	                 label: "팔로워 수",
	                 data: [28, 48, 40, 19, 86, 27, 90],
	                 backgroundColor: 'rgba(233, 30, 99, 0.8)'
	             }]
	    },
	    options: {
	        responsive: true,
	        
	    }
	});
}

let year_chart2 =function(){
	chart3.destroy();
	var ctx2 = document.getElementById('bar_chart').getContext('2d');
	 chart3 = new Chart(ctx2, {
	    // The type of chart we want to create
	    type: 'bar',
	    // The data for our dataset
	    data: {
	    	labels: ['2011', '2012', '2013', '2014', '2015', '2016','2017','2018','2019','2020'],
	         datasets: [{
	             label: "구독자 수",
	             data:  [0, 10, 5, 2, 20, 30, 45,34,23,25],
	             backgroundColor: 'rgba(0, 188, 212, 0.8)'
	         }, {
	                 label: "팔로워 수",
	                 data: [28, 48, 40, 19, 86, 27, 90,34,25,12],
	                 backgroundColor: 'rgba(233, 30, 99, 0.8)'
	             }]
	    },
	    options: {
	        responsive: true,
	        
	    }
	});
}

let month_chart3 = function(){
	chart4.destroy();
	var ctx2 = document.getElementById('radar_chart').getContext('2d');
	 chart4 = new Chart(ctx2, {
		 type: 'line',
		    // The data for our dataset
		    data: {
		        labels:['1월', '2월', '3월', '4월', '5월', '6월', '7월','8월','9월','10월','11월','12월'],
		        datasets: [{
		            label: '구독 수익',
		            data: [40, 70, 20, 50, 20, 30, 45,34,13,45,56,23],
		            borderColor: 'rgba(102, 102, 153, 0.75)',
		            backgroundColor: 'rgba(102, 102, 153, 0.3)',
		            pointBorderColor: 'rgba(102, 102, 153, 0)',
		            pointBackgroundColor: 'rgba(102, 102, 153, 0.9)',
		            pointBorderWidth: 1
		        },{
		        	 label: "도네 수익",
		             data: [28, 48, 40, 19, 86, 27, 90,12,23,65,24,53],
		             borderColor: 'rgba(233, 30, 99, 0.75)',
		             backgroundColor: 'rgba(233, 30, 99, 0.3)',
		             pointBorderColor: 'rgba(233, 30, 99, 0)',
		             pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
		             pointBorderWidth: 1
		        },{
		            label: '총 수익',
		            data: [68, 118, 60, 69, 116, 57, 135,111,56,23,45,67],
		            borderColor: 'rgba(204, 000, 204, 0.75)',
		            backgroundColor: 'rgba(204, 000, 204, 0.3)',
		            pointBorderColor: 'rgba(204, 000, 204, 0)',
		            pointBackgroundColor: 'rgba(204, 000, 204, 0.9)',
		            pointBorderWidth: 1
		        }]
		    },
		    options: {
		    	responsive: true,
		    
		    }
	
	 });
}

let week_chart3 = function(){
	chart4.destroy();
	var ctx2 = document.getElementById('radar_chart').getContext('2d');
	 chart4 = new Chart(ctx2, {
		 type: 'line',
		  // The data for our dataset
		    data: {
		        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
		        datasets: [{
		            label: '구독 수익',
		            data: [40, 70, 20, 50, 20, 30, 45],
		            borderColor: 'rgba(102, 102, 153, 0.75)',
		            backgroundColor: 'rgba(102, 102, 153, 0.3)',
		            pointBorderColor: 'rgba(102, 102, 153, 0)',
		            pointBackgroundColor: 'rgba(102, 102, 153, 0.9)',
		            pointBorderWidth: 1
		        },{
		        	 label: "도네 수익",
		             data: [28, 48, 40, 19, 86, 27, 90],
		             borderColor: 'rgba(233, 30, 99, 0.75)',
		             backgroundColor: 'rgba(233, 30, 99, 0.3)',
		             pointBorderColor: 'rgba(233, 30, 99, 0)',
		             pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
		             pointBorderWidth: 1
		        },{
		            label: '총 수익',
		            data: [68, 118, 60, 69, 116, 57, 135],
		            borderColor: 'rgba(204, 000, 204, 0.75)',
		            backgroundColor: 'rgba(204, 000, 204, 0.3)',
		            pointBorderColor: 'rgba(204, 000, 204, 0)',
		            pointBackgroundColor: 'rgba(204, 000, 204, 0.9)',
		            pointBorderWidth: 1
		        }]
		    },
		    options: {
		    	responsive: true,
		    
		    }
	
	 });
}

let year_chart3 = function(){
	chart4.destroy();
	var ctx2 = document.getElementById('radar_chart').getContext('2d');
	 chart4 = new Chart(ctx2, {
		 type: 'line',
		  // The data for our dataset
		    data: {
		    	labels: ['2011', '2012', '2013', '2014', '2015', '2016','2017','2018','2019','2020'],
		        datasets: [{
		            label: '구독 수익',
		            data: [40, 70, 20, 50, 20, 30, 45,34,56,23],
		            borderColor: 'rgba(102, 102, 153, 0.75)',
		            backgroundColor: 'rgba(102, 102, 153, 0.3)',
		            pointBorderColor: 'rgba(102, 102, 153, 0)',
		            pointBackgroundColor: 'rgba(102, 102, 153, 0.9)',
		            pointBorderWidth: 1
		        },{
		        	 label: "도네 수익",
		             data: [28, 48, 40, 19, 86, 27, 90,15,26,67],
		             borderColor: 'rgba(233, 30, 99, 0.75)',
		             backgroundColor: 'rgba(233, 30, 99, 0.3)',
		             pointBorderColor: 'rgba(233, 30, 99, 0)',
		             pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
		             pointBorderWidth: 1
		        },{
		            label: '총 수익',
		            data: [68, 118, 60, 69, 116, 57, 135,25,67,45],
		            borderColor: 'rgba(204, 000, 204, 0.75)',
		            backgroundColor: 'rgba(204, 000, 204, 0.3)',
		            pointBorderColor: 'rgba(204, 000, 204, 0)',
		            pointBackgroundColor: 'rgba(204, 000, 204, 0.9)',
		            pointBorderWidth: 1
		        }]
		    },
		    options: {
		    	responsive: true,
		    
		    }
	
	 });
}

let month_chart4= function(){
	chart5.destroy();
	var ctx2 = document.getElementById('pie_chart').getContext('2d');
	 chart5 = new Chart(ctx2, {
	    // The type of chart we want to create
	    type: 'pie',
	    // The data for our dataset
	    data: {
	         datasets: [{
	             data: [44, 23, 70, 50],
	             backgroundColor: [
	                 "rgb(233, 30, 99)",
	                 "rgb(255, 193, 7)",
	                 "rgb(0, 188, 212)",
	                 "rgb(139, 195, 74)"
	             ],
	         }],
	         labels: [
	             "Pink",
	             "Amber",
	             "Cyan",
	             "Light Green"
	         ]
	     },
	     options: {
	         responsive: true,
	         
	     }
	});
	
}

let week_chart4= function(){
	chart5.destroy();
	var ctx2 = document.getElementById('pie_chart').getContext('2d');
	 chart5 = new Chart(ctx2, {
	    // The type of chart we want to create
	    type: 'pie',
	    // The data for our dataset
	    data: {
	         datasets: [{
	        	 data: [225, 50, 100, 40],
	             backgroundColor: [
	                 "rgb(233, 30, 99)",
	                 "rgb(255, 193, 7)",
	                 "rgb(0, 188, 212)",
	                 "rgb(139, 195, 74)"
	             ],
	         }],
	         labels: [
	             "Pink",
	             "Amber",
	             "Cyan",
	             "Light Green"
	         ]
	     },
	     options: {
	         responsive: true,
	         
	     }
	});
	
}

let year_chart4= function(){
	chart5.destroy();
	var ctx2 = document.getElementById('pie_chart').getContext('2d');
	 chart5 = new Chart(ctx2, {
	    // The type of chart we want to create
	    type: 'pie',
	    // The data for our dataset
	    data: {
	         datasets: [{
	        	 data: [112, 50, 78, 40],
	             backgroundColor: [
	                 "rgb(233, 30, 99)",
	                 "rgb(255, 193, 7)",
	                 "rgb(0, 188, 212)",
	                 "rgb(139, 195, 74)"
	             ],
	         }],
	         labels: [
	             "Pink",
	             "Amber",
	             "Cyan",
	             "Light Green"
	         ]
	     },
	     options: {
	         responsive: true,
	         
	     }
	});
	
}


