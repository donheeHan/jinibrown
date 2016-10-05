package jiniShop.cart.service;

import java.util.List;
import java.util.Map;

import jiniShop.vo.BuyListViewVO;
import jiniShop.vo.CartVO;
import jiniShop.vo.CartViewVO;
import jiniShop.vo.ProductVO;

public interface CartService {
	void insertCart(Map<String, String> insertCart);
	List<CartViewVO> getMyCart(String id);
	void myCartDel(int pass);
	void myCartBuy(Map<String, Object> productBuy);
	CartVO myCartPno(int k);
	List<BuyListViewVO> getBuyMyProduct(String id);
	int getPrice(int point);
	void minusPoint(Map<String, Object> pointChange);
	int getProNum(int point);
	void insertSell(Map<String, String> insertCart);
}
