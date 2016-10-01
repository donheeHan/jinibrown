package jiniShop.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import jiniShop.member.service.MemberService;
import jiniShop.security.SecurityProcess;
import jiniShop.vo.UsersVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/loginPage", method={RequestMethod.GET, RequestMethod.POST})
	public String loginForm(){
		String url = "/member/loginPage";
		
		return url;
	}
	
	@RequestMapping(value="/loginCheck", method={RequestMethod.GET, RequestMethod.POST})
	public void loginCheck(HttpServletResponse response, @RequestParam(value="use_id")String id, @RequestParam(value="use_pwd")String pwd){
		String message = "";
		SecurityProcess sp = new SecurityProcess();
		String encPwd = "";
		try {
			encPwd = sp.encrypt(pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.setContentType("text/html; charset=UTF-8;");
		Map<String, String> checkMap = new HashMap<String, String>();
		checkMap.put("id", id);
		checkMap.put("pwd", encPwd);
		
		UsersVO loginUser = memberService.getLoginCheck(checkMap);
		
		if(loginUser == null){
			message = "error";
		}else{
			message = "success";
		}
		
		Map<String, String> loginCheck = new HashMap<String, String>();
		loginCheck.put("message", message);
		loginCheck.put("encPwd", encPwd);
		
		ObjectMapper jsonObject = new ObjectMapper();
		
		try {
			response.setContentType("text/json; charset=utf-8;");
			String str = jsonObject.writeValueAsString(loginCheck);
			response.getWriter().print(str);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException ei){
			ei.printStackTrace();
		}
		
	}
}
