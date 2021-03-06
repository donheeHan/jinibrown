package jiniShop.cart.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import jiniShop.vo.BuyListViewVO;
import jiniShop.vo.CartVO;
import jiniShop.vo.CartViewVO;
import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.ProductVO;

public interface CartDAO {
	void insertCart(Map<String, String> insertCart) throws SQLException;
	List<CartViewVO> getMyCart(String id) throws SQLException;
	void myCartDel(int pass) throws SQLException;
	void myCartBuy(Map<String, Object> productBuy) throws SQLException;
	CartVO myCartPno(int k) throws SQLException;
	List<BuyListViewVO> getBuyMyProduct(String id) throws SQLException;
	int getPrice(int point) throws SQLException;
	void minusPoint(Map<String, Object> pointChange) throws SQLException;
	int getProNum(int point) throws SQLException;
	void insertSell(Map<String, String> insertCart)throws SQLException;
	ProductVO getProductInfo(int productNo) throws SQLException;
	Login_ViewVO getMyPoint(String id) throws SQLException;
	CartViewVO getCartProductInfo(int cartNo) throws SQLException;
	void minusProductQty(Map<String, Object> minusQty) throws SQLException;
	int getProductQty(String productNo) throws SQLException;
	List<BuyListViewVO> getBuyMyProductDay(Map<String, String> params);

}
