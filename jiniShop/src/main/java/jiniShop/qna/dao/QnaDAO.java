package jiniShop.qna.dao;

import java.util.List;

import jiniShop.vo.QnaVO;
import jiniShop.vo.QnaViewVO;

public interface QnaDAO {

	//qna리스트
	List<QnaViewVO> getQnaList(String id);

	//qna등록
	void insertQna(QnaVO qnaVO);

	//qna디테일
	QnaViewVO getQnaDetail(String q_no);

	//qna삭제
	void deleteQna(String q_no);

}
