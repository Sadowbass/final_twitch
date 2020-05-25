package login;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;



public class Member_mPhotoUpload {
	public static String upload = "c:/Users/JHTA/eclipse-workspace3/1907-login/WebContent/photo/";
	                               
	String tempDir = "c:/temp/";
	
	int maxSize = 1024*1024*50;
	HttpServletRequest req;
	HttpServletResponse resp;
	
	public Member_mPhotoUpload(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
	}
	public boolean uploadFormCheck() {
		boolean flag = ServletFileUpload.isMultipartContent(req);
		
		return flag;
	}
	public HttpServletRequest uploading() {
		MemberVo_m vo = new MemberVo_m();
		List<Member_mPhoto> attList = new ArrayList<Member_mPhoto>();
		List<Member_mPhoto> delList = new ArrayList<Member_mPhoto>();
		
		
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
					case "mId": // <input type='text' name='Id'/>
						vo.setMem_Id(v);break;
					case "pwd":
						vo.setMem_pwd(v);break;
					case "mName":
						vo.setMem_name(v);break;
					
					case "delFile":
						Member_mPhoto attVo = new Member_mPhoto();
						attVo.setPh_sysFile(v);
						delList.add(attVo);break;
				
					}
				}else { // <input type='file'/>
					if(fi.getSize()>0) {
						String f = fi.getName();
						String sysfile = new Date().getTime() + "-" +f ;
						Member_mPhoto attVo = new Member_mPhoto();
						attVo.setPh_Id(vo.getMem_Id());
						attVo.setPh_oriFile(f);
						attVo.setPh_sysFile(v);
						attList.add(attVo);
						
						File file = new File(upload + sysfile);
						fi.write(file);
						
						fi.delete();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		req.setAttribute("vo", vo);
		req.setAttribute("attList", attList);
		req.setAttribute("delList", delList);
		
		return req;
		
	}
}
