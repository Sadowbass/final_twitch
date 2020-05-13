
function LoadImg(value,i){
	if(value.files && value.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			/*alert(e.target.result);*/
			/*$('#target'+i).attr('src',e.target.result);*/
			$('#target'+i).css({"background-image":"url("+e.target.result+")"});
		}
		/*alert(value.files[0])*/
		reader.readAsDataURL(value.files[0])
	}
}

var cmh = {}

cmh.func = function(){
	$('#close1').click(function(){
		$('#target1').css({'background-image':'url(https://via.placeholder.com/300)'})
	})
	$('#close2').click(function(){
		$('#target2').css({'background-image':'url(https://via.placeholder.com/300)'})
	})
	$('#close3').click(function(){
		$('#target3').css({'background-image':'url(https://via.placeholder.com/300)'})
	})
}

cmh.productView = function(serial){
	location.href = "index.jsp?inc=admin_pages/shop/product_view.jsp"
}

cmh.orderView = function(serial){
	location.href = "index.jsp?inc=admin_pages/shop/order_view.jsp"
}
