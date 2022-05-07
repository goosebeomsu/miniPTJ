package com.model2.mvc.service.purchase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.user.impl.UserServiceImpl;

public interface PurchaseDao {

	public void addPurchase(Purchase purchase) throws Exception;

	public Purchase getPurchase(int prodNo) throws Exception;

	public List<Purchase> getPurchaseList(Search search, String userId) throws Exception;

	public void updatePurchase(Purchase purchase) throws Exception;

	public void updateTranCode(Purchase purchase) throws Exception;

	public int getTotalCount(String userId) throws Exception;

}
