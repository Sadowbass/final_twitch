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

public class ProductPhotoUpload_mh {
	public static String upload = "D:/Java_Study/final_twitch/WebContent/admin/admin_pages/product_photo/";
	                               
	String tempDir = "c:/temp/";
	
	int maxSize = 1024*1024*50;
	HttpServletRequest req;
	HttpServletResponse resp;
	
	public ProductPhotoUpload_mh(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
	}
	public boolean uploadFormCheck() {
		boolean flag = ServletFileUpload.isMultipartContent(req);
		
		return flag;
	}
	public HttpServletRequest uploading() {
		
		ProductVo_mh vo = new ProductVo_mh();
		List<ProductPhoto_mh> attList = new ArrayList<ProductPhoto_mh>();
		List<ProductPhoto_mh> delList = new ArrayList<ProductPhoto_mh>();
		//Page p = new Page();
		
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
					case "productName": // <input type='text' name='Id'/>
						vo.setProduct_name(v);break;
					case "productPrice":
						vo.setProduct_price(Integer.parseInt(v));break;
					case "productSize":
						vo.setProduct_size(v);break;
					case "explain":
						vo.setProduct_explain(v);break;			
					case "productCount":
						vo.setProduct_count(Integer.parseInt(v));break;
					case "category":
						vo.setProduct_cate(v);break;	
						
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
						ProductPhoto_mh attVo = new ProductPhoto_mh();
						
						System.out.println("sysfile :" + sysfile);
						
						attVo.setOrifile(f);
						attVo.setSysfile(sysfile);
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
		/*req.setAttribute("delList", delList);*/
		/*req.setAttribute("p", p);*/
		
		return req;
		
	}
}
