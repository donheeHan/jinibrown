package jiniShop.product.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jiniShop.product.service.ProductService;
import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.ProductVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

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

	@RequestMapping(value="/productCate", method={RequestMethod.GET, RequestMethod.POST})
	public void idCheck(HttpServletResponse response, @RequestParam("cate")String cate){

		List<ProductVO> productList = productService.productList(cate);
		
		ObjectMapper jsonObject = new ObjectMapper();
	
		try {
			response.setContentType("text/json; charset=utf-8;");
			String str = jsonObject.writeValueAsString(productList);
			response.getWriter().print(str);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException ei){
			ei.printStackTrace();
		}
	}
}
