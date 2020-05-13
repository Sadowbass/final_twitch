
function LoadImg(value,i){
	if(value.files && value.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			/*alert(e.target.result);*/
			$('#target'+i).attr('src',e.target.result);
		}
		/*alert(value.files[0])*/
		reader.readAsDataURL(value.files[0])
	}
}

var cmh = {}

cmh.func = function(){
	
}
