package jiniShop.product.service;

import java.util.List;
import java.util.Map;

import jiniShop.vo.ProductVO;

public interface ProductService {

	List<ProductVO> productList(String kind);
	ProductVO getProductDetail(int productNo);
	void increaseCount(Map<String, Object> counting);

}
