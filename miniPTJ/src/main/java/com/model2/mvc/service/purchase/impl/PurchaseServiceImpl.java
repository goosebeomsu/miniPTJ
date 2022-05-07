package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.purchase.PurchaseDao;
import com.model2.mvc.service.purchase.PurchaseService;


@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService {

	
	@Autowired
	@Qualifier("purchaseDaoImpl")
	private PurchaseDao purchaseDao;
	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}
	
	
	
	public PurchaseServiceImpl() {
		System.out.println(this.getClass());
	}

	
	@Override
	public void addPurchase(Purchase purchase) throws Exception {
	
		purchaseDao.addPurchase(purchase);
		
	}
	
	public Purchase getPurchase(int prodNo) throws Exception {
		
		return purchaseDao.getPurchase(prodNo);
	}

	@Override
	public Map<String, Object> getPurchaseList(Search search, String userId) throws Exception {
		
		System.out.println("서비스임플 getPurchaseList 실행");
		
		List<Purchase> list= purchaseDao.getPurchaseList(search, userId);
		int totalCount = purchaseDao.getTotalCount(userId);
		
		System.out.println("1");
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("2");
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void updatePurchase(Purchase purchase) throws Exception {
		
		purchaseDao.updatePurchase(purchase);
	}

	
	public void updateTranCode(Purchase purchase) throws Exception {
		
		purchaseDao.updateTranCode(purchase);
	}

}
