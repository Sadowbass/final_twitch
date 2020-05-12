/**
 * 
 */let lm = {}
 
 lm.func= function(){
	
	 
	 
	 $('#btnsum').click(function(){
		 
	 
	 
	 })
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 //로그인
	 $('#btnLogin').click(function(){
		let param = $('#frm_login').serialize();
		$.post("../login.lm", param, function(data, state){
			alert(data);
			location.href='../index.jsp';
		});
	})	
	//로그아웃
	$('#btnLogout').click(function(){
		$.post("logout.mm", null, function(data, state){
			alert(data);
			location.href='index.jsp';
		});
		
	})
	
}