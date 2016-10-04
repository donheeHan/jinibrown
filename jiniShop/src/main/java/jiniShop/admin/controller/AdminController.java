package jiniShop.admin.controller;

import java.util.List;

import jiniShop.admin.service.AdminService;
import jiniShop.vo.Login_ViewVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
}
