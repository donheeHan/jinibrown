package jiniShop.admin.dao;

import java.util.List;

import jiniShop.vo.Login_ViewVO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Autowired
	SqlSession session;
	
	@Override
	public List<Login_ViewVO> getMemberList() {
		return session.selectList("Member.memberList");
	}

}
