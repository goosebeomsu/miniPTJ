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
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
public class ProductServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	//@Test
	public void testAddProduct() throws Exception {
		
		Product product = new Product();
		product.setFileName("abc");
		product.setManuDate("121212");
		product.setPrice(7000);
		product.setProdDetail("�����ٶ�");
		product.setProdName("�����ٶ�");
		
		
		
		productService.addProduct(product);
		

		//==> console Ȯ��
		System.out.println(product);
		
	
	
	}
	
	//@Test
	public void testGetProduct() throws Exception {
		
		Product product = new Product();
		
	

		
		product = productService.getProduct(10000);

		//==> console Ȯ��
		System.out.println(product);
}
	@Test
	 public void testUpdateProduct() throws Exception{
		
		Product product = productService.getProduct(10021);
		
		product.setProdName("����");
		product.setProdDetail("������");
		product.setManuDate("2021");
		product.setPrice(1557);
		product.setFileName("����");
		
		
		productService.updateProduct(product);
		
		product = productService.getProduct(10021);
		
		System.out.println(product);
		

		//==> console Ȯ��
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
		
		 	
			//==> console Ȯ��
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
//		 	//==> console Ȯ��
//		 	System.out.println("list2: "+list);
//		 	
//		 	totalCount = (Integer)map.get("totalCount");
//		 	System.out.println(totalCount);
		 
		 
	 }
	
}