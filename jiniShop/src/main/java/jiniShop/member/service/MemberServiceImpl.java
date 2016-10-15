package jiniShop.member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import jiniShop.member.dao.MemberDAO;
import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.MemberVO;
import jiniShop.vo.ProductVO;
import jiniShop.vo.UsersVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public UsersVO getLoginCheck(Map<String, String> checkMap) {
		return memberDAO.getLoginCheck(checkMap);
	}

	@Override
	public Login_ViewVO getLoginInfo(String id) {
		return memberDAO.getLoginInfo(id);
	}

	@Override
	public void insertMember(MemberVO member, UsersVO users) {

		memberDAO.insertUser(users);
		memberDAO.insertMember(member);
	}

	@Override
	public List<ProductVO> getBestProduct() {
		List<ProductVO> getBestProduct = null;
		try {
			getBestProduct = memberDAO.getBestProduct();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return getBestProduct;
	}

	@Override
	public List<ProductVO> getNewProduct() {
		return memberDAO.getNewProduct();
	}

	@Override
	public void updateMypageInfo(MemberVO vo) {
		memberDAO.updateMypageInfo(vo);
	}

	@Override
	public void updateUserPwd(UsersVO vo) {
		memberDAO.updateUserPwd(vo);
	}

}
