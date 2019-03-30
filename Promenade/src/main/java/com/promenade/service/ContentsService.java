package com.promenade.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.promenade.dao.ContentsDAO;

@Service
public class ContentsService {

	
	@Autowired
	@Qualifier("contentsDAO")
	ContentsDAO dao;
	
	public ArrayList<HashMap<String, Object>> selectContents(String id) throws Exception{
		return (ArrayList<HashMap<String, Object>> )dao.selectContents(id);
	}

	public HashMap<String,Object> getContentsDetail(String num) {
		// TODO Auto-generated method stub
		return dao.getContentsDetail(num);
	}

	
	
	
	public ArrayList<HashMap<String, Object>> selectNormalList(HashMap<String, String> indexMap) {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, Object>> )dao.selectNormalList(indexMap);
	}
	
	public int listTotalCnt(HashMap<String, String> map) {
		return dao.listTotalCnt(map);
	}

	public int login(Map<String, Object> hashmap) {
		// TODO Auto-generated method stub
		return dao.login(hashmap);
	}

	public String getAuthority(String id) {
		// TODO Auto-generated method stub
		return dao.getAuthority(id);
	}
	
	/***
	 * 
	 *  <br>getCategory</br>
	 *  
	 *  <pre>카테고리 갖고오기</pre>
	 *	@param box
	 *	@return
	 *  @date 2019. 1. 28.
	 *  @author hmga1115	
	 *  @version 
	 * @throws Exception 
	 *
	 */
	public ArrayList<HashMap<String,Object>> getCategory(HashMap<String,Object> box) throws Exception{
			
		 
		
		return (ArrayList<HashMap<String,Object>>)dao.getCategory(box);
	}

	public  ArrayList<HashMap<String,Object>> getSubCategory(HashMap<String, Object> box) {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String,Object>>)dao.getSubCategory(box);
	}

	public ArrayList<HashMap<String, Object>> getGosiTitle(HashMap<String, Object> box) {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, Object>>)dao.getGosiTitle(box);
	}

	public ArrayList<HashMap<String, Object>>  getGroupCategory() {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, Object>> )dao.getGroupCategory();
	}

	/***
	 * 
	 *  <br>contentAdd</br>
	 *  
	 *  <pre>컨텐츠 추가 </pre>
	 *	@param box
	 *  @date 2019. 2. 7.
	 *  @author hmga1115	
	 *  @version 
	 * @throws Exception 
	 *
	 */
	public Map<String, Object> contentAdd(Map<String, Object> box) throws Exception {
		
	
		return dao.insertContent(box);
	}

	public ArrayList<HashMap<String, Object>> getUserList(Map<String, Object> cnt) {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, Object>>)dao.getUserList(cnt);
	}

	public ArrayList<HashMap<String, Object>> selectTOPList(HashMap<String, String> indexMap) {
		// TODO Auto-generated method stub
		return (ArrayList<HashMap<String, Object>> )dao.selectTOPList(indexMap);
	}

	public int userListCnt(Map<String, Object> cnt) {
		// TODO Auto-generated method stub
		return dao.userListCnt(cnt);
	}

	public void updateAuth(HashMap<String, String> requestGetParameter) {
		// TODO Auto-generated method stub
		 dao.updateAuth(requestGetParameter);
	}

	public void insertUser(HashMap<String, String> re) {
		// TODO Auto-generated method stub
		 dao.insertUser(re);
	}
	
	
	
	
	
	
}
