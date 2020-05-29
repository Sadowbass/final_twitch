<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<script src="./vendor/jwplayer7/jwplayer.js"></script>
<script>
  jwplayer.key = "iiL9xxalkP7di2nLZ3tPLw0NLBCHdHBe8i3QDQ==";
</script>

<div id="mediaplayer"></div>

<script>
  jwplayer("mediaplayer").setup({
    width: "100%",

    primary: "flash",

    autostart: "true",

    //repeat: 'always',

    androidhls: true,

    abouttext: "얍얍",

    aboutlink: "http://www.jhta.co.kr",

    aspectratio: "16:9",

    sources: [
      {
        file: "rtmp://192.168.0.77/hls/${vo.mem_skey}",
      },
      {
        file: "http://192.168.0.77:8882/hls/${vo.mem_skey}.m3u8",
      },
    ],
  });

  /*jwplayer().onIdle(function () {
    location.href = "test5";
  });*/
</script>
