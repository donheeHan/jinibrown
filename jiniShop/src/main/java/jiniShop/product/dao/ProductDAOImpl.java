package jiniShop.product.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import jiniShop.vo.ProductVO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO{
	@Autowired
	SqlSession session;

	@Override
	public List<ProductVO> productList(String kind) throws SQLException {
		List<ProductVO> productList1 = null;
		productList1 = session.selectList("product.list", kind);
		return productList1;
	}
	@Override
	public ProductVO getProductDetail(int productNo) throws SQLException {
		ProductVO getProductDetail = null;
		getProductDetail = (ProductVO) session.selectOne("product.detail", productNo);
		return getProductDetail;
	}
	@Override
	public void increaseCount(Map<String, Object> counting) throws SQLException {
		session.update("product.increaseCount",counting);
	}

	
}
