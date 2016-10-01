package jiniShop.member.service;

import java.util.Map;

import jiniShop.member.dao.MemberDAO;
import jiniShop.vo.Login_ViewVO;
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

}
