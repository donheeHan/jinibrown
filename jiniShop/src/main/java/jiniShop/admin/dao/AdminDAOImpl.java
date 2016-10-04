package jiniShop.admin.dao;

import java.util.List;
import java.util.Map;

import jiniShop.vo.Login_ViewVO;
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

}
