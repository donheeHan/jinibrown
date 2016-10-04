package jiniShop.cart.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import jiniShop.cart.dao.CartDAO;
import jiniShop.vo.CartVO;
import jiniShop.vo.CartViewVO;

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
			// TODO Auto-generated catch block
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public CartVO myCartPno(int k) {
		CartVO myCartPno = null;
		try {
			myCartPno = cartDAO.myCartPno(k);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return myCartPno;
	}

}
