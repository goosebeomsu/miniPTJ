package com.model2.mvc.web.purchase;

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
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

//==> 회원관리 Controller
@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {

	/// Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	// setter Method 구현 않음

	public PurchaseController() {
		System.out.println(this.getClass());
	}

	// ==> classpath:config/common.properties , classpath:config/commonservice.xml
	// 참조 할것
	// ==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

//	@RequestMapping("/addPurchaseView.do")
//	public String addPurchaseView(@RequestParam("prodNo") String prodNo, Model model) throws Exception {
//		
//		System.out.println("/addPurchaseView.do");
//		
//		
//		
//		System.out.println("prodNo:"+prodNo);
//		
//		Product product = productService.getProduct(Integer.parseInt(prodNo));
//		
//		model.addAttribute("product", product);
//		
//		System.out.println("product: "+product);
//		
//		return "purchase/addPurchaseView.jsp";
//	}

	@RequestMapping(value="addPurchaseView")
	public ModelAndView addPurchaseView(@RequestParam("prodNo") String prodNo) throws Exception {

		System.out.println("/addPurchaseView.do");

		System.out.println("prodNo:" + prodNo);

		Product product = productService.getProduct(Integer.parseInt(prodNo));

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/addPurchaseView.jsp");
		modelAndView.addObject("product", product);

		System.out.println("product: " + product);

		return modelAndView;
	}

	@RequestMapping(value="addPurchase")
	public ModelAndView addPurchase(@RequestParam("prodNo") String prodNo, @RequestParam("buyerId") String buyerId,
										@RequestParam("imp") String imp,
			@ModelAttribute("purchase") Purchase purchase) throws Exception {

		System.out.println("/addPurchase.do");
		System.out.println("purchase:" + purchase);
		System.out.println("imp:" + imp);
		
		System.out.println("prodNo:" + prodNo);
		System.out.println("buyerId:" + buyerId);

		Product product = productService.getProduct(Integer.parseInt(prodNo));
		purchase.setPurchaseProd(product);

		User user = userService.getUser(buyerId);
		purchase.setBuyer(user);

		purchase.setTranCode("100");

		System.out.println("purchase: " + purchase);

		purchaseService.addPurchase(purchase);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/getPurchaseView.jsp");
		modelAndView.addObject("purchase", purchase);

		return modelAndView;
	}

	@RequestMapping(value="updateTranCode")
	public ModelAndView updateTranCode(@RequestParam("prodNo") String prodNo,
										@RequestParam("tranCode") String tranCode) throws Exception {

		System.out.println("/updateTranCode.do");
		

		Purchase purchase = purchaseService.getPurchase(Integer.parseInt(prodNo));
		
		System.out.println("tranCode: "+tranCode);
		System.out.println("purchase: "+purchase);

		if (tranCode.equals("100")) {
			purchase.setTranCode("200");

		} else if (tranCode.equals("200")) {
			purchase.setTranCode("300");
		}

		purchaseService.updateTranCode(purchase);
		
		
		//Product product = productService.getProduct(Integer.parseInt(prodNo));
		//System.out.println("product: "+product);

		ModelAndView modelAndView = new ModelAndView();
		//modelAndView.addObject("product", product);
		modelAndView.setViewName("redirect:/product/listProduct?menu=manage");

		return modelAndView;
	}
	
	//일괄배송처리를 위한 컨트롤러
	@RequestMapping(value="updateTranCodeAll")
	public ModelAndView updateTranCodeAll(@RequestParam("prodNo") int[] prodNo, @RequestParam("tranCode") String[] tranCode)
			throws Exception {

		System.out.println("/updateTranCodeAll");
		
		////debug
		for(int no: prodNo) {
			System.out.println(no);
		}
		
		for(String no: tranCode) {
			System.out.println(no);
		}
		
		////
		for(int i=0; i<prodNo.length; i++) {
			Purchase purchase = purchaseService.getPurchase(prodNo[i]);
			System.out.println("tranCode: "+tranCode);
			System.out.println("purchase: "+purchase);
			
			if (tranCode[i].equals("100")) {
				purchase.setTranCode("200");
				
			} else if (tranCode[i].equals("200")) {
				purchase.setTranCode("300");
			}
			
			purchaseService.updateTranCode(purchase);
			
		}
		

		
		
//		Product product = productService.getProduct(prodNo[0]);
//		System.out.println("product: "+product);
//		modelAndView.addObject("product", product);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/product/listProduct?menu=manage");

		return modelAndView;
	}


	@RequestMapping(value="listPurchase")
	public ModelAndView listPurchase(@ModelAttribute("search") Search search, HttpSession session,
			ModelAndView modelAndView) throws Exception {
		System.out.println("/listPurchase.do");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		String userId = ((User) session.getAttribute("user")).getUserId();
		System.out.println("userId: " + userId);

		Map<String, Object> map = purchaseService.getPurchaseList(search, userId);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);

		modelAndView.setViewName("/purchase/listPurchase.jsp");
		return modelAndView;
	}

	@RequestMapping(value="getPurchase")
	public ModelAndView getPurchase(@RequestParam("prodNo") String prodNo) throws Exception {

		Purchase purchase = purchaseService.getPurchase(Integer.parseInt(prodNo));

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/GetPurchaseActionView.jsp");
		modelAndView.addObject("purchase", purchase);

		return modelAndView;
	}

	@RequestMapping(value="listSale")
	public ModelAndView listSale(@ModelAttribute("search") Search search, HttpSession session,
			ModelAndView modelAndView) throws Exception {
		System.out.println("/listSale.do");
		

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		

		String userId = ((User) session.getAttribute("user")).getUserId();
		System.out.println("userId: " + userId);

		Map<String, Object> map = purchaseService.getPurchaseList(search, userId);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);

		modelAndView.setViewName("/purchase/listSale.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="updatePurchaseView")
	public ModelAndView updatePurchaseView(@RequestParam("prodNo") String prodNo) throws Exception {
		
		System.out.println("updatePurchaseView");
		
		
		
		Purchase purchase = purchaseService.getPurchase(Integer.parseInt(prodNo));
		
		System.out.println("purchase:" +purchase);
		
	    String divyDate = purchase.getDivyDate();
			   
	    divyDate = divyDate.replace(" 00:00:00", "");
	    System.out.println("divyDate: "+divyDate);
	    
	    purchase.setDivyDate(divyDate);
		
			
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/updatePurchaseView.jsp");
		modelAndView.addObject("purchase", purchase);
		
		return modelAndView;
	}
	
	@RequestMapping(value="updatePurchase")
	public ModelAndView updatePurchase(@ModelAttribute("purchase") Purchase purchase
									, @RequestParam("prodNo") String prodNo) throws Exception {
		
		System.out.println("updatePurchase실행");
		System.out.println("purchase: "+purchase);
		
		purchaseService.updatePurchase(purchase);
		
		purchaseService.getPurchase(Integer.parseInt(prodNo));

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/GetPurchaseActionView.jsp");
		modelAndView.addObject("purchase", purchase);
		
		return modelAndView;
	}
	

}