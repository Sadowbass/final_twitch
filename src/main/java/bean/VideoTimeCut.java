package bean;

import java.io.IOException;

public class VideoTimeCut {

	public static void main(String[] args) throws IOException {
		//thumbnail();
	}
	
	
	public void thumbnail(String sKey,String time) {
		System.out.println(sKey +"Ű");
		System.out.println(time +"�ð�");
		Runtime run = Runtime.getRuntime();
		String videofile = "C:/Users/JHTA/Desktop/nginx/nginx-rtmp-win32-1.17.0_V3_20190527/html/hls/"+sKey +".m3u8";
		String dataUrl = "C:/Users/JHTA/eclipse-workspace/final_twitch/WebContent/uploads/"+ sKey+".m3u8";
		String command = "C:/ffmpeg-4.2.2-win64-static/bin/ffmpeg.exe  -y -i \"" + videofile + "\" -ss 00:00:01 -vcodec png -vframes 1 \""  +dataUrl + ".png\""; // ������ 1�ʿ��� Thumbnail ����
		//String command = "C:/ffmpeg-20191109-0f89a22-win64-static/bin/ffmpeg.exe -i \"" + videofile + "\" -ss 00:00:01 -vcodec png -vframes 1 \""  +videofile + "_%2d.png\""; // ������ 
		System.out.println(command);
		try{
		    run.exec("cmd.exe chcp 65001");  // cmd���� �ѱ۹����� ������� ��������������� cmdâ���� utf-8�� ��ȯ�ϴ� ���
		    run.exec(command);
		}catch(Exception e){
		    System.out.println("�������� : "+e.getMessage());
		    //e.printStackTrace();
		}       


	}
}