package jiniShop.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import jiniShop.vo.QnaViewVO;
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

	@RequestMapping("/admin/main")
	public String adminMain(){
		String url="/admin/adminMain";
		
		return url;
	}
	
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

		List<QnaViewVO> qnaList = adminService.getQnaList();

		model.addAttribute("qnaList", qnaList);

		return url;
	}

	@RequestMapping("/admin/adminQnaDetail")
	public String qnaDetail(Model model, @RequestParam("q_no") String q_no) {
		String url = "/admin/adminQnaDetail";

		QnaViewVO qnaInfo = adminService.getQnaDetail(q_no);

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

		QnaViewVO qnaInfo = adminService.insertQnaReply(params);

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
	
	@RequestMapping("/admin/sellList")
	public String sellList(Model model) {
		String url = "/admin/adminSellList";

		return url;
	}
	
	@RequestMapping(value="/admin/mainSellProduct", method=RequestMethod.GET)
	@ResponseBody
	public Object mainSellProduct(Model model, HttpSession session
			, @RequestParam(value="search")String search
			, @RequestParam(value="month")String month
			, @RequestParam(value="index")int index){
		Map<String,Object> retVal = new HashMap<String, Object>();
		if(search.equals("month")){
			month = month.substring(2);
			List<SellVO> getProductMonth = adminService.getProductMonth(month, index);
			retVal.put("getProductMonth", getProductMonth);
		}
		
		return retVal;
	}
	
	@RequestMapping("/admin/clientList")
	public String clientList(Model model){
		String url="/admin/adminClientList";
		
		List<ClientVO> clientList = adminService.getClientList();
		
		model.addAttribute("clientList", clientList);
		
		return url;
	}
	@RequestMapping("/admin/clientInsert")
	public String clientInsertForm(ClientVO clientVO){
		String url="redirect:/admin/clientList";
		
		adminService.insertClient(clientVO);
		
		return url;
	}
	@RequestMapping("/admin/clientDel")
	public String clientDel(@RequestParam("c_no")String c_no){
		String url="redirect:/admin/clientList";
		
		adminService.deleteClient(c_no);
		
		return url;
	}
	@RequestMapping("/admin/productModify")
	public String productModify(Model model, HttpSession session, @RequestParam(value="productNo")int productNo) {
		String url = "redirect:/admin/main";
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
	      
	    if(loginUser !=null){
	    	url = "/admin/adminProductModify";
	    	ProductVO adminProductDetail = adminService.getProductDetail(productNo);
	    	List<ClientVO> clientList = adminService.getClientList();
	    	model.addAttribute("adminProductDetail",adminProductDetail);
    		model.addAttribute("clientList",clientList);
	    }
		return url;
	}
	@RequestMapping(value="/admin/modifyProduct", method=RequestMethod.POST)
	public String modifyProduct(Model model, MultipartFile multiFile1, MultipartFile multiFile2, HttpSession session, ProductVO product){
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
				adminService.modifyProduct(product);
			}else if(!multiFile1.isEmpty()){
				String uploadPath = "C:/Users/admin/git/jinibrown/jiniShop/src/main/webapp/resources/images/productImage";
				File file2 = new File(uploadPath, "$$"+System.currentTimeMillis() + multiFile2.getOriginalFilename());
				
				try {
					multiFile2.transferTo(file2); 
					//실제 저장이 이루어짐
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} //실제 저장이 이루어짐
				ProductVO adminProductDetail = adminService.getProductDetail(product.getP_no());
				product.setP_mainimg(adminProductDetail.getP_mainimg()); //DB 컬럼에 파일명 저장
				product.setP_subimg(file2.getName());
				adminService.modifyProduct(product);
			}else if(!multiFile2.isEmpty()){
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
				ProductVO adminProductDetail = adminService.getProductDetail(product.getP_no());
				product.setP_mainimg(adminProductDetail.getP_mainimg()); //DB 컬럼에 파일명 저장
				product.setP_subimg(adminProductDetail.getP_subimg());
				adminService.modifyProduct(product);
			}else{
				ProductVO adminProductDetail = adminService.getProductDetail(product.getP_no());
				product.setP_mainimg(adminProductDetail.getP_mainimg()); //DB 컬럼에 파일명 저장
				product.setP_subimg(adminProductDetail.getP_subimg());	        	 
				adminService.modifyProduct(product);
			}
		}
		return url;
	}
	
	@RequestMapping("/admin/adminMemberDetail")
	public String adminMemberDetailForm(Model model, @RequestParam("id")String id){
		String url ="/admin/adminMemberDetail";
		Login_ViewVO memberInfo = adminService.getMemberDetail(id);
		
		
		model.addAttribute("loginInfo", memberInfo);
		return url;
	}
	
	@RequestMapping("/admin/adminPointUpdate")
	public String adminPointUpdate(@RequestParam("id")String id, @RequestParam("point")String point){
		String url ="redirect:/admin/memberList";
		
		adminService.updateMemberPoint(id, point);
		
		return url;
	}
	
	@RequestMapping("/admin/sellChart")
	public void sellChart(HttpServletResponse response,
			@RequestParam("year")String year) {
		
		List<Object> chartList = new ArrayList<Object>();
		
		for (int i = 1; i < 13; i++) {
			String y = year+"-"; 
			String rey = year.substring(2)+"/";
			rey = rey+i;
			int sum = 0;
			int profit = 0;
			List<SellVO> monthList = new ArrayList<SellVO>();
			Map<Object, Object> params = new HashMap<Object, Object>();
			
			monthList = adminService.getProductMonth(rey, i);
			
			for (int j = 0; j < monthList.size(); j++) {
				sum += monthList.get(j).getS_c_qty()*monthList.get(j).getP_price();
				profit += monthList.get(j).getS_c_qty()*monthList.get(j).getP_price2();
			}
			
			params.put("y", y+i);
			params.put("sum", sum);
			params.put("profit", sum-profit);
			
			chartList.add(params);
		}
		

		ObjectMapper jsonObject = new ObjectMapper();

		try {
			response.setContentType("text/json; charset=utf-8;");
			String str = jsonObject.writeValueAsString(chartList);
			response.getWriter().print(str);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException ei) {
			ei.printStackTrace();
		}
	}
}
