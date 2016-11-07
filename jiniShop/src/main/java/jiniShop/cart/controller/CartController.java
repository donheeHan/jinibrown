package jiniShop.cart.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import jiniShop.cart.service.CartService;
import jiniShop.member.service.MemberService;
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

@Controller
public class CartController {
	
	@Autowired
	CartService cartService;
	
	@Autowired
	MemberService memberService;
	
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
			@RequestParam(value="buyMethod",defaultValue="aa")String buyMethod,
			@RequestParam(value="stackPoint",defaultValue="0")String stackPoint,
			@RequestParam(value="setPoint",defaultValue="0")String setPoint,
			HttpSession session){
		//로그인정보
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
		
		String check = "err";
		
		int priceSum=0;
		int myPoint = 0;
		
		Login_ViewVO loginInfo = memberService.getLoginInfo(loginUser.getId());
		
		//현재나의포인트
		int getMyPoint = Integer.parseInt(loginInfo.getPoint());
		Map<String, Object> pointChange = new HashMap<String, Object>();
		Map<String, String> insertCart = new HashMap<String, String>();
		Map<String, Object> minusQty = new HashMap<String, Object>();
		int stackPointInput = Integer.parseInt(stackPoint);
		int setPointInput = Integer.parseInt(setPoint);
		if(loginUser!=null){
			if(buyMethod.equals("1")){
				//포인트 쌓기
				getMyPoint= getMyPoint+stackPointInput;
				pointChange.put("priceSum", getMyPoint);
				pointChange.put("loginUser", loginUser.getId());
				cartService.minusPoint(pointChange);
				
				insertCart.put("productNo", productNo);
				insertCart.put("c_qty", c_qty);
				insertCart.put("c_color", c_color);
				insertCart.put("member", loginUser.getId());
				cartService.insertSell(insertCart);
				
				int checkQty = cartService.getProductQty(productNo);
				int c_qtyChange = Integer.parseInt(c_qty);
				
				minusQty.put("productNo", productNo);
				minusQty.put("c_qty", (checkQty-c_qtyChange));
				cartService.minusProductQty(minusQty);
				
				
				check="ok";
			}if(buyMethod.equals("2")){
				int proNo = Integer.parseInt(productNo);
				//----------------------------------------------------------
				myPoint = cartService.getPrice(proNo);
					if(myPoint!=0){
						priceSum += myPoint;
					}
				if(getMyPoint>priceSum){
					int checking = getMyPoint-priceSum;
	
						pointChange.put("priceSum", checking);
						pointChange.put("loginUser", loginUser.getId());
						cartService.minusPoint(pointChange);
					//---------------------------------------------------------
					
					insertCart.put("productNo", productNo);
					insertCart.put("c_qty", c_qty);
					insertCart.put("c_color", c_color);
					insertCart.put("member", loginUser.getId());
					
					cartService.insertSell(insertCart);
					
					int checkQty = cartService.getProductQty(productNo);
					int c_qtyChange = Integer.parseInt(c_qty);
					
					minusQty.put("productNo", productNo);
					minusQty.put("c_qty", (checkQty-c_qtyChange));
					cartService.minusProductQty(minusQty);
					
					check="ok";
				}else{
					check="point";
				}
			}if(buyMethod.equals("3")){
				int proNo = Integer.parseInt(productNo);
				//----------------------------------------------------------
				if(getMyPoint>=stackPointInput){
				getMyPoint-=setPointInput;
				
					pointChange.put("priceSum", getMyPoint);
					pointChange.put("loginUser", loginUser.getId());
					cartService.minusPoint(pointChange);
				//---------------------------------------------------------
				
				insertCart.put("productNo", productNo);
				insertCart.put("c_qty", c_qty);
				insertCart.put("c_color", c_color);
				insertCart.put("member", loginUser.getId());
				
				cartService.insertSell(insertCart);
				
				int checkQty = cartService.getProductQty(productNo);
				int c_qtyChange = Integer.parseInt(c_qty);
				
				minusQty.put("productNo", productNo);
				minusQty.put("c_qty", (checkQty-c_qtyChange));
				cartService.minusProductQty(minusQty);
				
				check="ok";
				}else{
					check="point";
				}
			}
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
				
				int totalPrice = 0;
				for (int i = 0; i < myCart.size(); i++) {
					totalPrice += Integer.parseInt(myCart.get(i).getC_qty()) * Integer.parseInt(myCart.get(i).getP_price());
				}
				if(myCart!=null){
					model.addAttribute("myCart", myCart);
					model.addAttribute("totalPrice", totalPrice);
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
	
	@RequestMapping(value="/myCartBuyForm")
	public String myCartBuyForm(Model model, HttpSession session, @RequestParam(value="str")String str){
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
		StringTokenizer tokens2 = new StringTokenizer(str, "," );
		List<CartViewVO> selectList = new ArrayList<CartViewVO>();
		int sum = 0;
		if(loginUser!=null){
			for(int x = 0; tokens2.hasMoreElements(); x++ ){
				String pass = tokens2.nextToken();
				if(!pass.equals("checkAll")){
					//----------------------------------------------------------
					int cartNo = Integer.parseInt(pass);
					CartViewVO viewCartPro = cartService.getCartProductInfo(cartNo); 
					sum += (Integer.parseInt(viewCartPro.getP_price())*Integer.parseInt(viewCartPro.getC_qty()));
					selectList.add(viewCartPro);
				}
			}
			model.addAttribute("myPoint",loginUser.getPoint());
			model.addAttribute("sum",sum);
			model.addAttribute("selectList",selectList);
		}
		return "/cart/myCartBuy";
	}
	@RequestMapping(value="/myCartBuy")
	@ResponseBody
	public String myCartBuy(Model model, HttpSession session,
							@RequestParam(value="str")String str,
							@RequestParam(value="buyMethod")String buyMethod,
							@RequestParam(value="setPoint", defaultValue="0")String setPoint){
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
		int priceSum=0;
		int myPoint = 0;
		String data = "noProduct";
		int getMyPoint = Integer.parseInt(loginUser.getPoint());
		if(loginUser!=null){
			Map<String, Object> minusQty = new HashMap<String, Object>();
			if(buyMethod.equals("3")){
				int usePoint = Integer.parseInt(setPoint);
				int checking = getMyPoint-usePoint;
				StringTokenizer tokens = new StringTokenizer(str, "," );
				if (checking>=0) {
					Map<String, Object> productBuy = new HashMap<String, Object>();
					productBuy.put("loginUser",loginUser.getId());
					Map<String, Object> pointChange = new HashMap<String, Object>();
					pointChange.put("priceSum", checking);
					pointChange.put("loginUser", loginUser.getId());
					cartService.minusPoint(pointChange);
					
						for (int x = 0; tokens.hasMoreElements(); x++) {
							String pass = tokens.nextToken();
							if (!pass.equals("checkAll")) {
								if(!pass.equals("")){
								int k = Integer.parseInt(pass);
								productBuy.put("pass", k);
								CartVO cartPno = cartService.myCartPno(k);
								productBuy.put("pass2", cartPno.getC_p_no());
								productBuy.put("s_c_qty", cartPno.getC_qty());
								productBuy.put("s_c_color", cartPno.getC_color());
								
								String changeNo = String.valueOf(cartPno.getC_p_no());
								int checkQty = cartService.getProductQty(changeNo);
								int c_qtyChange = cartPno.getC_qty();
								
								minusQty.put("productNo", cartPno.getC_p_no());
								minusQty.put("c_qty", (checkQty-c_qtyChange));
								cartService.minusProductQty(minusQty);
								
								cartService.myCartBuy(productBuy);
								cartService.myCartDel(k);
								
								}
							}
						}
						data="ok";
					}else{
						data="noPoint";
					}
				
			}else if(buyMethod.equals("1")){
			StringTokenizer tokens = new StringTokenizer(str, "," );
			Map<String, Object> productBuy = new HashMap<String, Object>();
			productBuy.put("loginUser",loginUser.getId());
			
				for (int x = 0; tokens.hasMoreElements(); x++) {
					String pass = tokens.nextToken();
					if (!pass.equals("checkAll")) {
						if(!pass.equals("")){
							int k = Integer.parseInt(pass);
							productBuy.put("pass", k);
							CartVO cartPno = cartService.myCartPno(k);
							productBuy.put("pass2", cartPno.getC_p_no());
							productBuy.put("s_c_qty", cartPno.getC_qty());
							productBuy.put("s_c_color", cartPno.getC_color());
							
							String changeNo = String.valueOf(cartPno.getC_p_no());
							int checkQty = cartService.getProductQty(changeNo);
							int c_qtyChange = cartPno.getC_qty();
							
							minusQty.put("productNo", cartPno.getC_p_no());
							minusQty.put("c_qty", (checkQty-c_qtyChange));
							cartService.minusProductQty(minusQty);
							
							cartService.myCartBuy(productBuy);
							cartService.myCartDel(k);
						}
					}
				}
				data="ok";
		}else if(buyMethod.equals("2")){
			StringTokenizer tokens2 = new StringTokenizer(str, "," );
				for(int x = 0; tokens2.hasMoreElements(); x++ ){
					String pass = tokens2.nextToken();
					if(!pass.equals("checkAll")){
						if(!pass.equals("")){
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
				}
				int checking = getMyPoint-priceSum;
				StringTokenizer tokens = new StringTokenizer(str, "," );
				if(priceSum!=0){
				if (checking>=0) {
					Map<String, Object> productBuy = new HashMap<String, Object>();
					productBuy.put("loginUser",loginUser.getId());
					Map<String, Object> pointChange = new HashMap<String, Object>();
					pointChange.put("priceSum", checking);
					pointChange.put("loginUser", loginUser.getId());
					cartService.minusPoint(pointChange);
					
						for (int x = 0; tokens.hasMoreElements(); x++) {
							String pass = tokens.nextToken();
							if (!pass.equals("checkAll")) {
								if(!pass.equals("")){
								int k = Integer.parseInt(pass);
								productBuy.put("pass", k);
								CartVO cartPno = cartService.myCartPno(k);
								productBuy.put("pass2", cartPno.getC_p_no());
								productBuy.put("s_c_qty", cartPno.getC_qty());
								productBuy.put("s_c_color", cartPno.getC_color());
								
								String changeNo = String.valueOf(cartPno.getC_p_no());
								int checkQty = cartService.getProductQty(changeNo);
								int c_qtyChange = cartPno.getC_qty();
								
								minusQty.put("productNo", cartPno.getC_p_no());
								minusQty.put("c_qty", (checkQty-c_qtyChange));
								cartService.minusProductQty(minusQty);
								
								cartService.myCartBuy(productBuy);
								cartService.myCartDel(k);
								}
							}
						}
						data="ok";
					}else{
						data="noPoint";
					}
				}else{
					if(str.equals(""))
					data="noProduct";
				}
				
			}
		}
		return data;
	}
	@RequestMapping(value="/myBuyList")
	public String myCartBuy(Model model, HttpSession session, @RequestParam(value="day", defaultValue="")String day){
		String url="redirect:/main";
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
		if(loginUser!=null){
			Map<String, Object> productBuy = new HashMap<String, Object>();
			List<BuyListViewVO> mySell = new ArrayList<BuyListViewVO>();
			if(day.equals("")){
				mySell = cartService.getBuyMyProduct(loginUser.getId());
			}else{
				day = day.substring(2);
				day = day.replaceAll("-", "/");
				mySell = cartService.getBuyMyProductDay(loginUser.getId(), day);
			}
			
			int totalPrice = 0;
			for (int i = 0; i < mySell.size(); i++) {
				totalPrice += mySell.get(i).getS_c_qty() * Integer.parseInt(mySell.get(i).getP_price());
			}
			if(mySell!=null){
				model.addAttribute("mySell",mySell);
				model.addAttribute("totalPrice", totalPrice);
			}
			url = "/cart/myBuyList";
		}
		return url;
	}
	
	@RequestMapping(value="/productBuy")
	public String productBuy(Model model,
			@RequestParam(value="productNo",defaultValue="aa")int productNo,
			@RequestParam(value="c_qty",defaultValue="aa")int c_qty,
			@RequestParam(value="c_color",defaultValue="aa")String c_color,			
			HttpSession session){
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
		
		if(loginUser!=null){
			ProductVO productInfo = cartService.getProductInfo(productNo); 
			Login_ViewVO memberInfo = cartService.getMyPoint(loginUser.getId());
			model.addAttribute("memberInfo", memberInfo);
			model.addAttribute("productInfo",productInfo);
			model.addAttribute("c_qty",c_qty);
			model.addAttribute("c_color",c_color);
		}
		return "/product/productBuy";
	}
}
