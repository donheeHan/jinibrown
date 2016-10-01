package jiniShop.member.service;

import java.util.Map;

import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.UsersVO;

public interface MemberService {

	//로그인정보 체크
	UsersVO getLoginCheck(Map<String, String> checkMap);

	//로그인정보
	Login_ViewVO getLoginInfo(String id);

}
