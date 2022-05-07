package com.model2.mvc.service.purchase.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;


/*
 *	FileName :  UserServiceTest.java
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
public class PurchaseServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private  PurchaseService purchaseService;

	//@Test
	public void testAddProduct() throws Exception {
		
		Purchase purchase = new Purchase();
		Product product = new Product();
		User user = new User();
		
		product.setProdNo(10010);
		user.setUserId("user13");
		
		purchase.setPurchaseProd(product);
		purchase.setBuyer(user);
		purchase.setPaymentOption("1");
		purchase.setReceiverName("�ڼ���");
		purchase.setReceiverPhone("01041237894");
		purchase.setDivyAddr("����");
		purchase.setDivyRequest("������");
		purchase.setTranCode("100");
		purchase.setDivyDate("22/04/11");
		
		
		purchaseService.addPurchase(purchase);
		

		//==> console Ȯ��
		System.out.println(purchase);
		
	
	
	}
	
	//@Test
	public void testGetPurchase() throws Exception {
		


		//==> console Ȯ��
		System.out.println("testGetPurchase���Ȯ��:"+purchaseService.getPurchase(10006));
}
	//@Test
	 public void testUpdateProduct() throws Exception{
		 	Purchase purchase = purchaseService.getPurchase(10007);
			
	
			purchase.setPaymentOption("1");
			purchase.setReceiverName("�ڹڹ�");
			purchase.setReceiverPhone("01041237894");
			purchase.setDivyAddr("����");
			purchase.setDivyRequest("������");
			purchase.setTranCode("100");
			purchase.setDivyDate("22/04/11");
			
			
			purchaseService.updatePurchase(purchase);
			
			purchase =  purchaseService.getPurchase(10007);
			

			//==> console Ȯ��
			System.out.println(purchase);
	}
	 
	 //@Test
	public void testUpdateTranCode() throws Exception{
	 	Purchase purchase = purchaseService.getPurchase(10000);
		
	 	
		purchase.setTranCode("100");
	
		
		
		purchaseService.updateTranCode(purchase);
		
		purchase =  purchaseService.getPurchase(10000);
		

		//==> console Ȯ��
		System.out.println(purchase);
}
	 
	 @Test
	 public void testGetPurchaseList() throws Exception{
		 
		 Search search = new Search();
		 search.setCurrentPage(1);
		 search.setPageSize(3);
		
		 Map<String,Object> map = purchaseService.getPurchaseList(search, "admin");
		 
		 List<Object> list = (List<Object>)map.get("list");
		
		 	
			//==> console Ȯ��
		 	System.out.println("list1: "+list);
		 	
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	
		 
		 	
		 	
		 
		 
	 }
	
}