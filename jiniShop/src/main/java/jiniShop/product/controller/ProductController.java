package jiniShop.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import jiniShop.product.service.ProductService;
import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.ProductVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {
	@Autowired
	ProductService productService;
	
	@RequestMapping(value="/productList")
	public String productList1(Model model, @RequestParam(value="kind") String kind, HttpSession session){
		String url="/product/productPage";
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
			List<ProductVO> productList = productService.productList(kind);
			if(productList!=null){
				model.addAttribute("productList", productList);
			}
		
		return url;
	}
	@RequestMapping(value="/productDetail")
	public String productDetail(Model model, @RequestParam(value="productNo")int productNo, HttpSession session){
		String url = "/product/productDetail";
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
			ProductVO productDetail = productService.getProductDetail(productNo);
			
			//조회수 증가
			Map<String, Object> counting = new HashMap<String, Object>();
			int count = productDetail.getp_count();
			count++;
			counting.put("productNo", productNo);
			counting.put("count", count);
			productService.increaseCount(counting);
			
			
			if(productDetail!=null){
				model.addAttribute("productDetail", productDetail);
			}
			
		return url;
	}
	
}
