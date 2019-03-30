package com.promenade.prom;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.promenade.dto.MainListPageDTO;
import com.promenade.service.ContentsService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	ContentsService service;
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request) throws Exception {
		ModelAndView mav= new ModelAndView();
		HttpSession session = request.getSession();
		String view="login";
		if(session.getAttribute("id")!=null) {
		if(!session.getAttribute("id").equals("")) {
			view="home";
		}
		}
		mav.setViewName(view);
		return mav;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> loginPush(HttpServletRequest request,@RequestParam Map<String,Object> map) throws Exception {
	
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("id", map.get("id"));
		hashmap.put("pw", map.get("pw"));
		int n=service.login(map);
		String authority= service.getAuthority(String.valueOf(hashmap.get("id")));
		if(n==1) {
			HttpSession session = request.getSession();
			session.setAttribute("id", hashmap.get("id"));
			session.setAttribute("authority", authority);
			map.put("resultCd", "000");
			map.put("authority",authority);
		
		}else {
			map.put("resultCd", "400");
			map.put("loginCheck", "아이디와 비밀번호를 확인해 주세요");
			
		}
		
		return map;
	}
	
	@RequestMapping(value = "/normalList", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request) throws Exception {
		ModelAndView mav= new ModelAndView();
		String authority = (String)request.getSession().getAttribute("authority");
		mav.setViewName("home");
		mav.addObject("authority", authority);
		return mav;
	}
	
	@RequestMapping(value="/normalListTop.ajax", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> normalListTop(HttpServletRequest request) throws Exception {
		
		

	
		Map<String,Object> m= new HashMap<String,Object>();
		String authority = (String)request.getSession().getAttribute("authority");
		String id = (String)request.getSession().getAttribute("id");
		HashMap<String, String> indexMap = new HashMap<String, String>();

		indexMap.put("id", id);
		indexMap.put("authority", authority);
	
		ArrayList<HashMap<String, Object>> normalList =service.selectTOPList(indexMap);
		m.put("authority",authority);
		m.put("normalList",normalList );
		m.put("totalCnt",8 );
		m.put("resultCd","000" );
		
		return m;
	}
	
	
	
	@RequestMapping(value="/normalList.ajax", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> normalList(HttpServletRequest request) throws Exception {
		
		
		String strIndex= requestGetParameter(request, "index", "1");
		String category_cd = requestGetParameter(request, "category_cd", "0");
		Map<String,Object> m= new HashMap<String,Object>();
		String authority = (String)request.getSession().getAttribute("authority");
		String id = (String)request.getSession().getAttribute("id");
		HashMap<String, String> indexMap = new HashMap<String, String>();
		indexMap.put("currentPage", strIndex==""?"1":strIndex);
		indexMap.put("id", id);
		indexMap.put("authority", authority);
		indexMap.put("category_cd", category_cd);
		System.out.println(indexMap);
		ArrayList<HashMap<String, Object>> normalList =service.selectNormalList(indexMap);
		
		int total =service.listTotalCnt(indexMap);
		int totalCnt= total/20;
		
		System.out.println("119 " +normalList);
		m.put("normalList",normalList );
		m.put("totalCnt",totalCnt );
		m.put("resultCd","000" );
		m.put("currentPage", strIndex);
		return m;
	}
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/sineUp", method = RequestMethod.GET)
	public ModelAndView sineUp(HttpServletRequest request) throws Exception {
		ModelAndView mav= new ModelAndView();
		
		
		mav.setViewName("/createID");
		return mav;
	}
	
	
	@RequestMapping(value = "/updateAuth", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> updateAuth(HttpServletRequest request) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		HashMap<String, String> re = new HashMap<String, String>();
		re.put("id", requestGetParameter(request, "id", null));
		re.put("authority", requestGetParameter(request, "authority", null));
		service.updateAuth(re);
		
		return map;
	}
	
	
	
	@RequestMapping(value = "/addPartner", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> addPartner(HttpServletRequest request) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		HashMap<String, String> re = new HashMap<String, String>();
		re.put("id", requestGetParameter(request, "id", null));
		re.put("pw", requestGetParameter(request, "pw", null));
		re.put("name", requestGetParameter(request, "name", null));
		re.put("authority", requestGetParameter(request, "auth", null));
		
		service.insertUser(re);
		 map.put("resultCd", "200");
		 map.put("resultMsg", "등록에 성공하였습니다.");
		return map;
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
