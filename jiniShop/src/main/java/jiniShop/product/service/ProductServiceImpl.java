package jiniShop.product.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import jiniShop.product.dao.ProductDAO;
import jiniShop.vo.ProductVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductDAO productDAO;

	@Override
	public List<ProductVO> productList(String kind) {
		List<ProductVO> productList = null;
		try {
			productList = productDAO.productList(kind);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productList;
	}
	@Override
	public ProductVO getProductDetail(int productNo) {
		ProductVO getProductDetail = null;
		try {
			getProductDetail = productDAO.getProductDetail(productNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return getProductDetail;
	}
	@Override
	public void increaseCount(Map<String, Object> counting) {
		try {
			productDAO.increaseCount(counting);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	
}
