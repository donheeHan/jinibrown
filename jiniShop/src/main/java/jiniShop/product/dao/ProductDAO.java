package jiniShop.product.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import jiniShop.vo.ProductVO;

public interface ProductDAO {

	List<ProductVO> productList(String kind) throws SQLException;
	ProductVO getProductDetail(int productNo) throws SQLException;
	void increaseCount(Map<String, Object> counting) throws SQLException;

}
