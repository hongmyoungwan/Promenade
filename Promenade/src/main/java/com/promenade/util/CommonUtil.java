package com.promenade.util;

import java.security.MessageDigest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * <b>CommonUtil.java</b>
 *
 * <pre>怨듯넻 �쑀�떥由ы떚 硫붿냼�뱶</pre>
 *
 * @author jekim414
 *
 * @version 1.0<br>2018. 12. 14.
 *
 */
public class CommonUtil {
	private static Logger logger = LoggerFactory.getLogger(CommonUtil.class);
	
	private static final SimpleDateFormat sdfyyMMddHHmmss = new SimpleDateFormat("yyMMddHHmmss");
	
	public static String null2str(final String org, final String converted){
		if(org == null || org.trim().length() == 0)
			return converted;
		else
			return org.trim();
	}
	

	public static String convertEmoticonsStr(String str){
		Pattern emoticons = Pattern.compile("[^\u0000-\uffff]",Pattern.UNICODE_CASE | Pattern.CANON_EQ | Pattern.CASE_INSENSITIVE);
		Matcher emoticonsMatcher = emoticons.matcher(str);
		return emoticonsMatcher.replaceAll("?");
	}
	
	public static String generateSerialNumber(String prefix){
		String temp = String.valueOf(System.nanoTime());
		return prefix + sdfyyMMddHHmmss.format(new Date(System.currentTimeMillis())) + temp.substring(temp.length()-9, temp.length()-5);
	}
	

	public static final synchronized String Base64EncodedMD5(String strPW){ 

		String passACL = null;
		MessageDigest md = null;

		try {
			md = MessageDigest.getInstance("MD5");
		} catch(Exception e) {
			e.printStackTrace();
		}

		md.update(strPW.getBytes());
		byte[] raw = md.digest();
		byte[] encodedBytes = Base64.encodeBase64(raw);
		passACL = new String(encodedBytes);
		
		return passACL;
	}

	
	public static final synchronized String encodedSHA512(String strPW){ 

		String passACL = null;
		MessageDigest md = null;

		try {
			md = MessageDigest.getInstance("SHA-512");
		} catch(Exception e) {
			e.printStackTrace();
		}

		md.reset();
		md.update(strPW.getBytes());
		byte[] raw = md.digest();
		byte[] encodedBytes = Base64.encodeBase64(raw);
		passACL = new String(encodedBytes);

		return passACL;
	}
	
	
	public static String percentage(int cnt, int totalCnt){
		return cnt == 0 ? "0" : String.format("%.2f", (double)cnt / (double)totalCnt * 100);
	}
	public static String formatDate(String date,String delimiter, String defVal){
		String rtn;
		if(date==null){
			return defVal;
		}
		
		if(date.length()==6){
			rtn = date.substring(0, 4)+delimiter+date.substring(4);
		}else if(date.length()==8){
			rtn = date.substring(0, 4)+delimiter+date.substring(4, 6)+delimiter+date.substring(6);
		}else if(date.length()==10){
			rtn = date.substring(0, 4)+delimiter+date.substring(4, 6)+delimiter+date.substring(6, 8)+" "+date.substring(8);
		}else{
			rtn = date;
		}
		
		return rtn;
	}
	
	
	
	public static String getToday(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		return sdf.format(date);
	}
	
		  
	  
	  
	  
	  
	  /**
		 * <b>quotationCheck</b>
		 *
		 * <pre>quotation�씠 �룷�븿�릺�뼱 �엳�쑝硫� false, �뾾�쑝硫� true</pre>
		 *
		 * @author purify20
		 *
		 * @version 1.0<br>2017. 3. 2.
		 *
		 */
		public static boolean quotationCheck(String str) {
			if (str == null) {
				return true;
			}
			int sz = str.length();
			for (int i = 0; i < sz; ++i) {
				char ch = str.charAt(i);
				if (ch == '\'' || ch == '\"' ){
					return false;
				}
			}
			return true;
		}
		
		public static boolean checkDate(String szDate, String szFormat) {
	        
	        boolean bResult = true;
	        SimpleDateFormat oDateFormat = new SimpleDateFormat();
	 
	        oDateFormat.applyPattern(szFormat);
	        oDateFormat.setLenient(false);
	         
	        try {
	            oDateFormat.parse(szDate);
	        } catch (ParseException e) {
	            bResult = false;
	        }
	         
	        return bResult;         
	    }
		
		
		

		public static long getLongRemainingTime(String frDt, String toDt){
			long diff = -1;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			
			try{
				Date date1 = sdf.parse(frDt);
				Date date2 = sdf.parse(toDt);
				
				diff = ( date2.getTime() - date1.getTime() ) / 1000;
			}catch(Exception e){
				e.printStackTrace();
			}		
			return diff;
		}
		
		
		
		
		/**
		 * 
		 * <b class="comment_method">validateEmail</b><br/>
		 * <pre>
		 * �씠硫붿씪 二쇱냼�쓽 �쑀�슚�꽦�쓣 泥댄겕�빀�땲�떎.
		 * </pre>
		 * <hr>
		 * @param mail {@link String �씠硫붿씪 二쇱냼}
		 * @return Boolean {@link Boolean �꽦怨듭뿬遺�}
		 * @since none
		 * 
		 * @version 0.1 2013. 6. 28. [hsyou] validateEmail �깮�꽦
		 */
		public static Boolean validateEmail(String mail) {
			
			boolean flag = false;

			String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
			
		
			Pattern pattern = Pattern.compile(regex);
			Matcher matcher = pattern.matcher(mail);
		
			if(matcher.matches()){
				flag = true;
			}
			
			return flag;
		}
		
		
		/**
		 * �쟾�솕踰덊샇 �룷留�
		 * @param no
		 * @param defVal
		 * @return
		 */
		public static String formatPhoneNo(String no, String defVal){
			String rtn;
			if(no==null){
				return defVal;
			}
		
			if(no.length()==11){
				rtn = no.substring(0, 3)+"-"+no.substring(3, 7)+"-"+no.substring(7);
			}else if(no.length()==10){
				if(no.substring(0, 2).equals("02")){
					rtn = no.substring(0, 2)+"-"+no.substring(2, 6)+"-"+no.substring(6);
				}else{
					rtn = no.substring(0, 3)+"-"+no.substring(3, 6)+"-"+no.substring(6);
				}
			}else if(no.length()==9){
				rtn = no.substring(0, 2)+"-"+no.substring(2, 5)+"-"+no.substring(5);
			}else if(no.length()==8){
				rtn = no.substring(0, 4)+"-"+no.substring(4);
			}else if(no.length()==7){
				rtn = no.substring(0, 3)+"-"+no.substring(3);
			}else{
				rtn = no;
			}

			return rtn;
		}
		
		
		/**
		 * �빖�뱶�룿 踰덊샇 �옄由ъ닔 �쑀�슚�꽦 寃��궗(�쑀�슚�븯硫� true/ �쑀�슚�븯吏� �븡�쑝硫� false 由ы꽩)
		 * @param str
		 * @return
		 */
		public static boolean checkPhoneNum(String str){
			return str.matches("(01[016789])-(\\d{3,4})-(\\d{4})");
		}
		
		
		
}










