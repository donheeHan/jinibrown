package jiniShop.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.MemberVO;
import jiniShop.vo.ProductVO;
import jiniShop.vo.UsersVO;

public interface MemberDAO {

	UsersVO getLoginCheck(Map<String, String> checkMap);

	Login_ViewVO getLoginInfo(String id);

	void insertUser(UsersVO users);

	void insertMember(MemberVO member);

	List<ProductVO> getBestProduct() throws SQLException;

}
