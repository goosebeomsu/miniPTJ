package com.model2.mvc.service.product.impl;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserDao;





@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDao productDao;
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	public ProductServiceImpl() {
		System.out.println(this.getClass());
	}
	
	public void addProduct(Product product) throws Exception{
		productDao.addProduct(product);
	}
	
	public Map<String,Object> getProductList(Search search) throws Exception {
		List<Product> list= productDao.getProductList(search);
		
		System.out.println("서비스임플 getProductList");
		for(Product product: list) {
			System.out.println(product);
		}
		
		int totalCount = productDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	public Product getProduct(int prodNo) throws Exception {
		return productDao.getProduct(prodNo);
	}
	
	public void updateProduct(Product product) throws Exception{
		productDao.updateProduct(product);
	}
	
}
