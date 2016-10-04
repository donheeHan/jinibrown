package jiniShop.admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import jiniShop.vo.ClientVO;
import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.ProductVO;
import jiniShop.vo.QnaVO;

public interface AdminDAO {

	List<Login_ViewVO> getMemberList();

	List<QnaVO> getQnaList();

	QnaVO getQnaDetail(String q_no);

	void deleteAdminQna(String q_no);

	void insertQnaReply(Map<String, String> params);

	void addProduct(ProductVO product) throws SQLException;

	List<ProductVO> getProductList() throws SQLException;

	void productDel(int proNo) throws SQLException;

	List<ClientVO> getClientList() throws SQLException;

}
