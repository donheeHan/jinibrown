package jiniShop.admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import jiniShop.vo.ClientVO;
import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.ProductVO;
import jiniShop.vo.QnaVO;
import jiniShop.vo.QnaViewVO;
import jiniShop.vo.SellVO;

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
	public List<QnaViewVO> getQnaList() {
		return session.selectList("QNA.adminQnaList");
	}

	@Override
	public QnaViewVO getQnaDetail(String q_no) {
		return (QnaViewVO) session.selectOne("QNA.adminQnaDetail", q_no);
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

	@Override
	public List<SellVO> getProductMonth(int month) throws SQLException {
		List<SellVO> getProductMonth = null;
		getProductMonth = session.selectList("product.getProductMonth",month);
		return getProductMonth;
	}

	@Override
	public List<SellVO> getProductDay(int date) throws SQLException {
		List<SellVO> getProductDay = null;
		getProductDay = session.selectList("product.getProductDay",date);
		return getProductDay;
	}

	@Override
	public List<SellVO> getProductWeek(int weekDay)
			throws SQLException {
		List<SellVO> getProductWeek = null;
		getProductWeek = session.selectList("product.getProductWeek",weekDay);
		return getProductWeek;
	}

	@Override
	public void insertClient(ClientVO clientVO) {
		session.insert("product.insertClient", clientVO);
	}

	@Override
	public void deleteClient(String c_no) {
		session.delete("product.deleteClient", c_no);
	}

	@Override
	public ProductVO getProductDetail(int productNo) {
		ProductVO adminProductDetail = null;
		adminProductDetail = (ProductVO) session.selectOne("product.detail",productNo);
		return adminProductDetail;
	}

	@Override
	public void modifyProduct(ProductVO product) throws SQLException {
		session.update("product.adminProductUpdate",product);
	}

}
