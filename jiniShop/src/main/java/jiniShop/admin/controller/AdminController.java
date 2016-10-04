package jiniShop.admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import jiniShop.admin.service.AdminService;
import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.QnaVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping("/admin/memberList")
	public String memberList(Model model){
		String url="/admin/memberList";
		
		List<Login_ViewVO> memberList = adminService.getMemberList();
		
		model.addAttribute("memberList", memberList);
		
		return url;
	}
	
	@RequestMapping("/admin/qnaList")
	public String qnaList(Model model){
		String url = "/admin/adminQnaList";
		
		List<QnaVO> qnaList = adminService.getQnaList();
		
		model.addAttribute("qnaList", qnaList);
		
		return url;
	}
	
	@RequestMapping("/admin/adminQnaDetail")
	public String qnaDetail(Model model, @RequestParam("q_no")String q_no){
		String url = "/admin/adminQnaDetail";
		
		QnaVO qnaInfo = adminService.getQnaDetail(q_no);
		
		model.addAttribute("qnaInfo", qnaInfo);
		
		return url;
	}
	
	@RequestMapping("/admin/qnaDel")
	public String qnaDel(@RequestParam("q_no")String q_no){
		String url="redirect:/admin/qnaList";
		
		adminService.deleteAdminQna(q_no);
		
		return url;
	}
	
	@RequestMapping("/admin/qnaReplyInsert")
	public void qnaReplyForm(@RequestParam("q_no")String q_no, @RequestParam("reply")String reply,
			HttpServletResponse response){
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
		} catch (IOException ei){
			ei.printStackTrace();
		}
	}
	
}
