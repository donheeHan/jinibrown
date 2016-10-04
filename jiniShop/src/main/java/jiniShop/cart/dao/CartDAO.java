package jiniShop.cart.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import jiniShop.vo.BuyListViewVO;
import jiniShop.vo.CartVO;
import jiniShop.vo.CartViewVO;

public interface CartDAO {
	void insertCart(Map<String, String> insertCart) throws SQLException;
	List<CartViewVO> getMyCart(String id) throws SQLException;
	void myCartDel(int pass) throws SQLException;
	void myCartBuy(Map<String, Object> productBuy) throws SQLException;
	CartVO myCartPno(int k) throws SQLException;
	List<BuyListViewVO> getBuyMyProduct(String id) throws SQLException;

}
