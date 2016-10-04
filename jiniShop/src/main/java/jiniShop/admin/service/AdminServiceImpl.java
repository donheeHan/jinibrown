package jiniShop.admin.service;

import java.util.List;

import jiniShop.admin.dao.AdminDAO;
import jiniShop.vo.Login_ViewVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDAO adminDAO;

	@Override
	public List<Login_ViewVO> getMemberList() {
		return adminDAO.getMemberList();
	}
	
	
}
