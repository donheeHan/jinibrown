package jiniShop.qna.dao;

import java.util.List;

import jiniShop.vo.QnaVO;
import jiniShop.vo.QnaViewVO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAOImpl implements QnaDAO{

	@Autowired
	SqlSession session;
	
	@Override
	public List<QnaViewVO> getQnaList(String id) {
		return session.selectList("QNA.qnaList",id);
	}

	@Override
	public void insertQna(QnaVO qnaVO) {
		session.insert("QNA.insertQna", qnaVO);
	}

	@Override
	public QnaViewVO getQnaDetail(String q_no) {
		return (QnaViewVO) session.selectOne("QNA.qnaDetail", q_no);
	}

	@Override
	public void deleteQna(String q_no) {
		session.delete("QNA.qnaDelete", q_no);
	}

}
