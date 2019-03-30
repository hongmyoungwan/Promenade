package com.promenade.service;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.PixelGrabber;
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.imageio.IIOException;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.promenade.util.CMYKConverter;
import com.promenade.util.MultipartRequest;
import java.util.regex.Matcher;

@Service
public class CommonService {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonService.class);

public Map<String, Object> getImageFile(HttpServletRequest request, String fileDir, String fileNm, int maxSize) throws Exception{
		
	Map<String, Object> box = new HashMap<String, Object>();
		int imgWidth=0;
		int imgHeight=0;
		
		
		try {
			//Directory Checking
			File dir = new File(fileDir);
			
			if(!dir.isDirectory()){
				dir.mkdirs();
			}
			
			//*** File Upload Class : MultipartRequest Class를 이용 ***//      
			MultipartRequest multi = new MultipartRequest(request, fileDir, maxSize);
			String oriFileNm = multi.fileNames.get(0);
			System.out.println(multi.fileNames);
			String affix = oriFileNm.substring(oriFileNm.lastIndexOf(".")+1).toLowerCase();
			fileNm += "."+affix;
			
			if(oriFileNm.length()<5){
				throw new Exception();
			}else if( !"png".equals(affix) && !"jpg".equals(affix) && !"jpeg".equals(affix)){
				throw new Exception();
			}
			
			File oriFile = new File(fileDir+"/"+oriFileNm);
			File nFile = new File(fileDir+"/"+fileNm);
			oriFile.renameTo(nFile);
			
			if(nFile.exists()) {
				long nFsize = nFile.length();
				
			
				if(nFsize > 0) {

					CMYKConverter jpegReader = new CMYKConverter(); 
					
					BufferedImage oriImage = null;
				    try{ //cmyk가 아닌경우
				    	oriImage = ImageIO.read(nFile);
				    }catch(Exception e){ //cmyk인경우
				    	oriImage = jpegReader.readImage(nFile);
				    }
					
					imgWidth = oriImage.getWidth();
					imgHeight = oriImage.getHeight();
					
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
		box.put("fileNm", fileNm);
		box.put("imgWidth", imgWidth);
		box.put("imgHeight", imgHeight);
		
		return box;
	}




public Map<String, Object> getFile2(HttpServletRequest request, String fileDir, String fileNm, int maxSize) throws Exception{
	
	Map<String, Object> box = new HashMap<String, Object>();
	
		
		
		try {
			//Directory Checking
			File dir = new File(fileDir);
			
			if(!dir.isDirectory()){
				dir.mkdirs();
			}
			
			//*** File Upload Class : MultipartRequest Class를 이용 ***//      
			MultipartRequest multi = new MultipartRequest(request, fileDir, maxSize);
			String oriFileNm = multi.fileNames.get(0);
			String affix = oriFileNm.substring(oriFileNm.lastIndexOf(".")+1).toLowerCase();
			fileNm += "."+affix;
			
			
			File oriFile = new File(fileDir+"/"+oriFileNm);
			File nFile = new File(fileDir+"/"+fileNm);
			oriFile.renameTo(nFile);
			
			
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
		box.put("fileNm", fileNm);
	
		
		return box;
	}
/**
 * @author khbae87
 * @param request, fileDir, finalFileNm, resize, resizeWidth, resizeHeight
 * @return Box {fileNm}
 * @throws Exception
 */
public Map<String, Object> saveCroppedImage(HttpServletRequest request, String fileDir, String finalFileNm, boolean resize, int resizeWidth, int resizeHeight) throws Exception{
	Map<String, Object> box = new HashMap();
	
	int x = Integer.parseInt( request.getParameter("x") );
	int y = Integer.parseInt( request.getParameter("y") );
	int w = Integer.parseInt( request.getParameter("w") );
	int h = Integer.parseInt( request.getParameter("h") );
	String fileNm = request.getParameter("fileNm");
	
	try{
		String fileExt = "jpg";
		if(fileNm.indexOf(".png")>=0) fileExt="png";

		BufferedImage oriImage = null;
	    try{ //cmyk가 아닌경우
	    	oriImage = ImageIO.read(new File(fileDir+"/"+fileNm));
	    }catch(Exception e){ //cmyk인경우
			
			//원본이미지 가져오기
			CMYKConverter jpegReader = new CMYKConverter(); //cmyk타입은 변환한다.
			
	    	oriImage = jpegReader.readImage(new File(fileDir+"/"+fileNm));
	    }
	    
		//원본이미지에서 크롭
		BufferedImage subImage;
		if( x==0 && y==0 && w==0 && h==0 ){
			subImage = oriImage;
		}else{
			subImage = oriImage.getSubimage(x, y, w, h);
		}
		
		if(resize){
			subImage = resizeImage(subImage, resizeWidth, resizeHeight);
		}
		
		File finalFile = new File(fileDir+"/"+finalFileNm);
		
		//크롭 저장
		ImageIO.write(subImage, fileExt, finalFile); 
		
		if(finalFile.exists()) {
		    // 파일 사이즈를 가져온다
			long nFsize = finalFile.length();
			
			// synchronize servers
			if(nFsize > 0) {
				String szLine, szLine2;
				String strOption = "--cwd="+fileDir;
				String strCmd[] = {"ifwas_sync", strOption, finalFileNm};
				String strCmd2[] = {"stg_sync", strOption, finalFileNm};
				
				if(System.getProperty("SYSTEM_MODE")!=null && "REAL".indexOf(System.getProperty("SYSTEM_MODE"))>-1){
					Runtime runtime = Runtime.getRuntime();
					Process process = runtime.exec(strCmd);
					BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
					while((szLine = br.readLine()) != null) logger.info(szLine);
					
					Process process2 = runtime.exec(strCmd2);
					BufferedReader br2 = new BufferedReader(new InputStreamReader(process2.getInputStream()));
					while((szLine2 = br2.readLine()) != null) logger.info(szLine2);
				}
			}
		}
		
		box = new HashMap<String, Object>();
		box.put("fileNm", finalFileNm);
		
	}catch(Exception e){
		e.printStackTrace();
		
	}
	return box;
}
/**
 * <b>convertEmoticonsStr</b>
 *
 * <pre>이모티콘 공백으로 바꾸기</pre>
 *
 * @param str
 * @return
 *
 * @author jekim414
 *
 * @version 1.0<br>2018. 12. 14.
 *
 */
public static String convertEmoticonsStr(String str){
	Pattern emoticons = Pattern.compile("[^\u0000-\uffff]",Pattern.UNICODE_CASE | Pattern.CANON_EQ | Pattern.CASE_INSENSITIVE);
	Matcher emoticonsMatcher = emoticons.matcher(str);
	return emoticonsMatcher.replaceAll("?");
}
public BufferedImage resizeImage(BufferedImage srcImage, int resizeWidth, int resizeHeight) throws Exception{
	int imtType = srcImage.getType() != 0 ? srcImage.getType() : BufferedImage.TYPE_INT_ARGB;
    
	Image image = srcImage.getScaledInstance(resizeWidth, resizeHeight, Image.SCALE_SMOOTH);
    int pixels[] = new int[resizeWidth * resizeHeight];
    PixelGrabber pixelGrabber = new PixelGrabber(image, 0, 0, resizeWidth, resizeHeight, pixels, 0, resizeWidth);
    pixelGrabber.grabPixels();

    // image 객체로부터 픽셀 정보를 읽어온 후, BufferedImage에 채워 넣어주면 이미지 크기 변환이 된다.
    BufferedImage resizedImage = new BufferedImage(resizeWidth, resizeHeight, imtType);
    resizedImage.setRGB(0, 0, resizeWidth, resizeHeight, pixels, 0, resizeWidth);
	
	return resizedImage;
}






public  Map<String, Object> getUploadedFile(HttpServletRequest request, String fileDir, String fileNm, int maxSize) throws Exception{
	
	 Map<String, Object> box = new  HashMap<String, Object>();
	
	try {
		//Directory Checking
		File dir = new File(fileDir);
		
		if(!dir.isDirectory()){
			dir.mkdirs();
		}
		
		//*** File Upload Class : MultipartRequest Class를 이용 ***//      
		MultipartRequest multi = new MultipartRequest(request, fileDir, maxSize);
		String oriFileNm = multi.fileNames.get(0);
		
		String affix = "";
		if(oriFileNm.lastIndexOf(".")<0){
			throw new Exception();
		}else{
			affix = oriFileNm.substring(oriFileNm.lastIndexOf("."), oriFileNm.length());
		}
		
		fileNm += affix;
		
		File oriFile = new File(fileDir+"/"+oriFileNm);
		File nFile = new File(fileDir+"/"+fileNm);
		oriFile.renameTo(nFile);
		
		if(nFile.exists()) {
		    // 파일 사이즈를 가져온다
			long nFsize = nFile.length();
			
			// synchronize servers
			if(nFsize > 0) {
				String szLine, szLine2;
				String strOption = "--cwd="+fileDir;
				String strCmd[] = {"ifwas_sync", strOption, fileNm};
				String strCmd2[] = {"stg_sync", strOption, fileNm};
				
				if(System.getProperty("SYSTEM_MODE")!=null && "REAL".indexOf(System.getProperty("SYSTEM_MODE"))>-1){
					Runtime runtime = Runtime.getRuntime();
					Process process = runtime.exec(strCmd);
					BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
					while((szLine = br.readLine()) != null) logger.info(szLine);
					
					Process process2 = runtime.exec(strCmd2);
					BufferedReader br2 = new BufferedReader(new InputStreamReader(process2.getInputStream()));
					while((szLine2 = br2.readLine()) != null) logger.info(szLine2);
				}
				
			}
		}
		
	}catch(Exception e){
		e.printStackTrace();
	
	}
	
	box.put("fileNm", fileNm);
	
	return box;
}
}
