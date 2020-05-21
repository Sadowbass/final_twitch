package config;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.omg.CORBA.Request;
import org.springframework.context.ApplicationContext;

import bean.BroadCastingCateVo;
import bean.MemberVo;

public class HE_FileUpload2 {
	
	HttpServletRequest req;
	HttpServletResponse resp;
	String path;
	
	//public static String upload = 
	String tempDir = "c:/Temp/";
	
	int maxSize = 1024 * 1024 * 50;

	public HE_FileUpload2(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
		//File test = new File("admin/images/member_img/");
		//System.out.println(test.getAbsolutePath());
	    path = req.getSession().getServletContext().getRealPath("/img/cate/"); //가상서버 경로 
		System.out.println("사진 업로드 절대경로:"+path);
	}

	public boolean uploadFormCheck() { // enctype 이 enctype='multipart/form-data'인가 체크
		boolean flag = ServletFileUpload.isMultipartContent(req);

		return flag;
	}

	public BroadCastingCateVo boardUploading() {
		BroadCastingCateVo vo = new BroadCastingCateVo();

		DiskFileItemFactory factory = new DiskFileItemFactory(); // 아파치에 파일업로드를 하기위한 클래스
		factory.setSizeThreshold(4096); // 파일 업로드할때 사용할 버퍼 메모리 크기
		factory.setRepository(new File(tempDir));// 업로드 중에 파일이 저장되는 공간

		ServletFileUpload sf = new ServletFileUpload(factory);
		sf.setHeaderEncoding("utf-8");
		sf.setFileSizeMax(maxSize);

		try {
			List<FileItem> list = sf.parseRequest(req);
			for (FileItem fi : list) {
				String v = fi.getString("utf-8"); // 이건 value값
				String k = fi.getFieldName(); // 입력 태그의 이름
				if (fi.isFormField()) { // input type 인가?
					switch (k) {
					case "cate_name": // <input type = 'text' name='mId'/> 인가
						vo.setCat_gname(v);
						break;
					case "cate_tags":
						vo.setCat_genre(v);
						break;
					case "cate_serial":
						vo.setCat_serial(v);
						break;
					}
			
				} else { // <input type = 'file' /> 인가
					if (fi.getSize() > 0) {
						String f = fi.getName();
						String sysfile = new Date().getTime() + "-" + f;
						vo.setCat_orifile(f);
						vo.setCat_sysfile(sysfile);
						
						File file = new File(path + sysfile);
						fi.write(file);
						fi.delete(); // 임시파일을 지우는 작업
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return vo;
	}


}