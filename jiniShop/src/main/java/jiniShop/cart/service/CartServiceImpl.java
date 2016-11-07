package jiniShop.cart.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jiniShop.cart.dao.CartDAO;
import jiniShop.vo.BuyListViewVO;
import jiniShop.vo.CartVO;
import jiniShop.vo.CartViewVO;
import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.ProductVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	CartDAO cartDAO;
	
	@Override
	public void insertCart(Map<String, String> insertCart) {
		try {
			cartDAO.insertCart(insertCart);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}

	@Override
	public List<CartViewVO> getMyCart(String id) {
		List<CartViewVO> getMyCart = null;
		try {
			getMyCart = cartDAO.getMyCart(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return getMyCart;
	}

	@Override
	public void myCartDel(int pass) {
		try {
			cartDAO.myCartDel(pass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void myCartBuy(Map<String, Object> productBuy) {
		try {
			cartDAO.myCartBuy(productBuy);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public CartVO myCartPno(int k) {
		CartVO myCartPno = null;
		try {
			myCartPno = cartDAO.myCartPno(k);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return myCartPno;
	}

	@Override
	public List<BuyListViewVO> getBuyMyProduct(String id) {
		List<BuyListViewVO> getBuyMyProduct = null;
		try {
			getBuyMyProduct = cartDAO.getBuyMyProduct(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return getBuyMyProduct;
	}

	@Override
	public int getPrice(int point) {
		int getPrice = 0;
		try {
			getPrice = cartDAO.getPrice(point);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return getPrice;
	}

	@Override
	public void minusPoint(Map<String, Object> pointChange) {
		try {
			cartDAO.minusPoint(pointChange);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int getProNum(int point) {
		int getProNum=0;
		try {
			getProNum = cartDAO.getProNum(point);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return getProNum;
	}

	@Override
	public void insertSell(Map<String, String> insertCart) {
		try {
			cartDAO.insertSell(insertCart);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ProductVO getProductInfo(int productNo) {
		ProductVO productInfo = null;
		try {
			productInfo = cartDAO.getProductInfo(productNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productInfo;
	}

	@Override
	public Login_ViewVO getMyPoint(String id) {
		Login_ViewVO memberInfo = null;
		try {
			memberInfo = cartDAO.getMyPoint(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberInfo;
	}

	@Override
	public CartViewVO getCartProductInfo(int cartNo) {
		CartViewVO viewCartPro = null;
		try {
			viewCartPro = cartDAO.getCartProductInfo(cartNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return viewCartPro;
	}

	@Override
	public void minusProductQty(Map<String, Object> minusQty) {
		try {
			cartDAO.minusProductQty(minusQty);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int getProductQty(String productNo) {
		int qty = 0;
		try {
			qty = cartDAO.getProductQty(productNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return qty;
	}

	@Override
	public List<BuyListViewVO> getBuyMyProductDay(String id, String day) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("id", id);
		params.put("day", day);
		return cartDAO.getBuyMyProductDay(params);
	}

}
