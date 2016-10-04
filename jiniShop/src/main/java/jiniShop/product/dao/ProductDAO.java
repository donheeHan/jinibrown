package jiniShop.product.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import jiniShop.vo.ProductVO;

public interface ProductDAO {

	List<ProductVO> productList1(String kind) throws SQLException;
	List<ProductVO> productList2(String kind) throws SQLException;
	List<ProductVO> productList3(String kind) throws SQLException;
	List<ProductVO> productList4(String kind) throws SQLException;
	ProductVO getProductDetail(int productNo) throws SQLException;

}
