package jiniShop.qna.service;

import java.util.List;

import jiniShop.qna.dao.QnaDAO;
import jiniShop.vo.QnaVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	QnaDAO qnaDAO;
	
	@Override
	public List<QnaVO> getQnaList(String id) {
		return qnaDAO.getQnaList(id);
	}

	@Override
	public void insertQna(QnaVO qnaVO) {
		qnaDAO.insertQna(qnaVO);
	}

	@Override
	public QnaVO getQnaDetail(String q_no) {
		return qnaDAO.getQnaDetail(q_no);
	}

	@Override
	public void deleteQna(String q_no) {
		qnaDAO.deleteQna(q_no);
	}

}
