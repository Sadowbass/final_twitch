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




