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
	public List<ProductVO> productList1(String kind) {
		List<ProductVO> productList1 = null;
		try {
			productList1 = productDAO.productList1(kind);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return productList1;
	}
	@Override
	public List<ProductVO> productList2(String kind) {
		List<ProductVO> productList2 = null;
		try {
			productList2 = productDAO.productList2(kind);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return productList2;
	}
	@Override
	public List<ProductVO> productList3(String kind) {
		List<ProductVO> productList3 = null;
		try {
			productList3 = productDAO.productList3(kind);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return productList3;
	}
	@Override
	public List<ProductVO> productList4(String kind) {
		List<ProductVO> productList4 = null;
		try {
			productList4 = productDAO.productList4(kind);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return productList4;
	}
	@Override
	public ProductVO getProductDetail(int productNo) {
		ProductVO getProductDetail = null;
		try {
			getProductDetail = productDAO.getProductDetail(productNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return getProductDetail;
	}

	
}
