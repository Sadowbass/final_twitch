<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<script src="./vendor/jwplayer7/jwplayer.js"></script>
	<script>
		jwplayer.key = 'iiL9xxalkP7di2nLZ3tPLw0NLBCHdHBe8i3QDQ==';
	</script>

		<div id="mediaplayer"></div>

	<script>
		jwplayer('mediaplayer').setup({

			width : "100%",

			primary : "flash",

			autostart : "true",

			//repeat: 'always',

			androidhls : true,

			abouttext : "얍얍",

			aboutlink : "http://www.jhta.co.kr",

			aspectratio : "16:9",

			sources : [ {
				file : "rtmp://daum123.gonetis.com/hls/${vo.mem_Skey}",
			}, {
				file : "http://daum123.gonetis.com:8882/hls/${vo.mem_Skey}.m3u8"
			} ]
		});
	</script>