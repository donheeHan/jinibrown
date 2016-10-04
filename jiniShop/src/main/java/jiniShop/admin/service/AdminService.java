package jiniShop.admin.service;

import java.util.List;
import java.util.Map;

import jiniShop.vo.ClientVO;
import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.ProductVO;
import jiniShop.vo.QnaVO;

public interface AdminService {

	List<Login_ViewVO> getMemberList();

	List<QnaVO> getQnaList();

	QnaVO getQnaDetail(String q_no);

	void deleteAdminQna(String q_no);

	QnaVO insertQnaReply(Map<String, String> params);

	void addProduct(ProductVO product);

	List<ProductVO> getProductList();

	void productDel(int proNo);

	List<ClientVO> getClientList();

}
