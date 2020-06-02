package bean;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class MyPagePhotoUpload {
	
	public static String upload = "D:/JavaStudy/final_twitch/WebContent/img/user-photo/";
    
	String tempDir = "c:/temp/";
	
	int maxSize = 1024*1024*50;
	HttpServletRequest req;
	HttpServletResponse resp;
	
	public MyPagePhotoUpload(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
	}
	public boolean uploadFormCheck() {
		boolean flag = ServletFileUpload.isMultipartContent(req);
		
		return flag;
	}
	public UserInfoVo uploading() {
		UserInfoVo vo = new UserInfoVo();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(4096);
		factory.setRepository(new File(tempDir) );
		
		ServletFileUpload sf = new ServletFileUpload(factory);
		sf.setHeaderEncoding("utf-8");
		sf.setFileSizeMax(maxSize);
		
		try {
			List<FileItem> list = sf.parseRequest(req);
			for(FileItem fi : list) {
				String v = fi.getString("utf-8");
				String k = fi.getFieldName();
				
				if(fi.isFormField()) {
					switch(k) {
					case "userId" :
						vo.setMem_id(v);break;
					case "userName": // <input type='text' name='Id'/>
						vo.setMem_name(v);break;
					case "userEmail":
						vo.setMem_email(v);break;
					case "userContent":
						vo.setMem_profile(v);break;
					case "delFile" :
						if(v.equals("")) {
							vo.setFlag(0); // 사진 없던놈
												
						}else {
							vo.setFlag(1); // 사진 있던놈
							vo.setPh_delfile(v);
						}					
						break;
		
					/*case "delFile":
						ProductPhoto_mh attVo = new ProductPhoto_mh();
						attVo.setSysfile(v);
						delList.add(attVo);break;*/
						
					/*case "findStr":
						p.setFindStr(v);break;*/
					/*case "nowPage":
						p.setNowPage(Integer.parseInt(v));break;*/
					}
				}else { // <input type='file'/>
					if(fi.getSize()>0) {
						String f = fi.getName();
						String sysfile = new Date().getTime() + "-" +f ;		
						
						vo.setPh_orifile(f);
						vo.setPh_sysfile(sysfile);
						
						File file = new File(upload + sysfile);
						fi.write(file);
						
						fi.delete();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return vo;
		
	}
	
	
	
	

}
