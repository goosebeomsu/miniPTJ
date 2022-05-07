package com.model2.mvc.web.purchase;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


import com.model2.mvc.service.domain.Purchase;

import com.model2.mvc.service.purchase.PurchaseService;



//==> 회원관리 RestController
@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {
	
	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	//setter Method 구현 않음
		
	public PurchaseRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/getPurchase/{prodNo}", method=RequestMethod.GET )
	public Purchase getPurchase( @PathVariable String prodNo ) throws Exception{
		
		System.out.println("json/getPurchase/ : GET");
		
		//Business Logic
		return purchaseService.getPurchase(Integer.parseInt(prodNo));
	}


	
}