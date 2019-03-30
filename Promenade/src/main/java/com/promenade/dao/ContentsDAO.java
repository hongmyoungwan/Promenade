package com.promenade.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Repository("contentsDAO")
public class ContentsDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	
	public List<HashMap<String, Object>> selectContents(String id)throws Exception{
		List<HashMap<String, Object>> s= sqlSession.selectList("contents.selectContents",id);
	
		return s;
	}
	
	


	public HashMap<String, Object> getContentsDetail(String key) {
		// TODO Auto-generated method stub
		
		return  sqlSession.selectOne("contents.getContentsDetail", key);
	}


	public int listTotalCnt(HashMap<String, String> map) {
		
		return sqlSession.selectOne("contents.selectRegDtContentsCount",map);
	}

	public List<HashMap<String, Object>> selectNormalList(HashMap<String, String> indexMap) {
			
		String strCurr=(String)indexMap.get("currentPage");
		int currentPage =(strCurr==""?1:Integer.parseInt(strCurr));
		int perPage=20;
		int index=  (currentPage-1)*perPage;
	
		List<HashMap<String, Object>> list= sqlSession.selectList("contents.selectRegDtContents",indexMap,new RowBounds(index,perPage));
	
		return list;
	}




	public int login(Map<String, Object> hashmap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("contents.loginCheck",hashmap);
	}




	public String getAuthority(String id) {
		// TODO Auto-generated method stub
		return String.valueOf(sqlSession.selectOne("contents.getAuthority",id));
	}




	/**
	 * 
	 *  <br>getCategory</br>
	 *  
	 *  <pre>카테고리정보 갖고오기 </pre>
	 *	@return
	 *  @date 2019. 1. 28.
	 *  @author hmga1115	
	 *  @version 
	 *
	 */
	public List<HashMap<String,Object>> getCategory(HashMap<String,Object> box) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("contents.selectCategory",box);
	}




	public List<HashMap<String, Object>> getSubCategory(HashMap<String, Object> box) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("contents.selectSubCategory",box);
	}



	public List<HashMap<String, Object>> getGosiTitle(HashMap<String, Object> box) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("contents.getGosidData",box);
	}



	/**
	 * 
	 *  <br>getGroupCategory</br>
	 *  
	 *  <pre>그룹카테고리정보 갖고오기 </pre>
	 *	@return
	 *  @date 2019. 1. 28.
	 *  @author hmga1115	
	 *  @version 
	 *
	 */
	public List<HashMap<String, Object>> getGroupCategory() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("contents.selectGetGroupCategory");
	}




	/**
	 * 
	 *  <br>insertContent</br>
	 *  
	 *  <pre>상품등록 </pre>
	 *	@param box
	 *	@return
	 *	@throws MyException
	 *  @date 2019. 2. 28.
	 *  @author hmga1115	
	 *  @version 
	 *
	 */
		@Transactional(rollbackFor = {Exception.class}, isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRES_NEW )
		public Map<String, Object> insertContent(Map<String, Object> box) throws Exception {
			if(sqlSession.insert("contents.insertTbContentsMainInfo", box)<1 ){
				throw new Exception();
				
			}else{
				
				if(
					sqlSession.insert("contents.insertContentsGoods", box)<1||	
					sqlSession.insert("contents.insertContentsGoodsAnmtList", box)<1||
					sqlSession.insert("contents.insertContentsGoodsDetail",box)<1)
						{
					throw new Exception();
				}
				else{
					
					if(box.get("deliveryYN").equals("1")){
						if(sqlSession.insert("contents.insertContentsGoodsDelivery",box)<1){
							throw new Exception();
						}
						
					}
					if(box.get("optionYN").equals("1")){
						if(sqlSession.insert("contents.insertTbContentsGoodsOptionInfo",box)<1){
							throw new Exception();
						}
						
						
					}
					
				}
				return box;
			}
			
		}




	public List<HashMap<String, Object>> getUserList(Map<String, Object> cnt) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("contents.getUserList",cnt);
	}




	public List<HashMap<String, Object>> selectTOPList(HashMap<String, String> indexMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("contents.selectTOPList",indexMap);
	}




	public int userListCnt(Map<String, Object> cnt) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("contents.userListCnt",cnt);
	}



	@Transactional(rollbackFor = {Exception.class}, isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRES_NEW )
	public int updateAuth(HashMap<String, String> requestGetParameter) {
		// TODO Auto-generated method stub
		return sqlSession.update("contents.updateAuth",requestGetParameter);
	}



	@Transactional(rollbackFor = {Exception.class}, isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRES_NEW )
	public void insertUser(HashMap<String, String> re) {
		// TODO Auto-generated method stub
		 sqlSession.insert("contents.insertUser",re);
	}

}
