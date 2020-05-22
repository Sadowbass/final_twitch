package bean;

import java.io.IOException;

public class VideoTimeCut {

	public static void main(String[] args) throws IOException {
		//thumbnail();
	}
	
	
	public void thumbnail(String sKey,String time) {
		System.out.println(sKey +"키");
		System.out.println(time +"시간");
		Runtime run = Runtime.getRuntime();
		String videofile = "C:/Users/JHTA/Desktop/nginx/nginx-rtmp-win32-1.17.0_V3_20190527/html/hls/"+sKey +".m3u8";
		String dataUrl = "C:/Users/JHTA/eclipse-workspace/final_twitch/WebContent/uploads/"+ sKey+".m3u8";
		String command = "C:/ffmpeg-4.2.2-win64-static/bin/ffmpeg.exe  -y -i \"" + videofile + "\" -ss 00:00:01 -vcodec png -vframes 1 \""  +dataUrl + ".png\""; // 동영상 1초에서 Thumbnail 추출
		//String command = "C:/ffmpeg-20191109-0f89a22-win64-static/bin/ffmpeg.exe -i \"" + videofile + "\" -ss 00:00:01 -vcodec png -vframes 1 \""  +videofile + "_%2d.png\""; // 동영상 
		System.out.println(command);
		try{
		    run.exec("cmd.exe chcp 65001");  // cmd에서 한글문제로 썸네일이 만들어지지않을시 cmd창에서 utf-8로 변환하는 명령
		    run.exec(command);
		}catch(Exception e){
		    System.out.println("에러났다 : "+e.getMessage());
		    //e.printStackTrace();
		}       


	}
}