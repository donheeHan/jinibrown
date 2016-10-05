package jiniShop.admin.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jiniShop.admin.service.AdminService;
import jiniShop.vo.ClientVO;
import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.ProductVO;
import jiniShop.vo.QnaVO;
import jiniShop.vo.SellVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;

	@RequestMapping("/admin/memberList")
	public String memberList(Model model) {
		String url = "/admin/memberList";

		List<Login_ViewVO> memberList = adminService.getMemberList();

		model.addAttribute("memberList", memberList);

		return url;
	}

	@RequestMapping("/admin/qnaList")
	public String qnaList(Model model) {
		String url = "/admin/adminQnaList";

		List<QnaVO> qnaList = adminService.getQnaList();

		model.addAttribute("qnaList", qnaList);

		return url;
	}

	@RequestMapping("/admin/adminQnaDetail")
	public String qnaDetail(Model model, @RequestParam("q_no") String q_no) {
		String url = "/admin/adminQnaDetail";

		QnaVO qnaInfo = adminService.getQnaDetail(q_no);

		model.addAttribute("qnaInfo", qnaInfo);

		return url;
	}

	@RequestMapping("/admin/qnaDel")
	public String qnaDel(@RequestParam("q_no") String q_no) {
		String url = "redirect:/admin/qnaList";

		adminService.deleteAdminQna(q_no);

		return url;
	}

	@RequestMapping("/admin/qnaReplyInsert")
	public void qnaReplyForm(@RequestParam("q_no") String q_no,
			@RequestParam("reply") String reply, HttpServletResponse response) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("q_no", q_no);
		params.put("reply", reply);

		QnaVO qnaInfo = adminService.insertQnaReply(params);

		ObjectMapper jsonObject = new ObjectMapper();

		try {
			response.setContentType("text/json; charset=utf-8;");
			String str = jsonObject.writeValueAsString(qnaInfo);
			response.getWriter().print(str);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException ei) {
			ei.printStackTrace();
		}
	}
	
	@RequestMapping("/admin/productForm")
	public String productForm(Model model, HttpSession session) {
		String url = "redirect:/main";
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
	      
	    if(loginUser !=null){
	    	url = "/admin/adminProductForm";
	    	List<ClientVO> clientList = adminService.getClientList();
	    	if(clientList!=null){
	    		model.addAttribute("clientList",clientList);
	    	}
	    }
		return url;
	}
	@RequestMapping("/admin/productList")
	public String productList(Model model, HttpSession session) {
		String url = "redirect:/main";
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
	      
	    if(loginUser !=null){
		List<ProductVO> productList = adminService.getProductList();
			if(productList!=null){
				model.addAttribute("productList",productList);
			}
				url = "/admin/adminProductList";
	    }
	    
		return url;
	}

	@RequestMapping(value="/admin/addProduct", method=RequestMethod.POST)
	public String addProduct(Model model, MultipartFile multiFile1, MultipartFile multiFile2, HttpSession session, ProductVO product){
	     /* String imagePath = request.getSession().getServletContext().getRealPath("resources/memberManagementImage");      
	      String signPath = request.getSession().getServletContext().getRealPath("resources/memberSign");        */     
 
		String url = "redirect:/admin/productList";
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
	      
	      if(loginUser !=null){
	         model.addAttribute("memberVO",loginUser);
	         if(!multiFile1.isEmpty() && !multiFile2.isEmpty()){
	        	String uploadPath = "C:/Users/admin/git/jinibrown/jiniShop/src/main/webapp/resources/images/productImage";
	            File file1 = new File(uploadPath, "$$"+System.currentTimeMillis() + multiFile1.getOriginalFilename());
	            File file2 = new File(uploadPath, "$$"+System.currentTimeMillis() + multiFile2.getOriginalFilename());
	            
	            try {
	            	multiFile1.transferTo(file1);
	            	multiFile2.transferTo(file2); 
					//실제 저장이 이루어짐
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} //실제 저장이 이루어짐
	            product.setP_mainimg(file1.getName()); //DB 컬럼에 파일명 저장
	            product.setP_subimg(file2.getName());
	            adminService.addProduct(product);
	         }else{
	        	 product.setP_mainimg("-"); //DB 컬럼에 파일명 저장
	        	 product.setP_subimg("-");	        	 
	        	 adminService.addProduct(product);
	         }
	      }
	      return url;
	}
	@RequestMapping(value="/admin/productDel")
	@ResponseBody
	public String myCartDel(Model model, HttpSession session, @RequestParam(value="str", defaultValue="aa")String str){
		String check = "err";
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
		if(loginUser!=null){
			StringTokenizer tokens = new StringTokenizer( str, "," );
				for(int x=1; tokens.hasMoreElements(); x++ ){
				    String pass = tokens.nextToken();
				    if(!pass.equals("checkAll")){
				    	int proNo = Integer.parseInt(pass);
				    	adminService.productDel(proNo);
				    	check = "ok";
				    }
				}
		}
		return check;
	}
	@RequestMapping(value="/admin/mainSellProduct", method=RequestMethod.GET)
	@ResponseBody
	public Object mainSellProduct(Model model, HttpSession session, @RequestParam(value="search")String search){
		Calendar cal = Calendar.getInstance();
		 
		int month = cal.get ( cal.MONTH ) + 1 ;
		int date = cal.get ( cal.DATE ) ;
		int weekDay = cal.get(cal.DATE);

		Map<String,Object> retVal = new HashMap<String, Object>();
		if(search.equals("month")){
		List<SellVO> getProductMonth = adminService.getProductMonth(month);
		retVal.put("getProductMonth", getProductMonth);
		}else if(search.equals("day")){
			List<SellVO> getProductMonth = adminService.getProductDay(date);
			retVal.put("getProductMonth", getProductMonth);
		}else if(search.equals("week")){
			List<SellVO> getProductMonth = adminService.getProductWeek(weekDay);
			retVal.put("getProductMonth", getProductMonth);
		}
		return retVal;
	}
}
