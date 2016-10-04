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
	public List<ProductVO> productList1(String kind) throws SQLException {
		List<ProductVO> productList1 = null;
		productList1 = session.selectList("product.list", kind);
		return productList1;
	}
	@Override
	public List<ProductVO> productList2(String kind) throws SQLException {
		List<ProductVO> productList2 = null;
		productList2 = session.selectList("product.list", kind);
		return productList2;
	}
	@Override
	public List<ProductVO> productList3(String kind) throws SQLException {
		List<ProductVO> productList3 = null;
		productList3 = session.selectList("product.list", kind);
		return productList3;
	}
	@Override
	public List<ProductVO> productList4(String kind) throws SQLException {
		List<ProductVO> productList4 = null;
		productList4 = session.selectList("product.list", kind);
		return productList4;
	}
	@Override
	public List<ProductVO> productList5(String kind) throws SQLException {
		List<ProductVO> productList5 = null;
		productList5 = session.selectList("product.list", kind);
		return productList5;
	}
	@Override
	public List<ProductVO> productList6(String kind) throws SQLException {
		List<ProductVO> productList6 = null;
		productList6 = session.selectList("product.list", kind);
		return productList6;
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
