package com.model2.mvc.web.product;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserService;


//==> 회원관리 Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping(value="addProductView")
	public String addProductView() throws Exception {

		System.out.println("/addProductView.do");
		
		return "product/addProductView.jsp";
	}
	
	@RequestMapping(value="addProduct")
	public String addProduct(@RequestParam("uploadFile") MultipartFile file, @ModelAttribute("product") Product product, Model model ) throws Exception {

		System.out.println("/addProduct.do");
		
		final String FILE_SERVER_PATH = "C:\\Users\\bitcamp\\git\\miniPJT09\\09.Model2MVCShop(jQuery)\\src\\main\\webapp\\images\\uploadFiles";
		
		if(!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(FILE_SERVER_PATH, file.getOriginalFilename()));
			product.setFileName(file.getOriginalFilename());
			model.addAttribute("msg", "File uploaded successfully.");
		}else {
			model.addAttribute("msg", "Please select a valid mediaFile..");
		}
		
		System.out.println(product);
		//Business Logic
		productService.addProduct(product);
		
		return "forward:/product/addProduct.jsp";
	}
	
	@RequestMapping(value="listProduct")
	public String listProduct( @ModelAttribute("search") Search search , Model model) throws Exception{
		
		System.out.println("/listProduct.do");
		
	
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		System.out.println("map: "+map);
		
		
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
	
			
			return "forward:/product/listProduct.jsp";
	
		
		
	}
	
	@RequestMapping(value="getProduct")
	public String getProduct(@RequestParam("prodNo") String prodNo, Model model) throws Exception {
		
		System.out.println("/getProduct.do");
		
		
		Product product = productService.getProduct(Integer.parseInt(prodNo));
		
		
		model.addAttribute("product", product);
		
		
		
		return "forward:/product/getProduct.jsp";
	}
	
	@RequestMapping(value="updateProductView")
	public String updateProductView(@RequestParam("prodNo") String prodNo, Model model) throws Exception {
		
		System.out.println("/updateProductView.do");
		
		
		Product product = productService.getProduct(Integer.parseInt(prodNo));
		
		model.addAttribute("product", product);
		
		
		
		return "/product/updateProductView.jsp";
	}
	
	@RequestMapping(value="updateProduct")
	public String updateProduct( @ModelAttribute("product") Product product, @RequestParam("prodNo") String prodNo, Model model) throws Exception {
		
		System.out.println("/updateProduct.do");
		
		
		productService.updateProduct(product);
		
		product = productService.getProduct(Integer.parseInt(prodNo));
		
		model.addAttribute("product", product);
		
		
		
		return "/product/getProduct.jsp";
	}
	

}