package jiniShop.admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import jiniShop.admin.dao.AdminDAO;
import jiniShop.vo.ClientVO;
import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.ProductVO;
import jiniShop.vo.QnaVO;

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

	@Override
	public List<QnaVO> getQnaList() {
		return adminDAO.getQnaList();
	}

	@Override
	public QnaVO getQnaDetail(String q_no) {
		return adminDAO.getQnaDetail(q_no);
	}

	@Override
	public void deleteAdminQna(String q_no) {
		adminDAO.deleteAdminQna(q_no);
	}

	@Override
	public QnaVO insertQnaReply(Map<String, String> params) {
		adminDAO.insertQnaReply(params);
		QnaVO qnaInfo = adminDAO.getQnaDetail(params.get("q_no"));
		return qnaInfo;
	}

	@Override
	public void addProduct(ProductVO product) {
		try {
			adminDAO.addProduct(product);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public List<ProductVO> getProductList() {
		List<ProductVO> productList = null;
		try {
			productList = adminDAO.getProductList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return productList;
	}

	@Override
	public void productDel(int proNo) {
		try {
			adminDAO.productDel(proNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<ClientVO> getClientList() {
		List<ClientVO> getClientList = null;
		try {
			getClientList = adminDAO.getClientList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return getClientList;
	}
	
	
}
