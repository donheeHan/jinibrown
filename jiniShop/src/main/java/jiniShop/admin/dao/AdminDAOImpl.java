package jiniShop.admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import jiniShop.vo.ClientVO;
import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.ProductVO;
import jiniShop.vo.QnaVO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Autowired
	SqlSession session;
	
	@Override
	public List<Login_ViewVO> getMemberList() {
		return session.selectList("Member.memberList");
	}

	@Override
	public List<QnaVO> getQnaList() {
		return session.selectList("QNA.adminQnaList");
	}

	@Override
	public QnaVO getQnaDetail(String q_no) {
		return (QnaVO) session.selectOne("QNA.adminQnaDetail", q_no);
	}

	@Override
	public void deleteAdminQna(String q_no) {
		session.delete("QNA.adminQnaDel", q_no);
	}

	@Override
	public void insertQnaReply(Map<String, String> params) {
		session.update("QNA.adminInsertReply", params);
	}

	@Override
	public void addProduct(ProductVO product) throws SQLException {
		session.insert("product.addProduct",product);
	}

	@Override
	public List<ProductVO> getProductList() throws SQLException {
		List<ProductVO> getProductList = null;
		getProductList = session.selectList("product.getProductList");
		return getProductList;
	}

	@Override
	public void productDel(int proNo) throws SQLException {
		session.delete("product.productDel",proNo);
	}

	@Override
	public List<ClientVO> getClientList() throws SQLException {
		List<ClientVO> getClientList = null;
		getClientList = session.selectList("product.getClientList");
		return getClientList;
	}

}
