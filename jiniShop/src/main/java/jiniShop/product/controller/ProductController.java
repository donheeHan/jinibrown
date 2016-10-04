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
	
	@RequestMapping(value="/changePage")
	public String changePage(Model model, @RequestParam(value="kind") String kind, HttpSession session){
		String url = "redirect:/main";
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
			model.addAttribute("kind", kind);
			if(kind.equals("1")){
				url = "redirect:/productList1";
			}else if(kind.equals("2")){
				url = "redirect:/productList2";
			}else if(kind.equals("3")){
				url = "redirect:/productList3";
			}else if(kind.equals("4")){
				url = "redirect:/productList4";
			}else if(kind.equals("5")){
				url = "redirect:/productList5";
			}else if(kind.equals("6")){
				url = "redirect:/productList6";
			}
		return url;
	}
	
	@RequestMapping(value="/productList1")
	public String productList1(Model model, @RequestParam(value="kind") String kind, HttpSession session){
		String url="/product/productPage1";
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
			List<ProductVO> productList1 = productService.productList1(kind);
			if(productList1!=null){
				model.addAttribute("productList1", productList1);
			}
		
		return url;
	}
	@RequestMapping(value="/productList2")
	public String productList2(Model model, @RequestParam(value="kind") String kind, HttpSession session){
		String url="/product/productPage2";
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
			List<ProductVO> productList2 = productService.productList2(kind);
			if(productList2!=null){
				model.addAttribute("productList2", productList2);
			}
		return url;
	}
	@RequestMapping(value="/productList3")
	public String productList3(Model model, @RequestParam(value="kind") String kind, HttpSession session){
		String url="/product/productPage3";
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
			List<ProductVO> productList3 = productService.productList3(kind);
			if(productList3!=null){
				model.addAttribute("productList3", productList3);
			}

		return url;
	}
	@RequestMapping(value="/productList4")
	public String productList4(Model model, @RequestParam(value="kind") String kind, HttpSession session){
		String url="/product/productPage4";
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
			List<ProductVO> productList4 = productService.productList4(kind);
			if(productList4!=null){
				model.addAttribute("productList4", productList4);			
			}
		return url;
	}
	@RequestMapping(value="/productList5")
	public String productList5(Model model, @RequestParam(value="kind") String kind, HttpSession session){
		String url="/product/productPage4";
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
		List<ProductVO> productList5 = productService.productList5(kind);
		if(productList5!=null){
			model.addAttribute("productList5", productList5);			
		}
		return url;
	}
	@RequestMapping(value="/productList6")
	public String productList6(Model model, @RequestParam(value="kind") String kind, HttpSession session){
		String url="/product/productPage6";
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
		List<ProductVO> productList6 = productService.productList6(kind);
		if(productList6!=null){
			model.addAttribute("productList6", productList6);			
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
