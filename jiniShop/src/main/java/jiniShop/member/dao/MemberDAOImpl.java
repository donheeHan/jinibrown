package jiniShop.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.MemberVO;
import jiniShop.vo.ProductVO;
import jiniShop.vo.UsersVO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	SqlSession session;

	@Override
	public UsersVO getLoginCheck(Map<String, String> checkMap) {
		return (UsersVO) session.selectOne("Member.loginCheck", checkMap);
	}

	@Override
	public Login_ViewVO getLoginInfo(String id) {
		return (Login_ViewVO) session.selectOne("Member.loginInfo", id);
	}

	@Override
	public void insertUser(UsersVO users) {
		session.insert("Member.insertUser", users);
	}

	@Override
	public void insertMember(MemberVO member) {
		session.insert("Member.insertMember", member);
	}

	@Override
	public List<ProductVO> getBestProduct() throws SQLException {
		List<ProductVO> getBestProduct = null;
		getBestProduct = session.selectList("product.getBestProduct");
		return getBestProduct;
	}

	@Override
	public List<ProductVO> getNewProduct() {
		return session.selectList("product.getNewProduct");
	}

	@Override
	public void updateMypageInfo(MemberVO vo) {
		session.update("Member.updateMypageInfo", vo);
	}

	@Override
	public void updateUserPwd(UsersVO vo) {
		session.update("Member.updateUserPwd", vo);
	}

}
