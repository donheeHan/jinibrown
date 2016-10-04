package jiniShop.admin.dao;

import java.util.List;

import jiniShop.vo.Login_ViewVO;

public interface AdminDAO {

	List<Login_ViewVO> getMemberList();

}
