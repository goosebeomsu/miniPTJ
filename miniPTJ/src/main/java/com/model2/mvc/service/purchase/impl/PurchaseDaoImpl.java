package com.model2.mvc.service.purchase.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseDao;


@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public PurchaseDaoImpl() {
		System.out.println(this.getClass());
	}
	
	public void addPurchase(Purchase purchase) throws Exception{
		System.out.println("addPurchase ����");
		sqlSession.insert("PurchaseMapper.addPurchase", purchase);
		
		
		System.out.println("insertProduct �Ϸ�");
		
	}
	
	public Purchase getPurchase(int prodNo) throws Exception{
		System.out.println("getPurchase ����");
		return sqlSession.selectOne("PurchaseMapper.getPurchase", prodNo);
		
	}

	public List<Purchase> getPurchaseList(Search search, String userId) throws Exception {
		
		System.out.println("getPurchaseList����");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("search", search);
		map.put("id", userId);
		
		return sqlSession.selectList("PurchaseMapper.getPurchaseList", map);
		
		
		
	}
	
	public void updatePurchase(Purchase purchase) throws Exception{
		
		System.out.println("updatePurchase����");
	 sqlSession.update("PurchaseMapper.updatePurchase", purchase);
	}
	
	
public void updateTranCode(Purchase purchase) throws Exception{
	System.out.println("updateTranCode����");
	sqlSession.update("PurchaseMapper.updateTranCode", purchase);
		
	}
	
	
	
public int getTotalCount(String userId) throws Exception {
	
	    System.out.println("getTotalCount����");
		
	    return sqlSession.selectOne("PurchaseMapper.getTotalCount", userId);
	}








	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
