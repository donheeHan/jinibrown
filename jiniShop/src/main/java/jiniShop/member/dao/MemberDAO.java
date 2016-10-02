package jiniShop.member.dao;

import java.util.Map;

import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.MemberVO;
import jiniShop.vo.UsersVO;

public interface MemberDAO {

	UsersVO getLoginCheck(Map<String, String> checkMap);

	Login_ViewVO getLoginInfo(String id);

	void insertUser(UsersVO users);

	void insertMember(MemberVO member);

}
