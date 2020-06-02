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



let month_chart2 = function(a,b,c,d,e,f,g,h,i,j,k,l,a2,b2,c2,d2,e2,f2,g2,h2,i2,j2,k2,l2){
	chart3.destroy();
	var ctx2 = document.getElementById('bar_chart').getContext('2d');
	 chart3 = new Chart(ctx2, {
	    // The type of chart we want to create
	    type: 'line',
	    // The data for our dataset
	    data: {
	        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월','8월','9월','10월','11월','12월'],
	         datasets: [{
	             label: "새 구독자 수",
	             data: [a, b, c, d, e, f,g,h,i,j,k,l],
	             borderColor: 'rgba(0, 188, 212, 0.75)',
	             backgroundColor: 'rgba(0, 188, 212, 0.3)',
	             pointBorderColor: 'rgba(0, 188, 212, 0)',
	             pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
	             pointBorderWidth: 1
	         }, {
	                 label: "누적 구독자 수",
	                 data: [a2, b2, c2, d2, e2, f2,g2,h2,i2,j2,k2,l2],
	                 borderColor: 'rgba(233, 30, 99, 0.75)',
	                 backgroundColor: 'rgba(233, 30, 99, 0.3)',
	                 pointBorderColor: 'rgba(233, 30, 99, 0)',
	                 pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
	                 pointBorderWidth: 1
	             }]
	    },
	    options: {
	        responsive: true,
	        
	    }
	});
	
}

let week_chart2 =function(mon,tue,wen,thr,fri,sat,sun,mon2,tue2,wen2,thr2,fri2,sat2,sun2){
	chart3.destroy();
	var ctx2 = document.getElementById('bar_chart').getContext('2d');
	 chart3 = new Chart(ctx2, {
	    // The type of chart we want to create
	    type: 'line',
	    // The data for our dataset
	    data: {
	    	 labels: ['일','월', '화', '수', '목', '금', '토'],
	         datasets: [{
	             label: "새 구독자 수",
	             data: [mon,tue,wen,thr,fri,sat,sun],
	             borderColor: 'rgba(0, 188, 212, 0.75)',
	             backgroundColor: 'rgba(0, 188, 212, 0.3)',
	             pointBorderColor: 'rgba(0, 188, 212, 0)',
	             pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
	             pointBorderWidth: 1
	         }, {
	                 label: "누적 구독자 수",
	                 data: [mon2,tue2,wen2,thr2,fri2,sat2,sun2],
	                 borderColor: 'rgba(233, 30, 99, 0.75)',
	                 backgroundColor: 'rgba(233, 30, 99, 0.3)',
	                 pointBorderColor: 'rgba(233, 30, 99, 0)',
	                 pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
	                 pointBorderWidth: 1
	             }]
	    },
	    options: {
	        responsive: true,
	        
	    }
	});
}

let year_chart2 =function(a,b,c,d,e,f,g,h,i,j,a2,b2,c2,d2,e2,f2,g2,h2,i2,j2){
	chart3.destroy();
	var ctx2 = document.getElementById('bar_chart').getContext('2d');
	 chart3 = new Chart(ctx2, {
	    // The type of chart we want to create
	    type: 'line',
	    // The data for our dataset
	    data: {
	    	labels: ['2011', '2012', '2013', '2014', '2015', '2016','2017','2018','2019','2020'],
	         datasets: [{
	             label: "새 구독자 수",
	             data:  [a, b, c, d, e, f, g,h,i,j],
	             borderColor: 'rgba(0, 188, 212, 0.75)',
	             backgroundColor: 'rgba(0, 188, 212, 0.3)',
	             pointBorderColor: 'rgba(0, 188, 212, 0)',
	             pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
	             pointBorderWidth: 1
	         }, {
	                 label: "누적 구독자 수",
	                 data: [a2, b2, c2, d2, e2, f2, g2,h2,i2,j2],
	                 borderColor: 'rgba(233, 30, 99, 0.75)',
	                 backgroundColor: 'rgba(233, 30, 99, 0.3)',
	                 pointBorderColor: 'rgba(233, 30, 99, 0)',
	                 pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
	                 pointBorderWidth: 1
	             }]
	    },
	    options: {
	        responsive: true,
	        
	    }
	});
}

