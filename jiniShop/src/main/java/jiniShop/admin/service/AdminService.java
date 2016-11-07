package jiniShop.admin.service;

import java.util.List;
import java.util.Map;

import jiniShop.vo.ClientVO;
import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.ProductVO;
import jiniShop.vo.QnaVO;
import jiniShop.vo.QnaViewVO;
import jiniShop.vo.SellVO;

public interface AdminService {

	List<Login_ViewVO> getMemberList();

	List<QnaViewVO> getQnaList();

	QnaViewVO getQnaDetail(String q_no);

	void deleteAdminQna(String q_no);

	QnaViewVO insertQnaReply(Map<String, String> params);

	void addProduct(ProductVO product);

	List<ProductVO> getProductList();

	void productDel(int proNo);

	List<ClientVO> getClientList();

	List<SellVO> getProductMonth(String month, int i);

	void insertClient(ClientVO clientVO);

	void deleteClient(String c_no);

	ProductVO getProductDetail(int productNo);

	void modifyProduct(ProductVO product);

	Login_ViewVO getMemberDetail(String id);

	void updateMemberPoint(String id, String point);


}
