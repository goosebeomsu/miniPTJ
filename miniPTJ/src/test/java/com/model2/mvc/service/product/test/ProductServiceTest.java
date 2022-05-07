package com.model2.mvc.service.product.test;

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
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
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
public class ProductServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	//@Test
	public void testAddProduct() throws Exception {
		
		Product product = new Product();
		product.setFileName("abc");
		product.setManuDate("121212");
		product.setPrice(7000);
		product.setProdDetail("가나다라");
		product.setProdName("가나다라");
		
		
		
		productService.addProduct(product);
		

		//==> console 확인
		System.out.println(product);
		
	
	
	}
	
	//@Test
	public void testGetProduct() throws Exception {
		
		Product product = new Product();
		
	

		
		product = productService.getProduct(10000);

		//==> console 확인
		System.out.println(product);
}
	@Test
	 public void testUpdateProduct() throws Exception{
		
		Product product = productService.getProduct(10021);
		
		product.setProdName("몬스터");
		product.setProdDetail("가나다");
		product.setManuDate("2021");
		product.setPrice(1557);
		product.setFileName("몰라");
		
		
		productService.updateProduct(product);
		
		product = productService.getProduct(10021);
		
		System.out.println(product);
		

		//==> console 확인
		System.out.println(product);
	}
	 
	 //@Test
	 public void testGetProductListAll() throws Exception{
		 
		 Search search = new Search();
		 search.setCurrentPage(1);
		 search.setPageSize(3);
		 search.setSearchCondition("2");
	 search.setSearchKeyword("1500");
		 Map<String,Object> map = productService.getProductList(search);
		 
		 List<Object> list = (List<Object>)map.get("list");
		
		 	
			//==> console 확인
		 	System.out.println("list1: "+list);
		 	
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	
		 	System.out.println("=======================================");
		 	
//		 	search.setCurrentPage(1);
//		 	search.setPageSize(3);
//		 	search.setSearchCondition("0");
//		 	search.setSearchKeyword("");
//		 	map = productService.getProductList(search);
//		 	
//		 	list = (List<Object>)map.get("list");
//		 
//		 	
//		 	//==> console 확인
//		 	System.out.println("list2: "+list);
//		 	
//		 	totalCount = (Integer)map.get("totalCount");
//		 	System.out.println(totalCount);
		 
		 
	 }
	
}