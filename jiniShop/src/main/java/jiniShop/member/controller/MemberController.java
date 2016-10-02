package jiniShop.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jiniShop.member.service.MemberService;
import jiniShop.security.SecurityProcess;
import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.MemberVO;
import jiniShop.vo.UsersVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
	SecurityProcess sp = new SecurityProcess();
	
	@RequestMapping(value="/main", method={RequestMethod.GET, RequestMethod.POST})
	public String main(){
		String url = "main";
		
		return url;
	}
	
	@RequestMapping(value="/loginPage", method={RequestMethod.GET, RequestMethod.POST})
	public String loginForm(){
		String url = "/member/loginPage";
		
		return url;
	}
	
	@RequestMapping(value="/loginCheck", method={RequestMethod.GET, RequestMethod.POST})
	public void loginCheck(HttpServletResponse response, @RequestParam(value="use_id")String id, @RequestParam(value="use_pwd")String pwd){
		String message = "";
		
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
	
	@RequestMapping(value="/login", method={RequestMethod.GET, RequestMethod.POST})
	public String login(HttpSession session){
		String url = "redirect:/main";
		
		//로그인되고
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Login_ViewVO loginUser = new Login_ViewVO();
		
		//id 가져와서
		String id = auth.getName();
		
		loginUser = memberService.getLoginInfo(id);
		
		session.setAttribute("loginUser", loginUser);
		
		return url;
	}
	
	@RequestMapping(value="/logout", method={RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpSession session){
		String url ="redirect:/main";
			
		if(session != null){
			session.invalidate();
		}
		
		return url;
	}
	
	@RequestMapping(value="/joinForm", method={RequestMethod.GET, RequestMethod.POST})
	public String joinForm(){
		String url = "/member/joinForm";
		
		return url;
	}
	
	@RequestMapping(value="/join", method={RequestMethod.GET, RequestMethod.POST})
	public String join(MemberVO member, @RequestParam("pwd")String pass,
			@RequestParam("email1")String email1, @RequestParam("email2")String email2,
			@RequestParam("birth1")String birth1, @RequestParam("birth2")String birth2,
			@RequestParam("birth3")String birth3){
		String url = "redirect:/main";
		
		member.setBirthday(birth1+birth2+birth3);
		member.setEmail(email1+"@"+email2);
		
		UsersVO users = new UsersVO();
		
		users.setUser_id(member.getId());
		try {
			users.setUser_pass(sp.encrypt(pass));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		memberService.insertMember(member, users);
		
		
		return url;
	}
	
	@RequestMapping(value="/idCheck", method={RequestMethod.GET, RequestMethod.POST})
	public void idCheck(HttpServletResponse response, @RequestParam("id")String id){

		String result = "";
		
		Login_ViewVO loginUser = new Login_ViewVO();
		
		loginUser = memberService.getLoginInfo(id);
		
		if(loginUser != null){
			result = "no";
		}else{
			result = "ok";
		}
		
		ObjectMapper jsonObject = new ObjectMapper();
	
		try {
			response.setContentType("text/json; charset=utf-8;");
			String str = jsonObject.writeValueAsString(result);
			response.getWriter().print(str);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException ei){
			ei.printStackTrace();
		}
	}
}
