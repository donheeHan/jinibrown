package jiniShop.cart.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import jiniShop.vo.BuyListViewVO;
import jiniShop.vo.CartVO;
import jiniShop.vo.CartViewVO;
import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.ProductVO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO{
	
	@Autowired
	SqlSession session;
	
	@Override
	public void insertCart(Map<String, String> insertCart) throws SQLException {
		session.insert("cart.insertCart",insertCart);
	}

	@Override
	public List<CartViewVO> getMyCart(String id) throws SQLException {
		List<CartViewVO> getMyCart = null;
		getMyCart = session.selectList("cart.getMyCart",id);
		return getMyCart;
	}

	@Override
	public void myCartDel(int pass) throws SQLException {
		session.delete("cart.myCartDel",pass);
	}

	@Override
	public void myCartBuy(Map<String, Object> productBuy) throws SQLException {		
		session.insert("cart.myCartBuy",productBuy);
	}

	@Override
	public CartVO myCartPno(int k) throws SQLException {
		CartVO myCartPno = null;
		myCartPno = (CartVO) session.selectOne("cart.myCartPno", k);
		return myCartPno;
	}

	@Override
	public List<BuyListViewVO> getBuyMyProduct(String id) throws SQLException {
		List<BuyListViewVO> getBuyMyProduct = null;
		getBuyMyProduct = session.selectList("cart.getBuyMyProduct", id);
		return getBuyMyProduct;
	}

	@Override
	public int getPrice(int point) throws SQLException {
		int getPrice = 0;
		getPrice = (Integer) session.selectOne("cart.getPrice",point);
		return getPrice;
	}

	@Override
	public void minusPoint(Map<String, Object> pointChange) throws SQLException {
		session.update("cart.minusPoint",pointChange);
	}

	@Override
	public int getProNum(int point) throws SQLException {
		int getProNum = 0;
		getProNum = (Integer) session.selectOne("cart.getProNum",point);
		return getProNum;
	}

	@Override
	public void insertSell(Map<String, String> insertCart) throws SQLException {
		session.insert("cart.insertSell",insertCart);
	}

	@Override
	public ProductVO getProductInfo(int productNo) throws SQLException {
		ProductVO productInfo = null;
		productInfo = (ProductVO) session.selectOne("product.detail", productNo);
		return productInfo;
	}

	@Override
	public Login_ViewVO getMyPoint(String id) throws SQLException {
		Login_ViewVO memberInfo = null;
		memberInfo = (Login_ViewVO) session.selectOne("cart.myPoint", id);
		return memberInfo;
	}

	@Override
	public CartViewVO getCartProductInfo(int cartNo) throws SQLException {
		CartViewVO viewCartPro = null;
		viewCartPro = (CartViewVO) session.selectOne("cart.cartProductDetail", cartNo);
		return viewCartPro;
	}

	@Override
	public void minusProductQty(Map<String, Object> minusQty)
			throws SQLException {
		session.update("product.minusProductQty",minusQty);
	}

	@Override
	public int getProductQty(String productNo) throws SQLException {
		int qty=0;
		qty=(Integer) session.selectOne("product.getProductQty", productNo);
		return qty;
	}

	@Override
	public List<BuyListViewVO> getBuyMyProductDay(Map<String, String> params) {
		return session.selectList("cart.getBuyMyProductDay", params);
	}
	
}
