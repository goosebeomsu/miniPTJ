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
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
public class PurchaseServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
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
		purchase.setReceiverName("박수범");
		purchase.setReceiverPhone("01041237894");
		purchase.setDivyAddr("성남");
		purchase.setDivyRequest("빠르게");
		purchase.setTranCode("100");
		purchase.setDivyDate("22/04/11");
		
		
		purchaseService.addPurchase(purchase);
		

		//==> console 확인
		System.out.println(purchase);
		
	
	
	}
	
	//@Test
	public void testGetPurchase() throws Exception {
		


		//==> console 확인
		System.out.println("testGetPurchase결과확인:"+purchaseService.getPurchase(10006));
}
	//@Test
	 public void testUpdateProduct() throws Exception{
		 	Purchase purchase = purchaseService.getPurchase(10007);
			
	
			purchase.setPaymentOption("1");
			purchase.setReceiverName("박박박");
			purchase.setReceiverPhone("01041237894");
			purchase.setDivyAddr("강남");
			purchase.setDivyRequest("느리게");
			purchase.setTranCode("100");
			purchase.setDivyDate("22/04/11");
			
			
			purchaseService.updatePurchase(purchase);
			
			purchase =  purchaseService.getPurchase(10007);
			

			//==> console 확인
			System.out.println(purchase);
	}
	 
	 //@Test
	public void testUpdateTranCode() throws Exception{
	 	Purchase purchase = purchaseService.getPurchase(10000);
		
	 	
		purchase.setTranCode("100");
	
		
		
		purchaseService.updateTranCode(purchase);
		
		purchase =  purchaseService.getPurchase(10000);
		

		//==> console 확인
		System.out.println(purchase);
}
	 
	 @Test
	 public void testGetPurchaseList() throws Exception{
		 
		 Search search = new Search();
		 search.setCurrentPage(1);
		 search.setPageSize(3);
		
		 Map<String,Object> map = purchaseService.getPurchaseList(search, "admin");
		 
		 List<Object> list = (List<Object>)map.get("list");
		
		 	
			//==> console 확인
		 	System.out.println("list1: "+list);
		 	
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	
		 
		 	
		 	
		 
		 
	 }
	
}