package jiniShop.member.service;

import java.util.List;
import java.util.Map;

import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.MemberVO;
import jiniShop.vo.ProductVO;
import jiniShop.vo.UsersVO;

public interface MemberService {

	//로그인정보 체크
	UsersVO getLoginCheck(Map<String, String> checkMap);

	//로그인정보
	Login_ViewVO getLoginInfo(String id);

	//회원가입
	void insertMember(MemberVO member, UsersVO users);

	List<ProductVO> getBestProduct();

}
