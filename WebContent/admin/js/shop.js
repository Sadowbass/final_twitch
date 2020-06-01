/**
 * http://usejsdoc.org/
 */
var notice_view = function(){
	location.href = "index.jsp?inc=admin_pages/shop/notice_detail.jsp"
	
}

$("#notice_modify_btn").click (function(){
	location.href = "index.jsp?inc=admin_pages/shop/notice_modify.jsp"
})

$('.shop_menu_delete').click(function(){
	//메뉴 삭제
	$(this).closest("li").hide();
})

$('.shop_menu_plus').click(function(){
	//메뉴 추가
	var str ='<li class="dd-item dd3-item" data-id="26">'
		+'<div class="dd-handle dd3-handle"></div>'
		+'<div class="dd3-content">'
        +'<input type="text" class="shop_menu_input" placeholder="메뉴를 입력하세요" />'
        +'<div class="shop_menu_delete" onclick="delete_menu(this)">'
        +'<i class="material-icons">close</i>'
                                 +'</div>'
                                          +'</div>'
                                        +'</li>'
         $('.parent_list').append(str);
                                        
})

var delete_menu =function(del){
	//새로생긴 메뉴 삭제 
	$(del).closest("li").hide();
}

var review_view = function(){
	location.href="index.jsp?inc=admin_pages/shop/review_detail.jsp"
}