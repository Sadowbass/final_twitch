/**
 * 2020.05.18
 * 템플릿 외 추가
 */
$(document).ready(function(){
	 $("#input_img").on("change", handleImages);
});

function handleImages(e){
    
    var files = e.target.files;
    var fileArr = Array.prototype.slice.call(files);
    
    fileArr.forEach(function(f){
    	if(!f.type.match("image.*")){
        	alert("이미지 확장자만 업로드 가능합니다.");
            return;
        }
       
        	sel_files.push(f);
            var reader = new FileReader();
            reader.onload = function(e){
            	var html = "<img src =\""+ e.target.result + "\" />";
                $('.imgs_wrap').append(html);
                index++;
            };
            reader.readAsDataURL(f);
        
    })
} 