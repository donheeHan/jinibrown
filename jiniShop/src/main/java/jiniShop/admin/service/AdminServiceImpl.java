package jiniShop.admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import jiniShop.admin.dao.AdminDAO;
import jiniShop.vo.ClientVO;
import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.ProductVO;
import jiniShop.vo.QnaVO;
import jiniShop.vo.QnaViewVO;
import jiniShop.vo.SellVO;

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
	public List<QnaViewVO> getQnaList() {
		return adminDAO.getQnaList();
	}

	@Override
	public QnaViewVO getQnaDetail(String q_no) {
		return adminDAO.getQnaDetail(q_no);
	}

	@Override
	public void deleteAdminQna(String q_no) {
		adminDAO.deleteAdminQna(q_no);
	}

	@Override
	public QnaViewVO insertQnaReply(Map<String, String> params) {
		adminDAO.insertQnaReply(params);
		QnaViewVO qnaInfo = adminDAO.getQnaDetail(params.get("q_no"));
		return qnaInfo;
	}

	@Override
	public void addProduct(ProductVO product) {
		try {
			adminDAO.addProduct(product);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<ProductVO> getProductList() {
		List<ProductVO> productList = null;
		try {
			productList = adminDAO.getProductList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productList;
	}

	@Override
	public void productDel(int proNo) {
		try {
			adminDAO.productDel(proNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<ClientVO> getClientList() {
		List<ClientVO> getClientList = null;
		try {
			getClientList = adminDAO.getClientList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return getClientList;
	}

	@Override
	public List<SellVO> getProductMonth(int month) {
		List<SellVO> getProductMonth = null;		
		try {
			getProductMonth = adminDAO.getProductMonth(month);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return getProductMonth;
	}

	@Override
	public List<SellVO> getProductDay(int date) {
		List<SellVO> getProductDay = null;
		try {
			getProductDay = adminDAO.getProductDay(date);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return getProductDay;
	}

	@Override
	public List<SellVO> getProductWeek(int weekDay) {
		List<SellVO> getProductWeek = null;
		try {
			getProductWeek = adminDAO.getProductWeek(weekDay);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return getProductWeek;
	}

	@Override
	public void insertClient(ClientVO clientVO) {
		adminDAO.insertClient(clientVO);
	}

	@Override
	public void deleteClient(String c_no) {
		adminDAO.deleteClient(c_no);
	}

	@Override
	public ProductVO getProductDetail(int productNo) {
		ProductVO adminProductDetail = null;
		adminProductDetail = adminDAO.getProductDetail(productNo);
		return adminProductDetail;
	}

	@Override
	public void modifyProduct(ProductVO product) {
		try {
			adminDAO.modifyProduct(product);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
