package jiniShop.admin.dao;

import java.util.List;
import java.util.Map;

import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.QnaVO;

public interface AdminDAO {

	List<Login_ViewVO> getMemberList();

	List<QnaVO> getQnaList();

	QnaVO getQnaDetail(String q_no);

	void deleteAdminQna(String q_no);

	void insertQnaReply(Map<String, String> params);

}
