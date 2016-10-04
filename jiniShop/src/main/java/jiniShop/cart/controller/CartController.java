package jiniShop.cart.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import jiniShop.cart.service.CartService;
import jiniShop.vo.CartVO;
import jiniShop.vo.CartViewVO;
import jiniShop.vo.Login_ViewVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CartController {
	
	@Autowired
	CartService cartService;
	
	@RequestMapping(value="/insertCart")
	public void insertCart(Model model, @RequestParam(value="productNo")String productNo, HttpSession session){
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
		if(loginUser!=null){
			Map<String, String> insertCart = new HashMap<String, String>();
			insertCart.put("productNo", productNo);
			insertCart.put("member", loginUser.getId());
			
			cartService.insertCart(insertCart);
		}
	}
	
	@RequestMapping(value="/myCart")
	public String myCart(Model model, HttpSession session){
		String url="redirect:/main";
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
			if(loginUser!=null){
				List<CartViewVO> myCart = new ArrayList<CartViewVO>();
				myCart = cartService.getMyCart(loginUser.getId());
				if(myCart!=null){
					model.addAttribute("myCart", myCart);
				}
			url="/cart/myCart";
		}
		return url;
	}
	@RequestMapping(value="/myCartDel")
	public String myCartDel(Model model, HttpSession session, @RequestParam(value="str")String str){
		String url="redirect:/main";
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
		if(loginUser!=null){
			StringTokenizer tokens = new StringTokenizer( str, "," );
				for(int x=1; tokens.hasMoreElements(); x++ ){
				    String pass = tokens.nextToken();
				    if(!pass.equals("checkAll")){
				    	int k = Integer.parseInt(pass);
				    	cartService.myCartDel(k);
				    }
				}
			url="redirect:/myCart";
		}
		return url;
	}
	@RequestMapping(value="/myCartBuy")
	public String myCartBuy(Model model, HttpSession session, @RequestParam(value="str")String str){
		String url="redirect:/main";
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
		if(loginUser!=null){
		Map<String, Object> productBuy = new HashMap<String, Object>();
		StringTokenizer tokens = new StringTokenizer( str, "," );
		
		productBuy.put("loginUser",loginUser);
		
			for(int x = 1; tokens.hasMoreElements(); x++ ){
				String pass = tokens.nextToken();
				if(!pass.equals("checkAll")){
					int k = Integer.parseInt(pass);
					productBuy.put("pass", k);
					CartVO cartPno = cartService.myCartPno(k);
					productBuy.put("pass2",cartPno.getC_p_no());
	
					cartService.myCartBuy(productBuy);
					cartService.myCartDel(k);
					}
				}
			url = "redirect:/myCart";
		}
		return url;
	}
}
