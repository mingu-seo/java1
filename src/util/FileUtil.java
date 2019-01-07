package util;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import property.SiteProperty;

public class FileUtil {
	protected final Log logger = LogFactory.getLog(getClass());
	
	private ServletContext servletContext;

	private File file;
	
	private String name;		// current file name
	private String relPath;		// relative path
	private String absPath;		// absolute path
	private String srcName;		// source file name
	private String srcType;		// source file type
	private long srcSize;		// source file Size
	private int width;			// width
	private int height;			// height
	private int sized;			// 사이즈를 수동 입력했는지 자동 입력 했는지
	
	public static final int AUTO_SIZED = 1;
	public static final int MANUAL_SIZED = 2;
	public static final String imageType[] = {"gif", "jpg", "jpeg", "png", "bmp"};
	public static final String flashType[] = {"swf"};
	
	private int maxWidth;
	private int maxHeight;
	private boolean zoom;
	
	static HashMap mime = new HashMap();
	static {
		mime.put("pdf", "application/pdf");
		mime.put("doc", "application/msword");
		mime.put("xls", "application/vnd.ms-excel");
		mime.put("ppt", "application/vnd.ms-powerpoint");
		mime.put("hwp", "application/x-hwp");
		mime.put("txt", "plain/text");
		mime.put("html", "text/html");
		mime.put("htm", "text/html");
		mime.put("xml", "text/xml");
	}

	static public String getMimeType(String ext) {
		return (String)mime.get(ext);
	}
	
	public String getType(String fileName) {
		String type = "";
		
		if (fileName!=null && fileName.length()>0 && fileName.lastIndexOf(".")>-1) {
			type = fileName.substring(fileName.lastIndexOf(".")+1, fileName.length());
		}
		
		return type.toLowerCase();
	}
	
	public boolean isImageFile(String type) {
		type = type.toLowerCase();
		if (type!=null && (type.equals("gif") || type.equals("jpg") || 
			type.equals("jpeg") || type.equals("bmp") || type.equals("png"))) {
			return true;	
		}
		
		return false;
	}
	
	public void setSize(File file) {
		try {
			BufferedImage bi = ImageIO.read(file); 
             
			setHeight(bi.getHeight()); 
			setWidth(bi.getWidth());
			
			sized = AUTO_SIZED;
		} catch (Exception e) {
			logger.debug("FileException during file size check.", e);
		}
	}
	
	// 파일업로드를 위한 첨부파일을 Map에 저장
	public Map getFileMap(HttpServletRequest request) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map map = multipartRequest.getFileMap();
		
		return map;
	}
	
	public void upload(MultipartFile file, String relPath, String absPath, String renamePrefix) throws IOException {
		if (file == null) throw new FileNotFoundException();
		
		String fileExt = "";
		int i = -1;
		if ((i = file.getOriginalFilename().indexOf(".")) != -1) {
			fileExt = file.getOriginalFilename().substring(i);
		}
		this.name = renamePrefix+"_"+new Date().getTime()+fileExt;
		this.srcName = file.getOriginalFilename();
		this.srcType = getType(srcName);
		this.srcSize = file.getSize();
		this.relPath = relPath;
	
		// 파일 저장
//		String realPath = absPath + File.separator + name;     + File.separator 가 왜 있는건지 모르겠음.
		String realPath = absPath + relPath + name;
		File outputFile = new File(realPath);
		OutputStream os = FileUtils.openOutputStream(outputFile);
		BufferedOutputStream bos = new BufferedOutputStream(os);
		bos.write(file.getBytes());
		bos.close();
		os.close();
		
		this.absPath = outputFile.getAbsolutePath();
		 
		if (isImageFile(srcType)){
			setSize(outputFile);
		}
		
		this.file = outputFile;		
	}
/*	
	public void fileNameCheckUpload(MultipartFile file, String relPath, String absPath) throws IOException {
		if (file == null) throw new FileNotFoundException();
		
		this.name = file.getOriginalFilename();
		this.srcName = file.getOriginalFilename();
		this.srcType = getType(srcName);
		this.srcSize = file.getSize();
		this.relPath = relPath;
		
		// 파일 저장
		String realPath = absPath + File.separator + name;
		File outputFile = new File(realPath);
		String fileName = file.getOriginalFilename();
		StringBuffer reFileName = new StringBuffer();
		String splitName[];
		
		// 파일명 중복 체크
		int i = 1;
		while( outputFile.exists() ) {
		      if( i == 1 ) {
		    	  splitName = fileName.split("[.]");
		      } else {
		    	  splitName = fileName.split("[(][0-9]+[)][.]");
		      }
		      //fileName = splitName[splitName.length - 2] + "(" + i + ")." + splitName[splitName.length - 1];
		      reFileName.append(splitName[splitName.length - 2]);
		      reFileName.append("(");
		      reFileName.append(i);
		      reFileName.append(").");
		      reFileName.append(splitName[splitName.length - 1]);

		      this.srcName = reFileName.toString();
		      realPath = SiteProperty.PROPOSAL_REAL_PATH + File.separator + reFileName.toString();
		      outputFile = new File(realPath);

		      i++;
		}
		
		OutputStream os = FileUtils.openOutputStream(outputFile);
		BufferedOutputStream bos = new BufferedOutputStream(os);
		bos.write(file.getBytes());
		bos.close();
		os.close();
		
		this.absPath = outputFile.getAbsolutePath();
		 
		if (isImageFile(srcType)){
			setSize(outputFile);
		}
		
		this.file = outputFile;
	}
*/
	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRelPath() {
		return relPath;
	}

	public void setRelPath(String relPath) {
		this.relPath = relPath;
	}

	public String getAbsPath() {
		return absPath;
	}

	public void setAbsPath(String absPath) {
		this.absPath = absPath;
	}

	public String getSrcName() {
		return srcName;
	}

	public void setSrcName(String srcName) {
		this.srcName = srcName;
	}

	public String getSrcType() {
		return srcType;
	}

	public void setSrcType(String srcType) {
		this.srcType = srcType;
	}

	public long getSrcSize() {
		return srcSize;
	}

	public void setSrcSize(long srcSize) {
		this.srcSize = srcSize;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getSized() {
		return sized;
	}

	public void setSized(int sized) {
		this.sized = sized;
	}

	public int getMaxWidth() {
		return maxWidth;
	}

	public void setMaxWidth(int maxWidth) {
		this.maxWidth = maxWidth;
	}

	public int getMaxHeight() {
		return maxHeight;
	}

	public void setMaxHeight(int maxHeight) {
		this.maxHeight = maxHeight;
	}

	public boolean isZoom() {
		return zoom;
	}

	public void setZoom(boolean zoom) {
		this.zoom = zoom;
	}

	public static HashMap getMime() {
		return mime;
	}

	public static void setMime(HashMap mime) {
		FileUtil.mime = mime;
	}

	public static int getAutoSized() {
		return AUTO_SIZED;
	}

	public static int getManualSized() {
		return MANUAL_SIZED;
	}

	public static String[] getImagetype() {
		return imageType;
	}

	public static String[] getFlashtype() {
		return flashType;
	}
	
	
	public ServletContext getServletContext() {
		return servletContext;
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}	

}
