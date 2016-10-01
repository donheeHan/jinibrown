package jiniShop.member.dao;

import java.util.Map;

import jiniShop.vo.UsersVO;

public interface MemberDAO {

	UsersVO getLoginCheck(Map<String, String> checkMap);

}
