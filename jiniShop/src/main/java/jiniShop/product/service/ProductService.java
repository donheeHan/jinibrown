package jiniShop.product.service;

import java.util.List;
import java.util.Map;

import jiniShop.vo.ProductVO;

public interface ProductService {

	List<ProductVO> productList1(String kind);
	List<ProductVO> productList2(String kind);
	List<ProductVO> productList3(String kind);
	List<ProductVO> productList4(String kind);
	List<ProductVO> productList5(String kind);
	List<ProductVO> productList6(String kind);
	ProductVO getProductDetail(int productNo);
	void increaseCount(Map<String, Object> counting);

}
