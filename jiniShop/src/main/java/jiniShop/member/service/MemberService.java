package jiniShop.member.service;

import java.util.Map;

import jiniShop.vo.UsersVO;

public interface MemberService {

	UsersVO getLoginCheck(Map<String, String> checkMap);

}
