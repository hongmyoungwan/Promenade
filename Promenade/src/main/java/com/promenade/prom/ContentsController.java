package com.promenade.prom;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.promenade.service.CommonService;
import com.promenade.service.ContentsService;
import com.promenade.util.CommonUtil;

@Controller
public class ContentsController {

	@Autowired
	ContentsService cService;
	@Autowired
	CommonService commonService;
	@RequestMapping(value = "/contentsDetail", method = RequestMethod.GET)
	public ModelAndView contentsDetailAjax(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String num = request.getParameter("num");
		mav.setViewName("itemDetail");
		HashMap<String, Object> obj = cService.getContentsDetail(num);

		mav.addObject("data", obj);

		return mav;
	}

	@RequestMapping(value = "/panging", method = RequestMethod.POST)
	public @ResponseBody ModelAndView getPanging(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("curIdx", requestGetParameter(request,"curIdx","0"));
		map.put("curPage", requestGetParameter(request,"curPage","1"));
		map.put("perPage", requestGetParameter(request,"perPage","0"));
		
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping(value = "/contentsReg", method = RequestMethod.GET)
	public ModelAndView contentReg(HttpServletRequest request , HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		 response.addHeader("Access-Control-Allow-Credentials", "true");
		    response.addHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
		    response.addHeader("Access-Control-Max-Age", "3600");
		    response.addHeader("Access-Control-Allow-Headers", "Content-Type, Accept, X-Requested-With, remember-me");
		ArrayList<HashMap<String, Object>> box =cService.getGroupCategory();
		mav.addObject("groupCategory", box);
		mav.setViewName("contentsReg");
		return mav;
	}
	
	
	@RequestMapping(value = "/showUserList", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> showUserList(HttpServletRequest request , HttpServletResponse response) throws Exception {
	
		 response.addHeader("Access-Control-Allow-Credentials", "true");
		    response.addHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
		    response.addHeader("Access-Control-Max-Age", "3600");
		    response.addHeader("Access-Control-Allow-Headers", "Content-Type, Accept, X-Requested-With, remember-me");
	
		Map<String,Object> map = new HashMap<String, Object>();
		
		Map<String,Object> Cnt = new HashMap<String, Object>();
		Cnt.put("start", requestGetParameter(request, "start", "0"));
		Cnt.put("length", requestGetParameter(request, "length", "10"));
		ArrayList<HashMap<String, Object>> subList =cService.getUserList(Cnt);
		int records= cService.userListCnt(Cnt);
		map.put("subList", subList);
		map.put("resultCd", "200");
		map.put("recordsTotal", records);
		map.put("recordsFiltered", records);
		return map;
	}
	
	
	
	
	@RequestMapping(value = "/createSubId", method = RequestMethod.GET)
	public ModelAndView createSubId(HttpServletRequest request , HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
	
		mav.setViewName("createID_detail");
		return mav;
	}
	
	
	
	/***
	 * 
	 *  <br>getCategory</br>
	 *  
	 *  <pre>카테고리 갖고오기 </pre>
	 *	@param request
	 *	@return
	 *	@throws Exception
	 *  @date 2019. 1. 29.
	 *  @author hmga1115	
	 *  @version 
	 *
	 */
	@RequestMapping(value="/getCategory" , method=RequestMethod.POST)
	public @ResponseBody  Map<String,Object>  getCategory(HttpServletRequest request,@RequestParam(value="group_category_cd") String group_category_cd)throws Exception{
		
		HashMap<String,Object> box = new HashMap<String,Object> ();
		box.put("group_category_cd", group_category_cd);
		
		ArrayList<HashMap<String,Object>>list = cService.getCategory(box);
		System.out.println(list);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", list);
		return map;
	}

	/***
	 * 
	 *  <br>getSubCategory</br>
	 *  
	 *  <pre>서브 카테고리 갖고오기 </pre>
	 *	@param request
	 *	@return
	 *	@throws Exception
	 *  @date 2019. 1. 29.
	 *  @author hmga1115	
	 *  @version 
	 *
	 */
	@RequestMapping(value="/getSubCategory" , method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> getSubCategory(HttpServletRequest request)throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		HashMap<String,Object> box = new HashMap<String,Object> ();
		box.put("category_cd", requestGetParameter(request, "categoryCd",""));
		map.put("subCategory", cService.getSubCategory(box));
		
		ArrayList<HashMap<String,Object> > list = cService.getGosiTitle(box);
	
		map.put("gosiTitle", list);
		
		return map;
	}
	
	@RequestMapping(value="/uploadGoodsImage.ajax", method=RequestMethod.POST)
public @ResponseBody Map<String,Object> uploadImgG(HttpServletRequest request,String imgType) throws Exception{
	Map<String, Object> map = new HashMap<String, Object>();
	String imgDir ="/user/local/tomcat7/promenade/downloadFile";
	int maxSize = "detail".equals(imgType) ? 5*1024*1024 : 2*1024*1024;
	
	Map<String,Object> box = commonService.getImageFile(request, imgDir, CommonUtil.generateSerialNumber("temp_"), maxSize);
	System.out.println(box);
	if(box != null){
	
		map.put("fileNm", box.get("fileNm"));
		map.put("fileNmFull", "c:/upload/"+box.get("fileNm"));
		map.put("imgWidth", box.get("imgWidth"));
		map.put("imgHeight", box.get("imgHeight"));
	}
	

		return map;
	}
	
	
	@RequestMapping(value="/uploadGoodsDetailImage.ajax", method=RequestMethod.POST)
public @ResponseBody Map<String,Object> uploadImg(HttpServletRequest request,String imgType) throws Exception{
	Map<String, Object> map = new HashMap<String, Object>();
	String imgDir ="c:/upload/";
	int maxSize = "detail".equals(imgType) ? 5*1024*1024 : 2*1024*1024;
	
	Map<String,Object> box = commonService.getImageFile(request, imgDir, CommonUtil.generateSerialNumber("temp_"), maxSize);
	
	if(box != null){
	
		map.put("fileNm", box.get("fileNm"));
		map.put("fileNmFull", "c:/upload/"+box.get("fileNm"));
		map.put("imgWidth", box.get("imgWidth"));
		map.put("imgHeight", box.get("imgHeight"));
	}
	

		return map;
	}
	
	
	/**
	 * <b>saveGoodsCropImage</b>
	 *
	 * <pre>상품 수정 이미지 업로드</pre>
	 *
	 * @param request
	 * @return
	 * @throws Exception
	 *
	 * @author jekim414
	 *
	 * @version 1.0<br>2016. 5. 4.
	 *
	 */
	@RequestMapping(value="/saveGoodsCropImage.ajax", method=RequestMethod.POST)
	public @ResponseBody  Map<String,Object> saveGoodsCropImage(HttpServletRequest request) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		String imgDir ="/user/local/tomcat7/promenade/downloadFile";
		boolean resize = Boolean.parseBoolean(requestGetParameter(request, "resize",""));
		int reWidth = Integer.parseInt(requestGetParameter(request, "reWidth", "0"));
		int reHeight = Integer.parseInt(requestGetParameter(request, "reHeight", "0"));
		
		Map<String, Object> box = commonService.saveCroppedImage(request, imgDir, CommonUtil.generateSerialNumber("crop")+".png", resize, reWidth, reHeight);
		
		if(box!=null){
		
			map.put("fileNmFull", "c:/upload/"+box.get("fileNm"));
		}
		
		return map;
	}
	

	
	
	@RequestMapping(value="/contentsAdd", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> contentsAdd(HttpServletRequest request)throws Exception{
		Map<String, Object> mav= new HashMap<String, Object>();
		Map<String, Object> box = new HashMap<String, Object>();
					
		String goodsAmt =requestGetParameter(request, "goods_amt","");
		String deliveryYN=requestGetParameter(request, "deliveryYN","");
		String phonNum=requestGetParameter(request, "phoneNum1", null) +requestGetParameter(request, "phoneNum2", null)+requestGetParameter(request, "phoneNum3", null);
		String email=requestGetParameter(request, "sellerEmail", null);

		box.put("contentsNm",requestGetParameter(request, "contentsNm", null) );
		box.put("contentsType", "04"); // 상품
		box.put("groupCategory",requestGetParameter(request, "groupCategory", null) );
		box.put("category",requestGetParameter(request, "category", null) );
		box.put("goodsImg1", requestGetParameter(request, "goodsImg1", null));
		box.put("subCategory",requestGetParameter(request, "subCategory", null) );
		box.put("sellAmt",requestGetParameter(request, "sellAmt", null) );
		box.put("goods_amt",goodsAmt);
		box.put("deliveryAmt",requestGetParameter(request, "deliveryAmt", null) );
		box.put("deliveryNotic",requestGetParameter(request, "deliveryNotic",null));
		box.put("goodsDetailImg1",requestGetParameter(request, "detailImg1", "") );
		box.put("goodsDetailImg2",requestGetParameter(request, "detailImg2", "") );
		box.put("goodsDetailImg3",requestGetParameter(request, "detailImg3", "") );
		box.put("goodsDetailImg4",requestGetParameter(request, "detailImg4", "") );
		box.put("goodsDetailImg5",requestGetParameter(request, "detailImg5", "") );
		box.put("hiddenFileName",requestGetParameter(request, "hiddenFileName", ""));
		box.put("authority", requestGetParameter(request, "authority", "") );
		box.put("contentsInfo", requestGetParameter(request, "contentsInfo", "") );
		box.put("phoneNum",phonNum);
		box.put("email",email);
		box.put("s_fee",requestGetParameter(request, "s_fee", ""));
		box.put("gosiData",requestGetParameter(request, "gosiData", ""));
		box.put("groupDelivery", requestGetParameter(request, "groupDelivery",null));
		
		box.put("tradeDeliveryText1",requestGetParameter(request, "tradeDeliveryText1", null) );
		box.put("tradeDeliveryText2",requestGetParameter(request, "tradeDeliveryText2", null) );
		box.put("tradeDeliveryText3",requestGetParameter(request, "tradeDeliveryText3", null) );
		box.put("mngId", request.getSession().getAttribute("mngId"));
		box.put("deliveryYN",deliveryYN);
	    
		mav.put("contentsBox", cService.contentAdd(box));
	
		
		
		return mav;
	}
	
	
	@RequestMapping(value="/proposalForm", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> proposalForm(HttpServletRequest request,@RequestParam("proposal") MultipartFile proposal)throws Exception{
		
		String imgDir ="/user/local/tomcat7/promenade/downloadFile";
//		Map<String, Object> maps= commonService.getUploadedFile(request, imgDir, CommonUtil.generateSerialNumber("temp"),104857600);
	
        Map<String, Object> box = null;
        
       // mav.put("fileNm",box.get("fileNm"));
		
		if (!proposal.isEmpty()) {
			byte[] bytes = proposal.getBytes();		
			
			
			
			File tempFile = new File(imgDir+"/"+proposal.getOriginalFilename());
			if(!tempFile.isDirectory()){
				tempFile.mkdirs();
			}
			FileOutputStream fos = new FileOutputStream(tempFile);
			fos.write(bytes);				
			fos.close();
		}
		System.out.println(proposal.getOriginalFilename());
		return box;
	}
	
	
	
	
	
	public String requestGetParameter(HttpServletRequest request,String name, String def) {
		String[] values = request.getParameterValues(name);
		if(values==null){
			return def;
		}else if(values.length==1){
			return values[0].trim();
		}else if(values.length>1){
			String pipedResult = "";
			for(int i=0; i<values.length; i++){
				pipedResult += values[i].trim()+"|";
			}
			return pipedResult;
		}else{
			return request.getParameter(name).trim();
		}
	}
}
