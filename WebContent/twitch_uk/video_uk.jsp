<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<script src="./vendor/jwplayer7/jwplayer.js"></script>
	<script>
		jwplayer.key = 'iiL9xxalkP7di2nLZ3tPLw0NLBCHdHBe8i3QDQ==';
	</script>

	<div id="main" style="width: 100%;">
		<div id="mediaplayer"></div>
	</div>
	 
	<script>
		jwplayer('mediaplayer').setup({

			width : "100%",

			height : "406",

			primary : "flash",

			autostart : "false",

			//repeat: 'always',

			androidhls : true,

			abouttext : "얍얍",

			aboutlink : "http://www.jhta.co.kr",

			aspectratio : "16:9",

			sources : [ {
				file : "rtmp://192.168.0.77/hls/${vo.mem_Skey}",
			}, {
				file : "http://192.168.0.77:8882/hls/${vo.mem_Skey}.m3u8"
			} ]
		});
	</script>