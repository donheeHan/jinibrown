package jiniShop.cart.service;

import java.util.List;
import java.util.Map;

import jiniShop.vo.CartVO;
import jiniShop.vo.CartViewVO;

public interface CartService {
	void insertCart(Map<String, String> insertCart);
	List<CartViewVO> getMyCart(String id);
	void myCartDel(int pass);
	void myCartBuy(Map<String, Object> productBuy);
	CartVO myCartPno(int k);
}
