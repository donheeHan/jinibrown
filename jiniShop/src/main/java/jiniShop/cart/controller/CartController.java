package jiniShop.cart.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import jiniShop.cart.service.CartService;
import jiniShop.vo.BuyListViewVO;
import jiniShop.vo.CartVO;
import jiniShop.vo.CartViewVO;
import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.ProductVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CartController {
	
	@Autowired
	CartService cartService;
	
	@RequestMapping(value="/insertCart")
	@ResponseBody
	public String insertCart(Model model,
							 @RequestParam(value="productNo",defaultValue="aa")String productNo,
							 @RequestParam(value="c_qty",defaultValue="aa")String c_qty,
							 @RequestParam(value="c_color",defaultValue="aa")String c_color,
							 HttpSession session){
		String check = "err";
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
		if(loginUser!=null){
			Map<String, String> insertCart = new HashMap<String, String>();
			insertCart.put("productNo", productNo);
			insertCart.put("c_qty", c_qty);
			insertCart.put("c_color", c_color);
			insertCart.put("member", loginUser.getId());
			
			cartService.insertCart(insertCart);
			check="ok";
		}else if(loginUser==null){
			check="err";
		}
		return check;
	}
	@RequestMapping(value="/insertSell")
	@ResponseBody
	public String insertSell(Model model,
			@RequestParam(value="productNo",defaultValue="aa")String productNo,
			@RequestParam(value="c_qty",defaultValue="aa")String c_qty,
			@RequestParam(value="c_color",defaultValue="aa")String c_color,
			HttpSession session){
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
		String check = "err";
		int priceSum=0;
		int myPoint = 0;
		int getMyPoint = Integer.parseInt(loginUser.getPoint());
		String data = "ok";
		if(loginUser!=null){
			int proNo = Integer.parseInt(productNo);
			//----------------------------------------------------------
			myPoint = cartService.getPrice(proNo);
				if(myPoint!=0){
					priceSum += myPoint;
				}
			int checking = getMyPoint-priceSum;
			
				Map<String, Object> pointChange = new HashMap<String, Object>();
				pointChange.put("priceSum", checking);
				pointChange.put("loginUser", loginUser.getId());
				cartService.minusPoint(pointChange);
			//---------------------------------------------------------
			Map<String, String> insertCart = new HashMap<String, String>();
			insertCart.put("productNo", productNo);
			insertCart.put("c_qty", c_qty);
			insertCart.put("c_color", c_color);
			insertCart.put("member", loginUser.getId());
			
			cartService.insertSell(insertCart);
			check="ok";
		}else if(loginUser==null){
			check="err";
		}
		return check;
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
	@ResponseBody
	public String myCartBuy(Model model, HttpSession session, @RequestParam(value="str")String str){
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
		int priceSum=0;
		int myPoint = 0;
		String data = "ok";
		int getMyPoint = Integer.parseInt(loginUser.getPoint());
		
		if(loginUser!=null){
		StringTokenizer tokens2 = new StringTokenizer(str, "," );

			for(int x = 0; tokens2.hasMoreElements(); x++ ){
				String pass = tokens2.nextToken();
				if(!pass.equals("checkAll")){
					//----------------------------------------------------------
					int point = Integer.parseInt(pass);
						int productNumber = cartService.getProNum(point);
						//----------------------------------------------------------
					myPoint = cartService.getPrice(productNumber);
					if(myPoint!=0){
						priceSum += myPoint;
					}
				}
			}
			int checking = getMyPoint-priceSum;
			StringTokenizer tokens = new StringTokenizer(str, "," );
			if(priceSum!=0){
			if (checking>=0) {
				System.out.println("결제함");
				Map<String, Object> productBuy = new HashMap<String, Object>();
				productBuy.put("loginUser",loginUser.getId());
				Map<String, Object> pointChange = new HashMap<String, Object>();
				pointChange.put("priceSum", checking);
				pointChange.put("loginUser", loginUser.getId());
				cartService.minusPoint(pointChange);
				
					for (int x = 0; tokens.hasMoreElements(); x++) {
						String pass = tokens.nextToken();
						if (!pass.equals("checkAll")) {
							int k = Integer.parseInt(pass);
							productBuy.put("pass", k);
							CartVO cartPno = cartService.myCartPno(k);
							productBuy.put("pass2", cartPno.getC_p_no());

							cartService.myCartBuy(productBuy);
							cartService.myCartDel(k);
						}
					}
				}else{
					data="noPoint";
				}
			}else{
				if(str.equals(""))
				data="noProduct";
			}
			
		}
		return data;
	}
	@RequestMapping(value="/myBuyList")
	public String myCartBuy(Model model, HttpSession session){
		String url="redirect:/main";
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
		if(loginUser!=null){
			Map<String, Object> productBuy = new HashMap<String, Object>();
			List<BuyListViewVO> mySell = cartService.getBuyMyProduct(loginUser.getId());
			if(mySell!=null){
				model.addAttribute("mySell",mySell);
			}
			url = "/cart/myBuyList";
		}
		return url;
	}
}