let month_chart3 = function(m,d){
	var m1 = m.substring(1,m.length-1);
	var m2 = m1.split(",");
	var d1 = d.substring(1,d.length-1);
	var d2 = d1.split(",");
	chart4.destroy();
	var ctx2 = document.getElementById('radar_chart').getContext('2d');
	 chart4 = new Chart(ctx2, {
		 type: 'line',
		    // The data for our dataset
		    data: {
		        labels:['1월', '2월', '3월', '4월', '5월', '6월', '7월','8월','9월','10월','11월','12월'],
		        datasets: [{
		            label: '구독 수익',
		            data: [m2[0], m2[1], m2[2], m2[3], m2[4], m2[5], m2[6],m2[7],m2[8],m2[9],m2[10],m2[11]],
		            borderColor: 'rgba(102, 102, 153, 0.75)',
		            backgroundColor: 'rgba(102, 102, 153, 0.3)',
		            pointBorderColor: 'rgba(102, 102, 153, 0)',
		            pointBackgroundColor: 'rgba(102, 102, 153, 0.9)',
		            pointBorderWidth: 1
		        },{
		        	 label: "도네 수익",
		             data:  [d2[0], d2[1], d2[2], d2[3], d2[4], d2[5], d2[6],d2[7],d2[8],d2[9],d2[10],d2[11]],
		             borderColor: 'rgba(233, 30, 99, 0.75)',
		             backgroundColor: 'rgba(233, 30, 99, 0.3)',
		             pointBorderColor: 'rgba(233, 30, 99, 0)',
		             pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
		             pointBorderWidth: 1
		        },{
		            label: '총 수익',
		            data: [Number(m2[0])+Number(d2[0]), Number(m2[1])+Number(d2[1]), Number(m2[2])+Number(d2[2]), Number(m2[3])+Number(d2[3]), Number(m2[4])+Number(d2[4]), Number(m2[5])+Number(d2[5]),
		            	Number(m2[6])+Number(d2[6]),Number(m2[7])+Number(d2[7]),Number(m2[8])+Number(d2[8]),Number(m2[9])+Number(d2[9]),Number(m2[10])+Number(d2[10]),Number(m2[11])+Number(d2[11])],
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

let week_chart3 = function(d,s){
	var s1 = s.substring(1,s.length-1);
	var s2 = s1.split(",");
	var d1 = d.substring(1,d.length-1);
	var d2 = d1.split(",");
	chart4.destroy();
	var ctx2 = document.getElementById('radar_chart').getContext('2d');
	 chart4 = new Chart(ctx2, {
		 type: 'line',
		  // The data for our dataset
		    data: {
		        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
		        datasets: [{
		            label: '구독 수익',
		            data: [s2[0], s2[1], s2[2], s2[3], s2[4], s2[5], s2[6]],
		            borderColor: 'rgba(102, 102, 153, 0.75)',
		            backgroundColor: 'rgba(102, 102, 153, 0.3)',
		            pointBorderColor: 'rgba(102, 102, 153, 0)',
		            pointBackgroundColor: 'rgba(102, 102, 153, 0.9)',
		            pointBorderWidth: 1
		        },{
		        	 label: "도네 수익",
		             data: [d2[0], d2[1], d2[2], d2[3], d2[4], d2[5], d2[6]],
		             borderColor: 'rgba(233, 30, 99, 0.75)',
		             backgroundColor: 'rgba(233, 30, 99, 0.3)',
		             pointBorderColor: 'rgba(233, 30, 99, 0)',
		             pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
		             pointBorderWidth: 1
		        },{
		            label: '총 수익',
		            data: [Number(s2[0])+Number(d2[0]), Number(s2[1])+Number(d2[1]), Number(s2[2])+Number(d2[2]), Number(s2[3])+Number(d2[3]), Number(s2[4])+Number(d2[4]), Number(s2[5])+Number(d2[5]),Number(s2[6])+Number(d2[6])],
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

let year_chart3 = function(d,s){
	var s1 = s.substring(1,s.length-1);
	var s2 = s1.split(",");
	var d1 = d.substring(1,d.length-1);
	var d2 = d1.split(",");
	chart4.destroy();
	var ctx2 = document.getElementById('radar_chart').getContext('2d');
	 chart4 = new Chart(ctx2, {
		 type: 'line',
		  // The data for our dataset
		    data: {
		    	labels: ['2011', '2012', '2013', '2014', '2015', '2016','2017','2018','2019','2020'],
		        datasets: [{
		            label: '구독 수익',
		            data: [s2[0], s2[1], s2[2], s2[3], s2[4], s2[5], s2[6],s2[7],s2[8],s2[9]],
		            borderColor: 'rgba(102, 102, 153, 0.75)',
		            backgroundColor: 'rgba(102, 102, 153, 0.3)',
		            pointBorderColor: 'rgba(102, 102, 153, 0)',
		            pointBackgroundColor: 'rgba(102, 102, 153, 0.9)',
		            pointBorderWidth: 1
		        },{
		        	 label: "도네 수익",
		             data: [d2[0],d2[1] , d2[2], d2[3], d2[4], d2[5], d2[6],d2[7],d2[8],d2[9]],
		             borderColor: 'rgba(233, 30, 99, 0.75)',
		             backgroundColor: 'rgba(233, 30, 99, 0.3)',
		             pointBorderColor: 'rgba(233, 30, 99, 0)',
		             pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
		             pointBorderWidth: 1
		        },{
		            label: '총 수익',
		            data: [Number(d2[0])+Number(s2[0]), Number(d2[1])+Number(s2[1]), Number(d2[2])+Number(s2[2]), Number(d2[3])+Number(s2[3]), Number(d2[4])+Number(s2[4]), Number(d2[5])+Number(s2[5]), Number(d2[6])+Number(s2[6]),Number(d2[7])+Number(s2[7]),Number(d2[8])+Number(s2[8]),Number(d2[9])+Number(s2[9])],
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


let month_chart5 = function(a,b,c,d,e,f,g,h,i,j,k,l,a2,b2,c2,d2,e2,f2,g2,h2,i2,j2,k2,l2){
	chart6.destroy();
	var ctx2 = document.getElementById('follow_chart').getContext('2d');
	 chart6 = new Chart(ctx2, {
	    // The type of chart we want to create
	    type: 'line',
	    // The data for our dataset
	    data: {
	        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월','8월','9월','10월','11월','12월'],
	         datasets: [{
	             label: "새 팔로우 수",
	             data: [a, b, c, d, e, f, g,h,i,j,k,l],
	             borderColor: 'rgba(0, 188, 212, 0.75)',
	             backgroundColor: 'rgba(0, 188, 212, 0.3)',
	             pointBorderColor: 'rgba(0, 188, 212, 0)',
	             pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
	             pointBorderWidth: 1
	         }, {
	                 label: "누적 팔로우 수",
	                 data: [a2, b2, c2, d2, e2, f2, g2,h2,i2,j2,k2,l2],
	                 borderColor: 'rgba(233, 30, 99, 0.75)',
	                 backgroundColor: 'rgba(233, 30, 99, 0.3)',
	                 pointBorderColor: 'rgba(233, 30, 99, 0)',
	                 pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
	                 pointBorderWidth: 1
	             }]
	    },
	    options: {
	        responsive: true,
	        
	    }
	});
	
}

let week_chart5 =function(mon,tue,wen,thr,fri,sat,sun,mon2,tue2,wen2,thr2,fri2,sat2,sun2){
	chart6.destroy();
	var ctx2 = document.getElementById('follow_chart').getContext('2d');
	 chart6 = new Chart(ctx2, {
	    // The type of chart we want to create
	    type: 'line',
	    // The data for our dataset
	    data: {
	    	 labels: ['일','월', '화', '수', '목', '금', '토'],
	         datasets: [{
	             label: "새 팔로우 수",
	             data: [mon,tue,wen,thr,fri,sat,sun],
	             borderColor: 'rgba(0, 188, 212, 0.75)',
	             backgroundColor: 'rgba(0, 188, 212, 0.3)',
	             pointBorderColor: 'rgba(0, 188, 212, 0)',
	             pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
	             pointBorderWidth: 1
	         }, {
	                 label: "누적 팔로우 수",
	                 data: [mon2,tue2,wen2,thr2,fri2,sat2,sun2],
	                 borderColor: 'rgba(233, 30, 99, 0.75)',
	                 backgroundColor: 'rgba(233, 30, 99, 0.3)',
	                 pointBorderColor: 'rgba(233, 30, 99, 0)',
	                 pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
	                 pointBorderWidth: 1
	             }]
	    },
	    options: {
	        responsive: true,
	        
	    }
	});
}

let year_chart5 =function(a,b,c,d,e,f,g,h,i,j,a2,b2,c2,d2,e2,f2,g2,h2,i2,j2){
	chart6.destroy();
	var ctx2 = document.getElementById('follow_chart').getContext('2d');
	 chart6 = new Chart(ctx2, {
	    // The type of chart we want to create
	    type: 'line',
	    // The data for our dataset
	    data: {
	    	labels: ['2011', '2012', '2013', '2014', '2015', '2016','2017','2018','2019','2020'],
	         datasets: [{
	             label: "새 팔로우 수",
	             data: [a, b, c, d, e, f, g,h,i,j],
	             borderColor: 'rgba(0, 188, 212, 0.75)',
	             backgroundColor: 'rgba(0, 188, 212, 0.3)',
	             pointBorderColor: 'rgba(0, 188, 212, 0)',
	             pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
	             pointBorderWidth: 1
	         }, {
	                 label: "누적 구독자 수",
	                 data: [a2, b2, c2, d2, e2, f2, g2,h2,i2,j2],
	                 borderColor: 'rgba(233, 30, 99, 0.75)',
	                 backgroundColor: 'rgba(233, 30, 99, 0.3)',
	                 pointBorderColor: 'rgba(233, 30, 99, 0)',
	                 pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
	                 pointBorderWidth: 1
	             }]
	    },
	    options: {
	        responsive: true,
	        
	    }
	});
}

function broad_stop(serial) {
    swal({
        title: "정말 정지하시겠습니까?",
        text: "다시 복구할 수 없습니다!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#e14eca",
        confirmButtonText: "정지",
        cancelButtonText: "취소",
        closeOnConfirm: false,
        closeOnCancel: false
    }, function (isConfirm) {
        if (isConfirm) {
        	let param = $('#he_form').serialize();
        	$.ajax({
        		url:'broadstop.he',
        		type:'post',
        		data:param,
        		error: function(xhr,status,error){
        			swal("에러발생",error, "error");
        		},
        		success:function(data,xhr,status){
        			swal({
        		        title: "정지 완료",
        		        text: "해당 회원의 방송이용이  정지되었습니다",
        		        type: "success",
        		        closeOnConfirm: true
        		    }, function () {
        		    	$('#he_serial').val(serial);
        		    	$('#he_form').attr('action','streamer_view.he').submit();	
        		    });
        		}
           })
        } else {
            swal("취소됨", "방송 정지가 취소되었습니다", "error");
        }
    });
}

function broad_ok(serial){
	swal({
        title: "정말 정지를 해제하시겠습니까?",
        text: "다시 복구할 수 없습니다!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#e14eca",
        confirmButtonText: "정지해제",
        cancelButtonText: "취소",
        closeOnConfirm: false,
        closeOnCancel: false
    }, function (isConfirm) {
        if (isConfirm) {
        	let param = $('#he_form').serialize();
        	$.ajax({
        		url:'broadok.he',
        		type:'post',
        		data:param,
        		error: function(xhr,status,error){
        			swal("에러발생",error, "error");
        		},
        		success:function(data,xhr,status){
        			swal({
        		        title: "해제 완료",
        		        text: "해당 회원의 방송이용정지가  해제되었습니다",
        		        type: "success",
        		        closeOnConfirm: true
        		    }, function () {
        		    	$('#he_serial').val(serial);
        		    	$('#he_form').attr('action','streamer_view.he').submit();	
        		    });
        		}
           })
        } else {
            swal("취소됨", "방송 정지해제가 취소되었습니다", "error");
        }
    });
}

function s_detail(serial){
	$('#he_serial').val(serial);
	$('#he_form').attr('action','streamer_view.he').submit();	
}

function d_list_n(){
	let nowpage =Number($('#page').val())+1
	if(nowpage>0){
		$('#page').val(nowpage);
	}
	
	let param = $('#he_form').serialize();
	$.ajax({
		url:'profit.he',
		type:'post',
		data:param,
		error: function(xhr,status,error){
			swal("에러발생",error, "error");
		},
		success:function(data,xhr,status){
			$('#main_body').html(data);
		}
		});
	//$('#he_form').attr('action','profit.he').submit();	
}

function d_list_b(){
	let nowpage = Number($('#page').val())-1
	if(nowpage>0){
		$('#page').val(nowpage);
	}
	let param = $('#he_form').serialize();
	$.ajax({
		url:'profit.he',
		type:'post',
		data:param,
		error: function(xhr,status,error){
			swal("에러발생",error, "error");
		},
		success:function(data,xhr,status){
			$('#main_body').html(data);
		}
	});
	
	//$('#he_form').attr('action','profit.he').submit();	
}

function s_list_n(){
	let nowpage =Number($('#page2').val())+1
	if(nowpage>0){
		$('#page2').val(nowpage);
	}
	
	let param = $('#he_form2').serialize();
	$.ajax({
		url:'profit.he',
		type:'post',
		data:param,
		error: function(xhr,status,error){
			swal("에러발생",error, "error");
		},
		success:function(data,xhr,status){
			$('#main_body').html(data);
		}
	});
	
	//$('#he_form2').attr('action','profit.he').submit();	
}

function s_list_b(){
	let nowpage = Number($('#page2').val())-1
	if(nowpage>0){
		$('#page2').val(nowpage);
	}
	
	let param = $('#he_form2').serialize();
	$.ajax({
		url:'profit.he',
		type:'post',
		data:param,
		error: function(xhr,status,error){
			swal("에러발생",error, "error");
		},
		success:function(data,xhr,status){
			$('#main_body').html(data);
		}
	});
	
	
	//$('#he_form2').attr('action','profit.he').submit();	
}
