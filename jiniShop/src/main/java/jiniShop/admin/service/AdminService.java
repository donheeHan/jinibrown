package jiniShop.admin.service;

import java.util.List;
import java.util.Map;

import jiniShop.vo.ClientVO;
import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.ProductVO;
import jiniShop.vo.QnaVO;
import jiniShop.vo.SellVO;

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

	List<SellVO> getProductMonth(int month);

	List<SellVO> getProductDay(int date);

	List<SellVO> getProductWeek(int weekDay);

	void insertClient(ClientVO clientVO);

	void deleteClient(String c_no);


}
